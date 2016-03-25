class SitesController < ApplicationController
  def index
    @sites = Site.all.page(params[:page] || 0)
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
  end

  private

  def site_params
    params.require(:site).permit(:name, :url, :description, :ranking)
  end
end
