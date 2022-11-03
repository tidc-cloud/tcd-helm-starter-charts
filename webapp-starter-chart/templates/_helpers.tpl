{{/* vim: set filetype=mustache: */}}
{{/*
Return the proper <CHARTNAME> image name
*/}}
{{- define "<CHARTNAME>.image" -}}
{{- $imageName := .Values.image.name }}
{{- $imageTag := .Values.image.tag |default .Chart.AppVersion | toString }}
{{- printf "%s:%s" $imageName $imageTag | quote }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "<CHARTNAME>.imagePullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global) }}
{{- end -}}

{{/*
 Create the name of the service account to use
 */}}
{{- define "<CHARTNAME>.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
