helpers do
    def authenticate!
      @current_user = User.find_by(pin: params[:pin])
      halt 401 unless @current_user
    end
end
  
error ActiveRecord::RecordNotFound do
    status 404
    { error: "Record not found" }.to_json
end
  
error do
    status 500
    { error: "Internal server error" }.to_json
end
  

begin
    # Find the user with an id of 1
    user = User.find(1)
  rescue ActiveRecord::RecordNotFound
    
    # Handle the error
    puts "Sorry, we couldn't find a user with that id."
  end
  