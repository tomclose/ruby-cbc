module Ilp
  class Constraint

    LESS_OR_EQ = :less_or_eq
    GREATER_OR_EQ = :greater_or_eq
    EQUALS = :equals

    attr_accessor :terms, :type, :bound

    def initialize(terms, type, bound)
      @terms = terms - bound
      @terms.normalize!
      @bound = -1 * @terms.send(:pop_constant)
      @type = type
    end

    def to_s
      case @type
      when LESS_OR_EQ
        sign = '<='
      when GREATER_OR_EQ
        sign = '>='
      when EQUALS
        sign = '='
      else
        sign = '??'
      end
      "#{@terms.to_s} #{sign} #{@bound}"
    end

  end
end
