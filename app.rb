class App
  
  get '/' do
    erb :new
  end
  
  post '/student' do
    # basic structure needed for nested form
    # params = {
    #   "student" => {
    #     "name" => "Vic",
    #     "grade" => "12",
    #     "courses" => [
    #       {
    #         "name" => "AP US History",
    #         "topic" => "History"
    #       },
    #       {
    #         "name" => "AP Human Geography",
    #         "topic" => "History"
    #       }
    #     ]
    #   }
    # }
    
    post '/student' do
      @student = Student.new(params[:student])
     
      params[:student][:courses].each do |details|
        Course.new(details)
      end
     
      @courses = Course.all
     
      erb :student
    end
  
end

#Ruby Hash
# my_hash = {}
# my_hash["student"] = {}
# my_hash["student"]["name"] = "Joe"
# my_hash["student"]["course"] = {}
# my_hash["student"]["course"]["name"] = "US History"
# my_hash["student"]["course"]["topic"] = "History"
 
# my_hash
#   => {"student"=>{"name"=>"Joe", "course"=>{"name"=>"US History", "topic"=>"History"}}}

#Ruby Hash with Array
# my_hash = {}
# my_hash["student"] = {}
# my_hash["student"]["name"] = "Joe"
# my_hash["student"]["courses"] = []
# my_hash["student"]["courses"][0] = { "name" => "AP US History", "topic" => "History"}
#my_hash["student"]["courses"][1] = { "name" => "AP Human Geography", "topic" => "History"}