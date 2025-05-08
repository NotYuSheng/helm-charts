{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "open-webui.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Set the name of the Open WebUI resources
*/}}
{{- define "open-webui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Generate a full resource name by combining Release.Name and Chart.Name
*/}}
{{- define "open-webui.fullname" -}}
  {{- if .Values.nameOverride -}}
    {{- .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}

{{/*
Create the chart name and version for the chart label
*/}}
{{- define "chart.name" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Create the base labels to include on chart resources
*/}}
{{- define "base.labels" -}}
helm.sh/chart: {{ include "chart.name" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create selector labels to include on all resources
*/}}
{{- define "base.selectorLabels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create selector labels to include on all Open WebUI resources
*/}}
{{- define "open-webui.selectorLabels" -}}
{{ include "base.selectorLabels" . }}
app.kubernetes.io/component: {{ .Chart.Name }}
{{- end -}}

{{/*
Create labels to include on chart all Open WebUI resources
*/}}
{{- define "open-webui.labels" -}}
{{ include "base.labels" . }}
{{ include "open-webui.selectorLabels" . }}
{{- end -}}
