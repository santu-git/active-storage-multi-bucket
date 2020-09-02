class ApplicationController < ActionController::Base
  def s3_service
    service = ActiveStorage::Blob.service
    return unless service.class.to_s ==   'ActiveStorage::Service::S3Service'
    service
  end
  
end
