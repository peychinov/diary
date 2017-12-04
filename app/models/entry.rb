class Entry < ActiveRecord::Base
  validates :content, :presence => true
  paginates_per 10

  default_scope { order('happened_on DESC, created_at DESC') }

  acts_as_taggable

  BIBLE_BOOKS = [
    "Genesis (Битие)",
    "Exodus (Изход)",
    "Leviticus (Левит)",
    "Numbers (Числа)",
    "Deuteronomy (Второзаконие)",
    "Joshua (Исус Навин)",
    "Judges (Съдии)",
    "Ruth (Рут)",
    "1 Samuel (1 Царе)",
    "2 Samuel (2 Царе)",
    "1 Kings (3 Царе)",
    "2 Kings (4 Царе)",
    "1 Chronicles (1 Летописи)",
    "2 Chronicles (2 Летописи)",
    "Ezra (Ездра)",
    "Nehemiah (Неемия)",
    "Esther (Естир)",
    "Job (Йов)",
    "Psalm (Псалми)",
    "Proverbs (Притчи)",
    "Ecclesiastes (Еклесиаст)",
    "Song of Solomon (Песен на песните)",
    "Isaiah (Исая)",
    "Jeremiah (Еремия)",
    "Lamentations (Плачът на Еремия)",
    "Ezekiel (Езекиил)",
    "Daniel (Даниил)",
    "Hosea (Осия)",
    "Joel (Йоил)",
    "Amos (Амос)",
    "Obadiah (Авдий)",
    "Jonah (Йон)",
    "Micah (Михей)",
    "Nahum (Наум)",
    "Habakkuk (Авакум)",
    "Zephaniah (Софония)",
    "Haggai (Агей)",
    "Zechariah (Захария)",
    "Malachi (Малахия)",
    "Matthew (Матей)",
    "Mark (Марк)",
    "Luke (Лука)",
    "John (Йоан)",
    "Acts (Деяния)",
    "Romans (Римляни)",
    "1 Corinthians (1 Коринтяни)",
    "2 Corinthians (2 Коринтяни)",
    "Galatians (Галатяни)",
    "Ephesians (Ефесяни)",
    "Philippians (Филипяни)",
    "Colossians (Колосяни)",
    "1 Thessalonians (1 Солунци)",
    "2 Thessalonians (2 Солунци)",
    "1 Timothy (1 Тимотей)",
    "2 Timothy (2 Тимотей)",
    "Titus (Тит)",
    "Philemon (Филимон)",
    "Hebrews (Евреи)",
    "James (Яков)",
    "1 Peter (1 Петрово)",
    "2 Peter (2 Петрово)",
    "1 John (1 Йоаново)",
    "2 John (2 Йоаново)",
    "3 John (3 Йоаново)",
    "Jude (Юда)",
    "Revelation (Откровение)"
  ]

  def tag_names
    tag_list.join(',')
  end

  def self.priority_options
    1..5
  end

  def self.priority_options_for_select
    priority_options.map{ |p| [p,p] }
  end

  def bible_verse
    book.present? ? "#{book} #{chapter}:#{verse}" : ''
  end
end
