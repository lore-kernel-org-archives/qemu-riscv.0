Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j94Xe-0002xB-Pf
	for mharc-qemu-riscv@gnu.org; Tue, 03 Mar 2020 05:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j94Wj-0000po-K2
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 05:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j94Wi-0006S2-9v
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 05:11:49 -0500
Resent-Date: Tue, 03 Mar 2020 05:11:49 -0500
Resent-Message-Id: <E1j94Wi-0006S2-9v@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21177)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j94WX-0006Ji-WE; Tue, 03 Mar 2020 05:11:38 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1583230192; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XkRKPV05yFTO13ia0QuFEzIhTdP7bGdmbq7QT7Xjs6O0jn1ydU6YnlpnG4xCFYARghZd3tlWcXrZ18Ch79Yr8H4FCoO3VRBEhAv4Z6+Mj3gDZ/Zi3PTeumztiEmMdbFDYJwImJXLw3QA1qrItdhHOC8qQqGOla95BGUC6m5X+nM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1583230192;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=6h0Avu/nURuND/3kDKluAF2+K7sniAsSm+DzLOZbamA=; 
 b=Bst7IyK7RESFkEvrFkSlhJhndGYABxlUayELZeZZ79HP1nKTJ+Deb0lpN/4/QyhszG18Y/7BwvZgoGSpc/ZxF+xfOWrnf4ma1h4Qrk5vRrL5iMoYInDpDMeoEx+mvxEzzln9kvcVPee3kTF60eMRLuYPXwjKZ+ZVNAW02cuMlJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1583230189403964.9433006367394;
 Tue, 3 Mar 2020 02:09:49 -0800 (PST)
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <158323018613.8962.3754180620911292868@abdcc9e1aa82>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, crwulff@gmail.com, sagark@eecs.berkeley.edu,
 david@redhat.com, green@moxielogic.com, mark.cave-ayland@ilande.co.uk,
 jcmvbkbc@gmail.com, Alistair.Francis@wdc.com, edgar.iglesias@gmail.com,
 marex@denx.de, qemu-ppc@nongnu.org, aleksandar.rikalo@rt-rk.com,
 rth@twiddle.net, atar4qemu@gmail.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 michael@walle.cc, palmer@dabbelt.com, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Date: Tue, 3 Mar 2020 02:09:49 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
X-List-Received-Date: Tue, 03 Mar 2020 10:11:51 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMwMzEwMDUxMS41NDk4
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpTdWJqZWN0OiBbUEFUQ0hdIGNwdTogVXNlIERldmljZUNsYXNzIHJl
c2V0IGluc3RlYWQgb2YgYSBzcGVjaWFsIENQVUNsYXNzIHJlc2V0Ck1lc3NhZ2UtaWQ6IDIwMjAw
MzAzMTAwNTExLjU0OTgtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcKVHlwZTogc2VyaWVzCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+
IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxi
YWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFm
Zjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApmYXRhbDogdW5hYmxlIHRvIGFjY2VzcyAnaHR0
cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11Lyc6IEZhaWxlZCBjb25uZWN0IHRv
IGdpdGh1Yi5jb206NDQzOyBObyByb3V0ZSB0byBob3N0CmVycm9yOiBDb3VsZCBub3QgZmV0Y2gg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApUcmFjZWJhY2sgKG1vc3Qg
cmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAicGF0Y2hldy10ZXN0ZXIvc3JjL3BhdGNoZXctY2xp
IiwgbGluZSA1MjEsIGluIHRlc3Rfb25lCiAgICBnaXRfY2xvbmVfcmVwbyhjbG9uZSwgclsicmVw
byJdLCByWyJoZWFkIl0sIGxvZ2YsIFRydWUpCiAgRmlsZSAicGF0Y2hldy10ZXN0ZXIvc3JjL3Bh
dGNoZXctY2xpIiwgbGluZSA0OCwgaW4gZ2l0X2Nsb25lX3JlcG8KICAgIHN0ZG91dD1sb2dmLCBz
dGRlcnI9bG9nZikKICBGaWxlICIvb3B0L3JoL3JoLXB5dGhvbjM2L3Jvb3QvdXNyL2xpYjY0L3B5
dGhvbjMuNi9zdWJwcm9jZXNzLnB5IiwgbGluZSAyOTEsIGluIGNoZWNrX2NhbGwKICAgIHJhaXNl
IENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vz
c0Vycm9yOiBDb21tYW5kICdbJ2dpdCcsICdyZW1vdGUnLCAnYWRkJywgJy1mJywgJy0tbWlycm9y
PWZldGNoJywgJzNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQnLCAnaHR0
cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11J10nIHJldHVybmVkIG5vbi16ZXJv
IGV4aXQgc3RhdHVzIDEuCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMjAyMDAzMDMxMDA1MTEuNTQ5OC0xLXBldGVyLm1heWRlbGxAbGluYXJv
Lm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

