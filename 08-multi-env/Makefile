help:       ##Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/://' -e 's/##//'

clean:
	@rm-rf .terraform*

dev-apply:  clean ## Install Frontend Component
	@terraform init -backend-config=env/dev-backend.tfvars -no-color
	@terraform apply -auto-apply -var-file=env/dev.tfvars -no-color

prod-apply:  clean ## Install Frontend Component
	@terraform init -backend-config=env/prod-backend.tfvars -no-color
	@terraform apply -auto-apply -var-file=env/prod.tfvars -no-color

dev-destory:  clean ## Install Frontend Component
	@terraform init -backend-config=env/dev-backend.tfvars -no-color
	@terraform destroy -auto-apply -var-file=env/dev.tfvars -no-color

prod-destory:  clean ## Install Frontend Component
	@terraform init -backend-config=env/prod-backend.tfvars -no-color
	@terraform destroy -auto-apply -var-file=env/prod.tfvars -no-color