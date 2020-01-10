class Project
attr_accessor :project_name

def initialize(attributes)
  @project_name = attributes.fetch(:project_name)
  @id = attributes.fetch(:id)

end



end
