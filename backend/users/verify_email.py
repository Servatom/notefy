from django.core.mail import send_mail, EmailMultiAlternatives
from django.utils.crypto import get_random_string
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.contrib.auth import get_user_model
from django.conf import settings

FRONTEND_URL = settings.FRONTEND_URL

def send_verify_email(to_mail, from_mail, verify_link):
    token = get_random_string(length=32)
    verify_link = FRONTEND_URL + '/email-verify/' + token
    html_content = render_to_string(
        'users/verify_mail_template.html', {'FRONTEND_URL': FRONTEND_URL, 'link': verify_link})  # render with dynamic value
    # Strip the html tag. So people can see the pure text at least.
    text_content = strip_tags(html_content)

    user = get_user_model().objects.get(email=to_mail)
    user.email_verified_hash = token
    user.save()

    # create the email, and attach the HTML version as well.
    msg = EmailMultiAlternatives(
        "Email Verification", text_content, from_mail, [to_mail])
    msg.attach_alternative(html_content, "text/html")
    msg.send()


def send_reset_email(to_mail, from_mail):
    token = get_random_string(length=32)
    reset_link = FRONTEND_URL + '/reset-password/' + token
    html_content = render_to_string(
        'users/reset_mail_template.html', {'FRONTEND_URL': FRONTEND_URL, 'link': reset_link})

    text_content = strip_tags(html_content)

    user = get_user_model().objects.get(email=to_mail)
    user.reset_password_hash = token
    user.save()

    msg = EmailMultiAlternatives(
        "Reset Password", text_content, from_mail, [to_mail])
    msg.attach_alternative(html_content, "text/html")
    msg.send()