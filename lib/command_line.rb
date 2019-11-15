

class CommandLine

    def welcome
        p "Welcome!"
    end
     
    def get
        $stdin.gets.chomp
    end
    
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

    def movie_titles
     movies = Movie.find(1,2,3,4,5,6,7,8,9,10)
     movies.each do |movie| 
        p "#{movie[:id]}: #{movie[:title]}"
        end
    end

    # def movie_ids
    #     mov_id = []
    #     movie = Movie.find(1,2,3,4,5,6,7,8,9,10)
    #     movie.each do |movie_id|
    #         mov_id << movie_id[:id]
    #         binding.pry
    #     end
    # end
    
    def movie_selection
        p "Please select a movie!"
        
        selection = get.to_i

        movie = Movie.find()
       
        if selection == 1
            p "You've slected #{movie_titles[0]}"
            Show.create(user_id: User.last[:id], movie_id: Movie.find(1), user_name: User.last[:name], movie_title: movie1[:title])

       elsif mov_sel == 2
            p "You've slected #{movie2[:title]}"
            Show.create(user_id: User.last[:id], movie_id: m_id2, user_name: User.last[:name], movie_title: movie2[:title])

        elsif mov_sel == 3
            p "You've slected #{movie3[:title]}"
            Show.create(user_id: User.last[:id], movie_id: m_id3, user_name: User.last[:name], movie_title: movie3[:title])

        elsif mov_sel == 4
            p "You've slected #{movie4[:title]}"
            Show.create(user_id: User.last[:id], movie_id: m_id4, user_name: User.last[:name], movie_title: movie4[:title])

        elsif mov_sel == 5
            p "You've slected #{movie5[:title]}"
            Show.create(user_id: User.last[:id], movie_id: m_id5, user_name: User.last[:name], movie_title: movie5[:title])
         
        else p "Sorry, you entered an incorrect enrtry"
         movie_display
        end
    end

    # def find_your_movie

end







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