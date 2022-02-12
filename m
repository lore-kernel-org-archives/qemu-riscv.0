Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nIr3n-0005Xa-J1
	for mharc-qemu-riscv@gnu.org; Sat, 12 Feb 2022 06:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nIr3m-0005Vl-5k
 for qemu-riscv@nongnu.org; Sat, 12 Feb 2022 06:59:26 -0500
Received: from mail-sender.a4lg.com ([153.120.152.154]:57939
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nIr3k-0006WA-80
 for qemu-riscv@nongnu.org; Sat, 12 Feb 2022 06:59:25 -0500
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: qemu-riscv@nongnu.org
Subject: [RESEND PATCH 1/1] target/riscv: misa to ISA string conversion fix
Date: Sat, 12 Feb 2022 20:59:10 +0900
Message-Id: <66cd3545068a8ab9d67bd4bd1f9a68a2c50cbdab.1644667142.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1644667142.git.research_trasio@irq.a4lg.com>
References: <cover.1644667142.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TO_EQ_FM_DIRECT_MX=0.001,
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
X-List-Received-Date: Sat, 12 Feb 2022 11:59:26 -0000

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
index 1cb0436187..7a8d6ce104 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,7 +34,7 @@
 
 /* RISC-V CPU definitions */
 
-static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
+static const char riscv_single_letter_exts[] = "IEMAFDQLCBJTPVNH";
 
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
@@ -831,12 +831,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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


