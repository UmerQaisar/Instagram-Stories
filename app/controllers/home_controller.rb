class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :instagram_client

  def index
    @data = @ig.stories
  end

  private

  def instagram_client
    access_token = current_user.long_lived_access_token
    @ig = InstagramGraphApi.new(access_token: access_token)
  end

  { "id" => "18045309670774650",
    "media_url" => "https://scontent.cdninstagram.com/o1/v/t16/f1/m78/EB472AB291FD2C1D29365AC31AA16B98_video_dashinit.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLnN0b3J5LnVua25vd24tQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=104&vs=965181678242532_1042572063&_nc_vs=HBkcFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0VCNDcyQUIyOTFGRDJDMUQyOTM2NUFDMzFBQTE2Qjk4X3ZpZGVvX2Rhc2hpbml0Lm1wNBUAAsgBACgAGAAbAYgHdXNlX29pbAExFQAAJo78veHt0%2Fs%2FFQIoAkMzLBdAB3bItDlYEBgSZGFzaF9iYXNlbGluZV8xX3YxEQB16AcA&ccb=9-4&oh=00_AYAVoxLAZonBOIL3z83qi7Y3VHO9UC8jHyTgoJq6ApzJUA&oe=66468E43&_nc_sid=1d576d",
    "media_type" => "VIDEO",
    "caption" => "@abcnews",
    "timestamp" => "2024-05-15T12:13:07+0000",
    "thumbnail_url" => "https://scontent.cdninstagram.com/v/t51.36329-15/444434705_1676046306496898_7008405131427683953_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=18de74&_nc_ohc=PPCNb0pDQdIQ7kNvgE5Y3o2&_nc_oc=AdipFKUxdvhslnR8HD_cdWixM-tfvoTWo7STLBLu0__CVj0Io9_Kn6aVwxr_F_1PST8&_nc_ht=scontent.cdninstagram.com&edm=AB9oSrcEAAAA&oh=00_AYAS_I4TdWA6WuinOX_d6GQcAUseONI1qDapLpM9EMG6vA&oe=664A8577" }
end
