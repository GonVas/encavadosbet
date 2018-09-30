#!/usr/bin/python3 

import bottle
import os
from time import sleep
from functools import lru_cache
from bottle import (post, request, response, route, run, url, Response, static_file, template)
from string import Template
from bottle import TEMPLATE_PATH
import sqlite3

app = bottle.default_app()
TEMPLATE_PATH.insert(0, os.path.abspath(os.path.dirname(__file__)))

candidates = [{'name':'OCO', 'file':'sample', 'matriculas':'4', 'curso':'Inphormatica', 'votos':100},
{'name':'Togapi', 'file':'sample', 'matriculas':'8', 'curso':'Metal Bio', 'votos':30},
{'name':'Rodriguez', 'file':'sample', 'matriculas':'10', 'curso':'Electro', 'votos':130} ]


cand_template = Template(' <section class=\"card\"> <header> </header> <img src=\"$image.jpg\" width=\"200\" height=\"200\"> <ul> <li>&nbsp;$name</li> <li>&nbsp;$curso</li> <li>&nbsp;$matriculas MATRICULAS</li> </ul> <button> Apostar </button> <progress value=\"$votos\" max=\"$totalvotos\"> </section>')

abs_app_dir_path = os.path.dirname(os.path.realpath(__file__))

bd = sqlite3.connect('final.db')
bd_cursor = bd.cursor()

@route('/')
def check_app():

    print(abs_app_dir_path)
    final_string = ''

    cand = bd_cursor.execute('''SELECT NAME, MATRICULAS, CURSO, IMAGE FROM voter WHERE active != 0 ''').fetchall()
    total_votes = int(bd_cursor.execute("SELECT Sum(cnt) from (select Count(token) as cnt from voter inner join vote ON vote.what_candidate = voter.token GROUP by Name)").fetchone()[0])
    print("Total Number of votes: " + str(total_votes))
    new_candidates = []

    for ca in cand:
        new_candidate = {}
        new_candidate['name'] = ca[0]
        new_candidate['matriculas'] = ca[1]
        new_candidate['curso'] = ca[2]
        new_candidate['image'] = ca[3]
        new_candidate['votos'] = bd_cursor.execute("SELECT Count(token) from voter inner join vote ON vote.what_candidate = voter.token WHERE NAME = ?", (ca[0],)).fetchone()[0]
        new_candidate['totalvotos'] = total_votes

        new_candidates.append(new_candidate)


    for candidate in sorted(new_candidates, key=lambda k: k['votos'], reverse = True) :
        print(candidate)
        complete_card = cand_template.substitute(candidate)
        final_string += complete_card

    info = {'title': "Apostas Encavados", 'cards':final_string}
    return template('page.tpl', info)

@route('/<filename:path>')
def send_static(filename):
    return static_file(filename, root=abs_app_dir_path)


if __name__ == '__main__':
    # use the Bottle framework run function to start the development server
    run(host='0.0.0.0', port=8080, debug=True, reloader=True)



