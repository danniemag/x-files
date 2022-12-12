# frozen_string_literal: true

# This class is used for querying projects and getting paginated results
class ProjectsQuery
  # Initializes a new instance of `ProjectsQuery`
  #
  # @return [ProjectsQuery]
  #
  def initialize; end

  # @param options [Hash] with any of the following keys:
  # @option :page [Integer] page number, default DEFAULT_PAGE
  # @option :page_size [Integer] results per page, default DEFAULT_PAGE_SIZE
  # @option :filters [String] the parameters in which the query will be based on
  def find(options)
    page = build_page(options[:page])
    page_size = build_page_size(options[:page_size])
    offset = page_size * (page - 1)
    query = data_source(options[:filters])
    query.offset(offset)#.limit(page_size)
  end

  private

  def data_source(filters)
    Rack::Reducer.call(filters&.compact, dataset: base_query, filters: SUPPORTED_FILTERS)
  end

  def base_query
    Project.all.order(:payment_date)
  end

  def build_page(page)
    pn = page.to_i
    return DEFAULT_PAGE_NUMBER unless pn.positive?

    pn
  end

  def build_page_size(page_size)
    ps = page_size.to_i
    return DEFAULT_PAGE_SIZE if ps > MAX_PAGE_SIZE || ps < MIN_PAGE_SIZE

    ps
  end

  DEFAULT_PAGE_NUMBER = 1
  private_constant :DEFAULT_PAGE_NUMBER

  DEFAULT_PAGE_SIZE = 10
  private_constant :DEFAULT_PAGE_SIZE

  MIN_PAGE_SIZE = 1
  private_constant :MIN_PAGE_SIZE

  MAX_PAGE_SIZE = 50
  private_constant :MAX_PAGE_SIZE

  SUPPORTED_FILTERS = [].freeze
  private_constant :SUPPORTED_FILTERS
end


