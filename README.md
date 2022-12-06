# TCD starter charts

## Installation

Clone starter charts to directory `$XDG_DATA_HOME/helm/starters/tcd`

```sh
git clone https://github.com/tidc-cloud/tcd-helm-starter-charts.git $XDG_DATA_HOME/helm/starters/tcd
```

---

## Create GitOps repository chart from starter

**Example** Create `demo-gitops` chart

```sh
GITOPS_CHART_NAME=demo-gitops

helm create $GITOPS_CHART_NAME --starter tcd/gitops-starter-chart
```

---

## Create web application sub-chart from starter

**Example** create `my-webapp` sub chart under `demo-gitops` chart

```sh
GITOPS_CHART_NAME=demo-gitops
CHART_NAME=my-webapp

# Create sub chart
helm create $GITOPS_CHART_NAME/charts/$CHART_NAME --starter tcd/webapp-starter-chart

```

---

## Create Cron Job application sub-chart from starter

```sh
GITOPS_CHART_NAME=demo-gitops
CHART_NAME=my-job

# Create sub chart
helm create $GITOPS_CHART_NAME/charts/$CHART_NAME --starter tcd/cronjob-starter-chart

```

---
