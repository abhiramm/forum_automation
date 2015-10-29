module Generator
        class API < Grape::API
                require 'json'
                require 'open-uri'
                version "v1", :using => :path
                format :json
                prefix :api
                get :keywords do 
                keyword = params[:keyword]  
                uri = URI.parse("http://api.datamuse.com/words?rd=#{keyword}")
                puts "uri #{uri.read}"
                json_values = JSON.parse(uri.read)
                automated_words = json_values.collect {|x| x["word"]}
                final_output = automated_words << params[:keyword]
                final_json = {"key_words" => final_output}

             end
        end
end
