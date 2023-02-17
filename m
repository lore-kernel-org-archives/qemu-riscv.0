Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT7Rg-0002bO-Kw
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 15:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rf-0002b6-8N
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:35:03 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rd-0006Tf-3K
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:35:02 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17172b43531so2587843fac.1
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 12:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gHhDXGq6+5c86zDctUl5U0RTzvEI55nAWACJQNcNP0=;
 b=QyI14BvhyxdQn45nTT2EJwWz3P2zdJkJ5MKugBtbhGk/wq3h7S6jMudnj4Nj7s9t4w
 5IdD/86YOLxCFGuMvU//hDQAMV18q6Y4AyBxGQqryTVKJsWKAp39HZ59LRlzg7oDqJNN
 l96/9mLC6CG4JTXC0q3YEVFpTyUwafAoVsaZjyAq8gci7cCqQbpuWf3hOj4e83qOw9FW
 ZambdDJJ3IOU7g8GMTRMtWNQNBlGndP+1V+6womSMMtY5t+sr4tXfrOD6NNh/NtwyFQQ
 L7NVS7GonN4iyhdIacGFmHb6U7/+IJqV6HUY48GtmSDrVUlnak2I2v+DwDuK9mkeBMTx
 REAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gHhDXGq6+5c86zDctUl5U0RTzvEI55nAWACJQNcNP0=;
 b=lojiFT5TlKjGLc6arCEJTsEOf163cqQ5fLLhomPKpct1lXFTiDTnrxWE491F5Vndcc
 wRelMp4k7yH0gPO5KkbHl9sbP7kRTFz9WiLMHygnExC3HDT5I8BsSkOvHFNCx6fY48FC
 fLeGaQx6R8CVQRf4iI2gVBQ7rBWda1hCPZFNTEEBEzuBtNXu51xjccExtk+X9EYmZIyN
 wD27IQdT+6g0Tn+cb2Gmc9uPXGCRU/n+2aQXOT3AIPXiO3e7ssZTft6CACI5DIuAt25v
 NkurA9SNMIaFYtDjJf5rzKYes2pcn+rsg84f8p/LaIJejriXO+SRA3yfteNowXrR4DIy
 nEoA==
X-Gm-Message-State: AO0yUKWmt+TgWOl28OnkXOfQUwJuwABsCOmPIITMEGrL/uJ2B4n0pHHS
 sB5wMxu3EcITsBpqIjQ2lDJaKBSYKw+A6TCH
X-Google-Smtp-Source: AK7set9GV2D5BXVCW3z1ZTtO2O51CzUvXKOoibxcGi/XZKk7GCTXbGO9YJXNjU+Q/jaI5r8EBk5cJw==
X-Received: by 2002:a05:6870:c347:b0:169:c12b:3457 with SMTP id
 e7-20020a056870c34700b00169c12b3457mr369481oak.39.1676666099685; 
 Fri, 17 Feb 2023 12:34:59 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 ef5-20020a0568701a8500b00152c52608dbsm1125616oab.34.2023.02.17.12.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:34:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v6 2/4] target/riscv: implement Zicboz extension
Date: Fri, 17 Feb 2023 17:34:43 -0300
Message-Id: <20230217203445.51077-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217203445.51077-1-dbarboza@ventanamicro.com>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Feb 2023 20:35:03 -0000

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

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c                          |  4 ++
 target/riscv/cpu.h                          |  2 +
 target/riscv/helper.h                       |  3 ++
 target/riscv/insn32.decode                  | 10 +++-
 target/riscv/insn_trans/trans_rvzicbo.c.inc | 30 +++++++++++
 target/riscv/op_helper.c                    | 55 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 7 files changed, 104 insertions(+), 1 deletion(-)
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
index 48f918b71b..c5053e9446 100644
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
@@ -123,6 +124,60 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
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
+    /*
+     * Check for virtual instruction exceptions first, as we don't see
+     * VU and VS reflected in env->priv (these are just the translated
+     * U and S stated with virtualisation enabled.
+     */
+    if (riscv_cpu_virt_enabled(env) &&
+        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
+         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
+    }
+
+    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
+        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+#endif
+}
+
+void helper_cbo_zero(CPURISCVState *env, target_ulong address)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    uintptr_t ra = GETPC();
+    uint16_t cbozlen;
+    void *mem;
+
+    check_zicbo_envcfg(env, MENVCFG_CBZE, ra);
+
+    /* Get the size of the cache block for zero instructions. */
+    cbozlen = cpu->cfg.cboz_blocksize;
+
+    /* Mask off low-bits to align-down to the cache-block. */
+    address &= ~(cbozlen - 1);
+
+    mem = tlb_vaddr_to_host(env, address, MMU_DATA_STORE,
+                            cpu_mmu_index(env, false));
+
+    if (likely(mem)) {
+        /* Zero the block */
+        memset(mem, 0, cbozlen);
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


