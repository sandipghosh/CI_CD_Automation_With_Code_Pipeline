1. Setup a s3 bucket to store the state file remotely
aws-code-pipeline/terraform.tfstate

## AWS system environment variables

| Variable                             | Description                          | Example                             |
| ------------------------------------ | ------------------------------------ | ----------------------------------- |
| `$CODEBUILD_SRC_DIR`                 | Directory containing source code     | `/codebuild/output/src123`          |
| `$CODEBUILD_SRC_DIR_<artifact>`      | Path to named input artifact         | `/codebuild/output/src123/artifact` |
| `$CODEBUILD_SRC_DIR_<sourceId>`      | Path to a specific source identifier | `/src/myrepo`                       |
| `$CODEBUILD_BUILD_ID`                | Unique build ID                      | `my-project:1234abcd`               |
| `$CODEBUILD_BUILD_NUMBER`            | Incremental build number             | `42`                                |
| `$CODEBUILD_INITIATOR`               | Trigger (like pipeline ARN)          | `codepipeline/my-pipeline`          |
| `$CODEBUILD_RESOLVED_SOURCE_VERSION` | Git commit ID of source              | `1a2b3c4d5e`                        |
| `$CODEBUILD_WEBHOOK_TRIGGER`         | Event name for webhook               | `branch/main`                       |
| `$AWS_DEFAULT_REGION`                | Region used by the build             | `ap-south-1`                        |
| `$CODEBUILD_SOURCE_REPO_URL`         | Repo clone URL                       | `https://github.com/org/repo.git`   |


## Steps to perform the terraform automations

1. Create terraform infrastructure for aws ececute the `terraform init` command
2. Setup s3 backend configuration and execure the `terraform init -reconfigure` command
3. Prepare the following aws code build spec files
    - buildspec-plan.yaml
    - buildspec-apply.yaml
    - buildspec-destroy.yaml
4. Create a GitHub repository and push all the code base into it 
5. In aws console, create IAM role for code build service with full administrative permissions
6. Create 3 different code build project as follows
    - Terraform-Build-Plan
    - Terraform-Build-Apply
    - Terraform-Build-Destroy
7. Create a code pipeline 
8. Modify the code pipeline service role to add full administrative pemissions
9. Add the following stages to the pipeline
    - Source Stage --> Source --> SourceArtifact
    - Plan Stage --> Terraform-Build-Plan --> Terraform-Build-Plan-Artifact
    - Apply Stage --> Terraform-Build-Apply --> Terraform-Build-Plan-Artifact
    - Manual Approval
    - Destroy Stage --> Terraform-Build-Destroy --> SourceArtifact