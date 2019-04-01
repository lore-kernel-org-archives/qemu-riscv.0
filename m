Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnNE-00072g-PB
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnNC-00070L-1b
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnNB-0002xn-3x
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnNA-0002xe-Sb
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b3so3808479pfd.1
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FhiOeyfHkHtfNyh860mOu1MjVRG+GSdZNydGKNnZxaM=;
	b=u2ddnX2Jbcuy0y20WdQPkIYQhxH8vNAsfGSQChoFrIigA5Z2tihdJK9K8A6WyqScfY
	D3G25HzJxNY49I+wldtkXoha1lHYSOovrNcN81Hq3aZn+IfATHSyxT0WXqHI6YEFDIb1
	CU/SwQwtDHtkwLGDyk2kcP2xU2vpuCpCWlW4UdV+KTI0ND30AJZHkBzwZtZSznLBCJY7
	TgerYK22w0Lhl+2R0TwfiU79hxqQMgFpChMb6ah0QF+Ned5CG3yT7/2l3+dIdIw8jT6g
	nF85gVYal1bzN5vRaGMyG+lu62rhLL+Q1Qc7W5w7fzY0Qh/uiSJ7nJBpiIfQPj05GaZu
	5iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FhiOeyfHkHtfNyh860mOu1MjVRG+GSdZNydGKNnZxaM=;
	b=XgsROw7Milo6ZZywFHOawXmxoz/eEhJ+aKePwGCX3j+2pCwm4xBTDSSGK2dqqqVCmL
	BfOB9eSjDENWwGsDVUXKjjCZbSR/ARzMwK4DdZl0l8B2l5d62n30hEAbeB4D2z5Jujz5
	RGH0m/Kx1Iqao7EJvsN2lfHC/bO2gsG6M8TDx0HH/NeobO0fiIWw/NFuPc8McHkgGVtC
	ytI7hx8psR8L5X7bf7vBJp4aQI4eyQ4bWLGGRwe0utfIg+7cv5z4e0L35CdlXMHUADzC
	I4956PjVP4g34yZLfjWh2mRVL/+6ulJrpzlTb++JW9TXE3Z2K0MCN+8H5AbPJKh51Pmq
	slYw==
X-Gm-Message-State: APjAAAU3N7uLVMCCIkfBSTy+D5e9nQuxbKz1M4LvKU0yjlsePJvzOkNe
	CJGRozlTrjO5sURaCa6I5SUJuF5g+yDQkg==
X-Google-Smtp-Source: APXvYqy/ET0VQKtjZjwftb2RI0SmTVMuTu1rKFB2dUFEExvHlKmCTYZALYdxyBqRQLEfWwF/Jx3Tlw==
X-Received: by 2002:a62:bd09:: with SMTP id a9mr59551934pff.61.1554088352023; 
	Sun, 31 Mar 2019 20:12:32 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:55 +0700
Message-Id: <20190401031155.21293-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-riscv] [PATCH for-4.1 8/8] target/riscv: Remove spaces from
 register names
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
X-List-Received-Date: Mon, 01 Apr 2019 03:12:35 -0000

These extra spaces make the "-d op" dump look weird.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d61bce6d55..624528efb5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -29,17 +29,17 @@
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
-  "zero", "ra  ", "sp  ", "gp  ", "tp  ", "t0  ", "t1  ", "t2  ",
-  "s0  ", "s1  ", "a0  ", "a1  ", "a2  ", "a3  ", "a4  ", "a5  ",
-  "a6  ", "a7  ", "s2  ", "s3  ", "s4  ", "s5  ", "s6  ", "s7  ",
-  "s8  ", "s9  ", "s10 ", "s11 ", "t3  ", "t4  ", "t5  ", "t6  "
+  "zero", "ra", "sp",  "gp",  "tp", "t0", "t1", "t2",
+  "s0",   "s1", "a0",  "a1",  "a2", "a3", "a4", "a5",
+  "a6",   "a7", "s2",  "s3",  "s4", "s5", "s6", "s7",
+  "s8",   "s9", "s10", "s11", "t3", "t4", "t5", "t6"
 };
 
 const char * const riscv_fpr_regnames[] = {
-  "ft0 ", "ft1 ", "ft2 ", "ft3 ", "ft4 ", "ft5 ", "ft6 ",  "ft7 ",
-  "fs0 ", "fs1 ", "fa0 ", "fa1 ", "fa2 ", "fa3 ", "fa4 ",  "fa5 ",
-  "fa6 ", "fa7 ", "fs2 ", "fs3 ", "fs4 ", "fs5 ", "fs6 ",  "fs7 ",
-  "fs8 ", "fs9 ", "fs10", "fs11", "ft8 ", "ft9 ", "ft10",  "ft11"
+  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
+  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
+  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
+  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
 };
 
 const char * const riscv_excp_names[] = {
-- 
2.17.1


