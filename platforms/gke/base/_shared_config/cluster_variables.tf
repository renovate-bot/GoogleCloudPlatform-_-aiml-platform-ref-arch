# Copyright 2024 Google LLC
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

#
# Configuration dependencies
# - shared_config/platform_variables.tf
#

locals {
  cluster_credentials_command_private = "gcloud container clusters get-credentials ${local.cluster_name} --internal-ip --location ${var.cluster_region} --project ${var.cluster_project_id}"
  cluster_credentials_command_public  = "gcloud container clusters get-credentials ${local.cluster_name} --location ${var.cluster_region} --project ${var.cluster_project_id}"
  cluster_credentials_command_gke     = var.cluster_enable_private_endpoint ? local.cluster_credentials_command_private : local.cluster_credentials_command_public
  cluster_credentials_command_gkee    = "gcloud container fleet memberships get-credentials ${local.cluster_name} --project ${var.cluster_project_id}"
  cluster_credentials_command         = var.cluster_use_connect_gateway ? local.cluster_credentials_command_gkee : local.cluster_credentials_command_gke
  cluster_name                        = local.unique_identifier_prefix

  kubeconfig_directory = abspath("${path.module}/../kubeconfig")
  kubeconfig_file      = abspath("${local.kubeconfig_directory}/${var.cluster_project_id}-${local.unique_identifier_prefix}")
}

variable "cluster_binary_authorization_evaluation_mode" {
  default     = "DISABLED"
  description = "Mode of operation for Binary Authorization policy evaluation. Valid values are DISABLED and PROJECT_SINGLETON_POLICY_ENFORCE."
  type        = string

  validation {
    condition = contains(
      [
        "DISABLED",
        "PROJECT_SINGLETON_POLICY_ENFORCE",
      ],
      var.cluster_binary_authorization_evaluation_mode
    )
    error_message = "'cluster_binary_authorization_evaluation_mode' value is invalid"
  }
}

variable "cluster_confidential_nodes_enabled" {
  default     = false
  description = "Enable Confidential GKE Nodes for this node pool, to enforce encryption of data in-use"
  type        = bool
}

variable "cluster_database_encryption_state" {
  default     = "DECRYPTED"
  description = "The desired state of etcd encryption. ENCRYPTED or DECRYPTED"
  type        = string

  validation {
    condition = contains(
      [
        "DECRYPTED",
        "ENCRYPTED",
      ],
      var.cluster_database_encryption_state
    )
    error_message = "'cluster_database_encryption_state' value is invalid"
  }
}

variable "cluster_database_encryption_key_name" {
  default     = null
  description = "Name of CloudKMS key to use for the encryption of secrets in etcd. Ex. projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key"
  type        = string
}

variable "cluster_enable_private_endpoint" {
  default     = true
  description = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled. When false, either endpoint can be used. This field only applies to private clusters, when enable_private_nodes is true."
  type        = bool
}

variable "cluster_gateway_api_config_channel" {
  default     = "CHANNEL_STANDARD"
  description = "Which Gateway Api channel should be used. CHANNEL_DISABLED, CHANNEL_EXPERIMENTAL or CHANNEL_STANDARD"
  type        = string

  validation {
    condition = contains(
      [
        "CHANNEL_DISABLED",
        "CHANNEL_EXPERIMENTAL",
        "CHANNEL_STANDARD",
      ],
      var.cluster_gateway_api_config_channel
    )
    error_message = "'cluster_gateway_api_config_channel' value is invalid"
  }
}

variable "cluster_gpu_driver_version" {
  default     = "LATEST"
  description = "Mode for how the GPU driver is installed."
  type        = string

  validation {
    condition = contains(
      [
        "DEFAULT",
        "GPU_DRIVER_VERSION_UNSPECIFIED",
        "INSTALLATION_DISABLED",
        "LATEST"
      ],
      var.cluster_gpu_driver_version
    )
    error_message = "'gpu_driver_version' value is invalid"
  }
}

variable "cluster_master_global_access_enabled" {
  default     = false
  description = "Whether the cluster master is accessible globally or not."
  type        = bool
}

variable "cluster_master_ipv4_cidr_block" {
  default     = "172.16.0.32/28"
  description = "The IP range in CIDR notation to use for the hosted master network."
  type        = string
}

variable "cluster_private_endpoint_subnetwork" {
  default     = null
  description = "Subnetwork in cluster's network where master's endpoint will be provisioned."
  type        = string
}

variable "cluster_project_id" {
  description = "The GCP project where the cluster resources will be created"
  type        = string

  validation {
    condition     = var.cluster_project_id != ""
    error_message = "'cluster_project_id' was not set, please set the value in the mlp.auto.tfvars file"
  }
}

variable "cluster_region" {
  default     = "us-central1"
  description = "Region where cluster resources will be created."
  type        = string

  validation {
    condition = contains(
      [
        "us-central1",
        "us-east4",
      ],
    var.cluster_region)
    error_message = "'cluster_region' must be one of ['us-central1', 'us-east4']"
  }
}

variable "cluster_use_connect_gateway" {
  default     = true
  description = "UsevConnect gateway to connect to the cluster, require GKE Enterprise."
  type        = bool
}