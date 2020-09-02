class Organization < ApplicationRecord
  has_many :posts

  #after_create :create_bucket

  def create_bucket #This is not working returning Aws::S3::Errors::XAmzContentSHA256Mismatch
    if self.bucket_name.present?
      client = Aws::S3::Resource.new( access_key_id:  ENV.fetch("S3_KEY"), secret_access_key:  ENV.fetch("S3_SECRET"), endpoint: 'https://sgp1.digitaloceanspaces.com', region: 'sgp1' )
      client.create_bucket({ bucket: bucket_name, acl: "private" })
    end
  end
end
