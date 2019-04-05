Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hCHpP-00083f-0q
	for mharc-qemu-riscv@gnu.org; Fri, 05 Apr 2019 01:55:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <1228455161@qq.com>) id 1hCHpN-00080t-2o
	for qemu-riscv@nongnu.org; Fri, 05 Apr 2019 01:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <1228455161@qq.com>) id 1hCHp8-00016A-Pj
	for qemu-riscv@nongnu.org; Fri, 05 Apr 2019 01:55:36 -0400
Received: from smtpbgau1.qq.com ([54.206.16.166]:55678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <1228455161@qq.com>) id 1hCHp6-0000hI-Ff
	for qemu-riscv@nongnu.org; Fri, 05 Apr 2019 01:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1554443719; bh=ckVRE+nzRz7UJgzi3HF1+9HXbpDStDn3JNo86AB5QIE=;
	h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
	b=YamQxjAgEhgooLVAcwfd+dsHHteJSoXi9CiPRuy2fR9BRWcIPWtH0yVc6tLi1Kkux
	vIVrM5SnDxlehaJLTt/2cxMYH14cQjF2vrNOwmimwIAw+j9gUETjs2vQRt+uI6JE1c
	s47K7k6YBfcsNlPUENCW1KgO3Hf5rm5no+7BtSSU=
X-QQ-FEAT: 3jlOKZxptE58OFyLegYAwZgl9mu7dUCmUVG5t2etWncAB5VbBb0QUIw7j1L2a
	J29iuVG0Pl69BkCzy8w9kJ+SK8b7OWmHz9hodyvmNeH1NQaw0uoC1vwBdsldP8G58xsdoXx
	PfytreIAn8i6oUIWFW4/a8JUQ3vKgpjVXxIRY4+npynyCDyic6sHNht2AWu4z7aXgo21Yie
	lNy0i0GYlK9/8wn+0p0i/UbbWnmchZnrbEZrAKndTUx7T6lV9MoHB81tZy9tUVMjuk4Wjyt
	pKhWFf4pbIBG8S
X-QQ-SSF: 000000000000003000000000000000V
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 202.119.139.206
X-QQ-STYLE: 
X-QQ-mid: webmail47t1554443717t8432770
From: "=?gb18030?B?wO7P/sHY?=" <1228455161@qq.com>
To: "=?gb18030?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5CA6EDC5_0A372570_64F4C4B7"
Content-Transfer-Encoding: 8Bit
Date: Fri, 5 Apr 2019 13:55:17 +0800
X-Priority: 3
Message-ID: <tencent_9349EB818EA590ABE334E66178E37FBF9107@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Fri, 05 Apr 2019 13:55:18 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 54.206.16.166
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
X-List-Received-Date: Fri, 05 Apr 2019 05:55:50 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CA6EDC5_0A372570_64F4C4B7
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

------=_NextPart_5CA6EDC5_0A372570_64F4C4B7
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

------=_NextPart_5CA6EDC5_0A372570_64F4C4B7--




