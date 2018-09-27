import bottle
import os
from time import sleep
from functools import lru_cache
from bottle import (post, request, response, route, run, url, Response, static_file, template)
from string import Template
import sqlite3

app = bottle.default_app()

candidates = [{'name':'OCO', 'file':'sample', 'matriculas':'4', 'curso':'Inphormatica', 'votos':100},
{'name':'Togapi', 'file':'sample', 'matriculas':'8', 'curso':'Metal Bio', 'votos':30},
{'name':'Rodriguez', 'file':'sample', 'matriculas':'10', 'curso':'Electro', 'votos':130} ]


cand_template = Template(' <section class=\"card\"> <header> </header> <img src=\"$file.jpg\" width=\"200\" height=\"200\"> <ul> <li>&nbsp;$name</li> <li>&nbsp;$curso</li> <li>&nbsp;$matriculas MATRICULAS</li> </ul> <button> Apostar </button> <progress value=\"$votos\" max=\"$totalvotos\"> </section>')


abs_app_dir_path = os.path.dirname(os.path.realpath(__file__))

bottle.TEMPLATE_PATH.insert(0, abs_app_dir_path)

bd = sqlite3.connect('dbfinal.db')
bd_cursor = bd.cursor()

@route('/')
def check_app():

    print(abs_app_dir_path)
    final_string = ''
    
    cand = bd_cursor.execute('''SELECT NAME, MATRICULAS, CURSO, IMAGE FROM candidate''').fetchall()
    new_candidates = []

    for ca in cand:
        new_candidate = {}
        new_candidate['name'] = ca[0]
        new_candidate['matriculas'] = ca[1]
        new_candidate['curso'] = ca[2]
        new_candidate['image'] = ca[3]

        new_candidates.append(new_candidate)

    print(new_candidates)

    for candidate in new_candidates:
        candidate['totalvotos'] = 100
        print(candidate)
        complete_card = cand_template.substitute(candidate)
        final_string += complete_card

    print(final_string)

    info = {'title': "Apostas Dux", 'cards':final_string}
    return template('page.tpl', info)

@route('/<filename>.jpg')
def stylesheets(filename):
    #Returns the jpg files
    return static_file('{}.jpg'.format(filename), root=abs_app_dir_path)

@route('/<filename>.tpl')
def send_template(filename):
    return static_file(filename, root=abs_app_dir_path)

@route('/<filename>.css')
def stylesheets(filename):
    #Returns the css files
    return static_file('{}.css'.format(filename), root=abs_app_dir_path)

@route('/<filename>.ico')
def stylesheets(filename):
    #Returns the css files
    return static_file('{}.ico'.format(filename), root=abs_app_dir_path)

@route('/<filename>.mp3')
def stylesheets(filename):
    #Returns the css files
    return static_file('{}.mp3'.format(filename), root=abs_app_dir_path)


if __name__ == '__main__':
    # use the Bottle framework run function to start the development server
    run(host='0.0.0.0', port=80, debug=True, reloader=True)