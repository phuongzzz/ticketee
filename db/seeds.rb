unless User.exists? email: "admin@ticketee.com"
  User.create! email: "admin@ticketee.com", password: "phuongphuong",
    admin: true
end

unless User.exists? email: "viewer@ticketee.com"
  User.create! email: "viewer@ticketee.com", password: "namphuong"
end

["Sublime Text 3", "Internet Explorer"].each do |name|
  unless Project.exists? name: name
    Project.create! name: name, description: "a #{name} project's description"
  end
end
