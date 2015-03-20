rails new people_management_app

cd people_management_app

bin/rails generate model Person name:string email:string type:string

cd app
cd models
touch user.rb
echo "class User < Person
has_many :post 
end">>user.rb

touch admin.rb
echo "class Admin < Person 
has_many :account 
end">>admin.rb


cd ..

cd ..

bin/rails generate model Post content:string description:string user:references

bin/rails generate model Account account_number:string admin:references


bin/rake db:migrate


rails c

 admin_monica=Admin.create(name: 'monica', email:'monica@gmail.com', type:'Admin')
 account_1=admin_monica.account.build(account_number: '236865')
 account_2=admin_monica.account.build(account_number: '15627672')
 account_1.save
 account_2.save
 admin_pallavi=Admin.create(name: 'Pallavi', email:'pallavi@gmail.com', type:'Admin')
 account_1=admin_pallavi.account.build(account_number: '245536')
 account_1.save
 user_pavan=User.create(name: 'pavan', email:'pavan@gmail.com', type:'User')
 u=user_pavan.post.build(content: 'lake', description: 'lake is beautiful')
 u.save
 user_apoorva=User.create(name: 'apoorva', email:'apoorva@gmail.com', type:'User')
 user_apoorva_post1=user_apoorva.post.build(content: 'lake', description: 'lake is beautiful')
 user_apoorva_post2=user_apoorva.post.build(content: 'ruby', description: 'ruby is fun')
 user_apoorva_post1.save
 user_apoorva_post2.save
 
 user_sudeep=User.create(name: 'sudeep', email:'sudeep@gmail.com', type:'User')
 user_sudeep_post=user_sudeep.post.build(content: 'world_cup!', description: 'India won the match today!')
 user_sudeep_post.save
exit







