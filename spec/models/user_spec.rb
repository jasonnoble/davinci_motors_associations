require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_secure_password }
  it { should validate_presence_of(:password) }

  it { should have_many(:cars) }

  it { should have_db_column(:verified_email).
    with_options(null: true)
  }

  it { should have_db_column(:token).
    with_options(null: true)
  }

  describe '#owns?(car)' do
    let(:car) { FactoryGirl.create(:car) }
    context 'when the user owns the car' do
      before(:each) do
        subject.cars << car
      end
      it 'returns true' do
        expect(subject.owns?(car)).to eq(true)
      end
    end
    context 'when the user does not own the car' do
      it 'returns false' do
        expect(subject.owns?(car)).to eq(false)
      end
    end
  end
end
