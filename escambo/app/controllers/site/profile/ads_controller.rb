class Site::Profile::AdsController < Site::ProfileController
  before_filter :set_ad, :only => [:edit, :update]

  def index
    @ads = Ad.to_the(current_member.id)
  end

  def edit
    #set_ad via before filter
  end

  def update
    if @ad.update_attributes(params_ad)
      redirect_to site_profile_ads_path, notice: "Anúncio atualizado com sucesso"
    else
      render :edit
    end
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_ad)
    @ad.member = current_member

    if @ad.save
      redirect_to site_profile_ads_path, notice: "Anúncio Cadastrado com sucesso"
    else
      render :new
    end

  end

  private

    def set_ad
      @ad = Ad.find(params[:id])
    end

    def params_ad
      params[:ad]
    end
end
