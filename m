Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZRnU-0003XB-4C
	for mharc-qemu-riscv@gnu.org; Tue, 07 Mar 2023 02:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pZRn7-0003Uk-UD; Tue, 07 Mar 2023 02:31:22 -0500
Received: from forward501a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d501])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pZRn2-0000oQ-Qe; Tue, 07 Mar 2023 02:31:19 -0500
Received: from vla3-dd49e4181521.qloud-c.yandex.net
 (vla3-dd49e4181521.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:2588:0:640:dd49:e418])
 by forward501a.mail.yandex.net (Yandex) with ESMTP id 729A15EA58;
 Tue,  7 Mar 2023 10:31:09 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0f:1610:0:640:7294:0
 [2a02:6b8:c0f:1610:0:640:7294:0])
 by vla3-dd49e4181521.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 5VV3qq0Z48c1-2zKjfJME; Tue, 07 Mar 2023 10:31:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1678174269; bh=6JLO+EAfFclyKbiAvEESAMoKbO4SYqSA6G9b8ENUFNQ=;
 h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
 b=OtEqxd6nWwkrfxVUMDQzE9iypwqsb7+EJAxmIhiY9bo2CDifAmRkZLFIX8vjkBhlO
 Et9/gwBEkOgqfSZs6RqOORGHmUdMyczY+Pwbeq4+eulD04VQpXXb3Zk3gqY8c5yegB
 M7gxc8CTRBXmZsOpiKgu4yasytcJzemJUxlcIy0o=
Authentication-Results: vla3-dd49e4181521.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
Received: by an4sa4silbm64yo4.vla.yp-c.yandex.net with HTTP;
 Tue, 07 Mar 2023 10:31:07 +0300
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Alistair.Francis@wdc.com" <alistair.francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>
In-Reply-To: <20230227090228.17117-1-ivan.klokov@syntacore.com>
References: <20230227090228.17117-1-ivan.klokov@syntacore.com>
Subject: Re: [PATCH] Fix slli_uw decoding
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 07 Mar 2023 10:31:07 +0300
Message-Id: <66441678174194@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:d501;
 envelope-from=ivan.klokov@syntacore.com; helo=forward501a.mail.yandex.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2023 07:31:24 -0000

PGRpdj48ZGl2PkhlbGxvIGd1eXMuIEkgd291bGQgYmUgcmVhbGx5IGFwcHJlY2lhdGUgaWYgeW91
IGxvb2sgdGhpcyBwYXRjaC48L2Rpdj48ZGl2Pkl0IHdvdWxkIGJlIG5pY2UgdG8gbWVyZ2UgaXQg
dG8gbmV3IHJlbGVhc2UgOC4wPC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MjcuMDIuMjAy
MywgMTI6MDIsICJJdmFuIEtsb2tvdiIgJmx0O2l2YW4ua2xva292QHN5bnRhY29yZS5jb20mZ3Q7
OjwvZGl2PjxibG9ja3F1b3RlPjxwPlRoZSBkZWNvZGluZyBvZiB0aGUgc2xsaV91dyBjdXJyZW50
bHkgY29udGFpbnMgZGVjb2Rpbmc8YnIgLz5lcnJvcjogc2hhbXQgcGFydCBvZiBvcGNvZGUgaGFz
IHNpeCBiaXRzLCBub3QgZml2ZS48YnIgLz48YnIgLz5GaXhlcyAzZGUxZmI3MSgidGFyZ2V0L3Jp
c2N2OiB1cGRhdGUgZGlzYXMuYyBmb3IgeG5vci9vcm4vYW5kbiBhbmQgc2xsaS51dyIpPGJyIC8+
PGJyIC8+U2lnbmVkLW9mZi1ieTogSXZhbiBLbG9rb3YgJmx0OzxhIGhyZWY9Im1haWx0bzppdmFu
Lmtsb2tvdkBzeW50YWNvcmUuY29tIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPml2YW4ua2xv
a292QHN5bnRhY29yZS5jb208L2E+Jmd0OzxiciAvPi0tLTxiciAvPsKgZGlzYXMvcmlzY3YuYyB8
IDggKysrKy0tLS08YnIgLz7CoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pPGJyIC8+PGJyIC8+ZGlmZiAtLWdpdCBhL2Rpc2FzL3Jpc2N2LmMgYi9kaXNhcy9y
aXNjdi5jPGJyIC8+aW5kZXggZGRkYTY4N2MxMy4uMDNjZmVmYjBkMyAxMDA2NDQ8YnIgLz4tLS0g
YS9kaXNhcy9yaXNjdi5jPGJyIC8+KysrIGIvZGlzYXMvcmlzY3YuYzxiciAvPkBAIC0xNjQ3LDcg
KzE2NDcsNyBAQCBjb25zdCBydl9vcGNvZGVfZGF0YSBvcGNvZGVfZGF0YVtdID0gezwhLS0gLS0+
PGJyIC8+wqDCoMKgwqDCoHsgImNsenciLCBydl9jb2RlY19yLCBydl9mbXRfcmRfcnMxLCBOVUxM
LCAwLCAwLCAwIH0sPGJyIC8+wqDCoMKgwqDCoHsgImNsenciLCBydl9jb2RlY19yLCBydl9mbXRf
cmRfcnMxLCBOVUxMLCAwLCAwLCAwIH0sPGJyIC8+wqDCoMKgwqDCoHsgImNwb3B3IiwgcnZfY29k
ZWNfciwgcnZfZm10X3JkX3JzMSwgTlVMTCwgMCwgMCwgMCB9LDxiciAvPi0geyAic2xsaS51dyIs
IHJ2X2NvZGVjX2lfc2g1LCBydl9mbXRfcmRfcnMxX2ltbSwgTlVMTCwgMCwgMCwgMCB9LDxiciAv
PisgeyAic2xsaS51dyIsIHJ2X2NvZGVjX2lfc2g2LCBydl9mbXRfcmRfcnMxX2ltbSwgTlVMTCwg
MCwgMCwgMCB9LDxiciAvPsKgwqDCoMKgwqB7ICJhZGQudXciLCBydl9jb2RlY19yLCBydl9mbXRf
cmRfcnMxX3JzMiwgTlVMTCwgMCwgMCwgMCB9LDxiciAvPsKgwqDCoMKgwqB7ICJyb2x3IiwgcnZf
Y29kZWNfciwgcnZfZm10X3JkX3JzMV9yczIsIE5VTEwsIDAsIDAsIDAgfSw8YnIgLz7CoMKgwqDC
oMKgeyAicm9ydyIsIHJ2X2NvZGVjX3IsIHJ2X2ZtdF9yZF9yczFfcnMyLCBOVUxMLCAwLCAwLCAw
IH0sPGJyIC8+QEAgLTI2MTcsMTAgKzI2MTcsMTAgQEAgc3RhdGljIHZvaWQgZGVjb2RlX2luc3Rf
b3Bjb2RlKHJ2X2RlY29kZSAqZGVjLCBydl9pc2EgaXNhKTxiciAvPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc3dpdGNoICgoKGluc3QgJmd0OyZndDsgMTIpICZhbXA7IDBiMTExKSkgezwhLS0g
LS0+PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlIDA6IG9wID0gcnZfb3BfYWRk
aXc7IGJyZWFrOzxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSAxOjxiciAvPi0g
c3dpdGNoICgoKGluc3QgJmd0OyZndDsgMjUpICZhbXA7IDBiMTExMTExMSkpIHs8IS0tIC0tPjxi
ciAvPisgc3dpdGNoICgoKGluc3QgJmd0OyZndDsgMjYpICZhbXA7IDBiMTExMTExKSkgezwhLS0g
LS0+PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2UgMDogb3AgPSBy
dl9vcF9zbGxpdzsgYnJlYWs7PGJyIC8+LSBjYXNlIDQ6IG9wID0gcnZfb3Bfc2xsaV91dzsgYnJl
YWs7PGJyIC8+LSBjYXNlIDQ4OjxiciAvPisgY2FzZSAyOiBvcCA9IHJ2X29wX3NsbGlfdXc7IGJy
ZWFrOzxiciAvPisgY2FzZSAyNDo8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzd2l0Y2ggKChpbnN0ICZndDsmZ3Q7IDIwKSAmYW1wOyAwYjExMTExKSB7PCEt
LSAtLT48YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNl
IDBiMDAwMDA6IG9wID0gcnZfb3BfY2x6dzsgYnJlYWs7PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSAwYjAwMDAxOiBvcCA9IHJ2X29wX2N0enc7IGJy
ZWFrOzwvcD4tLTxiciAvPjIuMzQuMTxiciAvPsKgPC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48
ZGl2PsKgPC9kaXY+PGRpdj4tLcKgPC9kaXY+PGRpdj5LaW5kIHJlZ2FyZHMsPC9kaXY+PGRpdj5J
dmFuIEtsb2tvdjwvZGl2PjxkaXY+wqA8L2Rpdj4=

