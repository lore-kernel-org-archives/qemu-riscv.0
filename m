Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0525C77B75
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 09:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1ORF-0006uQ-FR; Tue, 23 May 2023 05:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1OR9-0006qd-AD; Tue, 23 May 2023 05:36:11 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1OR5-0007Us-Uw; Tue, 23 May 2023 05:36:11 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowABXXYn8iGxkwiCaAw--.15216S5;
 Tue, 23 May 2023 17:36:00 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 3/8] target/riscv: Pass RISCVCPUConfig as target_info to
 disassemble_info
Date: Tue, 23 May 2023 17:35:34 +0800
Message-Id: <20230523093539.203909-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXXYn8iGxkwiCaAw--.15216S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tryUAFy3ZFWUZr43Kw1rJFb_yoW8uF17pF
 Z5C347KFZ5AF97WayFkF42gF18JrWkKrsYyw4Iyr4xAr47ArW8ZFWktw12yF48AFWrAw17
 CF4rCFy5AF48JF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU=
 =
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Pass RISCVCPUConfig as disassemble_info.target_info to support disas
of conflict instructions related to specific extensions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 disas/riscv.c      | 10 +++++++---
 target/riscv/cpu.c |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index e61bda5674..729ab684da 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
-
+#include "target/riscv/cpu_cfg.h"
 
 /* types */
 
@@ -967,6 +967,7 @@ typedef enum {
 /* structures */
 
 typedef struct {
+    RISCVCPUConfig *cfg;
     uint64_t  pc;
     uint64_t  inst;
     int32_t   imm;
@@ -4855,11 +4856,13 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
 /* disassemble instruction */
 
 static void
-disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
+disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
+            RISCVCPUConfig *cfg)
 {
     rv_decode dec = { 0 };
     dec.pc = pc;
     dec.inst = inst;
+    dec.cfg = cfg;
     decode_inst_opcode(&dec, isa);
     decode_inst_operands(&dec, isa);
     decode_inst_decompress(&dec, isa);
@@ -4914,7 +4917,8 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
         break;
     }
 
-    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
+    disasm_inst(buf, sizeof(buf), isa, memaddr, inst,
+                (RISCVCPUConfig *)info->target_info);
     (*info->fprintf_func)(info->stream, "%s", buf);
 
     return len;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db0875fb43..4fe926cdd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -818,6 +818,7 @@ static void riscv_cpu_reset_hold(Object *obj)
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     RISCVCPU *cpu = RISCV_CPU(s);
+    info->target_info = &cpu->cfg;
 
     switch (riscv_cpu_mxl(&cpu->env)) {
     case MXL_RV32:
-- 
2.25.1


