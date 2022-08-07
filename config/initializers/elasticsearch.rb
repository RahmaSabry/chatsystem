# ELASICSEARCH_CONFIG = proc do
#     host = ENV['ELASTIC_HOST']
#     port = ENV['ELASTIC_PORT']

# elastic_ready = host.present? and port.present?

# elastic_url = if elastic_ready
#         "http://#{host}:#{port}"
#     else
#         "http://localhost:9200"
#     end
# end
require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new(host:'elastic', retry_on_failure: 5 )