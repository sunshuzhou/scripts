#!/usr/bin/env python
from lxml import html
import requests
import urllib
import re

urls = [('http://dblp.uni-trier.de/db/conf/ndss/ndss2016.html', 'NDSS2016'),
        ('http://dblp.uni-trier.de/db/conf/ndss/ndss2015.html', 'NDSS2015'),
        ('http://dblp.uni-trier.de/db/conf/ndss/ndss2014.html', 'NDSS2014'),
        ('http://dblp.uni-trier.de/db/conf/ndss/ndss2013.html', 'NDSS2013'),
        ('http://dblp.uni-trier.de/db/conf/ndss/ndss2012.html', 'NDSS2012'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2016.html', 'CCS2016'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2015.html', 'CCS2015'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2014.html', 'CCS2014'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2013.html', 'CCS2013'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2012.html', 'CCS2012'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2011.html', 'CCS2011'),
        ('http://dblp.uni-trier.de/db/conf/ccs/ccs2010.html', 'CCS2010'),
        ('http://dblp.uni-trier.de/db/conf/ccs/asiaccs2016.html', 'ACCS2016'),
        ('http://dblp.uni-trier.de/db/conf/ccs/asiaccs2015.html', 'ACCS2015'),
        ('http://dblp.uni-trier.de/db/conf/ccs/asiaccs2014.html', 'ACCS2014'),
        ('http://dblp.uni-trier.de/db/conf/ccs/asiaccs2013.html', 'ACCS2013'),
        ('http://dblp.uni-trier.de/db/conf/ccs/asiaccs2012.html', 'ACCS2012'),
        ('http://dblp.uni-trier.de/db/conf/ccs/asiaccs2010.html', 'ACCS2010'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2016.html', 'S&P2016'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2015.html', 'S&P2015'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2014.html', 'S&P2014'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2013.html', 'S&P2013'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2012.html', 'S&P2012'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2011.html', 'S&P2011'),
        ('http://dblp.uni-trier.de/db/conf/sp/sp2010.html', 'S&P2010'),
        ('http://dblp.uni-trier.de/db/conf/sp/spw2016.html', 'S&PW2016'),
        ('http://dblp.uni-trier.de/db/conf/sp/spw2015.html', 'S&PW2015'),
        ('http://dblp.uni-trier.de/db/conf/sp/spw2014.html', 'S&PW2014'),
        ('http://dblp.uni-trier.de/db/conf/sp/spw2013.html', 'S&PW2013'),
        ('http://dblp.uni-trier.de/db/conf/sp/spw2012.html', 'S&PW2012'),
        ('http://dblp.uni-trier.de/db/conf/sp/spw2011.html', 'S&PW2011'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2016.html', 'USENIX2016'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2015.html', 'USENIX2015'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2014.html', 'USENIX2014'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2013.html', 'USENIX2013'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2012.html', 'USENIX2012'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2011.html', 'USENIX2011'),
        ('http://dblp.uni-trier.de/db/conf/uss/uss2010.html', 'USENIX2010'),
        ]

print('# Storage & Cloud')

count = 0

for url in urls:
    page = requests.get(url[0])
    tree = html.fromstring(page.content)
    titles = tree.xpath('//span[@class="title"]/text()')
    isTitlePrinted = 0
    for title in titles:
        #if title.upper().find('SSL') != -1 or title.upper().find('TLS') != -1 or title.upper().find('SSH') != -1:
        if re.match(r'.*(storage|cloud).*', title, re.I):
            if isTitlePrinted == 0:
                isTitlePrinted = 1
                print('## ' + url[1])
            #print '[', title, ']() | | '
            print('- ' + title)
            count += 1
    if isTitlePrinted == 1:
        print('')
    #print titles

print("Total : ", count)
