# azure-apim-terra-mock
## How will this repo help you?
If you're in the middle of a large enterprise project, you may have noticed API dependencies. Resolving API dependencies requires excellent teamwork. Some companies try to solve these dependencies by using SAFe and gathering teams at PI Planning, but even then, there's still a delay for API readiness.

How can we solve this delay for API dependencies and allow development to continue? We can mock the API. By deploying a mock api, the dependent team can continue development and then use feature flags or simply update to cutover to the real API once it's available.

If you're using Azure and Azure API Management, this task become really easy. With every APIm API, there's the ability to create a mock-response inbound policy. This mock-response policy will return the example response contained in an OpenAPI spec or Swagger spec file based on a combination of status-code and media type.

Even better, Terraform allows us to create APIm and APIs referencing these specs. So all we need to do is work out the contracts with the dependent team, include those contracts in an API spec file and ensure there's an example in the response section. The inbound mock-respose policy will reference a 200 status code for application/json, so any response example for the 200 status code will be returned. 

Now when someone needs an API, instead of them waiting, we can use Terraform to deploy the API spec file and have something live for the dependent team.

## How do you use this repository?
1. Download the code
1. I copy the files to Azure Cloud Shell as it has Terraform already included.
1. Create a new folder for your api under the examples.
1. Create your OpenAPI spec in this folder.
1. Copy the main.tf located in examples/echo-api
1. Update the values as needed
1. Execute the Terraform process (init, plan, apply)

## Caveats
1. This is a version 0.1 attempt, however Terraform modules are used to allow for flexibility. For any mock api you want to deploy, add a folder under examples. Copy the API spec file and create a main.tf that references the Terraform apim module. Variables exist to help fill-in the fields needed for deployment. You should be able to copy the main.tf from the echo-api example and augment to fit your needs.
1. Even though APIm APIs support OpenAPI and Swagger, currently this solution only supports a local OpenAPI spec file. Support for Swagger and other imports can easily be added as needed.
1. Currently, only one policy is supported for mocking and that's a status code 200, application/json policy. Support for other status codes can easily be added as needed.
1. It takes on average 30 minutes to deploy Azure APIm. That is not my or Terraform's fault. Behind the scenes, Azure APIm is very complex. During Azure APIm activation there are many resources that spin-up. Microsoft is working on improving the deployment time, but it will never be as fast as we will like. So if it's taking a while, as long as Terraform is updating the deployment time, have no fear, it's still working.
