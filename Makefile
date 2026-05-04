.PHONY: validate fmt policy model-scan

validate: fmt model-scan
	./scripts/validate.sh

fmt:
	terraform fmt -recursive terraform

policy:
	conftest test terraform/envs/dev --policy policies/opa

model-scan:
	python3 scripts/scan_model_manifest.py model-assets/manifest.example.json
