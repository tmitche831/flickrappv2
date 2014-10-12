class PhotosController < ApplicationController
	require 'flickraw'
	
	def index
		# raise
		text = params[:text]

		# https://github.com/hanklords/flickraw
		FlickRaw.api_key="ac2666e61447397277d2cc9e75652f7b"
		FlickRaw.shared_secret="22a4cfc651335bd8"
		# @photos = flickr.photos.search(
		@photos = flickr.photos.getRecent(
			# :text => params[:text], 
			:per_page => 8, 
			:page => params[:page] || 1 
		)

		@photos.each do |pic|
			photos_info = flickr.photos.getInfo(:photo_id => pic.id)
			photo_url_medium = FlickRaw.url(photos_info)
			photo_url_large = FlickRaw.url_b(photos_info)

			sizes = flickr.photos.getSizes :photo_id => pic.id
			original = sizes.find {|s| s.label == 'Original' }
			puts "------------------------------------"
			puts "#{photos_info.title}"
			# # puts "You can find this photo at #{photo_url_medium}"
			# # # puts "#{original.height}"
			# # puts "---------------------------------------"
			
		end
	end

	def show
		
		
	end
end
