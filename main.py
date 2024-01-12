import jinja2
import pdfkit
import random
from datetime import datetime


def generate_pdf():
    context = {
        'client_name': 'John Smith',
        'invoice_number': random.randint(1, 9999999999),
        'invoice_list': [['hello', '5'], ['world', '10']],
        'today_date': datetime.today().strftime('%d.%m.%Y')
    }

    template_env = jinja2.Environment(loader=jinja2.FileSystemLoader('templates'))
    template = template_env.get_template('invoice_template.html')
    output = template.render(context)

    file_location = pdfkit.configuration(wkhtmltopdf='/usr/bin/wkhtmltopdf')
    pdfkit.from_string(output, 'invoice.pdf', configuration=file_location, css='templates/styles.css')


if __name__ == '__main__':
    generate_pdf()
