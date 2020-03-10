

class CommandLine

        def welcome
            puts "__        __  _____   _        ____    ___    __  __   _____ "
            puts "\\ \\      / / | ____| | |      / ___|  / _ \\  |  \\/  | | ____|"
            puts " \\ \\ /\\ / /  |  _|   | |     | |     | | | | | |\\/| | |  _|  "
            puts "  \\ V  V /   | |___  | |___  | |___  | |_| | | |  | | | |___ "
            puts "   \\_/\\_/    |_____| |_____|  \\____|  \\___/  |_|  |_| |_____|"
            s_help(28)
            p "press enter to continue"
            binding.pry
            s_help(28)
            answer = get
            if answer == ""
            new_user
            else 
                exit
            end                                           
            s_help(20)

            
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
        p "here is your movie selection"
        s_help(10)
        movies = Movie.all.each{|movie| 
        p "#{movie.id} #{movie.title}" 
        p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"}
        s_help(5)
        p "press (c) to continue to the main menu"
        p "or press the space bar to exit"
        answer == get
        if answer == "c"
            display_choices
        elsif answer = " "
            exit
        else 
            p "that is an invalid choice"
            p "please select a diffenet option"
            all_movies
        end
    end
            
    def user_move_to_movie 
        p "would you like to select a movie now?"
        s_help(5)
        p "yes or no"
        s_help(5)
        answer = get
        s_help(11)
        if answer == "yes"
            select_movie
        elsif answer == "no"
            display_choices
        else
            p "that was a wrong selection"
            p "please try again"
            user_move_to_movie
        end
    end

    def new_user
        p "Please enter your name."
        p "***********************"
        s_help(31)
        name = get
        s_help(27)
        p "Please enter your age."
        p "***********************"
        s_help(32)
        age = get
        s_help(18)
        User.create(name: name, age: age)
        p "Thank You #{name}!"
        s_help(31) 
        user_move_to_movie  
        #find_and_create_by
    end
    #read#
    def select_movie
        p "Please select a movie for a movie ticket"
        s_help(10)
     movies = Movie.find(1,2,3,4,5,6,7,8,9,10)
     movie_title = movies.each do |movie| 
        p "#{movie[:id]}: #{movie[:title]}"
        s_help(2)
     end
     s_help(10)
     num = g3t
     s_help(7)
     i = 0

     until i == num 
        i += 1
     end
     p "You've selected #{movies[i - 1][:title]}"
     Show.create(user_id: User.last[:id], movie_id: movies[i - 1][:id], 
     user_name: User.last[:name], movie_title: movies[i - 1][:title])
     s_help(17)
     i = 0
     print_ticket
    end

    def print_help
        p "press (c) to continute to main menu"
        s_help(5)
        p "or press the spacebar to exit"
        s_help(12)
        answer = get
        if answer == "c"
            display_choices
        elsif answer == " "
            exit
        else
            p "that was an incorrect input"
            s_help(2)
            p "please select from the previous options"
            print_help
        end
    end

    def show_user
        p "************************"
        p "#{User.last.name}"
        p "************************"
        s_help(5)
        puts "/\\/\\/\\/\\/\\/\\/\\/\\/\\"
        s_help(5)
        p "************************"
        p "#{User.last.age}"
        p "************************"
        s_help(25)
        p "would you like to return to the main menu?"
        p " yes or no"
        answer = get
        s_help(22)
        if answer == "yes"
            display_choices
        else 
            show_user
        end
    end

    def print_ticket
        if User.last == nil
         p "there are no users or shows available"
         s_help(2)
         show_user
         s_help(2)
         p "please create a user"
         s_help(5)
         new_user
        else    

         puts"    __  __                      _                                                                                         __     _            __           __     __"
        puts"   / / / /  ___    _____  ___  ( )   _____          __  __  ____   __  __   _____          ____   ___  _      __         / /_   (_)  _____   / /__  ___   / /_   / /"
       puts"  / /_/ /  / _ \\  / ___/ / _ \\ |/   / ___/         / / / / / __ \\ / / / /  / ___/         / __ \\ / _ \\| | /| / /        / __/  / /  / ___/  / //_/ / _ \\ / __/  / /" 
      puts" / __  /  /  __/ / /    /  __/     (__  )         / /_/ / / /_/ // /_/ /  / /            / / / //  __/| |/ |/ /        / /_   / /  / /__   / ,<   /  __// /_   /_/"  
     puts"/_/ /_/   \\___/ /_/     \\___/     /____/          \\__, /  \\____/ \\__,_/  /_/            /_/ /_/ \\___/ |__/|__/         \\__/  /_/   \\___/  /_/|_|  \\___/ \\__/  (_)"   
    puts"                                                  /____/                                                                                                           "  

        s_help(10)
        p "*****************************"
        p "*****************************"
        s_help(3)

        p "#{Show.last[:user_name]}" 
        p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        p "#{Show.last[:movie_title]}"
        s_help(3)
        p "*****************************"
        p "*****************************"
        s_help(10)
        print_help
        end
    end
        
        
 

    #update#
    def change_movie
        p "would you like to change your movie?"
        s_help(10)
        p "yes or no"
        s_help(10)
        answer = get
        if answer == "yes"
            p "Please select a movie you would like to switch to"
            s_help(10)
            movies = Movie.find(1,2,3,4,5,6,7,8,9,10)
            movie_title = movies.each do |movie| 
            p "#{movie[:id]}: #{movie[:title]}"
            end
            num = g3t

            i = 0
            until i == num 
            i += 1
            end
            Show.last.update(user_id: User.last[:id], movie_id: movies[i - 1][:id], 
            user_name: User.last[:name], movie_title: movies[i - 1][:title])
            print_ticket
            s_help(5)
            display_choices
        elsif answer == "no"
            display_choices
        else 
            p "that wasnt a valid option"
            s_help(10)
            p "please try again"
            change_movie
        end
    end

    
    
    def update_user
        p "your user profile is"
        s_help(5)
        p "#{User.last}// name: #{User.last.name}   age: #{User.last.age}"
        s_help(5)
        p "would you like you update your profile?"
        s_help(5)
        p "yee or naw?"
        s_help(5)
        answer = get
        if answer == "yee"
            p "please enter your new user name"
            s_help(10)
            new_name = get
            p "please enter your new age"
            s_help(10)
            new_age = g3t
            new_profile = User.last.update(name: new_name, age: new_age)
            Show.last.update(user_name: new_name)
            p "your new user profile is #{User.last}// name: #{User.last.name}   age: #{User.last.age}"
            s_help(10)
            display_choices
        elsif answer == "naw"
            display_choices
        else
            p "you entrance is invalid"
            s_help(10)
            p "please try again"
            update_user
            s_help(10)
        end
        
    end
    
    def delete_user
        p "are you sure you want to delete this user?"
        s_help(10)
        p "yes or no"
        s_help(10)
        answer = get
        if answer == "yes"
            #User.last.empty?
            User.last.delete
            Show.last.delete
            p "your user and show have been deleted"
            s_help(10)
            p "please create a new user"
            s_help(10)
            new_user
        elsif answer == "no"
            display_choices
        else
            p "this is not a valid answer"
            s_help(10)
            p "please try again"
            delete_user
            s_help(10)
        end
    end
    
    
    def delete_show
        p "are you sure you want to remove your ticket?"
        s_help(10)
        p "yes or no"
        s_help(10)
        answer = get
        if answer == "yes"
            Show.last.delete
            p "your show has been deleted"
            s_help(10)
            p "here are all known movie tickets"
            s_help(10)
            Show.all.each{|show| p "#{show.user_name}///#{show.movie_title}"}
            display_choices
        elsif answer == "no"
            display_choices
        else
            p "sorry that is not a selection"
            s_help(10)
            p "please try again"
            delete_show
            s_help(10)
        end
    end
    
    
    
    
    def display_choices
        puts "   __  ___         _              __  ___  "               
        puts "  /  |/  / ___ _  (_)  ___       /  |/  / ___   ___  __ __"
        puts " / /|_/ / / _ `/ / /  / _ \\     / /|_/ / / -_) / _ \\/ // /"
        puts "/_/  /_/  \\_,_/ /_/  /_//_/    /_/  /_/  \\__/ /_//_/\\_,_/ "
        s_help(8)
        
        puts "          _             _                             _      _                           _   _   _             _                _         ___ "
        puts "__ __ __ | |_    __ _  | |_    __ __ __  ___   _  _  | |  __| |    _  _   ___   _  _    | | (_) | |__  ___    | |_   ___     __| |  ___  |__ \\"
        puts "\\ V  V / | ' \\  / _` | |  _|   \\ V  V / / _ \\ | || | | | / _` |   | || | / _ \\ | || |   | | | | | / / / -_)   |  _| / _ \\   / _` | / _ \\   /_/"
         puts " \\_/\\_/  |_||_| \\__,_|  \\__|    \\_/\\_/  \\___/  \\_,_| |_| \\__,_|    \\_, | \\___/  \\_,_|   |_| |_| |_\\_\\ \\___|    \\__| \\___/   \\__,_| \\___/  (_) "
           puts "                                                                  |__/                                                                       "
            
            s_help(10)
            p "1. list all movies"
            s_help(2)
            p "2. create a new user"
            s_help(2)
            p "3. select a movie"
            s_help(2)
            p "4. print your ticket"
            s_help(2)
            p "5. change your movie"
            s_help(2)
            p "6. update your user"
            s_help(2)
            p "7. delete your ticket"
            s_help(2)
            p "8. delete your user"
            s_help(2)
            p "9. show your profile"
            s_help(2)
            p "10. exit"
            s_help(7)
            
            input = g3t 
            s_help(18)      
            
            case input
            when 1
                all_movies
            when 2
                new_user
            when 3
                select_movie
            when 4
                print_ticket
            when 5
                change_movie
            when 6
                update_user
            when 7
                delete_show
            when 8
                delete_user
            when 9 
                show_user
            when 10
                exit
            else
                p "that selection was invalid"
                s_help(5)
                p "please try again"
                display_choices
                s_help(5)
            end
        end



                # def host_movie
                #     p "would you like to host a movie?"
                #     p "yes or no?"
                #     answer = get
                #     if answer == "no"
                #         display_choices
                #     elsif answer == "yes"
                #         p "please give the title of your movie"
                #         title = get
                #         p "please give the rating for the movie"
                #         rated = 
            
            
                
                # def change_movie
                #     p "would like to host a movie?"
                #     p "yes or no?"
                #     answer = get
                #     if answer == "yes"
                #         movies = Movie.find(1,2,3,4,5,6,7,8,9,10)
                #         p "please select the incorrect movie "
                #         movies = Movie.all.each{|movie| p "#{movie.id}) #{movie.title}"}
                    
                #         n = g3t
            
                #         i = 0
                #         until i == n
                #         i += 1
                #         end
            
                #         s = Show.last.update(movie_id: i, movie_title: movies[i - 1][:title])
                #         print_ticket
                #     elsif answer == "no"
                #         display_choices
                #     else
                #         p "does not compute"
                #         p "please select again"
                #         change_movie
                #     end
                # end
        
        # def delete_movie
        #     p "are you sure you want to remove a movie?"
        #     p "yes or no"
        #     answer = get     
        #      if answer == "yes"
        #         p "please select the movie you wish to remove"
        #         p "or press 0 to go back"
        #         movies = Movie.all.each{|movie| p "#{movie.id}) #{movie.title}"}
        #         n = g3t
        #         i = 0
        #         until i == n
        #             i += 1
        #         end
        #
        #         if n == 0
        #             delete_movie
        #         else
        #          Movie.find_by(id: n).delete
        #          Show.last.delete
        #          p "your movie and show have been removed"
        #          p "your new movie selection"
        #          all_movies
        #         end
        #     elsif answer == "no"
        #         display_choices
        #     end
        # end


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