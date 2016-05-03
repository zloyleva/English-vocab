#encoding : utf-8
#@random_num = 0
@result = ""
$answer_true = 0
$answer_all = 0

def read_file
	@arr = []
	input = File.open("text.txt", "r")
	while (line = input.gets)
		temp = []
		temp = line.strip.split(",")
		temp[1] = temp[1].force_encoding('UTF-8') #.force_encoding('UTF-8')
		@arr << temp
	end
	input.close
	return @arr.size
end
def get_new_russ
	@random_num = rand(0..@arr.size-1)
	@eng_word = @arr[@random_num][0]
	return @rus_word = @arr[@random_num][1] 
end
def compare_words(user_word, eng_word, rus_word)
	$answer_all += 1
	if user_word == eng_word
		$answer_true += 1
		@result = "<p class=\"bg-success\">Правильно!</p><p>Количество правильных ответов: #{$answer_true}<br>Общее число ответов: #{$answer_all}</p>"
	else
		#@arr << [@eng_word, @rus_word] #Дабавить в массив для более частого повторения 
		@result = "<p class=\"bg-warning\">Ошибка! Вы ввели: #{user_word}, а правильно: #{eng_word}</p><p>Количество правильных ответов: #{$answer_true}<br>Общее число ответов: #{$answer_all}</p>"
	end
end

require 'sinatra'

get '/' do
	@answer_true = 0

	@vocab_size = read_file
	@srt_enc = get_new_russ 
	erb :index
end

post '/' do
	input_user_word = params[:user_word]
	input_rus_word = params[:rus_word]
	input_eng_word = params[:eng_word]
	compare_words(input_user_word, input_eng_word, input_rus_word)

	@vocab_size = read_file
	@srt_enc = get_new_russ 

	erb :index
end