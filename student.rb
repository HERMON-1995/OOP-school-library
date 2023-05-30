# Student section
require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_honky
    '¯\\(ツ)/¯'
  end

  def add_classroom(classroom)
    if classroom.students.include?(self)
      # Student is already in the classroom, do nothing
    else
      @classroom = classroom
      classroom.add_student(self)
    end
  end
end
