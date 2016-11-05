class Worker < ActiveRecord::Base

	validates :first_name, presence: {message: "Por favor ingrese su(s) nombre(s)"}
	validates :last_name, presence: {message: "Por favor ingrese su(s) apellidos(s)"}

	validates :cc, presence: {message: "Por favor ingrese su cedula"}
	validates :cc, numericality: {message: "Su cedula solo debe contener numeros"}
	validates :cc, uniqueness: {message: "Esta cedula ya esta resgistrada"}


	belongs_to :user
	has_many :has_workers
  has_many :groups, through: :has_workers
	has_many :reports, class_name: 'Report', foreign_key: 'created_by_id'
end
