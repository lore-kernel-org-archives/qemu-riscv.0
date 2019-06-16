Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hccIS-0005Ju-V8
	for mharc-qemu-riscv@gnu.org; Sun, 16 Jun 2019 17:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hccIP-0005DY-AL
 for qemu-riscv@nongnu.org; Sun, 16 Jun 2019 17:02:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hccAe-0002pr-MZ
 for qemu-riscv@nongnu.org; Sun, 16 Jun 2019 16:54:37 -0400
Resent-Date: Sun, 16 Jun 2019 16:54:37 -0400
Resent-Message-Id: <E1hccAe-0002pr-MZ@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hccAd-0002oT-2U; Sun, 16 Jun 2019 16:54:35 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1560718456; cv=none; d=zoho.com; s=zohoarc; 
 b=hqR5vx7k6gV7D4DRVj8ZXk5k9K5HufVIClFJUqZZHbygrbuCG+gGY8rLL2nylNwNmE/AXnxk/VKfYb/b6RO4sDGEPdy/sj2S7Elk+iHoBEwH529GER3sf7xniGJTMmGjEn3EeyO0gEWjOKrojuIxvYFcsl31u50skWUDP7Lh06c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1560718456;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=5dcQFLSNVmib8ftv14hVHKYkvxX3AmkFKNGHgB9n7XY=; 
 b=QeQf6+PbWgRU+J8dINd+ynAJnxN/cnlChzpcmtJtTLEtu3jFEJC2vawvZPUixKA5WaUkD5KG7aGHU4Vj6NGwgp0TO5sjCrgks2vfUbEgZMDRc2fBeXpeagcVmyvtRGDcTljYdcth8Uo7vieP/ERtI90TcOf8XIJg3aPZe3wpYa8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1560718453821905.7702011182475;
 Sun, 16 Jun 2019 13:54:13 -0700 (PDT)
In-Reply-To: <20190616191900.GH61734@hippo.sing.id.au>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <156071845265.13573.2864992103449076842@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: joel@sing.id.au
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, me@carlosedp.com,
 palmer@sifive.com, Alistair.Francis@wdc.com, marco@decred.org
Date: Sun, 16 Jun 2019 13:54:13 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
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
X-List-Received-Date: Sun, 16 Jun 2019 21:02:39 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDYxNjE5MTkwMC5HSDYx
NzM0QGhpcHBvLnNpbmcuaWQuYXUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIGF0b21pYyBmYWlsdXJlcyBv
biBxZW11LXN5c3RlbS1yaXNjdjY0ClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDE5MDYxNjE5
MTkwMC5HSDYxNzM0QGhpcHBvLnNpbmcuaWQuYXUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
KiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3LzIwMTkwNjE2MTkxOTAwLkdINjE3MzRA
aGlwcG8uc2luZy5pZC5hdSAtPiBwYXRjaGV3LzIwMTkwNjE2MTkxOTAwLkdINjE3MzRAaGlwcG8u
c2luZy5pZC5hdQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmI1ODJjNmY4ZmMgYXRv
bWljIGZhaWx1cmVzIG9uIHFlbXUtc3lzdGVtLXJpc2N2NjQKCj09PSBPVVRQVVQgQkVHSU4gPT09
CldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBzZXBhcmF0ZSBs
aW5lCiM4MTogRklMRTogdGFyZ2V0L3Jpc2N2L2NwdV9oZWxwZXIuYzoxMzY6CisgICAgLyogQ2xl
YXIgdGhlIGxvYWQgcmVzZXJ2YXRpb24gLSBvdGhlcndpc2UgYSByZXNlcnZhdGlvbiBwbGFjZWQg
aW4gb25lCgpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBl
cnJvcnMsIDEgd2FybmluZ3MsIDM1IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBiNTgyYzZmOGZjY2Mg
KGF0b21pYyBmYWlsdXJlcyBvbiBxZW11LXN5c3RlbS1yaXNjdjY0KSBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy8yMDE5MDYxNjE5MTkwMC5HSDYxNzM0QGhpcHBvLnNpbmcuaWQuYXUvdGVzdGluZy5jaGVj
a3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


