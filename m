Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90F606A31D
	for <qemu-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 20:29:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVEBF-0003z4-Hu; Sun, 22 Nov 2026 15:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1112433017@e.gzhu.edu.cn>)
 id 1xVBTT-00075r-68
 for qemu-riscv@nongnu.org; Sun, 22 Nov 2026 12:35:37 -0500
Received: from smtpbgeu2.qq.com ([18.194.254.142])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1112433017@e.gzhu.edu.cn>)
 id 1xVBTQ-0008F7-6Q
 for qemu-riscv@nongnu.org; Sun, 22 Nov 2026 12:35:34 -0500
EX-QQ-RecipientCnt: 1
X-QQ-GoodBg: 2
X-QQ-SSF: 0040000000000030
X-QQ-FEAT: D4aqtcRDiqQ2hwknEHTU3mLwrm71ObIgm6i+WZlYK8w=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: A0yuUCq1E07MHiYjfGnx6mnUBZ1aBkFZkNDX47uB+Fk=
X-QQ-STYLE: 
X-QQ-mid: v3sz3b-12t1795368914tf74434d4
From: "=?utf-8?B?6buE5Y2O5oiQ?=" <1112433017@e.gzhu.edu.cn>
To: "=?utf-8?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Subject: [PATCH 0/2] target/riscv: fault shadow-stack accesses on
 non-shadow-stack data pages and in Bare mode
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 23 Nov 2026 01:35:14 +0800
X-Priority: 3
Message-ID: <tencent_17D866052BDCAEB93A192D71@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 18371780463626415638
X-Address-Ticket: version=; type=; ticket_id=; id_list=; display_name=;
 session_id=; 
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 23 Nov 2026 01:35:14 +0800 (CST)
Feedback-ID: v:e.gzhu.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N7h1OCCDntujMKimi/k1JMFtww427ZBMSj57cHlhG6tDr8gn9b+pnaVz
 tb0191FktEDUq0Pf123ymqnV1pAdfl0pPyNQXkkNhRGwvI0hHs8Z7S4mcoFUariZamTxoKm
 Oi8X58YPo1HyIkEIYVsDNDUm/L/fl2K0ifGqKv3pOWMPoIkRAjeDf1BZeI81w1z1/EAs9FC
 gqIjBrCrY7J4KA9JsVbDxghze8RCDCHuTSm+h/+CKbYYTDcTPrdwWffMZAxmuNA6tk9Plmu
 GMPs0k0P275YqTUNCU7tDWu3wqCevOQSPGpQ8HTDAvLcZjugKxVvi/QPpjZtTcvKZO+iC8C
 O5bbSSj1hSIplXdP1luUUmcKR5QUlJXwgLbYJwAc1SUdDcevAXwIOoC67O5zSAaZD/Y+QMk
 JjrhdNGmvbi9xcFoN20OG664ZjehUZbKsXS2xrBGvh1mu3HJTNZip/vV286eLAcmGYErNSX
 +K6GtIQw7nXb2iaAWs+cE+W/2bgYUXmP0J1lwV1aF9oAXK3q3PALjlCbykYJ0lqamnvG4ls
 fim/w2R4040Q19ClEoLzuV5MQVjwPL7zQu9459OpEhi3tz6il2AY+qCwKE8429NHFyFcaVN
 zEQtgA6zLuPrmfttnEJber3jVV98db8IamVafFBUGb9gJ0pixtCT8rWIDriEl/aSjmbU0hu
 lQszfpGVrnqAasGRAYbEVMRmw+Tk8iUAz/piiPLuZelsdjJcBIgfkUHdC/FVlkEkuRZYOlT
 xWv2LOIn/P/bBSW4Nd9YaLN3uXgrdZQ88hv9v6jDoLV5bYbt3HNVa4JGejTikn9mQ5OxEs0
 O+SauxT/IIB7WLUn0hofdrprNTwzmtYjlxYUonxLe6uHPdR7v1lzDEJHQNiMEZcAYZ9hi1G
 Z+uH9wxcfZFcvZni3L4nWH9oALE2qYMwv+a7wgCsh/XaWMVt/bNv/0F8Lb+CpFYyAWTRY9W
 PzHBQOC/iy8wLjuo0lv8bDLdBHHGmOACGA98CE271K6O2RSm+CoCX6BDP6dZlws/vmXRYK/
 nmiDlP0Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
Received-SPF: pass client-ip=18.194.254.142;
 envelope-from=1112433017@e.gzhu.edu.cn; helo=smtpbgeu2.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 22 Nov 2026 15:28:55 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sVGhlc2UgdHdvIHBhdGNoZXMgY2xvc2UgdGhlIHNoYWRvdy1zdGFjayBwYWdlLXR5
cGUgZ2FwcyByZXBvcnRlZCBpbmlzc3VlcyAjNDc2MiBhbmQgIzQ3NjM6UGF0Y2ggMSAoIzQ3
NjIpOiB0aGUgbGVhZiByd3ggc3dpdGNoIGluIGdldF9waHlzaWNhbF9hZGRyZXNzKCkgaGFu
ZGxlcyB0aGUgVy1vbmx5IChzaGFkb3ctc3RhY2spIGFuZCBSLW9ubHkgZW5jb2RpbmdzIGZv
ciBaaWNmaXNzIGJ1dCBoYXMgbm8gY2FzZXMgZm9yIFJXLCBSfFgsIFgtb25seSBvciBSV1gg
bGVhdmVzIHdoZW4gdGhlIGFjY2VzcyBpcyBhIHNoYWRvdy1zdGFjayBhY2Nlc3MgKGlzX3Nz
dGFja19pZHgpLiAgVGhvc2UgZmFsbCB0aHJvdWdoIHRvIHRoZSBub3JtYWwgcGVybWlzc2lv
biBwYXRoLCBzbyBzc3B1c2gvc3Nwb3BjaGsvc3NhbW9zd2FwIGZyZWVseSByZWFkIGFuZCB3
cml0ZSBvcmRpbmFyeSBkYXRhIHBhZ2VzIG1hcHBlZCBWfFJ8VywgYW5kIHNzcG9wY2hrIGNv
bXBhcmlzb25zIHN1Y2NlZWQgYWdhaW5zdCBhdHRhY2tlci1jaG9zZW4gUlctcGFnZSBtZW1v
cnkgKHByb2JlIFQxMTogcGl2b3Qgc3NwIHRvIGEgUlcgcGFnZSwgcGxhbnQgdGhlIGV4cGVj
dGVkIHZhbHVlLCBzc3BvcGNoayBwYXNzZXMgLSBleGl0IDB4NzUgImZ1bGwgcGFzcyIpLiAg
UGVyIFppY2Zpc3MsIHNoYWRvdy1zdGFjayBhY2Nlc3NlcyBhcmUgb25seSBwZXJtaXR0ZWQg
b24gc2hhZG93LXN0YWNrIHBhZ2VzIChhbmQgcmVhZC1vbmx5IHBhZ2VzIGZvciB1bndpbmQg
cmVhZHMsIGFscmVhZHkgaGFuZGxlZCBieSB0aGUgUFRFX1IgY2FzZSkuICBSZWplY3QgdGhl
IHJlbWFpbmluZyBub24tU1MgbGVhZiB0eXBlcyB3aGVuIGlzX3NzdGFja19pZHguICBUaGlz
IGFsc28gY2xvc2VzIHRoZSBNWFIgcGF0aDogYGlmIChteHIpIHByb3QgfD0gUEFHRV9SRUFE
YCBtdXN0IG5vdCBncmFudCBhIHNoYWRvdy1zdGFjayByZWFkIG9mIGFuIGV4ZWN1dGUtb25s
eSBwYWdlIChwcm9iZSBUMzIsIGV4aXQgMHg1OSAtPiBmYXVsdCkuUGF0Y2ggMiAoIzQ3NjMp
OiBpbiBWTV8xXzEwX01CQVJFIHRoZSB0cmFuc2xhdGlvbiByZXR1cm5zIHBoeXNpY2FsID09
IHZpcnR1YWwgd2l0aCBmdWxsIHBlcm1pc3Npb25zIGZvciBldmVyeSBhY2Nlc3MsIGluY2x1
ZGluZyBzaGFkb3ctc3RhY2sgYWNjZXNzZXMuICBXaXRoIHNhdHAgZGlzYWJsZWQsIHNzcHVz
aC9zc3BvcGNoay9zc2Ftb3N3YXAgb3BlcmF0ZSBvbiBvcmRpbmFyeSBwaHlzaWNhbCBtZW1v
cnkgKHByb2JlIFQyNyBmdWxsIHBhc3Mgb24gdW5wYXRjaGVkKS4gQmFyZSBtb2RlIGhhcyBu
byBwYWdlIHR5cGVzLCBzbyBhbGwgU1MgYWNjZXNzZXMgbXVzdCBmYXVsdC5Qcm9iZSBldmlk
ZW5jZSAodW5wYXRjaGVkIHYxMS4xLjEzIC0+IHdpdGggYm90aCBwYXRjaGVzKTogIFQxMSBS
Vy1wYWdlIHNzcG9wY2hrICAgOiAxMTcgKGJ5cGFzcykgIC0+IDE1IChmYXVsdCkgIFQxMyBV
LW1vZGUgUlcgdmFyaWFudCAgOiAxMTcgICAgICAgICAgIC0+IDE1ICBUMzIgTVhSICsgWC1v
bmx5ICAgICAgIDogIDg5IChieXBhc3MpICAtPiAxNSAgVDI3IEJhcmUtbW9kZSBwaXZvdCAg
ICA6IGZ1bGwgcGFzcyAgICAgLT4gZmF1bHQgIENvbmZvcm1hbmNlIHByb2JlcyBUNC9UNS9U
OCAoU1MtcGFnZSBwdXNoL3BvcGNoayBzZW1hbnRpY3MpIHVuY2hhbmdlZC5Qcm9iZSBFTEZz
IGFuZCB0aGUgZnVsbCAyMS1tdXRhbnQgcmVncmVzc2lvbiBiYXR0ZXJ5ICh6ZXJvIGZhbHNl
IHBvc2l0aXZlcyBvbiB0aGUgcGF0Y2hlZCB0cmVlKSBhdmFpbGFibGUgb24gcmVxdWVzdC5U
aGFua3PvvIxMb29raW5nIGZvcndhcmQgdG8geW91ciByZXBseSE=


