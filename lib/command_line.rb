

class CommandLine

        def welcome
            puts "__        __  _____   _        ____    ___    __  __   _____ "
            puts "\\ \\      / / | ____| | |      / ___|  / _ \\  |  \\/  | | ____|"
            puts " \\ \\ /\\ / /  |  _|   | |     | |     | | | | | |\\/| | |  _|  "
            puts "  \\ V  V /   | |___  | |___  | |___  | |_| | | |  | | | |___ "
            puts "   \\_/\\_/    |_____| |_____|  \\____|  \\___/  |_|  |_| |_____|"
                                                                         
                                                      
            s_help(27)
        end
     
    def get
        $stdin.gets.chomp
    end

    def g3t
        $stdin.gets.chomp.to_i
    end
    
    def s_help(num)
        num.times do
            puts " "
        end
    end

    def all_movies
        movies = Movie.all.each{|movie| p "#{movie.id}) #{movie.title}"}
    end
            
    def new_user
        p "Please enter your name."
        p "***********************"
        s_help(28)
        name = get
        p "Please enter your age."
        p "***********************"
        s_help(15)
        age = get
        new_profile = User.create(name: name, age: age)
        p "Thank You #{name}!"
    end
    #read#
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
     Show.create(user_id: User.last[:id], movie_id: movies[i - 1][:id], 
     user_name: User.last[:name], movie_title: movies[i - 1][:title])
     i = 0
     print_ticket
    end

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
        Show.last.update(user_id: User.last[:id], movie_id: movies[i - 1][:id], 
        user_name: User.last[:name], movie_title: movies[i - 1][:title])
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


    def update_user
        p "your user profile is"
        p "#{User.last}// name: #{User.last.name}   age: #{User.last.age}"
        p "would you like you update your profile?"
        p "yee or naw"
        answer = get
        if answer == "yee"
            p "please enter your new user name"
            new_name = get
            p "please enter your new age"
            new_age = g3t
            new_profile = User.last.update(name: new_name, age: new_age)
            p "your new user profile is #{User.last}// name: #{User.last.name}   age: #{User.last.age}"
        elsif answer == "naw"
            display_choices
        else
            p "you entrance is invalid"
            p "please try again"
            update_user
        end

    end

    def delete_user
        p "are you sure you want to delete this user?"
        p "yes or no"
        answer = get
        if answer == "yes"
            User.last.delete
            p "your user has been deleted"
            p "please create a new user"
            new_user
        elsif answer == "no"
            display_choices
        else
            p "this is not a valid answer"
            p "please try again"
            delete_user
        end
    end

    def delete_movie
        p "are you sure you want to remove a movie?"
        p "yes or no"
        answer = get     
         if answer == "yes"
            p "please select the movie you wish to remove"
            all_movies
            p "or press 0 to go back"
            n = g3t
            i = 0
            until i == n
                i += 1
            end
    
            if n == 0
                delete_movie
            else
             s = Movie.find_by(id: n).delete
             p "your new movie selection"
             all_movies
             display_choices
            end
        elsif answer == "no"
            display_choices
        end

    end



    
    def display_choices
        
        p "what would you like to do?"
        p "1. print your ticket"
        p "2. change your show"
        p "3. show your profile"
        p "4. search a different movie"
        p "5. change your movie"
        p "6. delete use"
        
         input = g3t       
         
         case input
         when 1
            print_ticket
         when 2
            change_show
         when 3
            show_profile
         when 4
            search_dif_movie
         when 5
            change_movie
         when 6
            delete_user
         else
            p "that selection was invalid"
            p "please try again"
            display_choices
         end
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
    #     binding.pry
    # end

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