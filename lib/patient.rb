#The Patient class needs a class variable @@all that begins as an empty array.
#The Patient class needs a class method .all that lists each patient in the class variable.
#A patient is instantiated with a name and be saved in the @@all array.
#new_appointment, that takes in an argument of a doctor and a date and creates a new Appointment. The Appointment should know that it belongs to the patient.
#appointments, that iterates through the Appointments array and returns Appointments that belong to the patient.
#doctors, that iterates over that patient's Appointments and collects the doctor that belongs to each Appointment.

class Patient

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date) #creates new Appointmen
        Appointment.new(date, self, doctor)
    end

    def appointments #from Appointments returns all that belong to patient
        Appointment.all.select {|appointment| appointment.patient == self}
    end

    def doctors #from Appointments returns all doctors that belong to each Appointment
        doctors = []
        Appointment.all.each do |appointment|
            if appointment.patient == self
                doctors << appointment.doctor
            end
        end
        doctors
    end
end