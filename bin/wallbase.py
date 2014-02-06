#!/usr/bin/python

import re
import argparse
from pyquery import PyQuery as Q
from lxml import etree
from base64 import b64decode
from urllib2 import urlopen

def main():
    opts = parse_args()

    url = 'http://wallbase.cc/'

    if opts.query_type.lower() != 'search':
        if opts.query_type.lower() == 'random':
            url += 'random/all/'
        else:
            url += 'toplist/0/all/'

        if opts.exact:
            url += 'eqeq/'
        else:
            url += 'gteq/'

        if not re.match("^\d+x\d+$", opts.res):
            print "[Error] Resolution must be in format AxB"
            return
        else:
            url += "%s/" % opts.res

        page = Q(url=url)
        wallpaper_url = page('div#thumbs div.thumb:first a.thlink').attr.href

        wallpaper_page = Q(url=wallpaper_url)
        wallpaper_container = wallpaper_page('div#bigwall.right script')
        wp_script = Q(wallpaper_container.html())
        wp_src = wp_script('img').attr.src

        wp_src = wp_src[5:-4]
        wp_src = b64decode(wp_src)

        f = open(wp_src.split('/')[-1] , 'w')
        print wp_src.split('/')[-1]
        f.write(urlopen(wp_src).read())
        f.flush()
    else:
        url += 'search/'

        if opts.color:
            if re.match("^(\d{1,3},){2},\d+", opts.color):
                # Color is RGB
                url += 'color/%s/%s/%s' % opts.color.split(',')
            elif re.match("^#(\d|[A-F a-f]){6}$", opts.color):
                # Color is Hex
                color_val = opts.color.lstrip('#')
                lv = len(color_val)
                rgb = tuple(int(color_val[i:i+lv/3], 16) for i in range(0, lv, lv/3))
                url += 'color/%s/%s/%s' % rgb
            else:
                print "[Error] Color must be either as R,G,B or #RRGGBB (html)"
                return

        if opts.exact:
            url += 'eqeq/'
        else:
            url += 'gteq/'

        if not re.match("^\d+x\d+$", opts.res):
            print "[Error] Resolution must be in format AxB"
            return
        else:
            url += "%s/" % opts.res

        query = ' '.join(opts.query)

        ##
        ## TODO: LOAD PAGE AND FIND WP


def parse_args():
    parser = argparse.ArgumentParser(description="Wallbase Background Scraper")

    parser.add_argument('--query-type', type=str, help="Query type, either 'Search', 'Random' or 'Popular'")
    parser.add_argument('--res', type=str, help="Resolution in format AxB")
    parser.add_argument('--exact', action='store_true', help="Query for Exact resolution match?", required=False)
    parser.add_argument('--sketchy', action='store_true', help="Include 'Sketchy' images?", required=False)
    parser.add_argument('--popular-range', type=str, help="For popular, set popular time", required=False)
    parser.add_argument('--query', type=str, nargs='+', help="Search term", required=False)
    parser.add_argument('--color', type=str, help="Search for a particular colo(u)?r (hex or r,g,b)", required=False)

    return parser.parse_args()


if __name__ == '__main__':
    main()

