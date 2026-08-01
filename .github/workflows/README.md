# GitHub Actions Workflows

## Deploy Workflow (`deploy.yaml`)

The deploy workflow runs the CI/CD pipeline on every push to `develop`. It typechecks the website, copies the project to the server, and starts the Docker containers.

### Disabling Deployments

GitHub Actions only recognises workflow files that end in `.yml` or `.yaml`. To disable deployments without deleting the workflow, simply rename the file to remove the extension:

```bash
mv .github/workflows/deploy.yaml .github/workflows/deploy.yaml.disabled
```

To re-enable it, rename it back:

```bash
mv .github/workflows/deploy.yaml.disabled .github/workflows/deploy.yaml
```

> **Note:** `make setup` automatically activates the workflow by renaming `deploy.yaml.template` → `deploy.yaml`. If you disable it afterwards, the setup script won't overwrite your change on subsequent runs.
