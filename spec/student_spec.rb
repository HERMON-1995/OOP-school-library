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

  describe '#add_classroom' do
    let(:classroom) { double('Classroom') }

    context 'when the student is not already in the classroom' do
      before do
        allow(classroom).to receive(:students).and_return([])
        allow(classroom).to receive(:add_student)
      end

      it 'sets the classroom attribute' do
        student.add_classroom(classroom)
        expect(student.classroom).to eq classroom
      end

      it 'calls the add_student method on the classroom' do
        expect(classroom).to receive(:add_student).with(student)
        student.add_classroom(classroom)
      end
    end

    context 'when the student is already in the classroom' do
      before do
        allow(classroom).to receive(:students).and_return([student])
      end

      it 'does not set the classroom attribute' do
        student.add_classroom(classroom)
        expect(student.classroom).to be_nil
      end

      it 'does not call the add_student method on the classroom' do
        expect(classroom).not_to receive(:add_student)
        student.add_classroom(classroom)
      end
    end
  end
end
