
"""
BEFORE RUNNING:
---------------
1. If not already done, enable the Storage Transfer API
   and check the quota for your project at
   https://console.developers.google.com/apis/api/storagetransfer
2. This sample uses Application Default Credentials for authentication.
   If not already done, install the gcloud CLI from
   https://cloud.google.com/sdk and run
   `gcloud beta auth application-default login`.
   For more information, see
   https://developers.google.com/identity/protocols/application-default-credentials
3. Install the Python client library for Google APIs by running
   `pip install --upgrade google-api-python-client`
"""
from pprint import pprint

from googleapiclient import discovery
from oauth2client.client import GoogleCredentials

credentials = GoogleCredentials.get_application_default()

service = discovery.build('storagetransfer', 'v1', credentials=credentials)

# The ID of the Google Cloud Platform Console project that the Google service
# account is associated with.
# Required.
project_id = 'dataflow-poc-323503'  # TODO: Update placeholder value.

request = service.googleServiceAccounts().get(projectId=project_id)
response = request.execute()

# TODO: Change code below to process the `response` dict:
pprint(response)