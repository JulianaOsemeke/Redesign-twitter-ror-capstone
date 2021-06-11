# frozen_string_literal: true

json.extract! opinion, :id, :opinion, :created_at, :updated_at
json.url opinion_url(opinion, format: :json)
