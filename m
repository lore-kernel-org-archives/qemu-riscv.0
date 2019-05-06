Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNfaz-0005Zh-GP
	for mharc-qemu-riscv@gnu.org; Mon, 06 May 2019 11:32:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hNfau-0005YN-MB
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 11:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hNfat-0003tj-Og
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 11:31:56 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38630)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hNfar-0003rR-EM; Mon, 06 May 2019 11:31:53 -0400
Received: by mail-lf1-x136.google.com with SMTP id y19so1904492lfy.5;
	Mon, 06 May 2019 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=FB9+SCfnB8QzagMDoXtuby435WXka8anbsg63mzE4aQ=;
	b=a5+jKVt8PEK+67H9Y6nu82VEJPzGr6IsMgm+VFHbU6hMUn2kK0Nrwc42ruKlFAoFFK
	BZlXNjCwSNUAgrGVdUSXnI/2Ej1/0CeqNKn2RJ0uSkJuQrffQYaIRAUtlmb601/QEuHe
	rCQPxC7ULvwx7JZ4zatKEFzmAGImPpYtHYnZxGtOA8o/D1MKgI5rlIese+P4nWSDW74o
	+j29kAkIKZGnl6xysEV4/HJ6qqF5vW+Sx2u6tvWWbE7oeLGW5nwkCl0Ebh8PatdmYC5P
	oyCjneAW92DHRC6mS4SNopjuE8HTEKAEKgMAFpK3vwekyiANBXtDjts7b5aAmchgd3ek
	ZpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=FB9+SCfnB8QzagMDoXtuby435WXka8anbsg63mzE4aQ=;
	b=VP869Nd7Zvfy82Z0X0TlM16iYqwxM8+SSsuFLlTLdAxOjfUXwGfk4a3SZCA/JWQDH2
	kPmwlIAnnSxCGpwwEZOYgeGVFvzgTERymXflS0intovkONhjsUAN3zBo8E297vGabjyZ
	yQJtKXOgma9sRebYJOOYbDkwUC752GecaXw/XMvdl1muchYQF6X7wVh5RxX2KyjQN9lR
	yfsyTXtiXypvh406AK2bzJyr7H43/FNRoSao5y2tP8d1E9uUxpQOPQGp1xX3hAvLQepn
	VqGvDC35wZEo4qcMldKfFDmLB0znk65nxCcjpfL+aM5PyLQUdKlA/SokdArk2yzXyHgs
	jzrA==
X-Gm-Message-State: APjAAAXCzZcCgaFRbsIIzBX9JrsyEuWjujqG7QOWGFviL2+Txh8KAdcZ
	6GvjyHXZ3amiVRpMmbtH3gvlCbJU4H7iuYpiXoM56Nz6lAk=
X-Google-Smtp-Source: APXvYqyYxT56gtddLmGYJfCpC9JolzfCBLbgyKTnf++k2WeNoCajOUNiBTpY3Xg7+IjjusSo7ricWfmRQTSdy6ow7FE=
X-Received: by 2002:ac2:4571:: with SMTP id k17mr4272321lfm.133.1557156710847; 
	Mon, 06 May 2019 08:31:50 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 6 May 2019 11:31:24 -0400
Message-ID: <CANnJOVFj9yhbjPY=_+LNDWwO=Q8jLFnH01AbTY8T0p=cmkrNiw@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="0000000000009c17d4058839ccc9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::136
Subject: [Qemu-riscv] [PATCH for 4.1] target/riscv: Only flush TLB if
 SATP.ASID changes
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
X-List-Received-Date: Mon, 06 May 2019 15:31:59 -0000

--0000000000009c17d4058839ccc9
Content-Type: text/plain; charset="UTF-8"

There is an analogous change for ARM here:
https://patchwork.kernel.org/patch/10649857
---
 target/riscv/csr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6083c782a1..1ec1222da1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno,
target_ulong val)
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return -1;
         } else {
-            tlb_flush(CPU(riscv_env_get_cpu(env)));
+            if((val ^ env->satp) & SATP_ASID) {
+                tlb_flush(CPU(riscv_env_get_cpu(env)));
+            }
             env->satp = val;
         }
     }
-- 
2.20.1

--0000000000009c17d4058839ccc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhlcmUgaXMgYW4gYW5hbG9nb3VzIGNoYW5n
ZSBmb3IgQVJNIGhlcmU6PGJyPjxhIGhyZWY9Imh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTA2NDk4NTciPmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2NDk4
NTc8L2E+PGJyPi0tLTxicj7CoHRhcmdldC9yaXNjdi9jc3IuYyB8IDQgKysrLTxicj7CoDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSk8YnI+PGJyPmRpZmYgLS1n
aXQgYS90YXJnZXQvcmlzY3YvY3NyLmMgYi90YXJnZXQvcmlzY3YvY3NyLmM8YnI+aW5kZXggNjA4
M2M3ODJhMS4uMWVjMTIyMmRhMSAxMDA2NDQ8YnI+LS0tIGEvdGFyZ2V0L3Jpc2N2L2Nzci5jPGJy
PisrKyBiL3RhcmdldC9yaXNjdi9jc3IuYzxicj5AQCAtNzMyLDcgKzczMiw5IEBAIHN0YXRpYyBp
bnQgd3JpdGVfc2F0cChDUFVSSVNDVlN0YXRlICplbnYsIGludCBjc3JubywgdGFyZ2V0X3Vsb25n
IHZhbCk8YnI+wqDCoMKgwqDCoMKgwqDCoCBpZiAoZW52LSZndDtwcml2ID09IFBSVl9TICZhbXA7
JmFtcDsgZ2V0X2ZpZWxkKGVudi0mZ3Q7bXN0YXR1cywgTVNUQVRVU19UVk0pKSB7PGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTE7PGJyPsKgwqDCoMKgwqDCoMKgwqAgfSBlbHNl
IHs8YnI+LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGxiX2ZsdXNoKENQVShyaXNjdl9lbnZfZ2V0
X2NwdShlbnYpKSk7PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmKCh2YWwgXiBlbnYtJmd0
O3NhdHApICZhbXA7IFNBVFBfQVNJRCkgezxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRsYl9mbHVzaChDUFUocmlzY3ZfZW52X2dldF9jcHUoZW52KSkpOzxicj4rwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnYtJmd0O3NhdHAg
PSB2YWw7PGJyPsKgwqDCoMKgwqDCoMKgwqAgfTxicj7CoMKgwqDCoCB9PGJyPi0tIDxicj4yLjIw
LjE8YnI+PGJyPjwvZGl2PjwvZGl2Pg0K
--0000000000009c17d4058839ccc9--

