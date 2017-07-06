# -*- coding: utf-8 -*-
from openprocurement.tender.openua.views.lot import TenderUaLotResource as TenderLotResource

from openprocurement.api.utils import (
    save_tender,
    opresource,
    json_view,
    context_unpack,
    get_now,
    apply_patch
)
from openprocurement.api.validation import (
    validate_lot_data,
    validate_patch_lot_data
)
from openprocurement.tender.openua.utils import calculate_business_date
from openprocurement.tender.openeu.models import TENDERING_DURATION


@opresource(name='Tender EU Lots',
            collection_path='/tenders/{tender_id}/lots',
            path='/tenders/{tender_id}/lots/{lot_id}',
            procurementMethodType='aboveThresholdEU',
            description="Tender EU lots")
class TenderEULotResource(TenderLotResource):
    def validate_update_tender(self, operation):
        tender = self.request.validated['tender']

        if tender.status not in ['active.tendering']:
            self.request.errors.add(
                'body', 'data', 'Can\'t {} lot in current ({}) tender status'.format(operation, tender.status)
            )
            self.request.errors.status = 403

            return

        if calculate_business_date(get_now(), TENDERING_DURATION, tender) > tender.tenderPeriod.endDate:
            self.request.errors.add(
                'body', 'data', 'tenderPeriod should be extended by {0.days} days'.format(TENDERING_DURATION)
            )
            self.request.errors.status = 403

            return

        return True

    @json_view(content_type="application/json", validators=(validate_lot_data,), permission='edit_tender')
    def collection_post(self):
        """
        Add a lot
        """
        if not self.validate_update_tender(operation='add'):
            return

        lot = self.request.validated['lot']
        lot.date = get_now()

        tender = self.request.validated['tender']
        tender.lots.append(lot)

        if self.request.authenticated_role == 'tender_owner':
            tender.invalidate_bids_data()

        if save_tender(request=self.request):
            self.LOGGER.info(
                msg='Created tender lot {}'.format(lot.id),
                extra=context_unpack(
                    request=self.request,
                    msg={'MESSAGE_ID': 'tender_lot_create'},
                    params={'lot_id': lot.id}
                )
            )
            self.request.response.status = 201
            self.request.response.headers['Location'] = self.request.route_url(
                'Tender EU Lots', tender_id=tender.id, lot_id=lot.id
            )

            return {'data': lot.serialize("view")}

    @json_view(content_type='application/json', validators=(validate_patch_lot_data,), permission='edit_tender')
    def patch(self):
        """
        Update of lot
        """
        if not self.validate_update_tender(operation='update'):
            return

        if self.request.authenticated_role == 'tender_owner':
            self.request.validated['tender'].invalidate_bids_data()

        if apply_patch(request=self.request, src=self.request.context.serialize()):
            self.LOGGER.info(
                msg='Updated tender lot {}'.format(self.request.context.id),
                extra=context_unpack(
                    request=self.request,
                    msg={'MESSAGE_ID': 'tender_lot_patch'}
                )
            )

            return {'data': self.context.serialize('view')}

    @json_view(permission='edit_tender')
    def delete(self):
        """
        Delete lot
        """
        if not self.validate_update_tender(operation='delete'):
            return

        lot = self.request.context

        tender = self.request.validated['tender']
        tender.lots.remove(lot)

        lot = lot.serialize('view')

        if self.request.authenticated_role == 'tender_owner':
            tender.invalidate_bids_data()

        if save_tender(request=self.request):
            self.LOGGER.info(
                msg='Deleted tender lot {}'.format(self.request.context.id),
                extra=context_unpack(
                    request=self.request,
                    msg={'MESSAGE_ID': 'tender_lot_delete'}
                )
            )

            return {'data': lot}










