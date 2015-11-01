module Generator
        class API < Grape::API
                require 'json'
                require 'open-uri'
                version "v1", :using => :path
                format :json
                prefix :api
                get :keywords do 
                        keywords = {}
                        #                keyword = params[:keyword]  
                        i = 1
                        params.each do |k|
                                @word = params["key#{i}"]
                                uri = URI.parse("http://api.datamuse.com/words?rd=#{@word}")
                                puts "uri #{uri.read}"
                                json_values = JSON.parse(uri.read)
                                automated_words = json_values.collect {|x| x["word"]}
                                final_output = automated_words << params["key#{i}"]
                                keywords[@word] = final_output
                                i = i+1
                        end
                        keywords
                        #          final_json = {"key_words" => final_output}

                end
        end
end
