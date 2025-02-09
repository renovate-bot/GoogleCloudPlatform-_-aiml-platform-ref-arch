Copyright 2024 Google LLC

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

## Requirements

| Name                                                            | Version   |
| --------------------------------------------------------------- | --------- |
| <a name="requirement_google"></a> [google](#requirement_google) | >= 4.28.0 |

## Modules

| Name                                         | Source                                  | Version |
| -------------------------------------------- | --------------------------------------- | ------- |
| <a name="module_vpc"></a> [vpc](#module_vpc) | terraform-google-modules/network/google | 5.2.0   |

## Inputs

| Name                                                                                                                           | Description                                       | Type     | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_network_name"></a> [network_name](#input_network_name)                                                          | Name of the VPC network.                          | `string` | n/a     |   yes    |
| <a name="input_project_id"></a> [project_id](#input_project_id)                                                                | Id of the GCP project where VPC is to be created. | `string` | n/a     |   yes    |
| <a name="input_routing_mode"></a> [routing_mode](#input_routing_mode)                                                          | The network routing mode.                         | `string` | n/a     |   yes    |
| <a name="input_subnet_01_description"></a> [subnet_01_description](#input_subnet_01_description)                               | Subnet description.                               | `string` | n/a     |   yes    |
| <a name="input_subnet_01_ip"></a> [subnet_01_ip](#input_subnet_01_ip)                                                          | IP range of first subnet.                         | `string` | n/a     |   yes    |
| <a name="input_subnet_01_name"></a> [subnet_01_name](#input_subnet_01_name)                                                    | Name of first subnet.                             | `string` | n/a     |   yes    |
| <a name="input_subnet_01_region"></a> [subnet_01_region](#input_subnet_01_region)                                              | Region of first subnet.                           | `string` | n/a     |   yes    |
| <a name="input_subnet_01_secondary_pod_name"></a> [subnet_01_secondary_pod_name](#input_subnet_01_secondary_pod_name)          | Name of pods IP range.                            | `string` | n/a     |   yes    |
| <a name="input_subnet_01_secondary_pod_range"></a> [subnet_01_secondary_pod_range](#input_subnet_01_secondary_pod_range)       | IP range of the pods.                             | `string` | n/a     |   yes    |
| <a name="input_subnet_01_secondary_svc_1_name"></a> [subnet_01_secondary_svc_1_name](#input_subnet_01_secondary_svc_1_name)    | Name of service IP range.                         | `string` | n/a     |   yes    |
| <a name="input_subnet_01_secondary_svc_1_range"></a> [subnet_01_secondary_svc_1_range](#input_subnet_01_secondary_svc_1_range) | IP range of the service.                          | `string` | n/a     |   yes    |
| <a name="input_subnet_01_secondary_svc_2_name"></a> [subnet_01_secondary_svc_2_name](#input_subnet_01_secondary_svc_2_name)    | Name of service IP range.                         | `string` | n/a     |   yes    |
| <a name="input_subnet_01_secondary_svc_2_range"></a> [subnet_01_secondary_svc_2_range](#input_subnet_01_secondary_svc_2_range) | IP range of the service.                          | `string` | n/a     |   yes    |
| <a name="input_subnet_02_description"></a> [subnet_02_description](#input_subnet_02_description)                               | Subnet description.                               | `string` | n/a     |   yes    |
| <a name="input_subnet_02_ip"></a> [subnet_02_ip](#input_subnet_02_ip)                                                          | IP range of second subnet.                        | `string` | n/a     |   yes    |
| <a name="input_subnet_02_name"></a> [subnet_02_name](#input_subnet_02_name)                                                    | Name of the second subnet.                        | `string` | n/a     |   yes    |
| <a name="input_subnet_02_region"></a> [subnet_02_region](#input_subnet_02_region)                                              | Region of second subnet.                          | `string` | n/a     |   yes    |
| <a name="input_subnet_02_secondary_pod_name"></a> [subnet_02_secondary_pod_name](#input_subnet_02_secondary_pod_name)          | Name of pods IP range.                            | `string` | n/a     |   yes    |
| <a name="input_subnet_02_secondary_pod_range"></a> [subnet_02_secondary_pod_range](#input_subnet_02_secondary_pod_range)       | IP range of the pods.                             | `string` | n/a     |   yes    |
| <a name="input_subnet_02_secondary_svc_1_name"></a> [subnet_02_secondary_svc_1_name](#input_subnet_02_secondary_svc_1_name)    | Name of service IP range.                         | `string` | n/a     |   yes    |
| <a name="input_subnet_02_secondary_svc_1_range"></a> [subnet_02_secondary_svc_1_range](#input_subnet_02_secondary_svc_1_range) | IP range of the service.                          | `string` | n/a     |   yes    |
| <a name="input_subnet_02_secondary_svc_2_name"></a> [subnet_02_secondary_svc_2_name](#input_subnet_02_secondary_svc_2_name)    | Name of service IP range.                         | `string` | n/a     |   yes    |
| <a name="input_subnet_02_secondary_svc_2_range"></a> [subnet_02_secondary_svc_2_range](#input_subnet_02_secondary_svc_2_range) | IP range of the service.                          | `string` | n/a     |   yes    |

## Outputs

| Name                                                     | Description                                   |
| -------------------------------------------------------- | --------------------------------------------- |
| <a name="output_network"></a> [network](#output_network) | Object containing details of the VPC network. |

## Usage

```hcl
  source = "git::https://github.com/YOUR_GITHUB_ORG/terraform-modules.git//vpc/"
  project_id   = "my-project"
  network_name    = "my-network"
  routing_mode    = "GLOBAL"
  subnet_01_name      = "subnet-1"
  subnet_01_ip        = "10.40.0.0/22"
  subnet_01_region    = "us-central1"
  subnet_01_description      = "subnet 1"
  subnet_02_name      = "subnet-2"
  subnet_02_ip        = "10.12.0.0/22"
  subnet_02_region    = "us-central1"
  subnet_02_description      = "subnet 2"
  subnet_01_secondary_svc_1_name    = "subnet1-service1"
  subnet_01_secondary_svc_1_range = "10.5.0.0/20"
  subnet_01_secondary_svc_2_name    = "subnet1-service2"
  subnet_01_secondary_svc_2_range = "10.5.16.0/20"
  subnet_01_secondary_pod_name    = "subnet1-pod"
  subnet_01_secondary_pod_range = "10.0.0.0/14"
  subnet_02_secondary_svc_1_name    = "subnet2-service1"
  subnet_02_secondary_svc_1_range = "10.13.0.0/20"
  subnet_02_secondary_svc_2_name    = "subnet2-service2"
  subnet_02_secondary_svc_2_range = "10.13.16.0/20"
  subnet_02_secondary_pod_name    = "subnet2-pod"
  subnet_02_secondary_pod_range = "10.8.0.0/14"

}
```

## Workflow

This module is called from [multi-tenant platform
repo][muti-tenant-platform-repo] that stands up multi-tenant infrastructure for
[dev][dev-multi-tenant], [staging][staging-multi-tenant] and
[prod][prod-multi-tenant] environments to create a VPC network. Additionally,
this module can be called by [infrastructure repo][infra-repo] if the
application needs its own VPC networks inside its projects.

## Contributing

- [Contributing guidelines][contributing-guidelines]
- [Code of conduct][code-of-conduct]

<!-- LINKS: https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributing-guidelines]: CONTRIBUTING.md
[code-of-conduct]: code-of-conduct.md
[muti-tenant-platform-repo]: ../../platform-template
[dev-multi-tenant]: ../../platform-template/env/dev/main.tf?plain=1#L50
[staging-multi-tenant]: ../../platform-template/env/staging/main.tf?plain=1#L50
[prod-multi-tenant]: ../../platform-template/env/prod/main.tf?plain=1#L50
[infra-repo]: ../../app-factory-template/README.md?plain=1#L64
