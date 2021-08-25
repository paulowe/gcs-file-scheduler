locals {
    # !Set! of APIs to activate
    apis = toset(
        [
            "storagetransfer.googleapis.com"
        ]
    )
}

resource "google_project_service" "activate-api" {
    project = var.project
    for_each = local.apis
    service = each.key
}