# -*- coding: utf-8 -*-
from logging import getLogger
from pkg_resources import get_distribution

from openprocurement.tender.openeu.models import Tender

PKG = get_distribution(__package__)

LOGGER = getLogger(PKG.project_name)


def includeme(config):
    LOGGER.info('Init openeu plugin.')
    config.add_tender_procurementMethodType(Tender)
    config.scan("openprocurement.tender.openeu.views")
