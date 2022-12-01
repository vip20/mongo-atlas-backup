# Mongo DB Atlas backup

## Inputs

## `mongodb_server `

**Required** Mongo DB Server URL

## `mongodb_user`

**Required** Mongo DB Username

## `mongodb_pas`

**Required** Mongo DB Password

## `mongodb_name`

**Required** Mongo DB Name

## Example

Below example displays on how to save the mongodump as artifacts

```yml
name: Backup Mongodb Atlas

on:
  schedule:
    - cron: "30 5 * * 0" # Every Sunday at Midnight IST
  push:
    branches:
      - "main"

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - name: Get current date
        id: date
        run: echo "::set-output name=date::$(date +'%Y-%m-%d')"
      - name: Backup Mongo DB
        uses: vip20/mongo-atlas-backup@0.0.5
        with:
          mongodb_server: ${{ secrets.MONGODB_SERVER }}
          mongodb_user: ${{ secrets.MONGODB_USER }}
          mongodb_pas: ${{ secrets.MONGODB_PAS }}
          mongodb_name: ${{ secrets.MONGODB_NAME }}

      - name: Push Backups to Artifacts
        uses: actions/upload-artifact@v2
        with:
          name: mongodb-backup-${{ steps.date.outputs.date }}
          path: backups/
```
