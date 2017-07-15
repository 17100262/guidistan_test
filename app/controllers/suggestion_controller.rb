class SuggestionController < ApplicationController
# before_action :set_city, only: [:show, :edit, :update, :destroy]
#  load_and_authorize_resource
 before_filter :set_variables
 def index
    #  puts "feature_hash_matrix2",feature_hash_matrix2
    # puts "current_user_like_matrix", current_user_like_matrix
    degree = user_discipline
    @suggest = degree.map{|a| DisciplineUniversity.find(a)}
     
 end
 
 
 def feature_hash_matrix2
    # all_degrees  = DisciplineUniversity.all
    # all_disciplines = Discipline.all
    matrix = Hash.new
    
    @all_degrees.each do |degree|
      @all_disciplines.each do |discipline|
        if(matrix[degree.id]==nil)
          matrix[degree.id] = {discipline.id => 0}
        else
          matrix[degree.id].merge!({discipline.id => 0})
        end
      end
      matrix[degree.id][degree.discipline_id] = 1
    end
    return matrix
    # puts "hash_2",feature_hash_matrix
 end
  
 def current_user_like_matrix
    # puts "current_user",current_user
    # all_degrees = DisciplineUniversity.all
    # all_discipline = Discipline.all
    user_rating = Hash.new
    
    
    if(current_user != nil)
      events = Ahoy::Event.where(user_id:current_user.id)
      
      
      @all_degrees.each do |degree|
        user_rating[degree.id] = 0
      end #initialize all user rating to zero
      
      events.each do |event|
        if(event.name == "Clicked Degree")
          degree_id_from_event = event.properties["id"]
          user_rating[degree_id_from_event] = user_rating[degree_id_from_event] +1
        elsif (event.name == "Clicked Discipline")
          # we need degree of that particular clicked discipline
          discipline_id_from_event = event.properties["id"]
          degrees_from_event = @all_degrees.map{|degree| degree.id if degree.discipline_id == discipline_id_from_event}.compact
          degrees_from_event.each do |d|
            user_rating[d] = user_rating[d] + 1 #increase in rating if user clicks at discipline
          end
        end #increase in rating of degree by user +1 if user clicks at that degree
      end
      
      user_interest = current_user.profile.student_interests_discipline
      user_interest_discipline = user_interest.map{|interest| interest.discipline_id} #sare disipline id mil gaye
      
      aa = user_interest_discipline.map{|record| DisciplineUniversity.find_by_discipline_id(record)}
      aa.each do |record|
        #   puts "hello world",record.name,record.discipline.name
          user_rating[record.id] = user_rating[record.id] + 1

      end
      
    #   puts "user_interest_discipline" , user_interest_discipline
    #   puts "user_rating",user_rating
      
    #   user_interest_discipline.each do |discipline|
    #     user_rating[discipline] = user_rating[discipline] + 1
    #   end ## add rating from user interest
      
      # puts "user_rating_updated",user_rating
      
    end
    return user_rating
 end
  
 def document_frequency
    # all_discipline = Discipline.all
    all_degrees_count = 0
    count = Hash.new
    inverse_count = Hash.new
    
    @all_disciplines.each do |discipline|
      count [discipline.id] = discipline.discipline_university.count
      all_degrees_count = all_degrees_count + count[discipline.id]
      inverse_count[discipline.id] = Math::log((all_degrees_count/count[discipline.id]),10)
    end
    return inverse_count
    
    puts "degrees_count", all_degrees_count
    puts "document_frequency",inverse_count
 end
  
 def user_discipline
    matrix = feature_hash_matrix2
    user_rating = current_user_like_matrix
    frequency = document_frequency
    
    user_liked_discipline = Hash.new
    
    @all_disciplines.each do |discipline|
      value = 0
      @all_degrees.each do |degree|
        value = value + (matrix[degree.id][discipline.id] * user_rating[degree.id])
      end
      user_liked_discipline[discipline.id] = value
    end
    # puts "user_discipline",user_liked_discipline
    
    user_suggest_degrees = Hash.new
    @all_degrees.each do |degree|
      prediction = 0
      @all_disciplines.each do |discipline|
        prediction= prediction + (matrix[degree.id][discipline.id] * frequency[discipline.id]*user_liked_discipline[discipline.id])
      end
      user_suggest_degrees[degree.id] = prediction
    end
    # puts "user_suggest_degrees",user_suggest_degrees
    
    object  = user_suggest_degrees.sort_by { |k,v| -v }.first(10).to_h.keys
    # na =  object.map{|a| DisciplineUniversity.find(a)}
    return object
    # na.each do |r|
    # #   puts "popp",r.name,r.discipline.name
    # end
    # puts "objects",na
 end

 def set_variables
    @all_degrees = DisciplineUniversity.all
    @all_disciplines = Discipline.all
 end
  

end
