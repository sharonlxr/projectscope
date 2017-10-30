class StudentTask < ActiveRecord::Base
    has_many :parents, class_name: "StudentTask"
    belongs_to :iteration
    belongs_to :project
    def add_parent(p)
        self.parents.push(p)
        self.save
    end
end
