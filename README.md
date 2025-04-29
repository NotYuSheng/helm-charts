# Open WebUI Helm Charts
Helm charts for the [Open WebUI](https://github.com/open-webui/open-webui) application.

## Downloading the Chart
The charts are hosted at https://helm.openwebui.com. You can add the Helm repo with:
```
helm repo add open-webui https://helm.openwebui.com/
``` 

## Helm startup

### Installation

1. Clone Repo
```
git clone https://github.com/NotYuSheng/helm-charts
cd helm-charts
```

2. Start up instruction
```
helm install open-webui ./open-webui -f ./charts/open-webui/values.yaml
```

3. Shut down instruction
```
helm uninstall open-webui
```
