from playwright.sync_api import sync_playwright
import pandas as pd

def main():
    with sync_playwright() as p:
        
        # IMPORTANT: Change dates to future dates, otherwise it won't work
        checkin_date = '2025-01-08'
        checkout_date = '2025-01-09'
        
        page_url = f'https://www.booking.com/searchresults.id.html?checkin={checkin_date}&checkout={checkout_date}&selected_currency=USD&ss=Samosir+Island%2C+Indonesia&ssne=Medan&ssne_untouched=Medan&lang=id&sb=1&src_elem=sb&src=searchresults&dest_type=region&group_adults=2&no_rooms=1&group_children=0'

        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        page.goto(page_url)
        
        hotels = page.locator('//div[@data-testid="property-card"]').all()
        print(f'There are: {len(hotels)} hotels.')

        hotels_list = []
        for hotel in hotels:
            hotel_dict = {}
            try:
                hotel_dict['hotel'] = hotel.locator('//div[@data-testid="title"]').inner_text()
                hotel_dict['price'] = hotel.locator('//span[@data-testid="price-and-discounted-price"]').inner_text()

                # Menunggu elemen review score muncul
                score_locator = hotel.locator('//div[@data-testid="review-score"]/div[1]')
                # score_locator.wait_for(timeout=30000)  # Menunggu elemen muncul selama 30 detik
                hotel_dict['score'] = score_locator.inner_text()

                # Menunggu elemen average review muncul
                avg_review_locator = hotel.locator('//div[@data-testid="review-score"]/div[2]/div[1]')
                # avg_review_locator.wait_for(timeout=30000)  # Menunggu elemen average review muncul selama 30 detik
                hotel_dict['avg review'] = avg_review_locator.inner_text()

                # Menunggu elemen jumlah review muncul
                reviews_count_locator = hotel.locator('//div[@data-testid="review-score"]/div[2]/div[2]')
                # reviews_count_locator.wait_for(timeout=30000)  # Menunggu elemen jumlah review muncul selama 30 detik
                hotel_dict['reviews count'] = reviews_count_locator.inner_text().split()[0]

                hotels_list.append(hotel_dict)
            except Exception as e:
                print(f"Error processing hotel: {e}")

        # Menyimpan data ke Excel dan CSV
        df = pd.DataFrame(hotels_list)
        df.to_excel('samosir.xlsx', index=False)
        df.to_csv('samosir.csv', index=False)
        
        browser.close()

if __name__ == '__main__':
    main()
