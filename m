Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT7Rq-0002fa-A6
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 15:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rj-0002eK-EK
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:35:07 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rh-0006ey-3g
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:35:07 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-171872a792fso2517136fac.3
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 12:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7TTGHHzmd6DC8aeZZgHae2UJ59O3lJ+vmgM+ZimXto=;
 b=nzEu1SbfueuscEoTR0fF3SDgwVTuJb11+G5Gn3F1YzuHEkptYVENUPmzGTCq/KXHOD
 hptHndMWylJlIfcjxdpPix+3eAcPKmpDu7c5OqXntzwkHdq3M96VwH7hS4AePn3XnIlr
 IMHgQefXuBGsd6FRnkvf/XHRptArKsQ4EALaU6N//9+6sEGSDCnzoIgAMDW62JUeNZ2m
 9EZKNfOxcYR71NVtJ32150vL55tgd6yXjMggfhES6nXZNaurIi45E8cnMI5hWtHinH5L
 1Kw0bNxdDJomhqb3A1sEliTPq6x4psjT0ZZDquVNdIY2t6dPspnCT6Bj3+4G356+Nh3j
 kKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7TTGHHzmd6DC8aeZZgHae2UJ59O3lJ+vmgM+ZimXto=;
 b=ow8lwUJ4mFeeqCLXkLVQWSXkvAkx+wq+Us5i+pvOyzuUzahgRyWuWewGvwLOrNTStr
 U0owYfyecNMWgcy0l8+Rq7Sb8r0SQggskiHh4IE+GBw7YMSTxRqt2jIBEDFcAu0l6Wxb
 +5ur8+NUtT/cWmhRNyJkCdxsoWfvMoGjZe5sStV4z8atyQjpgYQlPOV9oGdqvT/RypzD
 MJztVe6hMIFe0WFV03qGLcf9lCvoaWUcDY/PWpQscT/sdxMlu/QnfuTtzAN1nGUgxnc/
 o6QXOwVuN9idNQ9LptK8WWtjRp0Ypmd93Q6swOZij+brBVn4psBB9IWSPiYhywAsZFKG
 z0aw==
X-Gm-Message-State: AO0yUKVaCO5DlrIbVG7JV1+JyAkSMwUi3jkCE9grW3sg0LblIR8Z68dj
 x6RIKllesmKTp+n3cQl4z7Z5IA==
X-Google-Smtp-Source: AK7set+SLgyxFJ/szAYYX9QExnD+ZJLYE+yB3EBvo74kxURIGudRd7H+RkDvaDbpGG85jKOm34YvJg==
X-Received: by 2002:a05:6870:40d1:b0:163:77b9:a192 with SMTP id
 l17-20020a05687040d100b0016377b9a192mr845626oal.16.1676666103756; 
 Fri, 17 Feb 2023 12:35:03 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 ef5-20020a0568701a8500b00152c52608dbsm1125616oab.34.2023.02.17.12.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:35:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v6 3/4] target/riscv: implement Zicbom extension
Date: Fri, 17 Feb 2023 17:34:44 -0300
Message-Id: <20230217203445.51077-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217203445.51077-1-dbarboza@ventanamicro.com>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Fri, 17 Feb 2023 20:35:07 -0000

From: Christoph Muellner <cmuellner@linux.com>

Zicbom is the Cache-Block Management extension defined in the already
ratified RISC-V Base Cache Management Operation (CBO) ISA extension [1].

The extension contains three instructions: cbo.clean, cbo.flush and
cbo.inval. All of them must be implemented in the same group as LQ and
cbo.zero due to overlapping patterns.

All these instructions can throw a Illegal Instruction/Virtual
Instruction exception, similar to the existing cbo.zero. The same
check_zicbo_envcfg() is used to handle these exceptions.

Aside from that, these instructions also need to handle page faults and
guest page faults. This is done in a new check_zicbom_access() helper.

As with Zicboz, the cache block size for Zicbom is also configurable.
Note that the spec determines that Zicbo[mp] and Zicboz can have
different cache sizes (Section 2.7 of [1]), so we also include a
'cbom_blocksize' to go along with the existing 'cboz_blocksize'. They
are set to the same size, so unless users want to play around with the
settings both sizes will be the same.

[1] https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c                          |   3 +
 target/riscv/cpu.h                          |   2 +
 target/riscv/helper.h                       |   2 +
 target/riscv/insn32.decode                  |   5 +
 target/riscv/insn_trans/trans_rvzicbo.c.inc |  27 +++++
 target/riscv/op_helper.c                    | 107 ++++++++++++++++++++
 6 files changed, 146 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7dd37de7f9..4b779b1775 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -74,6 +74,7 @@ struct isa_ext_data {
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
     ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
@@ -1127,6 +1128,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
+    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
+    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6b4c714d3a..a0673b4604 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -447,6 +447,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_icbom;
     bool ext_icboz;
     bool ext_zihintpause;
     bool ext_smstateen;
@@ -495,6 +496,7 @@ struct RISCVCPUConfig {
     char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
+    uint16_t cbom_blocksize;
     uint16_t cboz_blocksize;
     bool mmu;
     bool pmp;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ce165821b8..37b54e0991 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -98,6 +98,8 @@ DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
 
 /* Cache-block operations */
+DEF_HELPER_2(cbo_clean_flush, void, env, tl)
+DEF_HELPER_2(cbo_inval, void, env, tl)
 DEF_HELPER_2(cbo_zero, void, env, tl)
 
 /* Special functions */
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3985bc703f..3788f86528 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -181,6 +181,11 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 {
   [
+    # *** RV32 Zicbom Standard Extension ***
+    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
+    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
+    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
+
     # *** RV32 Zicboz Standard Extension ***
     cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
   ]
diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
index feabc28342..7df9c30b58 100644
--- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
+++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
@@ -16,12 +16,39 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZICBOM(ctx) do {    \
+    if (!ctx->cfg_ptr->ext_icbom) { \
+        return false;               \
+    }                               \
+} while (0)
+
 #define REQUIRE_ZICBOZ(ctx) do {    \
     if (!ctx->cfg_ptr->ext_icboz) { \
         return false;               \
     }                               \
 } while (0)
 
+static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
+{
+    REQUIRE_ZICBOM(ctx);
+    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
+static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
+{
+    REQUIRE_ZICBOM(ctx);
+    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
+static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
+{
+    REQUIRE_ZICBOM(ctx);
+    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
 static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
 {
     REQUIRE_ZICBOZ(ctx);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index c5053e9446..25ffa324a3 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -178,6 +178,113 @@ void helper_cbo_zero(CPURISCVState *env, target_ulong address)
     }
 }
 
+/*
+ * check_zicbom_access
+ *
+ * Check access permissions (LOAD, STORE or FETCH as specified in
+ * section 2.5.2 of the CMO specification) for Zicbom, raising
+ * either store page-fault (non-virtualized) or store guest-page
+ * fault (virtualized).
+ */
+static void check_zicbom_access(CPURISCVState *env,
+                                target_ulong address,
+                                uintptr_t ra)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    int mmu_idx = cpu_mmu_index(env, false);
+    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
+    void *phost;
+    int ret;
+
+    /* Mask off low-bits to align-down to the cache-block. */
+    address &= ~(cbomlen - 1);
+
+    /*
+     * Section 2.5.2 of cmobase v1.0.1:
+     *
+     * "A cache-block management instruction is permitted to
+     * access the specified cache block whenever a load instruction
+     * or store instruction is permitted to access the corresponding
+     * physical addresses. If neither a load instruction nor store
+     * instruction is permitted to access the physical addresses,
+     * but an instruction fetch is permitted to access the physical
+     * addresses, whether a cache-block management instruction is
+     * permitted to access the cache block is UNSPECIFIED.
+     *
+     * This means we have to make a choice of whether checking
+     * MMU_INST_FETCH is worth it or not. We'll go the easier
+     * route and check MMU_DATA_LOAD and MMU_DATA_STORE only.
+     */
+    ret = probe_access_range_flags(env, address, cbomlen,
+                                   MMU_DATA_LOAD,
+                                   mmu_idx, true, &phost, ra);
+
+    if (ret == TLB_INVALID_MASK) {
+        probe_access_range_flags(env, address, cbomlen,
+                                 MMU_DATA_STORE,
+                                 mmu_idx, true, &phost, ra);
+    }
+
+    if (ret == TLB_INVALID_MASK) {
+        /*
+         * If ret == TLB_INVALID_MASK at this point, LOAD and
+         * STORE aren't permitted, meaning that access to the
+         * cache block is not permitted. Same paragraph
+         * mentioned above from cmobase v1.0.1 spec says:
+         *
+         * "If access to the cache block is not permitted, a
+         * cache-block management instruction raises a store
+         * page fault or store guest-page fault exception if
+         * address translation does not permit any access or
+         * raises a store access fault exception otherwise."
+         *
+         * Thus, raise a store (guest-)page fault exception.
+         */
+#ifndef CONFIG_USER_ONLY
+        if (riscv_cpu_virt_enabled(env)) {
+            riscv_raise_exception(env,
+                                  RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT,
+                                  ra);
+        }
+#endif
+        riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra);
+
+        return;
+    }
+
+    /*
+     * We're still missing PMP faults checks. The spec mentions
+     * that we either raise a store (guest) page fault, which
+     * we're already doing above, or raise a store access fault
+     * otherwise.
+     *
+     * The latter can be achieved by using probe_access_range_flags(),
+     * using MMU_DATA_STORE, with nonfault = false. riscv_cpu_tlb_fill()
+     * will raise the appropriate exception regardless of being a
+     * PMP fault or any other.
+     */
+    probe_access_range_flags(env, address, cbomlen, MMU_DATA_STORE,
+                             mmu_idx, false, &phost, ra);
+}
+
+void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)
+{
+    uintptr_t ra = GETPC();
+    check_zicbo_envcfg(env, MENVCFG_CBCFE, ra);
+    check_zicbom_access(env, address, ra);
+
+    /* We don't emulate the cache-hierarchy, so we're done. */
+}
+
+void helper_cbo_inval(CPURISCVState *env, target_ulong address)
+{
+    uintptr_t ra = GETPC();
+    check_zicbo_envcfg(env, MENVCFG_CBIE, ra);
+    check_zicbom_access(env, address, ra);
+
+    /* We don't emulate the cache-hierarchy, so we're done. */
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env)
-- 
2.39.2


