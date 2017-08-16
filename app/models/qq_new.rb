class QqNew
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String, default: "" #标题
  field :content, type: String, default: "" #内容
  field :url, type: String, default: "" #网址

end