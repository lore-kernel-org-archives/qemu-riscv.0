Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNnAB-0005qO-NF
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 20:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jNnA9-0005lj-N3
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 20:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jNnA8-0005uD-Iy
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 20:41:21 -0400
Resent-Date: Sun, 12 Apr 2020 20:41:21 -0400
Resent-Message-Id: <E1jNnA8-0005uD-Iy@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jNnA0-0005pl-1D; Sun, 12 Apr 2020 20:41:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586738401; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TAa4hD7glGhPZC4CUy5bvYcs28EurTc51MKmuUTOA1WYJJSDAOwrv4AoCbbJxk9ZymLlPpxKastTouASIwlPBa0KHdMbqq3ChgOVv47vE6LMPdwiEdpS3jNgzYuFLVxEEo5X7Qakn528u9R+sUk3wvg0f5Wuf9IM9HRdbjU9ors=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1586738401;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=V3j6Mnhyu7zXzu5q1EP1mH3AOGTvNzzUrss2N7jacJ8=; 
 b=Fu7MQjNdLguvbafMYMU/RvqgZ+z7MPktIfmp/JEUgW6zue/AGQFYkMd1+xRlzg8qR3b/4JjQ3QnBq/wP+RefZ5FX0OKrv9ZmD0OUewB6XyP1c/KrzNu4/pbkqparAroit9ptSB5mB3zBUpTXOs1yXDH3bN9G8pU+OsPQyt1xyxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1586738398626207.21748152433838;
 Sun, 12 Apr 2020 17:39:58 -0700 (PDT)
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 v3 00/24] various: Fix error-propagation with
 Coccinelle scripts (part 1)
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <158673839497.24582.16303937590417582232@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, peter.maydell@linaro.org,
 sagark@eecs.berkeley.edu, mst@redhat.com, codyprime@gmail.com,
 jasowang@redhat.com, Alistair.Francis@wdc.com, edgar.iglesias@gmail.com,
 sundeep.lkml@gmail.com, qemu-block@nongnu.org, armbru@redhat.com,
 mreitz@redhat.com, joel@jms.id.au, marcandre.lureau@redhat.com,
 rth@twiddle.net, philmd@redhat.com, ehabkost@redhat.com,
 xiechanglong.d@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, clg@kaod.org,
 palmer@dabbelt.com, david@gibson.dropbear.id.au, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, wencongyang2@huawei.com,
 f4bug@amsat.org, jcd@tribudubois.net, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, pbonzini@redhat.com
Date: Sun, 12 Apr 2020 17:39:58 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.53
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
X-List-Received-Date: Mon, 13 Apr 2020 00:41:23 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQxMjIyMzYxOS4xMTI4
NC0xLWY0YnVnQGFtc2F0Lm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGRvY2tl
ci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0xIE5FVFdP
Uks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0xIEo9MTQg
TkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpSQU1CbG9jayAic3JhbSBBIiBhbHJl
YWR5IHJlZ2lzdGVyZWQsIGFib3J0IQpCcm9rZW4gcGlwZQovdG1wL3FlbXUtdGVzdC9zcmMvdGVz
dHMvcXRlc3QvbGlicXRlc3QuYzoxNzU6IGtpbGxfcWVtdSgpIGRldGVjdGVkIFFFTVUgZGVhdGgg
ZnJvbSBzaWduYWwgNiAoQWJvcnRlZCkgKGNvcmUgZHVtcGVkKQpFUlJPUiAtIHRvbyBmZXcgdGVz
dHMgcnVuIChleHBlY3RlZCA2LCBnb3QgNSkKbWFrZTogKioqIFtjaGVjay1xdGVzdC1hYXJjaDY0
XSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgVEVT
VCAgICBpb3Rlc3QtcWNvdzI6IDE3OQogIFRFU1QgICAgaW90ZXN0LXFjb3cyOiAxODEKLS0tCiAg
ICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxl
ZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1uJywgJ2RvY2tlcicsICdydW4nLCAn
LS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPWFiYzRmMDkwODJhODQ0MGViODE2Njg2
ZDdmOWQ3YTk4JywgJy11JywgJzEwMDEnLCAnLS1zZWN1cml0eS1vcHQnLCAnc2VjY29tcD11bmNv
bmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9JywgJy1lJywgJ0VYVFJBX0NPTkZJ
R1VSRV9PUFRTPScsICctZScsICdWPScsICctZScsICdKPTE0JywgJy1lJywgJ0RFQlVHPScsICct
ZScsICdTSE9XX0VOVj0xJywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90bXAvY2NhY2hlJywgJy12
JywgJy9ob21lL3BhdGNoZXcvLmNhY2hlL3FlbXUtZG9ja2VyLWNjYWNoZTovdmFyL3RtcC9jY2Fj
aGU6eicsICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtOTlrYndlcmIvc3JjL2Rv
Y2tlci1zcmMuMjAyMC0wNC0xMi0yMC4yNy4yMy43MDkyOi92YXIvdG1wL3FlbXU6eixybycsICdx
ZW11OmNlbnRvczcnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAndGVzdC1xdWljayddJyByZXR1cm5l
ZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0ZXI9bGFiZWw9Y29tLnFlbXUu
aW5zdGFuY2UudXVpZD1hYmM0ZjA5MDgyYTg0NDBlYjgxNjY4NmQ3ZjlkN2E5OAptYWtlWzFdOiAq
KiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC92YXIv
dG1wL3BhdGNoZXctdGVzdGVyLXRtcC05OWtid2VyYi9zcmMnCm1ha2U6ICoqKiBbZG9ja2VyLXJ1
bi10ZXN0LXF1aWNrQGNlbnRvczddIEVycm9yIDIKCnJlYWwgICAgMTJtMzIuODg3cwp1c2VyICAg
IDBtOS40NDFzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy8yMDIwMDQxMjIyMzYxOS4xMTI4NC0xLWY0YnVnQGFtc2F0Lm9yZy90ZXN0aW5nLmRv
Y2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

