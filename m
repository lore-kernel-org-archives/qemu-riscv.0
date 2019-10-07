Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHMOQ-0007FO-W0
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 02:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iHMON-0007Cr-QI
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 02:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iHMOM-0007vn-LQ
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 02:21:11 -0400
Resent-Date: Mon, 07 Oct 2019 02:21:11 -0400
Resent-Message-Id: <E1iHMOM-0007vn-LQ@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iHMOJ-0007tT-Rz; Mon, 07 Oct 2019 02:21:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570429249; cv=none; d=zoho.com; s=zohoarc; 
 b=HkkSnxi+x76+GO19MJ7eTa/IqCGA1u/L6nsuHflDAqe0mDCUtImUHuw6+lJJACXTZa02wsRrz90yC3+2kYTDU+WxYH8dUKwAeK8ITTE8pmwXKFfcFCUSqtCyBjDVPHn0A+LQ3HIp+SwRIAQXA+vvDqCNTHpqhxTQR0gML0/7O8A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1570429249;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=Qh+vNqJghHptN57k0cNYiQz8vmlx8XPJ8RJgpu1Drs8=; 
 b=fqYaWma7RF9yTDgrvVqWKdXHrVMru2HX+3QRTWvpjg44XqnwAuCynHAwyAgqlAxBaHX7h9phKkfi4OWJBjRGpAuUAXMvYdJAnmU+yvVcM6u3/0VMOz9JhsFNsLGVEYMB+AQNtitCOJyjHcVgrSvQAU/6nJ77OyXUqkaxwANP0eI=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 157042924646341.74706414253876;
 Sun, 6 Oct 2019 23:20:46 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
In-Reply-To: <20191007052813.25814-1-dayeol@berkeley.edu>
Message-ID: <157042924496.31166.11860357702782230659@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: dayeol@berkeley.edu
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 dayeol@berkeley.edu, kbastian@mail.uni-paderborn.de, palmer@sifive.com,
 Alistair.Francis@wdc.com
Date: Sun, 6 Oct 2019 23:20:46 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.55
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Oct 2019 06:21:13 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAwNzA1MjgxMy4yNTgx
NC0xLWRheWVvbEBiZXJrZWxleS5lZHUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDE5MTAwNzA1MjgxMy4yNTgx
NC0xLWRheWVvbEBiZXJrZWxleS5lZHUKU3ViamVjdDogW1BBVENIXSB0YXJnZXQvcmlzY3Y6IFBN
UCB2aW9sYXRpb24gZHVlIHRvIHdyb25nIHNpemUgcGFyYW1ldGVyCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3Y2E5
NDcwIHRhcmdldC9yaXNjdjogUE1QIHZpb2xhdGlvbiBkdWUgdG8gd3Jvbmcgc2l6ZSBwYXJhbWV0
ZXIKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBzdXNwZWN0IGNvZGUgaW5kZW50IGZvciBj
b25kaXRpb25hbCBzdGF0ZW1lbnRzICg0LCA2KQojNDg6IEZJTEU6IHRhcmdldC9yaXNjdi9jcHVf
aGVscGVyLmM6NDc0OgorICAgIGlmIChhY2Nlc3NfdHlwZSA9PSBNTVVfSU5TVF9GRVRDSCkgewor
ICAgICAgcG1wX3NpemUgPSBSSVNDVl9JTlNOX0xFTkdUSDsKCnRvdGFsOiAxIGVycm9ycywgMCB3
YXJuaW5ncywgMzAgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDdjYTk0NzA0ODQ1MCAodGFyZ2V0L3Jp
c2N2OiBQTVAgdmlvbGF0aW9uIGR1ZSB0byB3cm9uZyBzaXplIHBhcmFtZXRlcikgaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFs
c2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRD
SCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVk
IHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNo
ZXcub3JnL2xvZ3MvMjAxOTEwMDcwNTI4MTMuMjU4MTQtMS1kYXllb2xAYmVya2VsZXkuZWR1L3Rl
c3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


