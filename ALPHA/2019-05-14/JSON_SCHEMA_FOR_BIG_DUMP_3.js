{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": [
    {
      "type": "object",
      "properties": {
        "abstyle": {
          "type": "string"
        },
        "brand": {
          "type": "string"
        },
        "description": {
          "type": "string"
        },
        "fabric": {
          "type": "array",
          "items": [
            {
              "type": "string"
            }
          ]
        },
        "features": {
          "type": "array",
          "items": [
            {
              "type": "string"
            }
          ]
        },
        "category": {
          "type": "string"
        },
        "gender": {
          "type": "string"
        },
        "fit": {
          "type": "string"
        },
        "icons": {
          "type": "array",
          "itemse": [
            {
              "type": "string"
            }
          ]
        },
        "companions": {
          "type": "object",
          "properties": {
            "mens": {
              "type": "string"
            },
            "ladies": {
              "type": "string"
            },
            "tall": {
              "type": "string"
            },
            "youth": {
              "type": "string"
            }
          },
          "required": [
            "mens",
            "ladies",
            "tall",
            "youth"
          ]
        },
        "sizes": {
          "type": "array",
          "items": [
            {
              "type": "string"
            }
          ]
        },
        "tier": {
          "type": "string"
        },
        "msrp": {
          "type": "string"
        },
        "msrp_code": {
          "type": "string"
        },
        "prime": {
          "type": "string"
        },
        "new": {
          "type": "boolean"
        },
        "colors": {
          "type": "array",
          "items": [
            {
              "type": "object",
              "properties": {
                "color_name": {
                  "type": "string"
                },
                "hex_code": {
                  "type": "string"
                },
                "swatch_filename": {
                  "type": "string"
                },
                "nomodel_filename": {
                  "type": "string"
                },
                "front_filename": {
                  "type": "string"
                },
                "side_filename": {
                  "type": "string"
                },
                "back_filename": {
                  "type": "string"
                }
              },
              "required": [
                "color_name",
                "hex_code",
                "swatch_filename",
                "nomodel_filename",
                "front_filename",
                "side_filename",
                "back_filename"
              ]
            }
          ]
        }
      },
      "required": [
        "abstyle",
        "brand",
        "description",
        "fabric",
        "features",
        "category",
        "gender",
        "fit",
        "icons",
        "companions",
        "sizes",
        "tier",
        "msrp",
        "msrp_code",
        "prime",
        "new",
        "colors"
      ]
    }
  ]
}