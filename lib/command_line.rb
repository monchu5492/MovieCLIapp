

class CommandLine

    def welcome
        p "Welcome!"
    end
     
    def get
        $stdin.gets.chomp
    end

    def g3t
        $stdin.gets.chomp.to_i
    end

    #create#
    def new_user
        p "Please enter your name."
        p "***********************"
        name = get
        p "Please enter your age."
        p "***********************"
        age = get
        new_profile = User.create(name: name, age: age)
        p "Thank You #{name}!"
    end

    #create/read#
    def movie_titles
        p "Please select a movie"
     movies = Movie.find(1,2,3,4,5,6,7,8,9,10)
     movie_title = movies.each do |movie| 
        p "#{movie[:id]}: #{movie[:title]}"
     end
     
     num = g3t
     i = 0

     until i == num 
        i += 1
     end
     p "You've selected #{movies[i - 1][:title]}"
     Show.create(user_id: User.last[:id], movie_id: movies[i - 1][:id], user_name: User.last[:name], movie_title: movies[i - 1][:title])
     i = 0
    end

    #read#
    def print_ticket
        p "Here is your movie ticket!"
        p "*****************************"
        p "#{Show.last[:user_name]}" 
        p "#{Show.last[:movie_title]}"
        p "*****************************"
    end

    #update#
    def change_show 
        p "Please select a movie"
        movies = Movie.find(1,2,3,4,5,6,7,8,9,10)
        movie_title = movies.each do |movie| 
        p "#{movie[:id]}: #{movie[:title]}"
    end
        num = g3t
        i = 0
     until i == num 
        i += 1
     end
        p "You've selected #{movies[i - 1][:title]}"
        Show.update(user_id: User.last[:id], movie_id: movies[i - 1][:id], user_name: User.last[:name], movie_title: movies[i - 1][:title])
    end
    
    #read#
    def show_profile
        p User.last[:name]
    end

    #create#
    def new_movie
        p "please enter movie title"
        title = get
        p "please enter the rating"
        rated = get
        p "please enter the genre"
        genre = get
        Movie.create(title: title, rated: rated, genre: genre)
        p "your new movie is #{Movie.last[:title]}, #{Movie.last[:rated]}, #{Movie.last[:genre]}"
    end


    def change_movie
        p "please update movie title"
        title = get
        p "please update movie rating"
        rated = get
        p "please update movie genre"
        genre = get
        Movie.last.update(title: title, rated: rated, genre: genre)
        
    end

    











    
    # p "You've slected #{movie_title[i][:title]}"
    # def movie_ids
    # movie = Movie.find(1,2,3,4,5,6,7,8,9,10)
    # mov_id = movie.map do |id| 
    #      id[:id]
    #     end

    # p "Please select a movie"
    #     num = g3t
    #     movie_selection(num)
        #binding.pry
    #end

    # def movie_ids
    #     mov_id = []
    #     movie = Movie.find(1,2,3,4,5,6,7,8,9,10)
    #     movie.each do |movie_id|
    #         mov_id << movie_id[:id]
    #         binding.pry
    #     end
    # end
    
    
    # def movie_selection
    #     # num = get.to_i
    #     # if num == 
    #         p "You've slected #{movie_title[0][:title]}"
    #         Show.create(user_id: User.last[:id], movie_id: movie_ids[0], user_name: User.last[:name], movie_title: movie[0][:title])
    #         binding.pry
    # end

    # def find_your_movie

end




#elsif mov_sel == 2
    #         p "You've slected #{movie2[:title]}"
    #         Show.create(user_id: User.last[:id], movie_id: m_id2, user_name: User.last[:name], movie_title: movie2[:title])



# elsif mov_sel == movie2[:title] || 2
        # p "You've slected #{movie2[:title]}"
        # Show.create(user_id: User.last[:id], movie_id: m_id2)
        # elsif mov_sel == movie3[:title] || 3
        # p "You've slected #{movie3[:title]}"
        # Show.create(user_id: User.last[:id], movie_id: m_id3)

        # elsif mov_sel == movie2[:title] || 4
        # p "You've slected #{movie4[:title]}"
        # Show.create(user_id: User.last[:id], movie_id: m_id4)

        # elsif mov_sel == movie2[:title] || 5
        # p "You've slected #{movie5[:title]}"
        # Show.create(user_id: User.last[:id], movie_id: m_id5)