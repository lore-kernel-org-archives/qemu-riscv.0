Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96FEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECVi-0000La-Ee; Tue, 27 Jun 2023 13:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECVf-0000KA-EL
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:29:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECVP-0000ZA-8Z
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:29:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2632a72f289so375315a91.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687886969; x=1690478969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sg1Y9KTiHwddDohwQN33/LnpY8r5C6zsPNVNLESbMK4=;
 b=JxDiwH/xG/AGrnErgkgwQJRqepteLCF4oMhcoq1T6seVStewf2l7yJINHRmrxAQ4VW
 pquETvNFV/dxazz6PQAwP3YSLwL25FKgsAbc1KB7SbCs2a+Cg4w0d0muNzj+lgE9kqUS
 ES/l7cHgObKaI8EQP2jfH6ugaVF+g7/ZyiM0C2bOxTrKKAntJpCCouW1KMBktqfedIJH
 owKgmBl/reePR8wIr1XhbcEbyhrJPcArriz5LwQ3yRgY06/8uBADvRY6mqS8fskZRK/w
 qndkFpQD8SQRVn1l7YNMyEBH1IoiZgn0n5xbwql61xD7SSRpXeE1WNy+uEh8DRTSjBru
 6IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687886969; x=1690478969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sg1Y9KTiHwddDohwQN33/LnpY8r5C6zsPNVNLESbMK4=;
 b=bRxgw766y89WoBfGSCPIvXXZ/T0oTFXA4M7MPyHKTiZcrwwq2YAyQ9jVx6ukJi2tIZ
 DB+QEfAnItbtPCPdaO5DwpDq7B9bcy8QHJirzIb2BK0Mc2FFsdnM2lGLjqpOAAfYSloi
 tgko6a+mjCZvWhTYbM4KrP56i1FfcMoLJpIZnHMIeEytdEaYGnAcdFMUmLHOoCr89mAL
 Aner68/ryJC85JQYKSDtQupx7XGzhANQAGrw01vpNNcd2zDasjZ2YcXe+6bUJVAHZRIm
 g2Grtlxe/Gr+PxfySqbKAsMnxM4oFeNX9J0ngupD0tQknvKW/oTfmD0cK8mE86rV/8OY
 m4og==
X-Gm-Message-State: AC+VfDxEtkgD3X7vdGe+H3V1j7iVN8tt4ue+kxbucGGvOyM/w9j89SYL
 Bn36rHqTELXll5fTR0mt2eAdhw==
X-Google-Smtp-Source: ACHHUZ63lctrtmtem6JyJhavWspIJo5mbC3NPZg+cGFE/caqyBPa5HRh7dMSuATgtmYKvNbl3z/aWg==
X-Received: by 2002:a17:90a:a6e:b0:25b:dd3e:d3c7 with SMTP id
 o101-20020a17090a0a6e00b0025bdd3ed3c7mr20179285pjo.3.1687886969399; 
 Tue, 27 Jun 2023 10:29:29 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 z19-20020a17090ad79300b002631f3d36a1sm1461443pju.36.2023.06.27.10.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:29:28 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 William Salmon <will.salmon@codethink.co.uk>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PATCH v5 09/15] target/riscv: Add Zvkned ISA extension support
Date: Wed, 28 Jun 2023 01:28:59 +0800
Message-Id: <20230627172921.65040-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

This commit adds support for the Zvkned vector-crypto extension, which
consists of the following instructions:

* vaesef.[vv,vs]
* vaesdf.[vv,vs]
* vaesdm.[vv,vs]
* vaesz.vs
* vaesem.[vv,vs]
* vaeskf1.vi
* vaeskf2.vi

Translation functions are defined in
`target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
`target/riscv/vcrypto_helper.c`.

Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Co-authored-by: William Salmon <will.salmon@codethink.co.uk>
[max.chou@sifive.com: Replaced vstart checking by TCG op]
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: William Salmon <will.salmon@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
[max.chou@sifive.com: Imported aes-round.h and exposed x-zvkned
property]
---
 target/riscv/cpu.c                       |   4 +-
 target/riscv/cpu_cfg.h                   |   1 +
 target/riscv/helper.h                    |  13 ++
 target/riscv/insn32.decode               |  14 ++
 target/riscv/insn_trans/trans_rvvk.c.inc | 177 +++++++++++++++++++
 target/riscv/op_helper.c                 |   6 +
 target/riscv/vcrypto_helper.c            | 209 +++++++++++++++++++++++
 7 files changed, 423 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7e24eef3f1..9b754122ac 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1190,7 +1191,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * In principle Zve*x would also suffice here, were they supported
      * in qemu
      */
-    if (cpu->cfg.ext_zvbb && !cpu->cfg.ext_zve32f) {
+    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned) && !cpu->cfg.ext_zve32f) {
         error_setg(errp,
                    "Vector crypto extensions require V or Zve* extensions");
         return;
@@ -1703,6 +1704,7 @@ static Property riscv_cpu_extensions[] = {
     /* Vector cryptography extensions */
     DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
     DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
+    DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0d43281dd7..13dbc11e90 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -85,6 +85,7 @@ struct RISCVCPUConfig {
     bool ext_zve64d;
     bool ext_zvbb;
     bool ext_zvbc;
+    bool ext_zvkned;
     bool ext_zmmul;
     bool ext_zvfh;
     bool ext_zvfhmin;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index fbb0ceca81..738f20d3ca 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1,5 +1,6 @@
 /* Exceptions */
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
+DEF_HELPER_2(restore_cpu_and_raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
@@ -1221,3 +1222,15 @@ DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_4(vaesef_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesef_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdf_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdf_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesem_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesem_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdm_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_5(vaeskf1_vi, void, ptr, ptr, i32, env, i32)
+DEF_HELPER_5(vaeskf2_vi, void, ptr, ptr, i32, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index aa6d3185a2..7e0295d493 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -75,6 +75,7 @@
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
+@r2_vm_1 ...... . ..... ..... ... ..... ....... &rmr vm=1 %rs2 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -934,3 +935,16 @@ vcpop_v     010010 . ..... 01110 010 ..... 1010111 @r2_vm
 vwsll_vv    110101 . ..... ..... 000 ..... 1010111 @r_vm
 vwsll_vx    110101 . ..... ..... 100 ..... 1010111 @r_vm
 vwsll_vi    110101 . ..... ..... 011 ..... 1010111 @r_vm
+
+# *** Zvkned vector crypto extension ***
+vaesef_vv   101000 1 ..... 00011 010 ..... 1110111 @r2_vm_1
+vaesef_vs   101001 1 ..... 00011 010 ..... 1110111 @r2_vm_1
+vaesdf_vv   101000 1 ..... 00001 010 ..... 1110111 @r2_vm_1
+vaesdf_vs   101001 1 ..... 00001 010 ..... 1110111 @r2_vm_1
+vaesem_vv   101000 1 ..... 00010 010 ..... 1110111 @r2_vm_1
+vaesem_vs   101001 1 ..... 00010 010 ..... 1110111 @r2_vm_1
+vaesdm_vv   101000 1 ..... 00000 010 ..... 1110111 @r2_vm_1
+vaesdm_vs   101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
+vaesz_vs    101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
+vaeskf1_vi  100010 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vaeskf2_vi  101010 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index 0e4b337613..c618f76e7e 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -224,3 +224,180 @@ static bool vwsll_vx_check(DisasContext *s, arg_rmrr *a)
 GEN_OPIVV_WIDEN_TRANS(vwsll_vv, vwsll_vv_check)
 GEN_OPIVX_WIDEN_TRANS(vwsll_vx, vwsll_vx_check)
 GEN_OPIVI_WIDEN_TRANS(vwsll_vi, IMM_ZX, vwsll_vx, vwsll_vx_check)
+
+/*
+ * Zvkned
+ */
+
+#define ZVKNED_EGS 4
+
+#define GEN_V_UNMASKED_TRANS(NAME, CHECK, EGS)                                \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)                  \
+    {                                                                         \
+        if (CHECK(s, a)) {                                                    \
+            TCGv_ptr rd_v, rs2_v;                                             \
+            TCGv_i32 desc;                                                    \
+            uint32_t data = 0;                                                \
+            TCGLabel *over = gen_new_label();                                 \
+            TCGLabel *vl_ok = gen_new_label();                                \
+            TCGLabel *vstart_ok = gen_new_label();                            \
+            TCGv_i32 tmp = tcg_temp_new_i32();                                \
+                                                                              \
+            /* save opcode for unwinding in case we throw an exception */     \
+            decode_save_opc(s);                                               \
+                                                                              \
+            /* check (vl % EGS == 0) assuming it's power of 2 */              \
+            tcg_gen_trunc_tl_i32(tmp, cpu_vl);                                \
+            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
+            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vl_ok);                  \
+            gen_helper_restore_cpu_and_raise_exception(                       \
+                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
+            gen_set_label(vl_ok);                                             \
+                                                                              \
+            /* check (vstart % EGS == 0) assuming it's power of 2 */          \
+            tcg_gen_trunc_tl_i32(tmp, cpu_vstart);                            \
+            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
+            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vstart_ok);              \
+            gen_helper_restore_cpu_and_raise_exception(                       \
+                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
+            gen_set_label(vstart_ok);                                         \
+                                                                              \
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);        \
+            data = FIELD_DP32(data, VDATA, VM, a->vm);                        \
+            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                    \
+            data = FIELD_DP32(data, VDATA, VTA, s->vta);                      \
+            data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);    \
+            data = FIELD_DP32(data, VDATA, VMA, s->vma);                      \
+            rd_v = tcg_temp_new_ptr();                                        \
+            rs2_v = tcg_temp_new_ptr();                                       \
+            desc = tcg_constant_i32(                                          \
+                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data)); \
+            tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));              \
+            tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));            \
+            gen_helper_##NAME(rd_v, rs2_v, cpu_env, desc);                    \
+            mark_vs_dirty(s);                                                 \
+            gen_set_label(over);                                              \
+            return true;                                                      \
+        }                                                                     \
+        return false;                                                         \
+    }
+
+static bool vaes_check_vv(DisasContext *s, arg_rmr *a)
+{
+    int egw_bytes = ZVKNED_EGS << s->sew;
+    return s->cfg_ptr->ext_zvkned == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           MAXSZ(s) >= egw_bytes &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           s->sew == MO_32;
+}
+
+static bool vaes_check_overlap(DisasContext *s, int vd, int vs2)
+{
+    int8_t op_size = s->lmul <= 0 ? 1 : 1 << s->lmul;
+    return !is_overlapped(vd, op_size, vs2, 1);
+}
+
+static bool vaes_check_vs(DisasContext *s, arg_rmr *a)
+{
+    int egw_bytes = ZVKNED_EGS << s->sew;
+    return vaes_check_overlap(s, a->rd, a->rs2) &&
+           MAXSZ(s) >= egw_bytes &&
+           s->cfg_ptr->ext_zvkned == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           s->sew == MO_32;
+}
+
+GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesef_vs, vaes_check_vs, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesdf_vv, vaes_check_vv, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesdf_vs, vaes_check_vs, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesdm_vv, vaes_check_vv, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesdm_vs, vaes_check_vs, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesz_vs, vaes_check_vs, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesem_vv, vaes_check_vv, ZVKNED_EGS)
+GEN_V_UNMASKED_TRANS(vaesem_vs, vaes_check_vs, ZVKNED_EGS)
+
+#define GEN_VI_UNMASKED_TRANS(NAME, CHECK, EGS)                               \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)                  \
+    {                                                                         \
+        if (CHECK(s, a)) {                                                    \
+            TCGv_ptr rd_v, rs2_v;                                             \
+            TCGv_i32 uimm_v, desc;                                            \
+            uint32_t data = 0;                                                \
+            TCGLabel *over = gen_new_label();                                 \
+            TCGLabel *vl_ok = gen_new_label();                                \
+            TCGLabel *vstart_ok = gen_new_label();                            \
+            TCGv_i32 tmp = tcg_temp_new_i32();                                \
+                                                                              \
+            /* save opcode for unwinding in case we throw an exception */     \
+            decode_save_opc(s);                                               \
+                                                                              \
+            /* check (vl % EGS == 0) assuming it's power of 2 */              \
+            tcg_gen_trunc_tl_i32(tmp, cpu_vl);                                \
+            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
+            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vl_ok);                  \
+            gen_helper_restore_cpu_and_raise_exception(                       \
+                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
+            gen_set_label(vl_ok);                                             \
+                                                                              \
+            /* check (vstart % EGS == 0) assuming it's power of 2 */          \
+            tcg_gen_trunc_tl_i32(tmp, cpu_vstart);                            \
+            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
+            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vstart_ok);              \
+            gen_helper_restore_cpu_and_raise_exception(                       \
+                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
+            gen_set_label(vstart_ok);                                         \
+                                                                              \
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);        \
+            data = FIELD_DP32(data, VDATA, VM, a->vm);                        \
+            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                    \
+            data = FIELD_DP32(data, VDATA, VTA, s->vta);                      \
+            data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);    \
+            data = FIELD_DP32(data, VDATA, VMA, s->vma);                      \
+                                                                              \
+            rd_v = tcg_temp_new_ptr();                                        \
+            rs2_v = tcg_temp_new_ptr();                                       \
+            uimm_v = tcg_constant_i32(a->rs1);                                \
+            desc = tcg_constant_i32(                                          \
+                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data)); \
+            tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));              \
+            tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));            \
+            gen_helper_##NAME(rd_v, rs2_v, uimm_v, cpu_env, desc);            \
+            mark_vs_dirty(s);                                                 \
+            gen_set_label(over);                                              \
+            return true;                                                      \
+        }                                                                     \
+        return false;                                                         \
+    }
+
+static bool vaeskf1_check(DisasContext *s, arg_vaeskf1_vi *a)
+{
+    int egw_bytes = ZVKNED_EGS << s->sew;
+    return s->cfg_ptr->ext_zvkned == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           MAXSZ(s) >= egw_bytes &&
+           s->sew == MO_32 &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul);
+}
+
+static bool vaeskf2_check(DisasContext *s, arg_vaeskf2_vi *a)
+{
+    int egw_bytes = ZVKNED_EGS << s->sew;
+    return s->cfg_ptr->ext_zvkned == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           MAXSZ(s) >= egw_bytes &&
+           s->sew == MO_32 &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul);
+}
+
+GEN_VI_UNMASKED_TRANS(vaeskf1_vi, vaeskf1_check, ZVKNED_EGS)
+GEN_VI_UNMASKED_TRANS(vaeskf2_vi, vaeskf2_check, ZVKNED_EGS)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index f563dc3981..a332059312 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -39,6 +39,12 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
     riscv_raise_exception(env, exception, 0);
 }
 
+void helper_restore_cpu_and_raise_exception(CPURISCVState *env,
+                                            uint32_t exception)
+{
+    riscv_raise_exception(env, exception, GETPC());
+}
+
 target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
     /*
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 11239b59d6..374ca603e5 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -22,6 +22,8 @@
 #include "qemu/bitops.h"
 #include "qemu/bswap.h"
 #include "cpu.h"
+#include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -195,3 +197,210 @@ RVVCALL(OPIVX2, vwsll_vx_w, WOP_UUU_W, H8, H4, DO_SLL)
 GEN_VEXT_VX(vwsll_vx_b, 2)
 GEN_VEXT_VX(vwsll_vx_h, 4)
 GEN_VEXT_VX(vwsll_vx_w, 8)
+
+static inline void xor_round_key(AESState *round_state, AESState *round_key)
+{
+    round_state->v = round_state->v ^ round_key->v;
+}
+
+#define GEN_ZVKNED_HELPER_VV(NAME, ...)                                   \
+    void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,  \
+                      uint32_t desc)                                      \
+    {                                                                     \
+        uint64_t *vd = vd_vptr;                                           \
+        uint64_t *vs2 = vs2_vptr;                                         \
+        uint32_t vl = env->vl;                                            \
+        uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
+        uint32_t vta = vext_vta(desc);                                    \
+                                                                          \
+        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
+            AESState round_key;                                           \
+            round_key.d[HOST_BIG_ENDIAN] = cpu_to_le64(vs2[i * 2 + 0]);   \
+            round_key.d[!HOST_BIG_ENDIAN] = cpu_to_le64(vs2[i * 2 + 1]);  \
+            AESState round_state;                                         \
+            cpu_to_le64s(vd + i * 2 + 0);                                 \
+            cpu_to_le64s(vd + i * 2 + 1);                                 \
+            for (int j = 0; j < 16; j++) {                                \
+                round_state.b[j] = ((uint8_t *)(vd + i * 2))[j];          \
+            }                                                             \
+            __VA_ARGS__;                                                  \
+            for (int j = 0; j < 16; j++) {                                \
+                ((uint8_t *)(vd + i * 2))[j] = round_state.b[j];          \
+            }                                                             \
+            le64_to_cpus(vd + i * 2 + 0);                                 \
+            le64_to_cpus(vd + i * 2 + 1);                                 \
+        }                                                                 \
+        env->vstart = 0;                                                  \
+        /* set tail elements to 1s */                                     \
+        vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);              \
+    }
+
+#define GEN_ZVKNED_HELPER_VS(NAME, ...)                                   \
+    void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,  \
+                      uint32_t desc)                                      \
+    {                                                                     \
+        uint64_t *vd = vd_vptr;                                           \
+        uint64_t *vs2 = vs2_vptr;                                         \
+        uint32_t vl = env->vl;                                            \
+        uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
+        uint32_t vta = vext_vta(desc);                                    \
+                                                                          \
+        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
+            AESState round_key;                                           \
+            round_key.d[HOST_BIG_ENDIAN] = cpu_to_le64(vs2[0]);           \
+            round_key.d[!HOST_BIG_ENDIAN] = cpu_to_le64(vs2[1]);          \
+            AESState round_state;                                         \
+            cpu_to_le64s(vd + i * 2 + 0);                                 \
+            cpu_to_le64s(vd + i * 2 + 1);                                 \
+            for (int j = 0; j < 16; j++) {                                \
+                round_state.b[j] = ((uint8_t *)(vd + i * 2))[j];          \
+            }                                                             \
+            __VA_ARGS__;                                                  \
+            for (int j = 0; j < 16; j++) {                                \
+                ((uint8_t *)(vd + i * 2))[j] = round_state.b[j];          \
+            }                                                             \
+            le64_to_cpus(vd + i * 2 + 0);                                 \
+            le64_to_cpus(vd + i * 2 + 1);                                 \
+        }                                                                 \
+        env->vstart = 0;                                                  \
+        /* set tail elements to 1s */                                     \
+        vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);              \
+    }
+
+GEN_ZVKNED_HELPER_VV(vaesef_vv, aesenc_SB_SR_AK(&round_state,
+                                                &round_state,
+                                                &round_key,
+                                                false);)
+GEN_ZVKNED_HELPER_VS(vaesef_vs, aesenc_SB_SR_AK(&round_state,
+                                                &round_state,
+                                                &round_key,
+                                                false);)
+GEN_ZVKNED_HELPER_VV(vaesdf_vv, aesdec_ISB_ISR_AK(&round_state,
+                                                  &round_state,
+                                                  &round_key,
+                                                  false);)
+GEN_ZVKNED_HELPER_VS(vaesdf_vs, aesdec_ISB_ISR_AK(&round_state,
+                                                  &round_state,
+                                                  &round_key,
+                                                  false);)
+GEN_ZVKNED_HELPER_VV(vaesem_vv, aesenc_SB_SR_MC_AK(&round_state,
+                                                   &round_state,
+                                                   &round_key,
+                                                   false);)
+GEN_ZVKNED_HELPER_VS(vaesem_vs, aesenc_SB_SR_MC_AK(&round_state,
+                                                   &round_state,
+                                                   &round_key,
+                                                   false);)
+GEN_ZVKNED_HELPER_VV(vaesdm_vv, aesdec_ISB_ISR_AK_IMC(&round_state,
+                                                      &round_state,
+                                                      &round_key,
+                                                      false);)
+GEN_ZVKNED_HELPER_VS(vaesdm_vs, aesdec_ISB_ISR_AK_IMC(&round_state,
+                                                      &round_state,
+                                                      &round_key,
+                                                      false);)
+GEN_ZVKNED_HELPER_VS(vaesz_vs, xor_round_key(&round_state, &round_key);)
+
+void HELPER(vaeskf1_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
+                        CPURISCVState *env, uint32_t desc)
+{
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs2 = vs2_vptr;
+    uint32_t vl = env->vl;
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+    uint32_t vta = vext_vta(desc);
+
+    uimm &= 0b1111;
+    if (uimm > 10 || uimm == 0) {
+        uimm ^= 0b1000;
+    }
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        uint32_t rk[8];
+        static const uint32_t rcon[] = {
+            0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
+            0x20000000, 0x40000000, 0x80000000, 0x1B000000, 0x36000000,
+        };
+
+        rk[0] = bswap32(vs2[i * 4 + H4(0)]);
+        rk[1] = bswap32(vs2[i * 4 + H4(1)]);
+        rk[2] = bswap32(vs2[i * 4 + H4(2)]);
+        rk[3] = bswap32(vs2[i * 4 + H4(3)]);
+
+        rk[4] = rk[0] ^ (((uint32_t)AES_sbox[(rk[3] >> 16) & 0xff] << 24) |
+                         ((uint32_t)AES_sbox[(rk[3] >> 8) & 0xff] << 16) |
+                         ((uint32_t)AES_sbox[(rk[3] >> 0) & 0xff] << 8) |
+                         ((uint32_t)AES_sbox[(rk[3] >> 24) & 0xff] << 0))
+                      ^ rcon[uimm - 1];
+        rk[5] = rk[1] ^ rk[4];
+        rk[6] = rk[2] ^ rk[5];
+        rk[7] = rk[3] ^ rk[6];
+
+        vd[i * 4 + H4(0)] = bswap32(rk[4]);
+        vd[i * 4 + H4(1)] = bswap32(rk[5]);
+        vd[i * 4 + H4(2)] = bswap32(rk[6]);
+        vd[i * 4 + H4(3)] = bswap32(rk[7]);
+    }
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
+}
+
+void HELPER(vaeskf2_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
+                        CPURISCVState *env, uint32_t desc)
+{
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs2 = vs2_vptr;
+    uint32_t vl = env->vl;
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+    uint32_t vta = vext_vta(desc);
+
+    uimm &= 0b1111;
+    if (uimm > 14 || uimm < 2) {
+        uimm ^= 0b1000;
+    }
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        uint32_t rk[12];
+        static const uint32_t rcon[] = {
+            0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
+            0x20000000, 0x40000000, 0x80000000, 0x1B000000, 0x36000000,
+        };
+
+        rk[0] = bswap32(vd[i * 4 + H4(0)]);
+        rk[1] = bswap32(vd[i * 4 + H4(1)]);
+        rk[2] = bswap32(vd[i * 4 + H4(2)]);
+        rk[3] = bswap32(vd[i * 4 + H4(3)]);
+        rk[4] = bswap32(vs2[i * 4 + H4(0)]);
+        rk[5] = bswap32(vs2[i * 4 + H4(1)]);
+        rk[6] = bswap32(vs2[i * 4 + H4(2)]);
+        rk[7] = bswap32(vs2[i * 4 + H4(3)]);
+
+        if (uimm % 2 == 0) {
+            rk[8] = rk[0] ^ (((uint32_t)AES_sbox[(rk[7] >> 16) & 0xff] << 24) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 8) & 0xff] << 16) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 0) & 0xff] << 8) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 24) & 0xff] << 0))
+                          ^ rcon[(uimm - 1) / 2];
+            rk[9] = rk[1] ^ rk[8];
+            rk[10] = rk[2] ^ rk[9];
+            rk[11] = rk[3] ^ rk[10];
+        } else {
+            rk[8] = rk[0] ^ (((uint32_t)AES_sbox[(rk[7] >> 24) & 0xff] << 24) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 16) & 0xff] << 16) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 8) & 0xff] << 8) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 0) & 0xff] << 0));
+            rk[9] = rk[1] ^ rk[8];
+            rk[10] = rk[2] ^ rk[9];
+            rk[11] = rk[3] ^ rk[10];
+        }
+
+        vd[i * 4 + H4(0)] = bswap32(rk[8]);
+        vd[i * 4 + H4(1)] = bswap32(rk[9]);
+        vd[i * 4 + H4(2)] = bswap32(rk[10]);
+        vd[i * 4 + H4(3)] = bswap32(rk[11]);
+    }
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
+}
-- 
2.31.1


