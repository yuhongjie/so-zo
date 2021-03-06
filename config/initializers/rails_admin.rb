RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  #for jcrop
  config.model User do
    configure :photo, :jcrop

    #what edit will show
    edit do
      field :name
      field :password
      field :password_confirmation
      field :sex
      field :occupation
      field :phone
      field :address
      field :motto
      field :description
      field :roles
      field :photo do
        jcrop_options aspectRatio: 500.0/320.0
      end
    end

    # what list will show
    list do
      field :name
      field :roles
      field :sex
      field :occupation
      field :phone
      field :address
    end

  end
 #order fields
  config.model Product do
    edit do
      field :name
      field :illustration
      field :product_template
      field :description
      field :price
      field :position_X
      field :position_Y
      field :ill_size_W
      field :ill_size_H
      field :product_image
    end
  end

end
