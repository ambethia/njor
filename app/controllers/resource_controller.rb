require "pagy/extras/headers"

class ResourceController < ApplicationController
  include Pagy::Backend

  before_action :load_resource, only: [:show, :update, :destroy]

  def index
    pagy, resources = pagy(base_scope)
    pagy_headers_merge(pagy)

    render json: resources
  end

  def show
    render json: @resource
  end

  def create
    resource = base_scope.create(resource_params)
    render json: resource
  end

  def update
    @resource.update(resource_params)
    render json: @resource
  end

  def destroy
    @resource.destroy!
    render json: { ok: true }
  end

  private

  def load_resource
    @resource = base_scope.find(params[:id])
  end

  def base_scope
    parts = Rails.application.routes.router.recognize(request) { }.first.last.parts - [:id, :format]
    if parts.length > 0
      parent_scopes = parts.map(&:to_s).reduce(nil) do |scope, part|
        klass = part.sub(/_id$/, "").classify.safe_constantize
        (scope ? scope.send(klass.model_name.collection) : klass).find(params[part])
      end
      parent_scopes.send(resource_class.model_name.collection)
    else
      resource_class
    end
  end

  def parent_resource_parts
  end

  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def resource_params
    @resource_attributes = resource_class.attribute_names — %w[id created_at updated_at]
    params.permit @resource_attributes
  end
end
