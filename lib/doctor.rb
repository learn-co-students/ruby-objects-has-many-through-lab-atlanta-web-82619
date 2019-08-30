#The Doctor class needs a class variable @@all that begins as an empty array.
#The Doctor class needs a class method .all that lists each doctor in the class variable.
#A doctor should be initialized with a name and be saved in the @@all array.
#new_appointment, that takes in a an instance of the Patient class and a date, and creates a new Appointment. That Appointment should know that it belongs to the doctor
#appointments, that iterates through all Appointments and finds those belonging to this doctor.
#patients, that iterates over that doctor's Appointments and collects the patient that belongs to each Appointments.

class Doctor

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments #list all Appointments that match the doctor
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def patients #loops over Appointments and finds the patient that belongs to each Appointment???
        patients = []
        Appointment.all.map do |appointment|
            if appointment.doctor == self
                patients << appointment.patient
            end
        end
        patients
    end

end