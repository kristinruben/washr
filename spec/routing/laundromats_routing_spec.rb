require 'rails_helper'

RSpec.describe LaundromatsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/laundromats').to route_to('laundromats#index')
    end

    it 'routes to #new' do
      expect(get: '/laundromats/new').to route_to('laundromats#new')
    end

    it 'routes to #show' do
      expect(get: '/laundromats/1').to route_to('laundromats#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/laundromats/1/edit').to route_to('laundromats#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/laundromats').to route_to('laundromats#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/laundromats/1').to route_to('laundromats#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/laundromats/1').to route_to('laundromats#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/laundromats/1').to route_to('laundromats#destroy', id: '1')
    end

  end
end
