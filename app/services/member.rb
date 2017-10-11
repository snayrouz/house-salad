class Member
  attr_reader :role,
              :party,
              :district,
              :seniority

  def initialize(attributes ={})
    @attributes = attributes
    @name       = attributes[:name]
    @role       = attributes[:role]
    @party      = attributes[:party]
    @district   = attributes[:district]
    @seniority  = attributes[:seniority]
  end

  def name
    "#{attributes[:first_name]} #{attributes[:last_name]}"
  end

  private

  attr_reader :attributes

end
