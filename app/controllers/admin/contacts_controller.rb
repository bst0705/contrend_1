class Admin::ContactsController < ApplicationController
  before_action :if_not_admin
end
