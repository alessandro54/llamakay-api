# frozen_string_literal: true

class RootController < ApplicationController
  def index
    render json: { message: 'Welcome to the Llamakay API' }, status: :ok
  end
end
