class Admin::AdminController < ApplicationController
  before_filter :authenticate_admin_admin_user!
end