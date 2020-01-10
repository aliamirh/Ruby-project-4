class Project
attr_accessor :title, :id

def initialize(attributes)
  @title = attributes.fetch(:title)
  @id = attributes.fetch(:id)

end

def self.all
  returned_titles = DB.exec("SELECT * FROM projects;")
  titles = []
  returned_titles.each() do |title|
    title = title.fetch("title")
    id = title.fetch("id").to_i
    titles.push(Project.new({:title => title, :id => id}))
  end
  titles
end

def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{@titlee}') RETURNING id;")
  @id = result.first().fetch("id").to_i
end

def ==(project_to_compare)
  (self.title() == project_to_compare.title()) && (self.id() == project_to_compare.id())
end

def self.clear
  DB.exec("DELETE FROM projects *;")
end



end
