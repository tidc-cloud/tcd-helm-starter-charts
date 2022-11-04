# Web Application chart

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
helm install my-release .
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
helm delete my-release
```

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |

### Common parameters

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `nameOverride`           | String to partially override fullname template (will maintain the release name)         | `""`            |
| `fullnameOverride`       | String to fully override fullname template                                              | `""`            |
| `clusterDomain`          | Kubernetes Cluster Domain                                                               | `cluster.local` |
| `commonLabels`           | Add labels to all the deployed resources                                                | `{}`            |
| `commonAnnotations`      | Add annotations to all the deployed resources                                           | `{}`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the the deployment(s)/statefulset(s)              | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the the deployment(s)/statefulset(s)                 | `["infinity"]`  |

### Application parameters

| Name                 | Description                                                                                           | Value                 |
| -------------------- | ----------------------------------------------------------------------------------------------------- | --------------------- |
| `image.name`         | Image repository                                                                                      | `""`                  |
| `image.tag`          | Image tag (immutable tags are recommended)                                                            | `""`                  |
| `image.pullPolicy`   | Image pull policy                                                                                     | `IfNotPresent`        |
| `image.pullSecrets`  | Specify docker-registry secret names as an array                                                      | `[]`                  |
| `image.debug`        | Set to true if you would like to see extra information on logs                                        | `false`               |
| `hostAliases`        | Deployment pod host aliases                                                                           | `[]`                  |
| `command`            | Override default container command (useful when using custom images)                                  | `[]`                  |
| `args`               | Override default container args (useful when using custom images)                                     | `[]`                  |
| `env`                | Environment variables to be set on containers                                                         | `{}`                  |
| `envFrom.configmaps` | List of ConfigMaps with extra environment variables                                                   | `[]`                  |
| `envFrom.secrets`    | List of Secrets with extra environment variables                                                      | `[]`                  |
| `volumes`            | List of volumes                                                                                       | `[]`                  |
| `configMaps`         | List of ConfigMaps                                                                                    | `[]`                  |
| `secrets`            | List of Secrets                                                                                       | `[]`                  |

### Application deployment parameters

| Name                                          | Description                                                                               | Value           |
| --------------------------------------------- | ----------------------------------------------------------------------------------------- | --------------- |
| `replicaCount`                                | Number of replicas to deploy                                                              | `1`             |
| `updateStrategy.type`                         | Deployment strategy type                                                                  | `RollingUpdate` |
| `updateStrategy.rollingUpdate`                | Deployment rolling update configuration parameters                                        | `{}`            |
| `podLabels`                                   | Additional labels for pods                                                                | `{}`            |
| `podAnnotations`                              | Annotations for pods                                                                      | `{}`            |
| `podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `nodeAffinityPreset.key`                      | Node label key to match Ignored if `affinity` is set.                                     | `""`            |
| `nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set.                                 | `[]`            |
| `affinity`                                    | Affinity for pod assignment                                                               | `{}`            |
| `hostNetwork`                                 | Specify if host network should be enabled for pod                                         | `false`         |
| `hostIPC`                                     | Specify if host IPC should be enabled for pod                                             | `false`         |
| `nodeSelector`                                | Node labels for pod assignment. Evaluated as a template.                                  | `{}`            |
| `tolerations`                                 | Tolerations for pod assignment. Evaluated as a template.                                  | `[]`            |
| `priorityClassName`                           | Pods' priorityClassName                                                                   | `""`            |
| `schedulerName`                               | Name of the k8s scheduler (other than default)                                            | `""`            |
| `terminationGracePeriodSeconds`               | In seconds, time the given to the pod needs to terminate gracefully                       | `""`            |
| `topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment                                            | `[]`            |
| `podSecurityContext.enabled`                  | Enabled pods' Security Context                                                            | `false`         |
| `podSecurityContext.fsGroup`                  | Set pod's Security Context fsGroup                                                        | `1001`          |
| `podSecurityContext.sysctls`                  | sysctl settings of the pods                                                               | `[]`            |
| `containerSecurityContext.enabled`            | Enabled containers' Security Context                                                      | `false`         |
| `containerSecurityContext.runAsUser`          | Set container's Security Context runAsUser                                                | `1001`          |
| `containerSecurityContext.runAsNonRoot`       | Set container's Security Context runAsNonRoot                                             | `true`          |
| `containerPorts.http`                         | Sets http port inside container                                                           | `8080`          |
| `containerPorts.https`                        | Sets https port inside container                                                          | `""`            |
| `extraContainerPorts`                         | Array of additional container ports for the container                                     | `[]`            |
| `resources.limits`                            | The resources limits for the container                                                    | `{}`            |
| `resources.requests`                          | The requested resources for the container                                                 | `{}`            |
| `lifecycleHooks`                              | Optional lifecycleHooks for the container                                                 | `{}`            |
| `startupProbe.enabled`                        | Enable startupProbe                                                                       | `false`         |
| `startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                    | `30`            |
| `startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                           | `10`            |
| `startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                          | `5`             |
| `startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                        | `6`             |
| `startupProbe.successThreshold`               | Success threshold for startupProbe                                                        | `1`             |
| `livenessProbe.enabled`                       | Enable livenessProbe                                                                      | `true`          |
| `livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                   | `30`            |
| `livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                          | `10`            |
| `livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                         | `5`             |
| `livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                       | `6`             |
| `livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                       | `1`             |
| `readinessProbe.enabled`                      | Enable readinessProbe                                                                     | `true`          |
| `readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                  | `5`             |
| `readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                         | `5`             |
| `readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                        | `3`             |
| `readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                      | `3`             |
| `readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                      | `1`             |
| `customStartupProbe`                          | Custom liveness probe for the Web component                                               | `{}`            |
| `customLivenessProbe`                         | Override default liveness probe                                                           | `{}`            |
| `customReadinessProbe`                        | Override default readiness probe                                                          | `{}`            |
| `autoscaling.enabled`                         | Enable autoscaling for deployment                                                         | `false`         |
| `autoscaling.minReplicas`                     | Minimum number of replicas to scale back                                                  | `""`            |
| `autoscaling.maxReplicas`                     | Maximum number of replicas to scale out                                                   | `""`            |
| `autoscaling.targetCPU`                       | Target CPU utilization percentage                                                         | `""`            |
| `autoscaling.targetMemory`                    | Target Memory utilization percentage                                                      | `""`            |
| `extraVolumes`                                | Array to add extra volumes                                                                | `[]`            |
| `extraVolumeMounts`                           | Array to add extra mount                                                                  | `[]`            |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for pod                                                 | `false`         |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                                    | `""`            |
| `serviceAccount.annotations`                  | Annotations for service account. Evaluated as a template.                                 | `{}`            |
| `serviceAccount.automountServiceAccountToken` | Auto-mount the service account token in the pod                                           | `false`         |
| `sidecars`                                    | Sidecar parameters                                                                        | `[]`            |
| `sidecarSingleProcessNamespace`               | Enable sharing the process namespace with sidecars                                        | `false`         |
| `initContainers`                              | Extra init containers                                                                     | `[]`            |
| `pdb.create`                                  | Created a PodDisruptionBudget                                                             | `false`         |
| `pdb.minAvailable`                            | Min number of pods that must still be available after the eviction                        | `1`             |
| `pdb.maxUnavailable`                          | Max number of pods that can be unavailable after the eviction                             | `0`             |

### Traffic Exposure parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | Service type                                                                                                                     | `ClusterIP`           |
| `service.ports.http`               | Service HTTP port                                                                                                                | `80`                     |
| `service.ports.https`              | Service HTTPS port                                                                                                               | `443`                    |
| `service.nodePorts`                | Specify the nodePort(s) value(s) for the LoadBalancer and NodePort service types.                                                | `{}`                     |
| `service.targetPort`               | Target port reference value for the Loadbalancer service types can be specified explicitly.                                      | `{}`                     |
| `service.clusterIP`                | Service Cluster IP                                                                                                               | `""`                     |
| `service.loadBalancerIP`           | LoadBalancer service IP address                                                                                                  | `""`                     |
| `service.loadBalancerSourceRanges` | Service Load Balancer sources                                                                                                    | `[]`                     |
| `service.extraPorts`               | Extra ports to expose (normally used with the `sidecar` value)                                                                   | `[]`                     |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                             | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `service.annotations`              | Service annotations                                                                                                              | `{}`                     |
| `service.externalTrafficPolicy`    | Enable client source IP preservation                                                                                             | `Cluster`                |
| `ingress.enabled`                  | Set to true to enable ingress record generation                                                                                  | `false`                  |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `ingress.hostname`                 | Default host for the ingress resource                                                                                            | `example.local`            |
| `ingress.path`                     | The Path to application. You may need to set this to '/*' in order to use this with ALB ingress controllers.                     | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.ingressClassName`         | Set the ingerssClassName on the ingress record for k8s 1.18+                                                                     | `""`                     |
| `ingress.tls`                      | Create TLS Secret                                                                                                                | `false`                  |
| `ingress.extraHosts`               | The list of additional hostnames to be covered with this ingress record.                                                         | `[]`                     |
| `ingress.extraPaths`               | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                     | `[]`                     |
| `ingress.extraTls`                 | The tls configuration for additional hostnames to be covered with this ingress record.                                           | `[]`                     |
| `ingress.secrets`                  | If you're providing your own certificates, please use this to add the certificates as secrets                                    | `[]`                     |
| `ingress.extraRules`               | The list of additional rules to be added to this ingress record. Evaluated as a template                                         | `[]`                     |
| `healthIngress.enabled`            | Set to true to enable health ingress record generation                                                                           | `false`                  |
| `healthIngress.selfSigned`         | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `healthIngress.pathType`           | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `healthIngress.hostname`           | When the health ingress is enabled, a host pointing to this will be created                                                      | `example.local`          |
| `healthIngress.path`               | Default path for the ingress record                                                                                              | `/`                      |
| `healthIngress.annotations`        | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `healthIngress.tls`                | Enable TLS configuration for the hostname defined at `healthIngress.hostname` parameter                                          | `false`                  |
| `healthIngress.extraHosts`         | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `healthIngress.extraPaths`         | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `healthIngress.extraTls`           | TLS configuration for additional hostnames to be covered                                                                         | `[]`                     |
| `healthIngress.secrets`            | TLS Secret configuration                                                                                                         | `[]`                     |
| `healthIngress.ingressClassName`   | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `healthIngress.extraRules`         | The list of additional rules to be added to this ingress record. Evaluated as a template                                         | `[]`                     |
