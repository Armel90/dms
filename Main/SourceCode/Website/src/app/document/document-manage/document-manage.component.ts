import { Component, OnInit } from '@angular/core';
import { UntypedFormGroup } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { BaseComponent } from 'src/app/base.component';
import { DocumentService } from '../document.service';
import { DocumentInfo } from '@core/domain-classes/document-info';
import { Router } from '@angular/router';
import { DocumentAuditTrail } from '@core/domain-classes/document-audit-trail';
import { DocumentOperation } from '@core/domain-classes/document-operation';
import { CommonService } from '@core/services/common.service';
import { TranslationService } from '@core/services/translation.service';

@Component({
  selector: 'app-document-manage',
  templateUrl: './document-manage.component.html',
  styleUrls: ['./document-manage.component.scss']
})
export class DocumentManageComponent extends BaseComponent implements OnInit {
  documentForm: UntypedFormGroup;
  loading$: Observable<boolean>;
  documentSource: string;

  constructor(
    private toastrService: ToastrService,
    private documentService: DocumentService,
    private router: Router,
    private commonService: CommonService,
    private translationService: TranslationService) {
    super();
  }

  ngOnInit(): void {
  }

  saveDocument(document: DocumentInfo) {
    this.sub$.sink = this.documentService.addDocument(document)
      .subscribe((documentInfo: DocumentInfo) => {
        this.addDocumentTrail(documentInfo.id);
        this.toastrService.success(this.translationService.getValue('DOCUMENT_SAVE_SUCCESSFULLY'));
        this.router.navigate(['/documents']);
      });
  }
  addDocumentTrail(id: string) {
    const objDocumentAuditTrail: DocumentAuditTrail = {
      documentId: id,
      operationName: DocumentOperation.Created.toString()
    }
    this.sub$.sink = this.commonService.addDocumentAuditTrail(objDocumentAuditTrail)
      .subscribe(c => {
      })
  }

}
