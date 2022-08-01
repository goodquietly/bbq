require 'rails_helper'
require 'pundit/rspec'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.new }
  let(:event_creator) { User.new }
  let(:event) { Event.new(user: event_creator) }

  subject { described_class }

  context 'when an anonymous user' do
    permissions :create?, :new?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end

    permissions :index?, :show? do
      it { is_expected.to permit(nil, event) }
    end
  end

  context 'when an authorized user' do
    permissions :new?, :create?, :index?, :show? do
      it { is_expected.to permit(user, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end
  end

  context 'when an authorized user event creator' do
    permissions :new?, :create?, :index?, :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(event_creator, event) }
    end
  end
end
