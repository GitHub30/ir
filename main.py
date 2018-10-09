import sys
import requests
from lxml.html import fromstring

if __name__ == '__main__':
    url = 'https://cimtops-support.com/i-Reporter/ja/dl-docs'
    if len(sys.argv) == 2:
        url = sys.argv[1]
    cookies = dict(cbfe553a78eeb790dfd0f23733c43a22='')
    r = requests.get(url, cookies=cookies)
    html = fromstring(r.content)
    html.make_links_absolute(url)
    urls = html.xpath('//a/@href')
    pdf_urls = [url for url in urls if url[-4:] == '.pdf']
    pdf_urls = list(set(pdf_urls))
    for url in pdf_urls:
        print(url)
