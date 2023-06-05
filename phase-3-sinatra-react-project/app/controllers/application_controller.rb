class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  get "/students" do
    students = Student.all 
    students.to_json
  end

  post "/students" do 
    student = Student.create(name: params[:name],age: params[:age])
    student.to_json
  end
  put "/students/:id" do 
    stud = Student.find(params[:id])
    stud.update(name:params[:name],age:params[:age])
    stud.to_json
  end
  delete "/students/:id" do
    stud = Student.find(params[:id]) 
    stud.destroy
    stud.to_json
  end

end
