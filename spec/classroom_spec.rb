require_relative '../teacher'
require_relative '../person'

RSpec.describe Teacher do
  subject(:teacher) { described_class.new(25, 'Salwa', specialization: 'Computer Science') }

  describe '#name' do
    it 'returns the correct name' do
      expect(teacher.name).to eq 'Salwa'
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(teacher.age).to eq 25
    end
  end

  describe '#can_use_services?' do
    it 'returns the correct value for using services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end