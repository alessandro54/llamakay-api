# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Professional:', type: :request do
  # SHOW
  let!(:user) { create(:professional) }
  let!(:auth_headers) { { 'Authorization' => "Bearer #{user.auth_token}" } }

  describe 'GET' do
    context 'with auth' do
      before { get '/profile', headers: auth_headers }
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'payload' do
        subject { response.body }
        it { is_expected.to include('id') }
        it { is_expected.to include('email') }
      end
    end
    context 'without auth' do
      before { get '/profile' }
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
      context 'payload' do
        subject { response.body }
        it { is_expected.to include('unauthorized') }
      end
    end
  end

  # CREATE
  let!(:create_params) { { 'user': { first_name: 'Renzo', last_name: 'Palacios', email: 'chutra@gmail.com' } } }
  let!(:repeated_create_params) do
    { 'user': { first_name: 'Renzo', last_name: 'Palacios', email: 'chutra@gmail.com' } }
  end
  describe 'POST' do
    context 'unique record' do
      before { post '/user', params: create_params }
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
    end
    context 'not unique record' do
      before { post '/user', params: create_params }
      before { post '/user', params: repeated_create_params }
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
      context 'payload' do
        subject { response.body }
        it { is_expected.to include('errors') }
      end
    end
  end
  # TODO: UPDATE
  # DELETE
  describe 'DELETE' do
    before { delete '/profile/destroy', headers: auth_headers }
    context 'response' do
      subject { response }
      it { is_expected.to have_http_status(:accepted) }
    end
    context 'payload' do
      subject { response.body }
      it { is_expected.to include('message') }
    end
  end
end
