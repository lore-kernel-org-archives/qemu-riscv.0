Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVY5P-0003mI-I1
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 08:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY5I-0003k8-2G
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 08:26:01 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY5D-0005Ua-9w
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 08:25:57 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1722c48a773so16398196fac.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 05:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CL4GPYzKFLWZQ/FFxXY4BBdu3KOs7b8oA1qVwK+TM10=;
 b=bTx98EA587Cg7D8/7U/8ylJxrSio80qkvCluIneRuywa74dz93UIsS/yV95nTriGNd
 iyWYNtOwRQGtJjv45OSdPRWgNXfpPJuMngxNlGhlpAwf/iQ9xtckq/tbrGT2NyJAIKxD
 nnXjP97u38TdhkupmuQssdUETDNwqBYfT0qpwPOuX/2fCiCjmHlADL5b8WWpPb3DehH0
 cVUFFFoAXE5LwtIyDqA9/o+POorj4LRGOtjfPGbGYq5Zv0kKtsSIIs0mEPTOfUs0RlQU
 MJIzsvho0pKNCkCLxCBOEi/TSAqeIh0CJ2WjClM6w6jmjcdp3F+AoWNNAubtS/603YNR
 6I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CL4GPYzKFLWZQ/FFxXY4BBdu3KOs7b8oA1qVwK+TM10=;
 b=OyOaFfcowVbm+tWpqphkUb1sh98GVshHzAJUmuIYaa/8vs3AMG4he2Ls9B2NOxpRTU
 pHaEDbHq/0RteJPgl8GP9o3cZ6BERQtAynxCk5ZP5g2mZ6t3YP9t2Zid0raz1U5KhmWS
 oDFY/OIWX8f7mgkGt2l5ym1BeAf9ve8Q0BLatx/quvkfzpf4k9VW1wajVfuwZOm+Hz0e
 L2i+k/P+NMdE9vcqG5ADjVxUUaOJcGm7G2kKWRjZEvoyMiQ6Awl3saeMP5wQ4psjoLmc
 vnc3BfYMQUmX8rJHSpXrzsYku484bZaXOfivECpQPPXjIjSINGx/K8YFw+UUaTuhRqIF
 NcqQ==
X-Gm-Message-State: AO0yUKUUPTQTYafjwW0ilKzj/x03uF7rIgbyjTdCzRnKcuxplA8f+xt5
 Oa5OQWchvwu0kCtqTiz2kNEpCA==
X-Google-Smtp-Source: AK7set+Ha5UFcVcpYJ7cGOFpqJx6DI6Wmla321zYCNlIyNS3vhDkNgPjh90ALrKBLWxi2Ctixid/2Q==
X-Received: by 2002:a05:6870:4713:b0:172:2c74:b99d with SMTP id
 b19-20020a056870471300b001722c74b99dmr7488543oaq.50.1677245153650; 
 Fri, 24 Feb 2023 05:25:53 -0800 (PST)
Received: from grind.. ([2804:18:18bc:fbbd:3c90:eebc:7544:73fd])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05687061c500b001435fe636f2sm3383763oah.53.2023.02.24.05.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:25:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 2/4] target/riscv: implement Zicboz extension
Date: Fri, 24 Feb 2023 10:25:34 -0300
Message-Id: <20230224132536.552293-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224132536.552293-1-dbarboza@ventanamicro.com>
References: <20230224132536.552293-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 13:26:01 -0000

From: Christoph Muellner <cmuellner@linux.com>

The RISC-V base cache management operation (CBO) ISA extension has been
ratified. It defines three extensions: Cache-Block Management, Cache-Block
Prefetch and Cache-Block Zero. More information about the spec can be
found at [1].

Let's start by implementing the Cache-Block Zero extension, Zicboz. It
uses the cbo.zero instruction that, as with all CBO instructions that
will be added later, needs to be implemented in an overlap group with
the LQ instruction due to overlapping patterns.

cbo.zero throws a Illegal Instruction/Virtual Instruction exception
depending on CSR state. This is also the case for the remaining cbo
instructions we're going to add next, so create a check_zicbo_envcfg()
that will be used by all Zicbo[mz] instructions.

[1] https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c                          |  4 ++
 target/riscv/cpu.h                          |  2 +
 target/riscv/helper.h                       |  3 +
 target/riscv/insn32.decode                  | 10 ++-
 target/riscv/insn_trans/trans_rvzicbo.c.inc | 30 +++++++++
 target/riscv/op_helper.c                    | 68 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 7 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..7dd37de7f9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -74,6 +74,7 @@ struct isa_ext_data {
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
@@ -1126,6 +1127,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
+    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
+    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
+
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     /* Vendor-specific custom extensions */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..6b4c714d3a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -447,6 +447,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_icboz;
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
@@ -494,6 +495,7 @@ struct RISCVCPUConfig {
     char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
+    uint16_t cboz_blocksize;
     bool mmu;
     bool pmp;
     bool epmp;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0497370afd..ce165821b8 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -97,6 +97,9 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
 
+/* Cache-block operations */
+DEF_HELPER_2(cbo_zero, void, env, tl)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b7e7613ea2..3985bc703f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -179,7 +179,15 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 
 # *** RV128I Base Instruction Set (in addition to RV64I) ***
 ldu      ............   ..... 111 ..... 0000011 @i
-lq       ............   ..... 010 ..... 0001111 @i
+{
+  [
+    # *** RV32 Zicboz Standard Extension ***
+    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
+  ]
+
+  # *** RVI128 lq ***
+  lq       ............   ..... 010 ..... 0001111 @i
+}
 sq       ............   ..... 100 ..... 0100011 @s
 addid    ............  .....  000 ..... 1011011 @i
 sllid    000000 ......  ..... 001 ..... 1011011 @sh6
diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
new file mode 100644
index 0000000000..feabc28342
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
@@ -0,0 +1,30 @@
+/*
+ * RISC-V translation routines for the RISC-V CBO Extension.
+ *
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
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
+#define REQUIRE_ZICBOZ(ctx) do {    \
+    if (!ctx->cfg_ptr->ext_icboz) { \
+        return false;               \
+    }                               \
+} while (0)
+
+static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
+{
+    REQUIRE_ZICBOZ(ctx);
+    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 48f918b71b..c43ecc19b5 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017-2018 SiFive, Inc.
+ * Copyright (c) 2022      VRULL GmbH
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -123,6 +124,73 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
     return int128_getlo(rv);
 }
 
+
+/*
+ * check_zicbo_envcfg
+ *
+ * Raise virtual exceptions and illegal instruction exceptions for
+ * Zicbo[mz] instructions based on the settings of [mhs]envcfg as
+ * specified in section 2.5.1 of the CMO specification.
+ */
+static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
+                                uintptr_t ra)
+{
+#ifndef CONFIG_USER_ONLY
+    if ((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+
+    if (riscv_cpu_virt_enabled(env) &&
+        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
+         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
+    }
+
+    if ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+#endif
+}
+
+void helper_cbo_zero(CPURISCVState *env, target_ulong address)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    uint16_t cbozlen = cpu->cfg.cboz_blocksize;
+    int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+    void *mem;
+
+    check_zicbo_envcfg(env, MENVCFG_CBZE, ra);
+
+    /* Mask off low-bits to align-down to the cache-block. */
+    address &= ~(cbozlen - 1);
+
+    /*
+     * cbo.zero requires MMU_DATA_STORE access. Do a probe_write()
+     * to raise any exceptions, including PMP.
+     */
+    mem = probe_write(env, address, cbozlen, mmu_idx, ra);
+
+    if (likely(mem)) {
+        memset(mem, 0, cbozlen);
+    } else {
+        /*
+         * This means that we're dealing with an I/O page. Section 4.2
+         * of cmobase v1.0.1 says:
+         *
+         * "Cache-block zero instructions store zeros independently
+         * of whether data from the underlying memory locations are
+         * cacheable."
+         *
+         * Write zeros in address + cbozlen regardless of not being
+         * a RAM page.
+         */
+        for (int i = 0; i < cbozlen; i++) {
+            cpu_stb_mmuidx_ra(env, address + i, 0, mmu_idx, ra);
+        }
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 772f9d7973..7f687a7e37 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1104,6 +1104,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
+#include "insn_trans/trans_rvzicbo.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.39.2


