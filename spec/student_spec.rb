require_relative '../student'
require_relative '../person'

describe Student do
  subject(:student) { described_class.new(20, 'Lolo', parent_permission: true) }

  describe '#name' do
    it 'returns the correct name' do
      expect(student.name).to eq 'Lolo'
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(student.age).to eq 20
    end
  end

  describe '#play_hooky' do
    it 'returns the correct message' do
      expect(student.play_honky).to eq '¯\\(ツ)/¯'
    end
  end
end
