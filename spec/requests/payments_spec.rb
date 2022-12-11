# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Payments' do
  describe 'GET /index' do
    it 'returns http success' do
      get payments_url
      expect(response).to be_successful
    end
  end
end
