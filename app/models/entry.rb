class Entry < ActiveRecord::Base
  validates :content, :presence => true

  default_scope { order('happened_on DESC, created_at DESC') }

  acts_as_taggable

  BIBLE_BOOKS = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", "Joshua", "Judges",
    "Ruth", "1 Samuel", "2 Samuel", "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra", "Nehemiah",
    "Esther", "Job", "Psalm", "Proverbs", "Ecclesiastes", "Song of Solomon",
    "Isaiah", "Jeremiah", "Lamentations", "Ezekiel", "Daniel",
    "Hosea", "Joel", "Amos", "Obadiah", "Jonah", "Micah", "Nahum",
    "Habakkuk", "Zephaniah", "Haggai", "Zechariah", "Malachi",
    "Matthew", "Mark", "Luke", "John",
    "Acts", "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians", "Philippians", "Colossians",
    "1 Thessalonians", "2 Thessalonians", "1 Timothy", "2 Timothy", "Titus", "Philemon", "Hebrews",
    "James", "1 Peter", "2 Peter", "1 John", "2 John", "3 John", "Jude", "Revelation"]

  def self.search(params)
    params[:tag].present? ? Entry.tagged_with(params[:tag]) : Entry.all
  end

  def tag_names
    tag_list.join(',')
  end

  def self.priority_options
    1..5
  end

  def self.priority_options_for_select
    priority_options.map{ |p| [p,p] }
  end

end
