#encoding: cp866
#���᪮-������᪨� ᫮����
@answer_true = 0.00
@answer_all = 0.00
@number_ru = 0
def read_file
	@words_array = []
	input = File.open("words.txt", "r")
	while (line = input.gets)
		@words_array << line.strip.split(",")
	end
	input.close
end
def get_new_word
	@number_ru = rand(0..@words_array.size-1)
	return @words_array[@number_ru][1] #"Enter word on English <b></b>"
end
def compare_words(user_word, ask_word)
	if user_word == ask_word
		puts "�� �ࠢ��쭮!"
		@answer_true += 1
	else
		puts "�訡��! �ࠢ��쭮 - #{ask_word}"
		@words_array << [ask_word, @words_array[@number_ru][1]] #�������� � ���ᨢ ��� ����� ��⮣� ����७�� 
		puts "����� ���������� � ���ᨢ"
	end
end
def print_result
	puts "�� �⢥⨫� �ࠢ��쭮 �� #{@answer_true.to_i} ����ᮢ �� #{@answer_all.to_i}"
	answer_all = (@answer_true/@answer_all)*100
	puts "��業� �������� ᫮���� ��⠢��� #{answer_all.to_i}%"
end

read_file
puts "������⢮ ᫮� � ᫮��� : #{@words_array.size}"

while true
	ask_word = get_new_word
	print "������ ᫮�� '#{ask_word}' �� ������᪮� ��� ������ Enter ��� ��室�: "
	user_word = gets.strip
	if user_word == ''
		break
	end
	@answer_all += 1
	compare_words(user_word, @words_array[@number_ru][0])
end

print_result