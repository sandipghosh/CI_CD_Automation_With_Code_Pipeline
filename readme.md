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
