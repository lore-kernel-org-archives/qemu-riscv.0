Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h787X-0007Fj-2E
	for mharc-qemu-riscv@gnu.org; Thu, 21 Mar 2019 20:33:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h787T-0007Ck-M6
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 20:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h787R-0008FR-Tl
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 20:33:11 -0400
Resent-Date: Thu, 21 Mar 2019 20:33:11 -0400
Resent-Message-Id: <E1h787R-0008FR-Tl@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h787R-0008Dd-HM; Thu, 21 Mar 2019 20:33:09 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1553214781; cv=none; d=zoho.com; s=zohoarc; 
	b=HMyNDThTSZ4XVG0tblvOmW8hwoJXQaV2Kjr+54bZQ8n2fpOnFVoyGhT2SI54OEcxEEUlBtPbhkei9J4ZqG9bePG+5n1tCxW2uCH0OFzekPVnytVwZmdxdsqopZx9l3Afc1IA4W0TePALhyxDD++S9L5piWV//HubjfE/2XGSGF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1553214781;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=49MKBRhMFqx84pThWHBl7El2xdH4W6XZBsKHlRMZheQ=; 
	b=YocqF08Q+FZbVYWh5f3SsTq1PGEP5drTwL6HM7XLdXvgYisov3a7p4zWL4YnxXaX86imINAaM4jq1zeDDENkuZc1XlS7sy5opFUr//WAmSvkEtpsHqAlAqamTW4dAvQisUtujxPgWAq1+vMCC8xQdPlQhqXOtmHlucjzyvWooDQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1553214778632221.9034446400177;
	Thu, 21 Mar 2019 17:32:58 -0700 (PDT)
In-Reply-To: <20190322002749.26561-1-palmer@sifive.com>
Message-ID: <155321477736.24.8768661903107922078@b782c5aab522>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: palmer@sifive.com
Cc: fam@euphon.net, qemu-riscv@nongnu.org, nathaniel.graff@sifive.com,
	palmer@sifive.com, qemu-devel@nongnu.org
Date: Thu, 21 Mar 2019 17:32:58 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] sifive_prci: Read and write
 PRCI registers
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2019 00:33:12 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDMyMjAwMjc0OS4yNjU2
MS0xLXBhbG1lckBzaWZpdmUuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpNZXNzYWdlLWlkOiAyMDE5MDMyMjAwMjc0OS4yNjU2MS0xLXBhbG1lckBzaWZp
dmUuY29tClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIHNpZml2ZV9wcmNpOiBSZWFkIGFu
ZCB3cml0ZSBQUkNJIHJlZ2lzdGVycwpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgICAgICAgIHBhdGNoZXcvMjAxOTAzMjIwMDI3NDkuMjY1NjEtMS1w
YWxtZXJAc2lmaXZlLmNvbSAtPiBwYXRjaGV3LzIwMTkwMzIyMDAyNzQ5LjI2NTYxLTEtcGFsbWVy
QHNpZml2ZS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpiYThiZTRkY2I2IHNp
Zml2ZV9wcmNpOiBSZWFkIGFuZCB3cml0ZSBQUkNJIHJlZ2lzdGVycwoKPT09IE9VVFBVVCBCRUdJ
TiA9PT0KRVJST1I6IHRoYXQgb3BlbiBicmFjZSB7IHNob3VsZCBiZSBvbiB0aGUgcHJldmlvdXMg
bGluZQojMzU6IEZJTEU6IGh3L3Jpc2N2L3NpZml2ZV9wcmNpLmM6Mjk6CisgICAgc3dpdGNoKGFk
ZHIpCisgICAgewoKRVJST1I6IHNwYWNlIHJlcXVpcmVkIGJlZm9yZSB0aGUgb3BlbiBwYXJlbnRo
ZXNpcyAnKCcKIzM1OiBGSUxFOiBody9yaXNjdi9zaWZpdmVfcHJjaS5jOjI5OgorICAgIHN3aXRj
aChhZGRyKQoKRVJST1I6IHRoYXQgb3BlbiBicmFjZSB7IHNob3VsZCBiZSBvbiB0aGUgcHJldmlv
dXMgbGluZQojNTQ6IEZJTEU6IGh3L3Jpc2N2L3NpZml2ZV9wcmNpLmM6NDg6CisgICAgc3dpdGNo
KGFkZHIpCisgICAgewoKRVJST1I6IHNwYWNlIHJlcXVpcmVkIGJlZm9yZSB0aGUgb3BlbiBwYXJl
bnRoZXNpcyAnKCcKIzU0OiBGSUxFOiBody9yaXNjdi9zaWZpdmVfcHJjaS5jOjQ4OgorICAgIHN3
aXRjaChhZGRyKQoKRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzcyOiBGSUxFOiBody9yaXNj
di9zaWZpdmVfcHJjaS5jOjY2OgorICAgICAgICAgICAgcy0+cGxsb3V0ZGl2ID0gKHVpbnQzMl90
KSB2YWw2NDsgJAoKdG90YWw6IDUgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMTUgbGluZXMgY2hlY2tl
ZAoKQ29tbWl0IGJhOGJlNGRjYjZjNCAoc2lmaXZlX3ByY2k6IFJlYWQgYW5kIHdyaXRlIFBSQ0kg
cmVnaXN0ZXJzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2Yg
dGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0K
ClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWls
YWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDMyMjAwMjc0OS4yNjU2MS0xLXBh
bG1lckBzaWZpdmUuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==


