Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxO-0003eV-Lv
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxL-0003HK-8c
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhg9-0006CH-RZ
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:27 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:46122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhg7-0005rX-RS
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:25 -0400
Received: by mail-pg1-f178.google.com with SMTP id v9so690085pgr.13
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=wFaos8LfgCUNeyF5mCTB+VZebrOrlkwKLg03H+AhURg=;
	b=Y8IBdj8HuWJTfLFGCDQ3DYh1bdX49baQrXvtqAy7eS6/0/eIL7pG3Am/GwZfUUWaxT
	sAC/DrlkrEmu4OZ7IZRXFoR1HmDkUluqknXTVZxtjNTwjlNWMqKO6aw6iAwS+RcfRFq1
	F+zVTMzxaX/68VqRVbaERwOte5J0duYp68FTyT87apc91dRZNja9eQfjCcaolCCmM75F
	eQ7TBJC6Y0kq8REN4LD6yBYi905w+Za+ZFmHJN7ge8SS8pRtLKo3mT7TyienyZiMC21q
	jYbAcn0zyBiA7g2qrAGh8cbvtiH2TLdMub33TIULOo2AkGYmAHthnk/QXu4KI46KraA7
	x7Yg==
X-Gm-Message-State: APjAAAUAUva92bX8UtIsgjQRXhJTSYcVPHY62LAYxCUzAZ2wrn1PmSlu
	2MaV0KA8BIjOporrC9ThMqf6L/BVX9M=
X-Google-Smtp-Source: APXvYqwktkR2TST2Q+9uDr24BRvVLcGngfY7/UDg7gkqELQ7uOJA5Kk3ATa85CFbsVyrwz9AH1/vcw==
X-Received: by 2002:a63:2c4a:: with SMTP id s71mr99074975pgs.343.1558833016754;
	Sat, 25 May 2019 18:10:16 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id x7sm6918429pfm.82.2019.05.25.18.10.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:15 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:30 -0700
Message-Id: <20190526010948.3923-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.178
Subject: [Qemu-riscv] [PULL 11/29] target/riscv: Remove spaces from register
 names
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
X-List-Received-Date: Sun, 26 May 2019 01:28:12 -0000

From: Richard Henderson <richard.henderson@linaro.org>

These extra spaces make the "-d op" dump look weird.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b7675707e0fe..6a58bc9e9d90 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -30,17 +30,17 @@
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
2.21.0


