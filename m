Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACC5C77B73
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 May 2023 02:24:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzpmp-0004Sx-BC; Thu, 18 May 2023 22:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzpml-0004Rl-Hz; Thu, 18 May 2023 22:24:05 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzpmh-0002AB-ND; Thu, 18 May 2023 22:24:03 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACHjw+x3WZkAeNjAQ--.12622S4;
 Fri, 19 May 2023 10:23:47 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/7] target/riscv: Pass RISCVCPUConfig as target_info to
 disassemble_info
Date: Fri, 19 May 2023 10:19:21 +0800
Message-Id: <20230519021926.15362-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHjw+x3WZkAeNjAQ--.12622S4
X-Coremail-Antispam: 1UD129KBjvJXoW3ArWUGw1DZF47Cr45Jr15CFg_yoW3Kr4Upr
 W5Ga43CrsxXr1xurn7Jw1jqr1rCws3Ga18t3W2yr1kJrWIqrWYqa1kA3WUZF4UJF18GF15
 Kr1jyFyUJry8AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
 CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
 I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
 8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
 UjIFyTuYvjfU8-eoUUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
---
 disas/riscv.c          |  10 ++-
 target/riscv/cpu.c     |   1 +
 target/riscv/cpu.h     | 114 +---------------------------------
 target/riscv/cpu_cfg.h | 135 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+), 116 deletions(-)
 create mode 100644 target/riscv/cpu_cfg.h

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
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..dc1229b69c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "cpu_cfg.h"
 #include "qapi/qapi-types-common.h"
 #include "cpu-qom.h"
 
@@ -368,119 +369,6 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-/*
- * map is a 16-bit bitmap: the most significant set bit in map is the maximum
- * satp mode that is supported. It may be chosen by the user and must respect
- * what qemu implements (valid_1_10_32/64) and what the hw is capable of
- * (supported bitmap below).
- *
- * init is a 16-bit bitmap used to make sure the user selected a correct
- * configuration as per the specification.
- *
- * supported is a 16-bit bitmap used to reflect the hw capabilities.
- */
-typedef struct {
-    uint16_t map, init, supported;
-} RISCVSATPMap;
-
-struct RISCVCPUConfig {
-    bool ext_zba;
-    bool ext_zbb;
-    bool ext_zbc;
-    bool ext_zbkb;
-    bool ext_zbkc;
-    bool ext_zbkx;
-    bool ext_zbs;
-    bool ext_zca;
-    bool ext_zcb;
-    bool ext_zcd;
-    bool ext_zce;
-    bool ext_zcf;
-    bool ext_zcmp;
-    bool ext_zcmt;
-    bool ext_zk;
-    bool ext_zkn;
-    bool ext_zknd;
-    bool ext_zkne;
-    bool ext_zknh;
-    bool ext_zkr;
-    bool ext_zks;
-    bool ext_zksed;
-    bool ext_zksh;
-    bool ext_zkt;
-    bool ext_ifencei;
-    bool ext_icsr;
-    bool ext_icbom;
-    bool ext_icboz;
-    bool ext_zicond;
-    bool ext_zihintpause;
-    bool ext_smstateen;
-    bool ext_sstc;
-    bool ext_svadu;
-    bool ext_svinval;
-    bool ext_svnapot;
-    bool ext_svpbmt;
-    bool ext_zdinx;
-    bool ext_zawrs;
-    bool ext_zfh;
-    bool ext_zfhmin;
-    bool ext_zfinx;
-    bool ext_zhinx;
-    bool ext_zhinxmin;
-    bool ext_zve32f;
-    bool ext_zve64f;
-    bool ext_zve64d;
-    bool ext_zmmul;
-    bool ext_zvfh;
-    bool ext_zvfhmin;
-    bool ext_smaia;
-    bool ext_ssaia;
-    bool ext_sscofpmf;
-    bool rvv_ta_all_1s;
-    bool rvv_ma_all_1s;
-
-    uint32_t mvendorid;
-    uint64_t marchid;
-    uint64_t mimpid;
-
-    /* Vendor-specific custom extensions */
-    bool ext_xtheadba;
-    bool ext_xtheadbb;
-    bool ext_xtheadbs;
-    bool ext_xtheadcmo;
-    bool ext_xtheadcondmov;
-    bool ext_xtheadfmemidx;
-    bool ext_xtheadfmv;
-    bool ext_xtheadmac;
-    bool ext_xtheadmemidx;
-    bool ext_xtheadmempair;
-    bool ext_xtheadsync;
-    bool ext_XVentanaCondOps;
-
-    uint8_t pmu_num;
-    char *priv_spec;
-    char *user_spec;
-    char *bext_spec;
-    char *vext_spec;
-    uint16_t vlen;
-    uint16_t elen;
-    uint16_t cbom_blocksize;
-    uint16_t cboz_blocksize;
-    bool mmu;
-    bool pmp;
-    bool epmp;
-    bool debug;
-    bool misa_w;
-
-    bool short_isa_string;
-
-#ifndef CONFIG_USER_ONLY
-    RISCVSATPMap satp_mode;
-#endif
-};
-
-typedef struct RISCVCPUConfig RISCVCPUConfig;
-
 /*
  * RISCVCPU:
  * @env: #CPURISCVState
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
new file mode 100644
index 0000000000..e2e982fac4
--- /dev/null
+++ b/target/riscv/cpu_cfg.h
@@ -0,0 +1,135 @@
+/*
+ * QEMU RISC-V CPU CFG
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_CPU_CFG_H
+#define RISCV_CPU_CFG_H
+
+/*
+ * map is a 16-bit bitmap: the most significant set bit in map is the maximum
+ * satp mode that is supported. It may be chosen by the user and must respect
+ * what qemu implements (valid_1_10_32/64) and what the hw is capable of
+ * (supported bitmap below).
+ *
+ * init is a 16-bit bitmap used to make sure the user selected a correct
+ * configuration as per the specification.
+ *
+ * supported is a 16-bit bitmap used to reflect the hw capabilities.
+ */
+typedef struct {
+    uint16_t map, init, supported;
+} RISCVSATPMap;
+
+struct RISCVCPUConfig {
+    bool ext_zba;
+    bool ext_zbb;
+    bool ext_zbc;
+    bool ext_zbkb;
+    bool ext_zbkc;
+    bool ext_zbkx;
+    bool ext_zbs;
+    bool ext_zca;
+    bool ext_zcb;
+    bool ext_zcd;
+    bool ext_zce;
+    bool ext_zcf;
+    bool ext_zcmp;
+    bool ext_zcmt;
+    bool ext_zk;
+    bool ext_zkn;
+    bool ext_zknd;
+    bool ext_zkne;
+    bool ext_zknh;
+    bool ext_zkr;
+    bool ext_zks;
+    bool ext_zksed;
+    bool ext_zksh;
+    bool ext_zkt;
+    bool ext_ifencei;
+    bool ext_icsr;
+    bool ext_icbom;
+    bool ext_icboz;
+    bool ext_zicond;
+    bool ext_zihintpause;
+    bool ext_smstateen;
+    bool ext_sstc;
+    bool ext_svadu;
+    bool ext_svinval;
+    bool ext_svnapot;
+    bool ext_svpbmt;
+    bool ext_zdinx;
+    bool ext_zawrs;
+    bool ext_zfh;
+    bool ext_zfhmin;
+    bool ext_zfinx;
+    bool ext_zhinx;
+    bool ext_zhinxmin;
+    bool ext_zve32f;
+    bool ext_zve64f;
+    bool ext_zve64d;
+    bool ext_zmmul;
+    bool ext_zvfh;
+    bool ext_zvfhmin;
+    bool ext_smaia;
+    bool ext_ssaia;
+    bool ext_sscofpmf;
+    bool rvv_ta_all_1s;
+    bool rvv_ma_all_1s;
+
+    uint32_t mvendorid;
+    uint64_t marchid;
+    uint64_t mimpid;
+
+    /* Vendor-specific custom extensions */
+    bool ext_xtheadba;
+    bool ext_xtheadbb;
+    bool ext_xtheadbs;
+    bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
+    bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
+    bool ext_xtheadmempair;
+    bool ext_xtheadsync;
+    bool ext_XVentanaCondOps;
+
+    uint8_t pmu_num;
+    char *priv_spec;
+    char *user_spec;
+    char *bext_spec;
+    char *vext_spec;
+    uint16_t vlen;
+    uint16_t elen;
+    uint16_t cbom_blocksize;
+    uint16_t cboz_blocksize;
+    bool mmu;
+    bool pmp;
+    bool epmp;
+    bool debug;
+    bool misa_w;
+
+    bool short_isa_string;
+
+#ifndef CONFIG_USER_ONLY
+    RISCVSATPMap satp_mode;
+#endif
+};
+
+typedef struct RISCVCPUConfig RISCVCPUConfig;
+#endif
-- 
2.25.1


