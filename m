Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC1v0-0007VA-7c
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 08:56:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <1228455161@qq.com>) id 1hBw7e-00079F-26
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 02:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <1228455161@qq.com>) id 1hBw7c-0000DM-EJ
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 02:45:13 -0400
Received: from smtpbgau1.qq.com ([54.206.16.166]:55403)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <1228455161@qq.com>) id 1hBw7a-00084M-R5
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 02:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1554360278; bh=uuI13tOkgVp7YQERbK0HvOrJmyXRNIf9JbFwegEyRk0=;
	h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
	b=Cf27MrhE4kl0w4SUYJiPHcmkDPQiCEqBb4KvI+z2ulSD5bvdXCTAE5MiaHf+eJL6D
	nnUPFrrSHXjtuvLSwWYJ2GZY8HvFXs1havmAWyqz/3o0NJkEjFyKD8WM7vCMCVTb9y
	kY9ON+IYU6TBg/wimQag8RUs0RLwFJm7QTMIqdSk=
X-QQ-FEAT: 5gms5Di3ODgZhuRxtos++gAxJs94n3qLdidIIGkctkjQNQpaQCkUQqtn7NKR8
	iivlEPL2V25rvNLa+b0GuEetCJLMC9UxuoK2Lyg2u85LkJf6rLLdz/2Si8Ic/nVEE++tuMy
	w8nI/EtjGUFKodsMgXeTdHHbB1r8A9agZXhW/NWNx6BHqBOypEwjyKsVq7/CXgjaDx0anM1
	+yVv86yc3iVzhjQ1PrMdwf4Uoda16b10aqOElAeGVVhk7leRnQfzKlcELfjVZTyQfA6J7O0
	5viOcIrFnGU3kW
X-QQ-SSF: 000000000000003000000000000000V
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 202.119.139.206
X-QQ-STYLE: 
X-QQ-mid: webmail47t1554360278t5400659
From: "=?gb18030?B?wO7P/sHY?=" <1228455161@qq.com>
To: "=?gb18030?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5CA5A7D6_0BD59528_44D96315"
Content-Transfer-Encoding: 8Bit
Date: Thu, 4 Apr 2019 14:44:38 +0800
X-Priority: 3
Message-ID: <tencent_746BD70E85909BE35FE60BF8B57FF2116607@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 04 Apr 2019 14:44:38 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 54.206.16.166
X-Mailman-Approved-At: Thu, 04 Apr 2019 08:56:31 -0400
Subject: [Qemu-riscv] How can I get the framebuffer's address of qemu-riscv
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
X-List-Received-Date: Thu, 04 Apr 2019 06:45:15 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CA5A7D6_0BD59528_44D96315
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RGVhciBNciBvciBNcnMsDQogICAgICAgIEknbSBydW5uaW5nIG15IGJhcmUtbWVudGFsIGV4
YW1wbGVzIG9uIHFlbXUtcmlzY3YuIEFuZCBJIHdhbnQgdG8gaW1wbGVtZW50IEFQSSB0byBk
cmF3IHZpZGVvIG9mIHFlbXUtcmlzY3YuIFNvIEkgaGF2ZSB0byBrbm93IHRoZSBhZGRyZXNz
IG9mIGZyYW1lYnVmZmVyLiBJIGhhdmUgc2VlbiBxZW11LWkzODYgYW5kIGZpbmQgdGhhdCB0
aGUgcG9pbnRlciB0byBmcmFtZWJ1ZmZlciBpcyBpbmNsdWRlZCBpbiBWRVNBIEJJT1MgRXh0
ZW5zaW9uLiBIb3dldmVyLCBpdCBpc24ndCBzdWl0YWJsZSBmb3IgcWVtdS1yaXNjdi4gU28g
aG93IGNhbiBJIGdldCB0aGUgZnJhbWVidWZmZXIncyBhZGRyZXNzIG9mIHFlbXUtcmlzY3Y/
IHdoaWNoIG1hbnVhbCBzaG91bGQgSSByZWFkPyBQbGVhc2UgaGVscCBtZS4NCiAgICAgICAg
QmVzdCBSZWdhcmRzLA0KICAgICAgICBUaHg=

------=_NextPart_5CA5A7D6_0BD59528_44D96315
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5EZWFyIE1yIG9yIE1ycyw8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyBJJ20gcnVubmluZyBteSBiYXJlLW1lbnRhbCBleGFtcGxlcyBvbiBxZW11LXJpc2N2
LiBBbmQgSSB3YW50IHRvIGltcGxlbWVudCBBUEkgdG8gZHJhdyB2aWRlbyBvZiBxZW11LXJp
c2N2LiBTbyBJIGhhdmUgdG8ga25vdyB0aGUgYWRkcmVzcyBvZiBmcmFtZWJ1ZmZlci4gSSBo
YXZlIHNlZW4gcWVtdS1pMzg2IGFuZCBmaW5kIHRoYXQgdGhlIHBvaW50ZXIgdG8gZnJhbWVi
dWZmZXIgaXMgaW5jbHVkZWQgaW4gVkVTQSBCSU9TIEV4dGVuc2lvbi4gSG93ZXZlciwgaXQg
aXNuJ3Qgc3VpdGFibGUgZm9yIHFlbXUtcmlzY3YuIFNvIGhvdyBjYW4gSSBnZXQgdGhlIGZy
YW1lYnVmZmVyJ3MgYWRkcmVzcyBvZiBxZW11LXJpc2N2PyB3aGljaCBtYW51YWwgc2hvdWxk
IEkgcmVhZD8gUGxlYXNlIGhlbHAgbWUuPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgQmVzdCBSZWdhcmRzLDwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7IFRoeDwvZGl2Pg==

------=_NextPart_5CA5A7D6_0BD59528_44D96315--




