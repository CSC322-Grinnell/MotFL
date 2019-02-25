json.extract! resource_metadatum, :id, :Title, :Author, :publish_date, :Abstract, :Link, :created_at, :updated_at
json.url resource_metadatum_url(resource_metadatum, format: :json)
