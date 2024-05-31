"use strict";(self.webpackChunkdocument_management=self.webpackChunkdocument_management||[]).push([[441],{7954:(S,C,s)=>{s.d(C,{g:()=>d});var d=(()=>{return(a=d||(d={}))[a.Read=1]="Read",a[a.Created=2]="Created",a[a.Modified=3]="Modified",a[a.Deleted=4]="Deleted",a[a.Add_Permission=5]="Add_Permission",a[a.Remove_Permission=6]="Remove_Permission",a[a.Send_Email=7]="Send_Email",a[a.Download=8]="Download",d;var a})()},4913:(S,C,s)=>{s.d(C,{J:()=>a});var d=s(5519);class a extends d.r{constructor(){super(...arguments),this.id="",this.createdBy="",this.categoryId=""}}},914:(S,C,s)=>{s.d(C,{Z:()=>_});var d=s(520),a=s(7221),w=s(5e3),b=s(8032);let _=(()=>{class e{constructor(i,p){this.httpClient=i,this.commonHttpErrorService=p}updateDocument(i){return this.httpClient.put(`document/${i.id}`,i).pipe((0,a.K)(this.commonHttpErrorService.handleError))}addDocument(i){var p,m,P;i.documentMetaDatas=null===(p=i.documentMetaDatas)||void 0===p?void 0:p.filter(g=>g.metatag);const u=new FormData;return u.append("files",i.files),u.append("name",i.name),u.append("categoryId",i.categoryId),u.append("categoryName",i.categoryName),u.append("description",i.description),u.append("documentMetaDataString",JSON.stringify(i.documentMetaDatas)),u.append("documentRolePermissionString",JSON.stringify(null!==(m=i.documentRolePermissions)&&void 0!==m?m:[])),u.append("documentUserPermissionString",JSON.stringify(null!==(P=i.documentUserPermissions)&&void 0!==P?P:[])),this.httpClient.post("document",u).pipe((0,a.K)(this.commonHttpErrorService.handleError))}deleteDocument(i){return this.httpClient.delete(`document/${i}`).pipe((0,a.K)(this.commonHttpErrorService.handleError))}getDocument(i){return this.httpClient.get(`document/${i}`).pipe((0,a.K)(this.commonHttpErrorService.handleError))}getDocuments(i){const m=(new d.LE).set("Fields",i.fields).set("OrderBy",i.orderBy).set("createDateString",i.createDate?i.createDate.toString():"").set("PageSize",i.pageSize.toString()).set("Skip",i.skip.toString()).set("SearchQuery",i.searchQuery).set("categoryId",i.categoryId).set("name",i.name).set("metaTags",i.metaTags).set("id",i.id.toString());return this.httpClient.get("documents",{params:m,observe:"response"}).pipe((0,a.K)(this.commonHttpErrorService.handleError))}saveNewVersionDocument(i){const m=new FormData;return m.append("files",i.files),m.append("url",i.url),m.append("documentId",i.documentId),this.httpClient.post("documentVersion",m).pipe((0,a.K)(this.commonHttpErrorService.handleError))}getDocumentVersion(i){return this.httpClient.get(`documentversion/${i}`).pipe((0,a.K)(this.commonHttpErrorService.handleError))}restoreDocumentVersion(i,p){return this.httpClient.post(`documentversion/${i}/restore/${p}`,{}).pipe((0,a.K)(this.commonHttpErrorService.handleError))}getdocumentMetadataById(i){return this.httpClient.get(`document/${i}/getMetatag`).pipe((0,a.K)(this.commonHttpErrorService.handleError))}}return e.\u0275fac=function(i){return new(i||e)(w.LFG(d.eN),w.LFG(b.U))},e.\u0275prov=w.Yz7({token:e,factory:e.\u0275fac,providedIn:"root"}),e})()},6927:(S,C,s)=>{s.d(C,{Y:()=>te});var d=s(520),a=s(7954),w=s(2340),b=s(5854),_=s(2676),e=s(5e3),x=s(1218),i=s(690),p=s(8265),m=s(4786),P=s(2457),O=s(6107),u=s(9808),g=s(943),L=s(2313);function c(o,r){if(1&o&&(e.TgZ(0,"div",2),e._UZ(1,"img",3),e.qZA()),2&o){const t=e.oxw();e.xp6(1),e.Q6J("src",t.imageUrl,e.LSH)("alt",t.document.name)}}function f(o,r){1&o&&(e.TgZ(0,"div",4),e._UZ(1,"mat-spinner"),e.qZA())}let l=(()=>{class o extends _.H{constructor(t,n,h,v){super(),this.overlayRef=t,this.sanitizer=n,this.ref=h,this.commonService=v,this.isLoading=!1}ngOnInit(){}ngOnChanges(t){t.document&&this.getImage()}getImage(){this.isLoading=!0,this.sub$.sink=this.commonService.downloadDocument(this.document.documentId,this.document.isVersion).pipe((0,g.g)(500)).subscribe(t=>{if(this.isLoading=!1,t.type===d.dt.Response){const n=new Blob([t.body],{type:t.body.type});this.imageUrl=this.sanitizer.bypassSecurityTrustUrl(URL.createObjectURL(n)),this.ref.markForCheck()}},t=>{this.isLoading=!1})}onCancel(){this.overlayRef.close()}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(m.L),e.Y36(L.H7),e.Y36(e.sBO),e.Y36(i.v))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-image-preview"]],inputs:{document:"document"},features:[e.qOj,e.TTD],decls:2,vars:2,consts:[["class","center-img m-5",4,"ngIf"],["class","loading-shade",4,"ngIf"],[1,"center-img","m-5"],[1,"img-fluid",3,"src","alt"],[1,"loading-shade"]],template:function(t,n){1&t&&(e.YNc(0,c,2,2,"div",0),e.YNc(1,f,2,0,"div",1)),2&t&&(e.Q6J("ngIf",n.imageUrl),e.xp6(1),e.Q6J("ngIf",n.isLoading))},dependencies:[u.O5],styles:[".center-img[_ngcontent-%COMP%]{text-align:center}"]}),o})();var y=s(5363);function D(o,r){1&o&&(e.TgZ(0,"div",3)(1,"div",4),e._UZ(2,"pdf-toggle-sidebar")(3,"pdf-page-number")(4,"pdf-zoom-out")(5,"pdf-zoom-in")(6,"pdf-zoom-dropdown")(7,"pdf-rotate-page"),e.TgZ(8,"div",5),e._UZ(9,"pdf-toggle-secondary-toolbar"),e.qZA()()()),2&o&&(e.xp6(1),e.ekj("invisible",!1))}function T(o,r){1&o&&(e.TgZ(0,"div",6),e._UZ(1,"mat-spinner"),e.qZA())}let I=(()=>{class o extends _.H{constructor(t){super(),this.commonService=t,this.loadingTime=2e3,this.documentUrl=null,this.isLoading=!1}ngOnChanges(t){t.document&&this.getDocument()}getDocument(){this.isLoading=!0,this.sub$.sink=this.commonService.downloadDocument(this.document.documentId,this.document.isVersion).subscribe(t=>{t.type===d.dt.Response&&(this.isLoading=!1,this.downloadFile(t))},t=>{this.isLoading=!1})}downloadFile(t){this.documentUrl=new Blob([t.body],{type:t.body.type})}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(i.v))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-pdf-viewer"]],inputs:{document:"document"},features:[e.qOj,e.TTD],decls:4,vars:19,consts:[["height","91vh",3,"src","showToolbar","showSidebarButton","showFindButton","showPagingButtons","showZoomButtons","showPresentationModeButton","showOpenFileButton","showPrintButton","showDownloadButton","showBookmarkButton","showSecondaryToolbarButton","showRotateButton","showHandToolButton","showScrollingButton","showSpreadButton","showPropertiesButton","useBrowserLocale"],["customCheckboxZoomToolbar",""],["class","loading-shade",4,"ngIf"],["id","toolbarViewer"],["id","toolbarViewerMiddle"],[1,"float:right"],[1,"loading-shade"]],template:function(t,n){1&t&&(e._UZ(0,"ngx-extended-pdf-viewer",0),e.YNc(1,D,10,2,"ng-template",null,1,e.W1O),e.YNc(3,T,2,0,"div",2)),2&t&&(e.Q6J("src",n.documentUrl)("showToolbar",!0)("showSidebarButton",!0)("showFindButton",!0)("showPagingButtons",!0)("showZoomButtons",!0)("showPresentationModeButton",!0)("showOpenFileButton",!1)("showPrintButton",!1)("showDownloadButton",!1)("showBookmarkButton",!1)("showSecondaryToolbarButton",!0)("showRotateButton",!0)("showHandToolButton",!0)("showScrollingButton",!0)("showSpreadButton",!1)("showPropertiesButton",!1)("useBrowserLocale",!1),e.xp6(3),e.Q6J("ngIf",n.isLoading))},dependencies:[u.O5,y.U2,y.Zu,y.nO,y.eE,y.ye,y.IS,y.mR,y.S3]}),o})();function B(o,r){if(1&o&&(e.TgZ(0,"pre"),e._uU(1),e.qZA()),2&o){const t=e.oxw().$implicit;e.xp6(1),e.Oqu(t)}}function R(o,r){1&o&&(e.TgZ(0,"div"),e._UZ(1,"br"),e.qZA())}function k(o,r){if(1&o&&(e.ynx(0),e.YNc(1,B,2,1,"pre",3),e.YNc(2,R,2,0,"div",3),e.BQk()),2&o){const t=r.$implicit;e.xp6(1),e.Q6J("ngIf",t),e.xp6(1),e.Q6J("ngIf",!t)}}function U(o,r){1&o&&(e.TgZ(0,"div",4),e._UZ(1,"mat-spinner"),e.qZA())}let A=(()=>{class o extends _.H{constructor(t,n){super(),this.commonService=t,this.overlayRef=n,this.textLines=[],this.isLoading=!1}ngOnChanges(t){t.document&&this.readDocument()}readDocument(){this.isLoading=!0,this.sub$.sink=this.commonService.readDocument(this.document.documentId,this.document.isVersion).subscribe(t=>{this.isLoading=!1,this.textLines=t.result},t=>{this.isLoading=!1})}onCancel(){this.overlayRef.close()}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(i.v),e.Y36(m.L))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-text-preview"]],inputs:{document:"document"},features:[e.qOj,e.TTD],decls:3,vars:2,consts:[[1,"m-5","text-main-div"],[4,"ngFor","ngForOf"],["class","loading-shade",4,"ngIf"],[4,"ngIf"],[1,"loading-shade"]],template:function(t,n){1&t&&(e.TgZ(0,"div",0),e.YNc(1,k,3,2,"ng-container",1),e.qZA(),e.YNc(2,U,2,0,"div",2)),2&t&&(e.xp6(1),e.Q6J("ngForOf",n.textLines),e.xp6(1),e.Q6J("ngIf",n.isLoading))},dependencies:[u.sg,u.O5],styles:[".text-div[_ngcontent-%COMP%]{word-wrap:break-word}.text-main-div[_ngcontent-%COMP%]{overflow:auto;height:75vh;background-color:#fff;padding:20px}pre[_ngcontent-%COMP%]{display:block;white-space:pre-wrap;word-wrap:break-word;margin:0;padding:0!important;font-size:1rem;font-family:inherit}"]}),o})();const Y=["iframe"];function F(o,r){1&o&&e._UZ(0,"iframe",3,4)}function M(o,r){1&o&&(e.TgZ(0,"div",5),e._UZ(1,"img",6),e.TgZ(2,"h5",7),e._uU(3,"Office View is not suporting the localhost please host your REST API and try again."),e.qZA()())}function N(o,r){1&o&&(e.TgZ(0,"div",8),e._UZ(1,"mat-spinner"),e.qZA())}let V=(()=>{class o extends _.H{constructor(t,n){super(),this.commonService=t,this.overlayRef=n,this.isLive=!0,this.isLoading=!1,this.token=""}ngOnInit(){w.N.apiUrl.indexOf("localhost")>=0&&(this.isLive=!1)}ngAfterViewInit(){this.isLive&&this.getDocumentToken()}getDocumentToken(){this.isLoading=!0,this.sub$.sink=this.commonService.getDocumentToken(this.document.documentId).subscribe(t=>{this.token=t.result;const n=location.host,h=location.protocol;this.iframe.nativeElement.src="https://view.officeapps.live.com/op/embed.aspx?src="+encodeURIComponent(`${"/"===w.N.apiUrl?`${h}//${n}/`:w.N.apiUrl}api/document/${this.document.documentId}/officeviewer?token=${this.token}&isVersion=${this.document.isVersion}`),this.isLoading=!1},t=>{this.isLoading=!1})}onCancel(){this.overlayRef.close()}ngOnDestroy(){this.isLive?this.sub$.sink=this.commonService.deleteDocumentToken(this.token).subscribe(()=>{super.ngOnDestroy()}):super.ngOnDestroy()}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(i.v),e.Y36(m.L))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-office-viewer"]],viewQuery:function(t,n){if(1&t&&e.Gf(Y,5),2&t){let h;e.iGM(h=e.CRH())&&(n.iframe=h.first)}},inputs:{document:"document"},features:[e.qOj],decls:3,vars:3,consts:[["class","preview-object","style","width: 100%;height: calc(100vh - 60px);",4,"ngIf"],["style","text-align: center;",4,"ngIf"],["class","loading-shade",4,"ngIf"],[1,"preview-object",2,"width","100%","height","calc(100vh - 60px)"],["iframe",""],[2,"text-align","center"],["src","../../../assets/images/file-preview.png","alt","",1,"m-5"],[1,"text-light"],[1,"loading-shade"]],template:function(t,n){1&t&&(e.YNc(0,F,2,0,"iframe",0),e.YNc(1,M,4,0,"div",1),e.YNc(2,N,2,0,"div",2)),2&t&&(e.Q6J("ngIf",n.isLive),e.xp6(1),e.Q6J("ngIf",!n.isLive),e.xp6(1),e.Q6J("ngIf",n.isLoading))},dependencies:[u.O5]}),o})();const Q=["playerEl"];function J(o,r){1&o&&(e.TgZ(0,"div",4),e._UZ(1,"mat-spinner"),e.qZA())}let Z=(()=>{class o extends _.H{constructor(t,n){super(),this.overlayRef=t,this.commonService=n,this.isLoading=!1}ngOnChanges(t){t.document&&this.getDocument()}getDocument(){this.isLoading=!0,this.sub$.sink=this.commonService.downloadDocument(this.document.documentId,this.document.isVersion).subscribe(t=>{if(t.type===d.dt.Response){this.isLoading=!1,this.htmlSource&&this.player().hasChildNodes()&&this.player().removeChild(this.htmlSource);const n=new Blob([t.body],{type:t.body.type});this.htmlSource=document.createElement("source"),this.htmlSource.src=URL.createObjectURL(n),this.htmlSource.type=t.body.type,this.player().pause(),this.player().load(),this.player().appendChild(this.htmlSource),this.player().play()}},t=>{this.isLoading=!1})}player(){return this.playerEl.nativeElement}onCancel(){this.overlayRef.close()}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(m.L),e.Y36(i.v))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-audio-preview"]],viewQuery:function(t,n){if(1&t&&e.Gf(Q,7),2&t){let h;e.iGM(h=e.CRH())&&(n.playerEl=h.first)}},inputs:{document:"document"},features:[e.qOj,e.TTD],decls:4,vars:1,consts:[[1,"audio-div"],["controls","controls"],["playerEl",""],["class","loading-shade",4,"ngIf"],[1,"loading-shade"]],template:function(t,n){1&t&&(e.TgZ(0,"div",0),e._UZ(1,"audio",1,2),e.qZA(),e.YNc(3,J,2,0,"div",3)),2&t&&(e.xp6(3),e.Q6J("ngIf",n.isLoading))},dependencies:[u.O5],styles:[".audio-div[_ngcontent-%COMP%]{display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center;min-height:calc(100vh - 60px);background:rgba(15,15,15,.9490196078)}"]}),o})();function H(o,r){1&o&&(e.TgZ(0,"div",4),e._UZ(1,"mat-spinner"),e.qZA())}let $=(()=>{class o extends Z{constructor(t,n){super(t,n),this.overlayRef=t,this.commonService=n}ngOnChanges(t){t.document&&this.getDocument()}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(m.L),e.Y36(i.v))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-video-preview"]],features:[e.qOj,e.TTD],decls:4,vars:1,consts:[[1,"video-div"],["controls","controls"],["playerEl",""],["class","loading-shade",4,"ngIf"],[1,"loading-shade"]],template:function(t,n){1&t&&(e.TgZ(0,"div",0),e._UZ(1,"video",1,2),e.qZA(),e.YNc(3,H,2,0,"div",3)),2&t&&(e.xp6(3),e.Q6J("ngIf",n.isLoading))},dependencies:[u.O5],styles:[".video-div[_ngcontent-%COMP%]{display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center;min-height:calc(100vh - 60px);background:rgba(15,15,15,.9490196078)}video[_ngcontent-%COMP%]{width:65vw}"]}),o})();function j(o,r){if(1&o){const t=e.EpF();e.TgZ(0,"span",8),e.NdJ("click",function(){e.CHM(t);const h=e.oxw();return e.KtG(h.downloadDocument(h.currentDoc))}),e._UZ(1,"i",9),e.qZA()}}function G(o,r){if(1&o&&e._UZ(0,"app-image-preview",10),2&o){const t=e.oxw();e.Q6J("document",t.currentDoc)}}function K(o,r){if(1&o&&e._UZ(0,"app-office-viewer",10),2&o){const t=e.oxw();e.Q6J("document",t.currentDoc)}}function z(o,r){if(1&o&&e._UZ(0,"app-pdf-viewer",10),2&o){const t=e.oxw();e.Q6J("document",t.currentDoc)}}function W(o,r){if(1&o&&e._UZ(0,"app-text-preview",10),2&o){const t=e.oxw();e.Q6J("document",t.currentDoc)}}function X(o,r){if(1&o&&e._UZ(0,"app-audio-preview",10),2&o){const t=e.oxw();e.Q6J("document",t.currentDoc)}}function q(o,r){if(1&o&&e._UZ(0,"app-video-preview",10),2&o){const t=e.oxw();e.Q6J("document",t.currentDoc)}}function ee(o,r){1&o&&(e.TgZ(0,"div",11),e._UZ(1,"mat-spinner"),e.qZA())}let te=(()=>{class o extends _.H{constructor(t,n,h,v,E,oe,ne){super(),this.overlay=t,this.commonService=n,this.data=h,this.clonerService=v,this.overlayRef=E,this.toastrService=oe,this.translationService=ne,this.type="",this.isLoading=!1,this.isDownloadFlag=!1}ngOnInit(){this.onDocumentView(this.data)}closeToolbar(){this.overlayRef.close()}onDocumentView(t){this.currentDoc=this.clonerService.deepClone(t);const h=w.N.allowExtesions.find(v=>v.extentions.find(E=>E.toLowerCase()===t.extension.toLowerCase()));this.type=h?h.type:"",this.getIsDownloadFlag(t),this.addDocumentTrail(t.isVersion?t.id:t.documentId,a.g.Read.toString())}addDocumentTrail(t,n){this.sub$.sink=this.commonService.addDocumentAuditTrail({documentId:t,operationName:n}).subscribe(v=>{})}getIsDownloadFlag(t){this.sub$.sink=this.commonService.isDownloadFlag(this.data.isVersion?t.id:t.documentId,this.data.isFromPreview).subscribe(n=>{this.isDownloadFlag=n})}downloadDocument(t){this.sub$.sink=this.commonService.downloadDocument(this.currentDoc.documentId,t.isVersion).subscribe(n=>{n.type===d.dt.Response&&(this.addDocumentTrail(t.isVersion?t.id:t.documentId,a.g.Download.toString()),this.downloadFile(n,t))},n=>{this.toastrService.error(this.translationService.getValue("ERROR_WHILE_DOWNLOADING_DOCUMENT"))})}downloadFile(t,n){const h=new Blob([t.body],{type:t.body.type}),v=document.createElement("a");v.setAttribute("style","display:none;"),document.body.appendChild(v),v.download=this.data.name,v.href=URL.createObjectURL(h),v.target="_blank",v.click(),document.body.removeChild(v)}}return o.\u0275fac=function(t){return new(t||o)(e.Y36(x.T),e.Y36(i.v),e.Y36(b.p),e.Y36(p.$),e.Y36(m.L),e.Y36(P._W),e.Y36(O.D))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-base-preview"]],features:[e.qOj],decls:14,vars:10,consts:[[1,"file-preview-toolbar","d-flex"],[1,"back-arrow"],[1,"las","la-arrow-left",3,"click"],[1,"file-name","flex-grow-1"],["class","back-arrow",3,"click",4,"ngIf"],[3,"ngSwitch"],[3,"document",4,"ngSwitchCase"],["class","loading-shade",4,"ngIf"],[1,"back-arrow",3,"click"],[1,"las","la-arrow-down"],[3,"document"],[1,"loading-shade"]],template:function(t,n){1&t&&(e.TgZ(0,"div",0)(1,"span",1)(2,"i",2),e.NdJ("click",function(){return n.closeToolbar()}),e.qZA()(),e.TgZ(3,"span",3),e._uU(4),e.qZA(),e.YNc(5,j,2,0,"span",4),e.qZA(),e.ynx(6,5),e.YNc(7,G,1,1,"app-image-preview",6),e.YNc(8,K,1,1,"app-office-viewer",6),e.YNc(9,z,1,1,"app-pdf-viewer",6),e.YNc(10,W,1,1,"app-text-preview",6),e.YNc(11,X,1,1,"app-audio-preview",6),e.YNc(12,q,1,1,"app-video-preview",6),e.BQk(),e.YNc(13,ee,2,0,"div",7)),2&t&&(e.xp6(4),e.Oqu(null==n.currentDoc?null:n.currentDoc.name),e.xp6(1),e.Q6J("ngIf",n.isDownloadFlag),e.xp6(1),e.Q6J("ngSwitch",n.type),e.xp6(1),e.Q6J("ngSwitchCase","image"),e.xp6(1),e.Q6J("ngSwitchCase","office"),e.xp6(1),e.Q6J("ngSwitchCase","pdf"),e.xp6(1),e.Q6J("ngSwitchCase","text"),e.xp6(1),e.Q6J("ngSwitchCase","audio"),e.xp6(1),e.Q6J("ngSwitchCase","video"),e.xp6(1),e.Q6J("ngIf",n.isLoading))},dependencies:[u.O5,u.RF,u.n9,l,I,A,V,Z,$],styles:["[_nghost-%COMP%]     #aligner{display:none!important;visibility:hidden!important}.file-preview-toolbar[_ngcontent-%COMP%]{top:0;left:0;display:flex;width:100%;align-items:center;color:var(--be-accent-contrast);height:60px;padding:0 15px;background:#1976d2;z-index:10}.back-arrow[_ngcontent-%COMP%]{color:#fff;font-size:x-large;font-weight:700;cursor:pointer;margin-right:10px}.download-button[_ngcontent-%COMP%]{position:absolute;right:30px}.file-name[_ngcontent-%COMP%]{color:#fff;margin-left:10px}"]}),o})()},5854:(S,C,s)=>{s.d(C,{p:()=>a});const a=new(s(5e3).OlP)("OVERLAY_PANEL_DATA")},4786:(S,C,s)=>{s.d(C,{L:()=>b});var d=s(8929),a=s(2986);class b{constructor(e){this.overlayRef=e,this.id=function w(_=36){let e="",x="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";for(let i=0;i<_;i++)e+=x.charAt(Math.floor(Math.random()*x.length));return e}(15),this.value=new d.xQ}isOpen(){return this.overlayRef&&this.overlayRef.hasAttached()}close(){this.overlayRef&&this.overlayRef.dispose()}emitValue(e){this.value.next(e)}valueChanged(){return this.value.asObservable()}getPanelEl(){return this.overlayRef.overlayElement}updatePosition(){return this.overlayRef.updatePosition()}afterClosed(){return this.overlayRef.detachments().pipe((0,a.q)(1))}}},1218:(S,C,s)=>{s.d(C,{T:()=>u});var d=s(5e3),a=s(7429),w=s(4786),b=s(5854);class _{attach(){}enable(){document.documentElement.classList.add("be-fullscreen-overlay-scrollblock")}disable(){document.documentElement.classList.remove("be-fullscreen-overlay-scrollblock")}}var e=s(2198),x=s(1159),i=s(2845),p=s(5113),m=s(591);let P=(()=>{class g{constructor(c){this.breakpointObserver=c,this.isMobile$=new m.X(!1),this.isTablet$=new m.X(!1),this.breakpointObserver.observe(p.u3.Handset).subscribe(f=>{this.isMobile$.next(f.matches)}),this.breakpointObserver.observe(p.u3.Tablet).subscribe(f=>{this.isTablet$.next(f.matches)})}observe(c){return this.breakpointObserver.observe(c)}}return g.\u0275fac=function(c){return new(c||g)(d.LFG(p.Yg))},g.\u0275prov=d.Yz7({token:g,factory:g.\u0275fac,providedIn:"root"}),g})();const O={hasBackdrop:!0,closeOnBackdropClick:!0,panelClass:"overlay-panel"};let u=(()=>{class g{constructor(c,f,l){this.overlay=c,this.breakpoints=f,this.injector=l}open(c,f){const l=Object.assign({},O,f),y={positionStrategy:this.getPositionStrategy(l),hasBackdrop:l.hasBackdrop,panelClass:l.panelClass,backdropClass:l.backdropClass,scrollStrategy:this.getScrollStrategy(l),disposeOnNavigation:!0};l.width&&(y.width=l.width),l.height&&(y.height=l.height),l.maxHeight&&(y.maxHeight=l.maxHeight),l.maxWidth&&(y.maxWidth=l.maxWidth);const D=this.overlay.create(y),T=new w.L(D),I=c instanceof d.Rgc?new a.UE(c,l.viewContainerRef,l.data):new a.C5(c,l.viewContainerRef,this.createInjector(l,T));return T.componentRef=D.attach(I),l.closeOnBackdropClick&&(D.backdropClick().subscribe(()=>T.close()),D.keydownEvents().pipe((0,e.h)(B=>B.keyCode===x.hY)).subscribe(()=>T.close())),T}getScrollStrategy(c){return c.fullScreen?new _:"close"===c.scrollStrategy?this.overlay.scrollStrategies.close():null}createInjector(c,f){const l=new WeakMap;return l.set(w.L,f),l.set(b.p,c.data||null),new a.nK(this.injector,l)}getPositionStrategy(c){if(c.positionStrategy)return c.positionStrategy;const f=this.breakpoints.isMobile$.value&&c.mobilePosition||c.position;return"global"===c.origin||this.positionIsGlobal(f)?this.getGlobalPositionStrategy(f):this.getConnectedPositionStrategy(f,c.origin)}positionIsGlobal(c){return"center"===c||!Array.isArray(c)}getGlobalPositionStrategy(c){if("center"===c)return this.overlay.position().global().centerHorizontally().centerVertically();{const f=this.overlay.position().global();return Object.keys(c).forEach(l=>{f[l](c[l])}),f}}getConnectedPositionStrategy(c,f){return this.overlay.position().flexibleConnectedTo(f).withPositions(c).withPush(!0).withViewportMargin(5)}}return g.\u0275fac=function(c){return new(c||g)(d.LFG(i.aV),d.LFG(P),d.LFG(d.zs3))},g.\u0275prov=d.Yz7({token:g,factory:g.\u0275fac,providedIn:"root"}),g})()}}]);