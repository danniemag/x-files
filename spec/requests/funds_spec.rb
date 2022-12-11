# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/funds' do
  let(:valid_attributes) do
    {
      title: 'Project',
      total: 10_000
    }
  end
  let(:invalid_attributes) { { total: 'NaN' } }

  describe 'GET /index' do
    it 'renders a successful response' do
      Fund.create! valid_attributes
      get funds_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      fund = Fund.create! valid_attributes
      get fund_url(fund)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_fund_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      fund = Fund.create! valid_attributes
      get edit_fund_url(fund)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Fund' do
        expect do
          post funds_url, params: { fund: valid_attributes }
        end.to change(Fund, :count).by(1)
      end

      it 'redirects to the created fund' do
        post funds_url, params: { fund: valid_attributes }
        expect(response).to redirect_to(fund_url(Fund.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Fund' do
        expect do
          post funds_url, params: { fund: invalid_attributes }
        end.not_to change(Fund, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post funds_url, params: { fund: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: 'New Project',
          total: 20_000
        }
      end

      it 'updates the requested fund' do
        fund = Fund.create! valid_attributes
        patch fund_url(fund), params: { fund: new_attributes }
        fund.reload
        expect(fund.title).to eq('New Project')
        expect(fund.total).to eq(20_000)
      end

      it 'redirects to the fund' do
        fund = Fund.create! valid_attributes
        patch fund_url(fund), params: { fund: new_attributes }
        fund.reload
        expect(response).to redirect_to(fund_url(fund))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        fund = Fund.create! valid_attributes
        patch fund_url(fund), params: { fund: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested fund' do
      fund = Fund.create! valid_attributes
      expect do
        delete fund_url(fund)
      end.to change(Fund, :count).by(-1)
    end

    it 'redirects to the funds list' do
      fund = Fund.create! valid_attributes
      delete fund_url(fund)
      expect(response).to redirect_to(funds_url)
    end
  end
end
