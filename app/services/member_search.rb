class MemberSearch
  def initialize(us_state)
    @us_state = us_state
  end

  def members
    @members = raw_members.map do |raw_member|
      Member.new(raw_member)
    end
  end

  private
    attr_reader :us_state

    def raw_members
      service.filter_by_state(us_state)[:results]
    end

    def service
      PropublicaService.new
    end
end
