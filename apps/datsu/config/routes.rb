# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `Datsu::Controllers::Home::Index` action in `apps/datsu/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
# get '/', to: 'home#index'
resources 'identities', only: [:create]
