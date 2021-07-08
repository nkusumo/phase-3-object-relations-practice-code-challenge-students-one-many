class Cohort < ActiveRecord::Base
    has_many :students

    def add_student(name, age)
        Student.create(name: name, age: age, cohort_id: self.id)
    end

    def average_age
        self.students.average(:age).to_f
    end

    def total_students
        self.students.count
    end

    def self.biggest
        num_students = self.all.map {|c| c.total_students}
        self.all[num_students.index(num_students.max)]
    end

    def self.sort_by_mod
        self.order(:current_mod, :asc)
    end

end