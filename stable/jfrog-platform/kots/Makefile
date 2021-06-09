SHELL := /bin/bash -o pipefail

.PHONY: helm-package
helm-package: 
	helm dependencies update ../
	helm package ../. -d manifests/

.PHONY: release
release: 
	replicated release create --auto -y

.PHONY: release-kurl-installer
release-kurl-installer: 
	replicated installer create --auto -y

