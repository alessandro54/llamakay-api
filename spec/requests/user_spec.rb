# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :request do
  let!(:user) { create(:user) }
  let!(:auth_headers) { { 'Authorization' => "Bearer #{user.auth_token}" } }

  describe 'Professional Show' do
    context 'profile' do
      context 'with auth' do
        before { get '/profile', headers: auth_headers }
        context 'response' do
          subject { response }
          it { is_expected.to have_http_status(:ok) }
        end
        context 'payload' do
          subject { response.body }
          it { is_expected.to include('id') }
          it { is_expected.to include('first_name') }
          it { is_expected.to include('last_name') }
          it { is_expected.to include('email') }
        end
      end
      context 'without auth' do
        before { get '/profile' }
        context 'response' do
          subject { response }
          it { is_expected.to have_http_status(:unauthorized) }
        end
      end
    end
  end
end
