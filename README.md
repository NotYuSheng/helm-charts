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

2. Start Openshift CRC (Refer to [CRC Setup Guide](#crc-setup-guide) if crc project not configured)
```
crc start
```

3. Helm Start up instruction
```
helm install open-webui ./charts/open-webui -f ./charts/open-webui/values.yaml
```

4. Helm Shut down instruction
```
helm uninstall open-webui
```

### CRC Setup Guide

1. Follow this guide to setup CRC: https://www.redhat.com/en/blog/codeready-containers

2. Create the open-webui project
