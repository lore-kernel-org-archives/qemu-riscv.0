Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EA8C001DF
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:04:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGkA-0004VF-De; Tue, 11 Jul 2023 13:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjb-0003Sp-Al
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:07 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjX-0001GP-Fz
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:07 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-55b0e7efb1cso3088211a12.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689094862; x=1691686862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISzm/OE2tqpDoDatRwHouXAMHK5uXNckR+Hf74FIDtU=;
 b=KAlJkZF6xS6OX/mOS6++Y2EewSOCex5/JcuawdCrrmoWrmsFPgVJ1f1D5TAFcspz+f
 zRLCEYBMW5REkytUWnQ3Bh3hsIclxeRqgc0lIcRSrPB2ZBRnAACpRdXHfAVOYRmJtOOp
 1jT77UOChnB650TCgoerLUAtZ344aDHUoN5oWiKi8EvhSEAsieoM8JnhI8MVa7856pbn
 gBbHA9EKVjayhRR93Z24JsOepkiI827LsjHuaU2gpQH9ZWLf/eYp6Tu58hSONoDdm7Sc
 YaD7+lSxcOMZLKz9n+oU/dr45F6s2yglKReqveUUIk8gRLrArSSKGvXY63/4CL1cBevi
 2ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094862; x=1691686862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISzm/OE2tqpDoDatRwHouXAMHK5uXNckR+Hf74FIDtU=;
 b=Kzx2gcP5YEmxDg0q7QjyLCjo5/AoozDZVabhpieA3yD77comPyxuABBFa9l+N+NKrc
 k2jA7niF6yVf2W20wwESyCxRwj7EjcCeHyC3K+zLMh4rhpbI95rJWSkBNFpR0mZKpLFf
 MtcHdezW4IJS20AEfmkSvjZBqwRRH140jH13v+9Uv+QtPq799g+zOmClDVtQ4l65FBPO
 JUuZ2zsltGhEi4df10AGDBALGFM/+iEWKoO6fnp2lz2c6rL6L4pAOUnLxJF5jvSQzTjj
 axV54KsGeFwkT3MZVQn7gkBkFIcy1cWDemso/DEKGXFCoqo7cr4BxbwKLc/XvCmMAHJX
 nPfA==
X-Gm-Message-State: ABy/qLbD3opvCPgGO1qfSiQwxLh8jrxssavrxjlZIZe6YWmOMbUVUFbg
 JnUmFP/34XRcIwmLrt+0/WAA4Q==
X-Google-Smtp-Source: APBJJlHWtK0X6FBjeAsIIKw60BexxwmAcdNtW//DQa4TwaVIIgth6pGlOUVzefpu0JykFDNgDJTUrg==
X-Received: by 2002:a17:90b:3109:b0:259:3e2a:b6d8 with SMTP id
 gc9-20020a17090b310900b002593e2ab6d8mr13420553pjb.17.1689094862004; 
 Tue, 11 Jul 2023 10:01:02 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 gw10-20020a17090b0a4a00b00262fc84b931sm8381793pjb.44.2023.07.11.10.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:01:01 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, alistair23@gmail.com,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 William Salmon <will.salmon@codethink.co.uk>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PATCH v8 09/15] target/riscv: Add Zvkned ISA extension support
Date: Wed, 12 Jul 2023 00:59:08 +0800
Message-Id: <20230711165917.2629866-10-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
References: <20230711165917.2629866-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x531.google.com
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
[max.chou@sifive.com: Fixed endian issues and replaced the vstart & vl
egs checking by helper function]
[max.chou@sifive.com: Replaced bswap32 calls in aes key expanding]
---
 target/riscv/cpu.c                       |   4 +-
 target/riscv/cpu_cfg.h                   |   1 +
 target/riscv/helper.h                    |  14 ++
 target/riscv/insn32.decode               |  14 ++
 target/riscv/insn_trans/trans_rvvk.c.inc | 147 +++++++++++++++++
 target/riscv/vcrypto_helper.c            | 202 +++++++++++++++++++++++
 6 files changed, 381 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e39a6118bbc..a1a40875f95 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -128,6 +128,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1274,7 +1275,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * In principle Zve*x would also suffice here, were they supported
      * in qemu
      */
-    if (cpu->cfg.ext_zvbb && !cpu->cfg.ext_zve32f) {
+    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned) && !cpu->cfg.ext_zve32f) {
         error_setg(errp,
                    "Vector crypto extensions require V or Zve* extensions");
         return;
@@ -1865,6 +1866,7 @@ static Property riscv_cpu_extensions[] = {
     /* Vector cryptography extensions */
     DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
     DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
+    DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0e31ebeed93..c7eafe27c0d 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -87,6 +87,7 @@ struct RISCVCPUConfig {
     bool ext_zve64d;
     bool ext_zvbb;
     bool ext_zvbc;
+    bool ext_zvkned;
     bool ext_zmmul;
     bool ext_zvfbfmin;
     bool ext_zvfbfwma;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3db25ed2a20..02e5dbe6ee4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1250,3 +1250,17 @@ DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_2(egs_check, void, i32, env)
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
index b982a8325bb..4f3c50f10f3 100644
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
@@ -972,3 +973,16 @@ vcpop_v     010010 . ..... 01110 010 ..... 1010111 @r2_vm
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
index 0e4b3376134..817353f4d30 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -224,3 +224,150 @@ static bool vwsll_vx_check(DisasContext *s, arg_rmrr *a)
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
+            TCGv_i32 desc, egs;                                               \
+            uint32_t data = 0;                                                \
+            TCGLabel *over = gen_new_label();                                 \
+                                                                              \
+            if (!s->vstart_eq_zero || !s->vl_eq_vlmax) {                      \
+                /* save opcode for unwinding in case we throw an exception */ \
+                decode_save_opc(s);                                           \
+                egs = tcg_constant_i32(EGS);                                  \
+                gen_helper_egs_check(egs, cpu_env);                           \
+                tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);    \
+            }                                                                 \
+                                                                              \
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
+            TCGv_i32 uimm_v, desc, egs;                                       \
+            uint32_t data = 0;                                                \
+            TCGLabel *over = gen_new_label();                                 \
+                                                                              \
+            if (!s->vstart_eq_zero || !s->vl_eq_vlmax) {                      \
+                /* save opcode for unwinding in case we throw an exception */ \
+                decode_save_opc(s);                                           \
+                egs = tcg_constant_i32(EGS);                                  \
+                gen_helper_egs_check(egs, cpu_env);                           \
+                tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);    \
+            }                                                                 \
+                                                                              \
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
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 11239b59d6f..cca78184e9b 100644
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
@@ -195,3 +197,203 @@ RVVCALL(OPIVX2, vwsll_vx_w, WOP_UUU_W, H8, H4, DO_SLL)
 GEN_VEXT_VX(vwsll_vx_b, 2)
 GEN_VEXT_VX(vwsll_vx_h, 4)
 GEN_VEXT_VX(vwsll_vx_w, 8)
+
+void HELPER(egs_check)(uint32_t egs, CPURISCVState *env)
+{
+    uint32_t vl = env->vl;
+    uint32_t vstart = env->vstart;
+
+    if (vl % egs != 0 || vstart % egs != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+}
+
+static inline void xor_round_key(AESState *round_state, AESState *round_key)
+{
+    round_state->v = round_state->v ^ round_key->v;
+}
+
+#define GEN_ZVKNED_HELPER_VV(NAME, ...)                                   \
+    void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env,            \
+                      uint32_t desc)                                      \
+    {                                                                     \
+        uint32_t vl = env->vl;                                            \
+        uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
+        uint32_t vta = vext_vta(desc);                                    \
+                                                                          \
+        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
+            AESState round_key;                                           \
+            round_key.d[0] = *((uint64_t *)vs2 + H8(i * 2 + 0));          \
+            round_key.d[1] = *((uint64_t *)vs2 + H8(i * 2 + 1));          \
+            AESState round_state;                                         \
+            round_state.d[0] = *((uint64_t *)vd + H8(i * 2 + 0));         \
+            round_state.d[1] = *((uint64_t *)vd + H8(i * 2 + 1));         \
+            __VA_ARGS__;                                                  \
+            *((uint64_t *)vd + H8(i * 2 + 0)) = round_state.d[0];         \
+            *((uint64_t *)vd + H8(i * 2 + 1)) = round_state.d[1];         \
+        }                                                                 \
+        env->vstart = 0;                                                  \
+        /* set tail elements to 1s */                                     \
+        vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);              \
+    }
+
+#define GEN_ZVKNED_HELPER_VS(NAME, ...)                                   \
+    void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env,            \
+                      uint32_t desc)                                      \
+    {                                                                     \
+        uint32_t vl = env->vl;                                            \
+        uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
+        uint32_t vta = vext_vta(desc);                                    \
+                                                                          \
+        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
+            AESState round_key;                                           \
+            round_key.d[0] = *((uint64_t *)vs2 + H8(0));                  \
+            round_key.d[1] = *((uint64_t *)vs2 + H8(1));                  \
+            AESState round_state;                                         \
+            round_state.d[0] = *((uint64_t *)vd + H8(i * 2 + 0));         \
+            round_state.d[1] = *((uint64_t *)vd + H8(i * 2 + 1));         \
+            __VA_ARGS__;                                                  \
+            *((uint64_t *)vd + H8(i * 2 + 0)) = round_state.d[0];         \
+            *((uint64_t *)vd + H8(i * 2 + 1)) = round_state.d[1];         \
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
+        uint32_t rk[8], tmp;
+        static const uint32_t rcon[] = {
+            0x00000001, 0x00000002, 0x00000004, 0x00000008, 0x00000010,
+            0x00000020, 0x00000040, 0x00000080, 0x0000001B, 0x00000036,
+        };
+
+        rk[0] = vs2[i * 4 + H4(0)];
+        rk[1] = vs2[i * 4 + H4(1)];
+        rk[2] = vs2[i * 4 + H4(2)];
+        rk[3] = vs2[i * 4 + H4(3)];
+        tmp = ror32(rk[3], 8);
+
+        rk[4] = rk[0] ^ (((uint32_t)AES_sbox[(tmp >> 24) & 0xff] << 24) |
+                         ((uint32_t)AES_sbox[(tmp >> 16) & 0xff] << 16) |
+                         ((uint32_t)AES_sbox[(tmp >> 8) & 0xff] << 8) |
+                         ((uint32_t)AES_sbox[(tmp >> 0) & 0xff] << 0))
+                      ^ rcon[uimm - 1];
+        rk[5] = rk[1] ^ rk[4];
+        rk[6] = rk[2] ^ rk[5];
+        rk[7] = rk[3] ^ rk[6];
+
+        vd[i * 4 + H4(0)] = rk[4];
+        vd[i * 4 + H4(1)] = rk[5];
+        vd[i * 4 + H4(2)] = rk[6];
+        vd[i * 4 + H4(3)] = rk[7];
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
+        uint32_t rk[12], tmp;
+        static const uint32_t rcon[] = {
+            0x00000001, 0x00000002, 0x00000004, 0x00000008, 0x00000010,
+            0x00000020, 0x00000040, 0x00000080, 0x0000001B, 0x00000036,
+        };
+
+        rk[0] = vd[i * 4 + H4(0)];
+        rk[1] = vd[i * 4 + H4(1)];
+        rk[2] = vd[i * 4 + H4(2)];
+        rk[3] = vd[i * 4 + H4(3)];
+        rk[4] = vs2[i * 4 + H4(0)];
+        rk[5] = vs2[i * 4 + H4(1)];
+        rk[6] = vs2[i * 4 + H4(2)];
+        rk[7] = vs2[i * 4 + H4(3)];
+
+        if (uimm % 2 == 0) {
+            tmp = ror32(rk[7], 8);
+            rk[8] = rk[0] ^ (((uint32_t)AES_sbox[(tmp >> 24) & 0xff] << 24) |
+                             ((uint32_t)AES_sbox[(tmp >> 16) & 0xff] << 16) |
+                             ((uint32_t)AES_sbox[(tmp >> 8) & 0xff] << 8) |
+                             ((uint32_t)AES_sbox[(tmp >> 0) & 0xff] << 0))
+                          ^ rcon[(uimm - 1) / 2];
+        } else {
+            rk[8] = rk[0] ^ (((uint32_t)AES_sbox[(rk[7] >> 24) & 0xff] << 24) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 16) & 0xff] << 16) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 8) & 0xff] << 8) |
+                             ((uint32_t)AES_sbox[(rk[7] >> 0) & 0xff] << 0));
+        }
+        rk[9] = rk[1] ^ rk[8];
+        rk[10] = rk[2] ^ rk[9];
+        rk[11] = rk[3] ^ rk[10];
+
+        vd[i * 4 + H4(0)] = rk[8];
+        vd[i * 4 + H4(1)] = rk[9];
+        vd[i * 4 + H4(2)] = rk[10];
+        vd[i * 4 + H4(3)] = rk[11];
+    }
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
+}
-- 
2.34.1


