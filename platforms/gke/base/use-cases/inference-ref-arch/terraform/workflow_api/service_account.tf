# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "google_service_account" "workflow_api_user" {
  account_id   = local.workflow_api_service_account_name
  description  = "Terraform-managed service account for ${local.workflow_api_service_account_name}"
  display_name = "${local.workflow_api_service_account_name} service account"
  project      = local.workflow_api_service_account_project_id
}
