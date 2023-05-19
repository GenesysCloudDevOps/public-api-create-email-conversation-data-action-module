resource "genesyscloud_integration_action" "action" {
    name           = var.action_name
    category       = var.action_category
    integration_id = var.integration_id
    secure         = var.secure_data_action
    
    contract_input  = jsonencode({
        "additionalProperties" = true,
        "properties" = {
            "attribute1Name" = {
                "type" = "string"
            },
            "attribute1Value" = {
                "type" = "string"
            },
            "attribute2Name" = {
                "type" = "string"
            },
            "attribute2Value" = {
                "type" = "string"
            },
            "attribute3Name" = {
                "type" = "string"
            },
            "attribute3Value" = {
                "type" = "string"
            },
            "attribute4Name" = {
                "type" = "string"
            },
            "attribute4Value" = {
                "type" = "string"
            },
            "attribute5Name" = {
                "type" = "string"
            },
            "attribute5Value" = {
                "type" = "string"
            },
            "flowId" = {
                "type" = "string"
            },
            "fromAddress" = {
                "type" = "string"
            },
            "fromName" = {
                "type" = "string"
            },
            "provider" = {
                "type" = "string"
            },
            "subject" = {
                "type" = "string"
            }
        },
        "required" = [
            "flowId",
            "provider"
        ],
        "type" = "object"
    })
    contract_output = jsonencode({
        "additionalProperties" = true,
        "properties" = {
            "id" = {
                "type" = "string"
            }
        },
        "type" = "object"
    })
    
    config_request {
        request_template     = "{\n\"flowId\": \"$${input.flowId}\",\n\"provider\": \"$${input.provider}\",\n\"subject\": \"$!{input.subject}\",\n\"fromName\": \"$!{input.fromName}\",\n\"fromAddress\": \"$!{input.fromAddress}\",\n\"attributes\": {\n\"$!{input.attribute1Name}\": \"$!{input.attribute1Value}\",\n\"$!{input.attribute2Name}\": \"$!{input.attribute2Value}\",\n\"$!{input.attribute3Name}\": \"$!{input.attribute3Value}\",\n\"$!{input.attribute4Name}\": \"$!{input.attribute4Value}\",\n\"$!{input.attribute5Name}\": \"$!{input.attribute5Value}\"\n}\n}"
        request_type         = "POST"
        request_url_template = "/api/v2/conversations/emails"
    }

    config_response {
        success_template = "$${rawResult}"
    }
}