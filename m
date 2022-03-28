Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYp9x-0003NW-Uw
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 09:11:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp9o-0003DV-MN; Mon, 28 Mar 2022 09:11:40 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:63828
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp9m-0004V5-Q5; Mon, 28 Mar 2022 09:11:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 61401300089;
 Mon, 28 Mar 2022 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648473096;
 bh=kcy6GEq7QNynODPz1ApvBd8m9NHfvR1NF/yo9QPK0d4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=JjN9NH4NJicGT4S8PAjd0ff8+vHH9rbdkuL7+NfJHpusN/6eG3JVucbEgtL7Rk7pD
 TQqZqa2jNY2pP8NmfFK1LSl7gtp/e/HLr2pBMAVWvgTMVYDpbSBaqzEL/AHhx1MKnB
 MC9NI7LLjh7gK//1dBTRAJ7T6QHQ2efSRo0nvfbU=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 1/1] target/riscv: misa to ISA string conversion fix
Date: Mon, 28 Mar 2022 22:11:23 +0900
Message-Id: <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1648473008.git.research_trasio@irq.a4lg.com>
References: <cover.1648473008.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Mon, 28 Mar 2022 13:11:43 -0000

Some bits in RISC-V `misa' CSR should not be reflected in the ISA
string.  For instance, `S' and `U' (represents existence of supervisor
and user mode, respectively) in `misa' CSR must not be copied since
neither `S' nor `U' are valid single-letter extensions.

This commit also removes all reserved/dropped single-letter "extensions"
from the list.

-   "B": Not going to be a single-letter extension (misa.B is reserved).
-   "J": Not going to be a single-letter extension (misa.J is reserved).
-   "K": Not going to be a single-letter extension (misa.K is reserved).
-   "L": Dropped.
-   "N": Dropped.
-   "T": Dropped.

It also clarifies that the variable `riscv_single_letter_exts' is a
single-letter extension order list.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..1f68c696eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,7 +34,7 @@
 
 /* RISC-V CPU definitions */
 
-static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
+static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
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


