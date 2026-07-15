-- Run this before removing *_gb fields from the admin/database.
-- It copies non-empty Googlebot SEO content into the normal fields used by the live templates.

START TRANSACTION;

UPDATE configs AS normal
JOIN configs AS googlebot
  ON googlebot.name = CONCAT(normal.name, '_gb')
SET normal.content = googlebot.content,
    normal.updated_at = NOW()
WHERE normal.name IN (
    'home_lilly_about_title',
    'home_lilly_about_desc',
    'home_health_about_title',
    'home_health_about_desc',
    'advs_title',
    'home_diversified_about_title',
    'home_diversified_about_desc',
    'home_news_about_title',
    'home_news_about_desc'
)
  AND googlebot.content IS NOT NULL
  AND googlebot.content <> '';

UPDATE article_cates
SET name = name_gb,
    updated_at = NOW()
WHERE name_gb IS NOT NULL
  AND name_gb <> '';

UPDATE categories
SET `describe` = describe_gb,
    updated_at = NOW()
WHERE describe_gb IS NOT NULL
  AND describe_gb <> '';

UPDATE categories
SET `describe2` = describe2_gb,
    updated_at = NOW()
WHERE describe2_gb IS NOT NULL
  AND describe2_gb <> '';

UPDATE faqs
SET questions = questions_gb,
    updated_at = NOW()
WHERE questions_gb IS NOT NULL
  AND questions_gb <> '';

UPDATE faqs
SET answers = answers_gb,
    updated_at = NOW()
WHERE answers_gb IS NOT NULL
  AND answers_gb <> '';

UPDATE navigations
SET name = name_gb,
    updated_at = NOW()
WHERE name_gb IS NOT NULL
  AND name_gb <> '';

UPDATE pages
SET title = title_gb,
    updated_at = NOW()
WHERE title_gb IS NOT NULL
  AND title_gb <> '';

UPDATE configs
SET content = '性健康知識分享｜禮來犀利士不斷提高不同族群的性健康品質',
    updated_at = NOW()
WHERE name IN ('home_diversified_about_title', 'home_diversified_about_title_gb');

UPDATE configs
SET content = '訂購犀利士壯陽藥｜讓陰莖持久勃起可達36小時，提升親密體驗',
    updated_at = NOW()
WHERE name IN ('advs_title', 'advs_title_gb');

UPDATE pages
SET title = '性健康知識',
    title_gb = '性健康知識',
    updated_at = NOW()
WHERE uri = 'sexual-health';

UPDATE pages
SET title = '犀利士正品壯陽藥線上訂購｜延長陰莖勃起時間',
    title_gb = '犀利士正品壯陽藥線上訂購｜延長陰莖勃起時間',
    updated_at = NOW()
WHERE uri = '/';

UPDATE navigations
SET name = '性健康知識',
    name_gb = '性健康知識',
    updated_at = NOW()
WHERE id IN (18);

UPDATE seos
SET title = CASE id
    WHEN 1 THEN '犀利士壯陽藥線上訂購官網｜陰莖持久勃起・親密不間斷'
    WHEN 2 THEN '犀利士壯陽藥20mg訂購｜陰莖勃起最持久・多次親密不疲軟'
    WHEN 3 THEN '犀利士壯陽藥10mg訂購｜陰莖持久勃起・滿足多次親密需求'
    WHEN 4 THEN '犀利士壯陽藥5mg訂購｜陰莖持續勃起・表現更持久'
    WHEN 5 THEN '犀利士壯陽藥2.5mg訂購｜幫助陰莖勃起・每日規律服用'
    WHEN 6 THEN '如何訂購犀利士，輕鬆提升親密體驗'
    WHEN 7 THEN '顧客隱私保障，犀利士官網守護你的個人資料'
    WHEN 8 THEN '犀利士官網完善的售後支持，使用更無憂'
    WHEN 9 THEN '快速查詢犀利士訂單，掌握每一次配送'
    WHEN 10 THEN '認識勃起障礙，犀利士助你親密更順暢'
    WHEN 11 THEN '了解犀利士機轉原理，改善親密時的勃起問題'
    WHEN 12 THEN '犀利士用法功效解析，讓親密更持久滿意'
    WHEN 13 THEN '犀利士不良反應說明，保障你的性健康'
    WHEN 14 THEN '注意事項提示，犀利士助你放心使用'
    WHEN 15 THEN '犀利士常見疑問，專業解答用藥問題'
    WHEN 16 THEN '性健康秘訣分享，犀利士助你享受美好親密生活'
    WHEN 17 THEN '犀利士使用心得分享，改善你的親密品質'
    WHEN 18 THEN '犀利士官網介紹，陪伴你的每次親密時刻'
    WHEN 19 THEN '犀利士專業客服，陪伴你用藥每一步'
    ELSE title
END,
    updated_at = NOW()
WHERE id BETWEEN 1 AND 19;

UPDATE seos
SET key_word = '犀利士，Cialis，他達拉非，壯陽藥，犀利士線上訂購',
    description = '犀利士Cialis線上訂購官網，提供不同劑量壯陽藥方案，協助改善男性勃起功能障礙，重視正品保障、隱私配送與售後服務。',
    updated_at = NOW()
WHERE id = 1;

UPDATE categories
SET describe2 = CASE id
    WHEN 1 THEN '陰莖勃起最持久｜發揮穩定表現'
    WHEN 2 THEN '陰莖持久勃起｜滿足多次親密需求'
    WHEN 3 THEN '陰莖短期勃起｜穩定自然發揮'
    WHEN 4 THEN '幫助陰莖勃起｜每日規律服用'
    ELSE describe2
END,
    describe2_gb = CASE id
    WHEN 1 THEN '陰莖勃起最持久｜發揮穩定表現'
    WHEN 2 THEN '陰莖持久勃起｜滿足多次親密需求'
    WHEN 3 THEN '陰莖短期勃起｜穩定自然發揮'
    WHEN 4 THEN '幫助陰莖勃起｜每日規律服用'
    ELSE describe2_gb
END,
    updated_at = NOW()
WHERE id IN (1, 2, 3, 4);

UPDATE faqs
SET questions = '親密前如何服用犀利士，效果最佳？',
    questions_gb = '親密前如何服用犀利士，效果最佳？',
    updated_at = NOW()
WHERE id = 9;

UPDATE configs
SET content = '壯陽藥犀利士Cialis自推出來就廣受市場歡迎，如宣稱效果一樣，不少患者服用後都表示藥效能夠維持2天到3天時間。而且有了每日錠5mg後，親密生活更加穩定和諧，特別是無法精準控制親密時間的情境，犀利士可補足短效藥物的不足，極大提高伴侶之間的親密幸福度。',
    updated_at = NOW()
WHERE name IN ('home_news_about_desc', 'home_news_about_desc_gb');

UPDATE faqs
SET answers = '犀利士通用名為他達那非，英文藥品名為Cialis，是一種用於治療男性陰莖勃起功能障礙的壯陽藥品。犀利士Cialis通過抑制PDE5來擴張血管，改善局部血流，從而達到改善ED的作用。',
    answers_gb = '犀利士通用名為他達那非，英文藥品名為Cialis，是一種用於治療男性陰莖勃起功能障礙的壯陽藥品。犀利士Cialis通過抑制PDE5來擴張血管，改善局部血流，從而達到改善ED的作用。',
    updated_at = NOW()
WHERE id = 4;

UPDATE faqs
SET questions = '犀利士與其他壯陽藥有什麼區別？',
    questions_gb = '犀利士與其他壯陽藥有什麼區別？',
    answers = '犀利士Cialis屬於治療男性陰莖勃起障礙的有效壯陽藥品，特色在於作用時間更長，藥物清除率約為2.5L/hr，半衰期約17.5小時，意味著犀利士Cialis藥效可以持續36小時，適合需要長效支持的使用情境。',
    answers_gb = '犀利士Cialis屬於治療男性陰莖勃起障礙的有效壯陽藥品，特色在於作用時間更長，藥物清除率約為2.5L/hr，半衰期約17.5小時，意味著犀利士Cialis藥效可以持續36小時，適合需要長效支持的使用情境。',
    updated_at = NOW()
WHERE id = 5;

UPDATE faqs
SET questions = '犀利士可以和其他壯陽藥同時服用嗎？',
    questions_gb = '犀利士可以和其他壯陽藥同時服用嗎？',
    answers = '不建議自行同時服用多種壯陽藥。若單一藥物治療效果不理想，應先諮詢醫師或藥師，由專業人員評估劑量、用藥間隔與身體狀況，避免增加副作用或其他用藥風險。',
    answers_gb = '不建議自行同時服用多種壯陽藥。若單一藥物治療效果不理想，應先諮詢醫師或藥師，由專業人員評估劑量、用藥間隔與身體狀況，避免增加副作用或其他用藥風險。',
    updated_at = NOW()
WHERE id = 17;

UPDATE articles
SET title = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(title, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    brief = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(brief, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    content = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(content, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    img_alt = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(img_alt, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    seo_title = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(seo_title, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    seo_keyword = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(seo_keyword, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    seo_description = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(seo_description, '威而鋼', '其他同類藥物'), '威而钢', '其他同類藥物'), '威而剛', '其他同類藥物'), '威爾剛', '其他同類藥物'), 'Viagra', '其他同類藥物'), 'viagra', '其他同類藥物'), '樂威壯', '其他同類藥物'), '乐威壮', '其他同類藥物'), 'Levitra', '其他同類藥物'), 'levitra', '其他同類藥物'),
    updated_at = NOW()
WHERE CONCAT_WS(' ', title, brief, content, seo_title, seo_keyword, seo_description, img_alt) REGEXP '樂威壯|乐威壮|威而鋼|威而钢|威而剛|威爾剛|Levitra|Viagra|拜耳|輝瑞';

COMMIT;
