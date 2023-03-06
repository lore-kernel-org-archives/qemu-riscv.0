Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwY-0006R6-WA
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwX-0006Or-PI
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:29 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwU-0006nx-Cx
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:29 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x11so7549937pln.12
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140264;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWP/2kCpSB46CivaMD7MPcbRO0hHoZv0vKKzTF/veqA=;
 b=cBaKTPa5cpoLXucbCjWp1M8XnwS4DlbdHHXBNRVFxfjuju4ahJ7CpZwnjUKTcSxb4w
 cALmwzLPmbSd7lGrupOnIt3vkFHHhaxopNCFnLDNtziQsmw/6ossaUtxh4Kq64RGEyGe
 751NId8uDtSNy1/X6/dmEDXbMWtSrutWaTJUQL05J3evWNS9967ktX/5D4G+AAFnQe8P
 46kJ4RCIe/iq3Av38gdm8g7Bz+vrj4qORJqduLBfIoGIrYIZdpjgh+G64pjNgOD5sU3s
 QgCCRNmxWt3DAieDFbMWs75Mga3kDKN7f2RLD7l3CSbWc4tbPzDWU0wVPT+ywVgV3Iwa
 bNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140264;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWP/2kCpSB46CivaMD7MPcbRO0hHoZv0vKKzTF/veqA=;
 b=c3VNjLqk1LKZM2Tt9hb8yfku7N4SCt6NEfaptKyVRE43naNoDik8PNwzqTtbh05PAr
 K1g2qToVxBORv9Lt3pv7JI4V/rrcSs6J9W3D9XOLOv2Uu9gY9HSoVGm2a9BUoPWWUEIt
 EoTwNcgK+3gpCts0vCfIlGy62tPBJz3/z/Ty1zJfkI1mWDJFuOvvYuekOuIUYLDfnMH9
 xOUnCZguWepDTxTZ9sJJmas6qj6CVkrkqQl/a7AVVunDV35Pq0BlBS2skzpudsI0/Toh
 LOwqYVz3jPE+vaJlS/YfVPfw5Rl8hMPABvFYk6bUhd+NoAg2g82jwHYZZbRkYEm6TFKt
 h9Xw==
X-Gm-Message-State: AO0yUKU6w0w5JVvsT2chOR8zIBSb8aUXaj5VEhTHBl+v5JqgC1IY6oRH
 u3KGkgQjNoT2ZCDWl3dtxFSrg6JtF1e8g+Es2RU=
X-Google-Smtp-Source: AK7set/RejL/3XNrN+TVb3rzYDGTsRKz5Vp171NvN8ammBxfj750mvvOApNVrWGMsfXptu21y4MUyA==
X-Received: by 2002:a05:6a20:8e28:b0:cd:7fcf:11a6 with SMTP id
 y40-20020a056a208e2800b000cd7fcf11a6mr12018828pzj.48.1678140264346; 
 Mon, 06 Mar 2023 14:04:24 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 g9-20020aa78189000000b0061a942c8b62sm3565506pfi.43.2023.03.06.14.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:24 -0800 (PST)
Subject: [PULL 01/22] target/riscv: implement Zicboz extension
Date: Mon,  6 Mar 2023 14:02:38 -0800
Message-Id: <20230306220259.7748-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Christoph Muellner <cmuellner@linux.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:30 -0000

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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230224132536.552293-3-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
index 5bc0005cc7..ab6c127859 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -75,6 +75,7 @@ struct isa_ext_data {
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
@@ -1167,6 +1168,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
+    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
+    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
+
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     /* Vendor-specific custom extensions */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 665b4c60b0..73c9832fb7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -434,6 +434,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_icboz;
     bool ext_zicond;
     bool ext_zihintpause;
     bool ext_smstateen;
@@ -486,6 +487,7 @@ struct RISCVCPUConfig {
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
index fb537e922e..a471adcea0 100644
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
index 9c0b91c88f..d0217b6a98 100644
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
index a8d516ca3e..fa8bd79cef 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1105,6 +1105,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
+#include "insn_trans/trans_rvzicbo.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.39.2


