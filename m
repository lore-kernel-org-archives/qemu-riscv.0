Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdcac-0002tS-8i
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 11:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44565)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quentin.mundell@protonmail.com>) id 1hdcaX-0002pp-Jy
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:33:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quentin.mundell@protonmail.com>) id 1hdcaV-0005r5-8j
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:33:29 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:11926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quentin.mundell@protonmail.com>)
 id 1hdcaS-0005lb-QA
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:33:27 -0400
Date: Wed, 19 Jun 2019 15:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1560958397;
 bh=l+j+00A6Afe5tXuXYDzDxMx1T5rqu9WY13ia2hDg8sc=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=I1Dyz1yj7KC1nVb2Uu+xj1f6EXQ8V/6EFOWi1B9Wwkfvok1Wc14Ko+11CwjtiRbaE
 zmkHhJUJPDeT8eIE+fpGyFL6AABk5AIBNscvrBK29lsJdeEiA2tuSyod2oDQ0Lx++0
 vuqyTxyE4/9/FIm+trNOTkvX9TjhK84pJ1Lnq3/4=
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
From: Quentin Mundell <quentin.mundell@protonmail.com>
Reply-To: Quentin Mundell <quentin.mundell@protonmail.com>
Message-ID: <Gpx9RF86BWnRvLPI5Kz0PRHM3oiLy4nkgS-FiQueS0d3dSS4N-N008stUGzVV-NctfG95esZlphJJ1A7J4rlkU6VniTM_Oxyrg1MfRpGwlA=@protonmail.com>
Feedback-ID: gBLPg9rW5wfp_bU1qG_NMga7H8Xt3ECyEnN_CmBbGEkU52qPG7hPf4oVg3Q-Scu5KvJCR5nhixecbLVi3_LVEA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_fdf2e8da67b82f0e29cafd79dac8d1ef"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.70.40.135
Subject: [Qemu-riscv] TLB refresh issue
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
X-List-Received-Date: Wed, 19 Jun 2019 15:33:31 -0000

This is a multi-part message in MIME format.

--b1_fdf2e8da67b82f0e29cafd79dac8d1ef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpJIGhhdmUgdXBkYXRlZCBteSBRRU1VIHZlcnNpb24gKGZyb20gMy54IHRvIHRvZGF5
J3MgbWFzdGVyKS4KSSBub3cgZ2V0IGFsbCBzb3J0IG9mIHdlaXJkIGFuZCBub3QgZWFzaWx5IHJl
cHJvZHVjaWJsZSBleGNlcHRpb25zIHRyaWdnZXJlZCBpbiBteSByaXNjLXYgZ3Vlc3QsIGhhcHBl
bmluZyBmcm9tIGJvdGggdXNlciBhbmQgc3VwZXJ2aXNvciBtb2RlLgoKVGhlIGNvbW1hbmQgSSB1
c2UgaXMgcm91Z2hseSBgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtbWFjaGluZSBzaWZpdmVfdSAtbSAx
MDI0IC1rZXJuZWwgbXliaW5hcnkuZWxmYCAoc29ycnksIEkgY2Fubm90IHNoYXJlIHRoZSBlbGYp
LgoKSSBoYXZlIGJpc2VjdGVkIHRoaXMgaXNzdWUgYmFjayB0byBjb21taXQgYzdiOTUxNzE4ODE1
NjkyODQ1MDFlZDAxZmVjN2FjYjg2NTRkYjdiLgpTb21lIFRMQiBmbHVzaGVzIHdlcmUgcmVtb3Zl
ZCBpbiB0aGUgZm9sbG93aW5nIHBsYWNlczoKdGFyZ2V0L3Jpc2N2L2NwdV9oZWxwZXIuYzogYGNz
cl93cml0ZV9oZWxwZXIoZW52LCBzLCBDU1JfTVNUQVRVUyk7YCAtPiBgZW52LT5tc3RhdHVzID0g
cztgICh0d2ljZSkKdGFyZ2V0L3Jpc2N2L29wX2hlbHBlci5jOiBgY3NyX3dyaXRlX2hlbHBlcihl
bnYsIHMsIENTUl9NU1RBVFVTKTtgIC0+IGBlbnYtPm1zdGF0dXMgPSBzO2AgKHR3aWNlKQpUaGVz
ZSBhcmUgdGhlIHBsYWNlcyB3aGVyZSB0aGUgcHJpdmlsZWdlZCBtb2RlIGlzIHN3aXRjaGVkLgoK
SWYgSSBhZGQgdGhlbSBiYWNrIChgdGxiX2ZsdXNoKGVudl9jcHUoZW52KSk7YCksIGV2ZXJ5dGhp
bmcgaXMgZmluZSBhZ2Fpbi4KCkhvd2V2ZXIsIGluIHRoZSBgcmlzY3ZfY3B1X3NldF9tb2RlYCBm
dW5jdGlvbiwgSSBzZWUgdGhlIGZvbGxvd2luZyBjb21tZW50Ogo+IHRsYl9mbHVzaCBpcyB1bm5l
Y2Vzc2FyeSBhcyBtb2RlIGlzIGNvbnRhaW5lZCBpbiBtbXVfaWR4Ckl0IHdvdWxkIHN1Z2dlc3Qg
YWRkaW5nIGJhY2sgVExCIGZsdXNoZXMgaXMgbm90IHRoZSB3YXkgdG8gZ28uLi4KCkRvZXMgc29t
ZW9uZSB3aXRoIGJldHRlciBrbm93bGVkZ2Ugb2YgdGhlIGNvZGViYXNlIGNhbiB0ZWxsIG1lIGhv
dyB0byBwcm9jZWVkIGhlcmU/Ci0gU2hvdWxkIEkgc3VibWl0IGEgcGF0Y2ggYWRkaW5nIGJhY2sg
dGhlIFRMQiBmbHVzaGVzPwotIElzIGl0IGFuIGlzc3VlIHNvbWV3aGVyZSBlbHNlPwoKUmVnYXJk
cwpRTQ==


--b1_fdf2e8da67b82f0e29cafd79dac8d1ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgdXBkYXRlZCBt
eSBRRU1VIHZlcnNpb24gKGZyb20gMy54IHRvIHRvZGF5J3MgbWFzdGVyKS48YnI+PC9kaXY+PGRp
dj5JIG5vdyBnZXQgYWxsIHNvcnQgb2Ygd2VpcmQgYW5kIG5vdCBlYXNpbHkgcmVwcm9kdWNpYmxl
IGV4Y2VwdGlvbnMgdHJpZ2dlcmVkIGluIG15IHJpc2MtdiBndWVzdCwgaGFwcGVuaW5nIGZyb20g
Ym90aCB1c2VyIGFuZCBzdXBlcnZpc29yIG1vZGUuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+VGhlIGNvbW1hbmQgSSB1c2UgaXMgcm91Z2hseSBgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtbWFj
aGluZSBzaWZpdmVfdSAtbSAxMDI0IC1rZXJuZWwgbXliaW5hcnkuZWxmYCAoc29ycnksIEkgY2Fu
bm90IHNoYXJlIHRoZSBlbGYpLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+SSBo
YXZlIGJpc2VjdGVkIHRoaXMgaXNzdWUgYmFjayB0byBjb21taXQgYzdiOTUxNzE4ODE1NjkyODQ1
MDFlZDAxZmVjN2FjYjg2NTRkYjdiLjxicj4NClNvbWUgVExCIGZsdXNoZXMgd2VyZSByZW1vdmVk
IGluIHRoZSBmb2xsb3dpbmcgcGxhY2VzOjxicj4NCnRhcmdldC9yaXNjdi9jcHVfaGVscGVyLmM6
IGBjc3Jfd3JpdGVfaGVscGVyKGVudiwgcywgQ1NSX01TVEFUVVMpO2AgLSZndDsgYGVudi0mZ3Q7
bXN0YXR1cyA9IHM7YCAodHdpY2UpPGJyPg0KdGFyZ2V0L3Jpc2N2L29wX2hlbHBlci5jOiBgY3Ny
X3dyaXRlX2hlbHBlcihlbnYsIHMsIENTUl9NU1RBVFVTKTtgIC0mZ3Q7IGBlbnYtJmd0O21zdGF0
dXMgPSBzO2AgKHR3aWNlKTwvZGl2PjxkaXY+VGhlc2UgYXJlIHRoZSBwbGFjZXMgd2hlcmUgdGhl
IHByaXZpbGVnZWQgbW9kZSBpcyBzd2l0Y2hlZC48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JZiBJIGFkZCB0aGVtIGJhY2sgKGB0bGJfZmx1c2goZW52X2NwdShlbnYpKTtgKSwgZXZlcnl0
aGluZyBpcyBmaW5lIGFnYWluLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkhvd2V2ZXIs
IGluIHRoZSBgcmlzY3ZfY3B1X3NldF9tb2RlYCBmdW5jdGlvbiwgSSBzZWUgdGhlIGZvbGxvd2lu
ZyBjb21tZW50OiA8YnI+PC9kaXY+PGRpdj4mZ3Q7IHRsYl9mbHVzaCBpcyB1bm5lY2Vzc2FyeSBh
cyBtb2RlIGlzIGNvbnRhaW5lZCBpbiBtbXVfaWR4PGJyPjwvZGl2PjxkaXY+SXQgd291bGQgc3Vn
Z2VzdCBhZGRpbmcgYmFjayBUTEIgZmx1c2hlcyBpcyBub3QgdGhlIHdheSB0byBnby4uLjxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkRvZXMgc29tZW9uZSB3aXRoIGJldHRlciBrbm93bGVk
Z2Ugb2YgdGhlIGNvZGViYXNlIGNhbiB0ZWxsIG1lIGhvdyB0byBwcm9jZWVkIGhlcmU/PGJyPjwv
ZGl2PjxkaXY+LSBTaG91bGQgSSBzdWJtaXQgYSBwYXRjaCBhZGRpbmcgYmFjayB0aGUgVExCIGZs
dXNoZXM/PGJyPjwvZGl2PjxkaXY+LSBJcyBpdCBhbiBpc3N1ZSBzb21ld2hlcmUgZWxzZT88YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5SZWdhcmRzPGJyPjwvZGl2PjxkaXY+UU08YnI+PC9k
aXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+



--b1_fdf2e8da67b82f0e29cafd79dac8d1ef--


