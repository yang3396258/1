# coding: utf-8

0.upto(9) do |idx|
  Article.create(
  { title: "新しい本猫が嫌いを購入しました",
    body: "作者が猫が嫌い原因を説明する 作者が猫が嫌い原因を説明する 作者が猫が嫌い原因を説明する 作者が猫が嫌い原因を説明する",
    released_at: 8.days.ago.advance(days: idx),
    expired_at: 2.days.ago.advance(days: idx),
    member_only: (idx % 3 == 0)
  }, without_protection: true)
end

0.upto(29) do |idx|
  Article.create(
  { title: "Article#{idx+10}",
    body: "blah, blah, blah...",
    released_at: 100.days.ago.advance(days: idx),
    expired_at: nil,
    member_only: false
  }, without_protection: true)
end
