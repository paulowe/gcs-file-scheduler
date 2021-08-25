/* 
Configure access to data sources and sinks

1.1 Grant your account permissions for 
Storage Transfer Service access
*/

resource "google_project_iam_binding" "storagetransfer-user" {
  project = var.project_id
  role    = "roles/storagetransfer.user"

  members = [
    "user:paul.owe@adastragrp.com",
  ]
}

/*
1.2 Storage Admin permission for this user is required so that 
he can grant the Google managed service account to move your data
*/

resource "google_project_iam_binding" "storage-admin" {
  project = var.project_id
  role    = "roles/storage.admin"

  members = [
    "user:paul.owe@adastragrp.com",
  ]
}

/* If you plan to use Pub/Sub for transfers*/
resource "google_project_iam_binding" "storage-admin" {
  project = var.project_id
  role    = "roles/pubsub.publisher"

  members = [
    "user:paul.owe@adastragrp.com",
  ]
}

/* Permissions granted to the Google-managed service account
project-PROJECT_NUMBER@storage-transfer-service.iam.gserviceaccount.com
 */


locals {
    gm_serviceaccount = toset(
        [
            "roles/storage.objectViewer",
            "roles/storage.legacyBucketReader",
            "roles/storage.legacyBucketWriter"
        ]
    )
}
resource "google_project_iam_binding" "gm-serviceaccount-permissions" {
  project = var.project_id
  for_each = local.gm_serviceaccount
  role    = each.key

  members = [
    "project-312957359553@storage-transfer-service.iam.gserviceaccount.com",
  ]
}






