# coding: utf-8

%w(Taro Jiro Hana).each do |name|
  member = Member.find_by_name(name)
  0.upto(9) do |idx|
    entry = Entry.create(
    { author: member,
      title: "新しい本猫が嫌いを購入しました",
      body: "新しい本を登録しました",
      posted_at: 10.days.ago.advance(days: idx),
      status: %w(draft member_only public)[idx % 3]
    }, without_protection: true)
    
    if idx == 7 || idx == 8
      %w(John Mike Sophy).each do |name2|
        voter = Member.find_by_name(name2)
        voter.voted_entries << entry
      end
    end
  end
end
