Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h94Rv-0006h1-9S
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 05:02:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h94Rk-0006c7-3H
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 05:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h94Ri-0001D0-ME
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 05:02:08 -0400
Resent-Date: Wed, 27 Mar 2019 05:02:08 -0400
Resent-Message-Id: <E1h94Ri-0001D0-ME@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h94Ri-00019Z-FG; Wed, 27 Mar 2019 05:02:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1553677304; cv=none; d=zoho.com; s=zohoarc; 
	b=MCaAu8T2T3NzP3RcUmo5MQfil6xS1gl/lZg1QL4GFjf8rmjWYlpYGHdSwiDLJkjXQS3y/CpHyf8Ch8+ggMeaXkUUZ2xXgOyAT8MfD90I0JoRoixhvK0OSZrSmaSvg6FEliPTGYCcrUhf7Ean/QD0gwiaBs2dS0SMLG/qUqy70r0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1553677304;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=xKC/QslWC3qoFkLpaAL36bbnR47oS1UjTAUKZk1wmdM=; 
	b=Mp3fZVos4nU4lkHxu9jHkGwhWXc2Jo81OsY8wpGCwojVXiyu9lgVOqhgvyZYG0FEiprwj+HzIHnU3oaeYGt/NChP8B+DeYJTfgI/430IdnTlAenmOdqcE3IrvMzKfMipampgx3j661jXYP72yLtzCoXm8U0O+Lolpw/tGb859Fk=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 155367730146712.21088979605122;
	Wed, 27 Mar 2019 02:01:41 -0700 (PDT)
In-Reply-To: <1553592437-109191-1-git-send-email-kito@andestech.com>
Message-ID: <155367730004.11112.14519146849045483815@b782c5aab522>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kito@andestech.com
Cc: fam@euphon.net, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	palmer@sifive.com, kito.cheng@gmail.com
Date: Wed, 27 Mar 2019 02:01:41 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.53
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Fix wrong
 expanding for c.fswsp
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
X-List-Received-Date: Wed, 27 Mar 2019 09:02:13 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTUzNTkyNDM3LTEwOTE5MS0x
LWdpdC1zZW5kLWVtYWlsLWtpdG9AYW5kZXN0ZWNoLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTU1MzU5MjQzNy0xMDkxOTEtMS1n
aXQtc2VuZC1lbWFpbC1raXRvQGFuZGVzdGVjaC5jb20KU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQ
QVRDSF0gdGFyZ2V0L3Jpc2N2OiBGaXggd3JvbmcgZXhwYW5kaW5nIGZvciBjLmZzd3NwClR5cGU6
IHNlcmllcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBh
cnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNj
OGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICAgN2U5YTIxMzdjZS4uNDlmYzg5OWY4ZCAgbWFz
dGVyICAgICAtPiBtYXN0ZXIKIHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0Y2hldy8xNTUy
NDk0NjgyLTE2Nzg4LTEtZ2l0LXNlbmQtZW1haWwtampoZXJuZUBsaW51eC5pYm0uY29tIC0+IHBh
dGNoZXcvMTU1MjQ5NDY4Mi0xNjc4OC0xLWdpdC1zZW5kLWVtYWlsLWpqaGVybmVAbGludXguaWJt
LmNvbQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzE1NTMxOTM2MzAtMjg2MTEt
MS1naXQtc2VuZC1lbWFpbC1zYW5kcmFAY29kZXNvdXJjZXJ5LmNvbSAtPiBwYXRjaGV3LzE1NTMx
OTM2MzAtMjg2MTEtMS1naXQtc2VuZC1lbWFpbC1zYW5kcmFAY29kZXNvdXJjZXJ5LmNvbQogdCBb
dGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzE1NTMzNTExOTctMTQ1ODEtMS1naXQtc2Vu
ZC1lbWFpbC1jYWZlci5hYmRpQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzE1NTMzNTExOTctMTQ1ODEt
MS1naXQtc2VuZC1lbWFpbC1jYWZlci5hYmRpQGdtYWlsLmNvbQogKiBbbmV3IHRhZ10gICAgICAg
ICAgICAgICBwYXRjaGV3LzE1NTM1OTI0MzctMTA5MTkxLTEtZ2l0LXNlbmQtZW1haWwta2l0b0Bh
bmRlc3RlY2guY29tIC0+IHBhdGNoZXcvMTU1MzU5MjQzNy0xMDkxOTEtMS1naXQtc2VuZC1lbWFp
bC1raXRvQGFuZGVzdGVjaC5jb20KIHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0Y2hldy8y
MDE5MDMwNzE0NDEyNi4zMTg0Ny0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0
Y2hldy8yMDE5MDMwNzE0NDEyNi4zMTg0Ny0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcK
IHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0Y2hldy8yMDE5MDMyMjE2MjMzMy4xNzE1OS0x
LWRyam9uZXNAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMTkwMzIyMTYyMzMzLjE3MTU5LTEtZHJq
b25lc0ByZWRoYXQuY29tCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMjAxOTAz
MjMxOTA5MjUuMjEzMjQtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcv
MjAxOTAzMjMxOTA5MjUuMjEzMjQtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnCiB0IFt0
YWcgdXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMjAxOTAzMjQxODA1MjMuR0EyMzk3OUBlcm9r
ZW5sYWJzZXJ2ZXIgLT4gcGF0Y2hldy8yMDE5MDMyNDE4MDUyMy5HQTIzOTc5QGVyb2tlbmxhYnNl
cnZlcgogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTkwMzI1MTE0NTU0Ljcz
ODgtMS1jaG91dGVhdUBhZGFjb3JlLmNvbSAtPiBwYXRjaGV3LzIwMTkwMzI1MTE0NTU0LjczODgt
MS1jaG91dGVhdUBhZGFjb3JlLmNvbQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3
LzIwMTkwMzI1MTYxMzM4LjY1MzYtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBh
dGNoZXcvMjAxOTAzMjUxNjEzMzguNjUzNi0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcK
IHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0Y2hldy8yMDE5MDMyNjA3MTIzMy4xOTQ3LTEt
YXJtYnJ1QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE5MDMyNjA3MTIzMy4xOTQ3LTEtYXJtYnJ1
QHJlZGhhdC5jb20KIHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0Y2hldy8yMDE5MDMyNjA5
MDUwMS4xNTI1My0xLWFybWJydUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAxOTAzMjYwOTA1MDEu
MTUyNTMtMS1hcm1icnVAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3Qn
Cgo9PT0gT1VUUFVUIEJFR0lOID09PQpjaGVja3BhdGNoLnBsOiBubyByZXZpc2lvbnMgcmV0dXJu
ZWQgZm9yIHJldmxpc3QgJzEnCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDI1NQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMTU1MzU5MjQzNy0xMDkxOTEtMS1naXQtc2VuZC1lbWFpbC1raXRvQGFu
ZGVzdGVjaC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


