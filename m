Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXyZI-0007A2-RA
	for mharc-qemu-riscv@gnu.org; Sat, 26 Mar 2022 01:02:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nXyZF-00079X-LJ; Sat, 26 Mar 2022 01:02:26 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:63827
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nXyZC-0000JC-9U; Sat, 26 Mar 2022 01:02:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 9E75730008A;
 Sat, 26 Mar 2022 05:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648270937;
 bh=cFQEic/N1H4WxnSZm3Wn2VCmqbwPtRax8EoUX4EoV+0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=YSX49dB3H49vQ/WVCMrOXHmNlEniAT0iISxbXL3Z6GxWHJYYMZstO1UXT4Jy63p6s
 Su6gtS5LBQVVEbdu1LGc9osvOExTeBOrI7UfkM7USxkKiGlO0cVEmASAX2nEPxhcDI
 Rnbyc6id6Pa6ARWGDWO5jyvtrBxW0MIgcprNdhT0=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH (PING) 1/1] target/riscv: misa to ISA string conversion fix
Date: Sat, 26 Mar 2022 14:01:45 +0900
Message-Id: <dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1648270894.git.research_trasio@irq.a4lg.com>
References: <cover.1648270894.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 26 Mar 2022 05:02:27 -0000

Some bits in RISC-V `misa' CSR should not be reflected in the ISA
string.  For instance, `S' and `U' (represents existence of supervisor
and user mode, respectively) in `misa' CSR must not be copied since
neither `S' nor `U' are valid single-letter extensions.

This commit restricts which bits to copy from `misa' CSR to ISA string
with another fix: `C' extension should be preceded by `L' extension.

It also clarifies that RISC-V extension order string is actually a
single-letter extension order list.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..84877cf24a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,7 +34,7 @@
 
 /* RISC-V CPU definitions */
 
-static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
+static const char riscv_single_letter_exts[] = "IEMAFDQLCBJTPVNH";
 
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
@@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 char *riscv_isa_string(RISCVCPU *cpu)
 {
     int i;
-    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
+    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
     char *isa_str = g_new(char, maxlen);
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
-    for (i = 0; i < sizeof(riscv_exts); i++) {
-        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
-            *p++ = qemu_tolower(riscv_exts[i]);
+    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
+        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
+            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
         }
     }
     *p = '\0';
-- 
2.32.0


