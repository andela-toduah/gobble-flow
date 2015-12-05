module RootHelper
  MAX_CHAR = 40

  def show_popular_links
    links = map_link_details_popular
    render partial: "link_card", collection: links, as: :card_link
  end

  def show_recent_links
    links = map_link_details_recent
    render partial: "link_card", collection: links, as: :card_link
  end

  def map_link_details_popular
    @popular.map do |link|
      click_count =
        link.count.to_s <<
        (link.count == 1 ? " click" : " clicks")
      map_helper(click_count, link)
    end
  end

  def map_link_details_recent
    @recent.map do |link|
      time_distance =
        distance_of_time_in_words(link.created_at, Time.zone.now) << " ago"
      map_helper(time_distance, link)
    end
  end

  def map_helper(badge, link)
    full_url = link.full_url
    get_object(
      badge, full_url, get_compact_form(full_url),
      generate_link(link)
    )
  end

  def get_compact_form(long_string)
    long_string[0..MAX_CHAR] <<
      (long_string.length <= MAX_CHAR ? "" : "...")
  end

  def generate_link(link)
    short_link = link_url(link)
    compact_short_url = get_compact_form(short_link)
    link_to compact_short_url, short_link
  end

  def get_object(*text_strings)
    {
      badge: text_strings[0],
      full_url: text_strings[1],
      compact_full_url: text_strings[2],
      link_to_url: text_strings[3]
    }
  end
end