require 'csv'
require_relative '../models/post'

class PostsRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @posts = []
    @next_id = 1
    load_csv
  end

  def list
    @posts
  end

  def add(element)
    element.id = @next_id.to_s
    @posts << element
    save_csv
    @next_id += 1
  end

  def headers
    header_array = []
    headers = CSV.read(@csv_file, headers: true).headers
    headers.each do |header|

      header_array << header.to_s.sub(/[@]/, '').sub(/[,]/, '')
    end
    return header_array
  end

private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = @next_id
      row[:read] = row[:read] == "true"
      @posts << Post.new(row)
      @next_id += 1
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "title", "path", "read"]
      @posts.each do |post|
      csv << [post.id, post.title, post.path, post.read]
      end
    end
  end


end
