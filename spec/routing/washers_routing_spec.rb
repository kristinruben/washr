require 'rails_helper'

RSpec.describe WashersController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: 'laundromats/1/washers/new').to route_to(
        'washers#new', laundromat_id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'laundromats/1/washers/1/edit').to route_to(
        'washers#edit', laundromat_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'laundromats/1/washers').to route_to(
        'washers#create', laundromat_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'laundromats/1/washers/1').to route_to(
        'washers#update', laundromat_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'laundromats/1/washers/1').to route_to(
        'washers#update', laundromat_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'laundromats/1/washers/1').to route_to(
        'washers#destroy', laundromat_id: '1', id: '1')
    end
  end
end
