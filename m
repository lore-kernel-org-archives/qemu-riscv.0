Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9638BC001DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:03:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGkl-0004Xt-Ll; Tue, 11 Jul 2023 13:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjq-0003sz-5n
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjo-0001Lx-8N
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:21 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-666eec46206so5196268b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689094879; x=1691686879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXY+bqhLBwhzW5suo9NtugGhT0JRM6PCs7I83NdR/rA=;
 b=RZ1/RLsqDZ1L9qsl/rVDJFIB8F6jc8G0LIuwbsk7Kk3PQtkEJnPW2nffkxhF4eKyIv
 N87grTvo+2q+cPyt7fB9ZAwIfJ89DJFUmPMtR06aG/d6kdrANPtbPi7GPVu55IzKsnf8
 Pj1kGDPUEbucNgytSUXZPBu4dOX7eCnb0ttGksx5Ny2vhSVqaaY+oIFdWQYyb8eP3RiM
 X3g5mCB4MmaPygD9nD3BzuUUC5gZHVy17cCUQbYsMIKtZGE1d2nIfa3oOvrUPasRB2i9
 sIZWJV3W135Q/m3TKRaFbiKFnyMF6CqwvmOJHgWJMJU/ATV7SgIzzwP+WxslORc7yN1F
 +sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094879; x=1691686879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXY+bqhLBwhzW5suo9NtugGhT0JRM6PCs7I83NdR/rA=;
 b=EC7vl3ZMdrcw+uJmJA/hvyNkKGPwTHL2JR+CAoIPjkTQAjRuUVZi12AoeVo6JJ4iAW
 Y8gKUi9EAwHOcXPT6IhjN0B8eLCtKRiM2TwmsmdIeTxx5B2DR/8A86j6gwzze89x7alp
 lHU3kfrFD/Mx+WpXJMjPI1PC8tJDWNn/8Rt0kOsvtwwchRzU3Cgu8pKvaedXyqPTBK+a
 gh2I8RxUOCFmGvRWHfoYTbYH2DycrDmzBvoC5cUdfOpzIx8cSOb+GtjgusIy74Ay3XI9
 DALfdmUHyC13iVoosOV9mb9I/BRxSmCeRQdKWF7MFCn0XXlN2oKTLhpS0nRoXxYe2lnu
 fkkw==
X-Gm-Message-State: ABy/qLb6WUgKuFQOnZwSmtrpUqGvdRHWuEaJO7X2CMG77cxH2zZrMkhZ
 wtzkO6p42516J48SokXCPmHwVg==
X-Google-Smtp-Source: APBJJlHCOvSnQdC/xCu/YO0eQAWeZLKWmfTSHD0pUkxC81IDWV7S9I77PVcxPWltQK90zygOLWcTxg==
X-Received: by 2002:a17:90a:ea05:b0:263:e122:a692 with SMTP id
 w5-20020a17090aea0500b00263e122a692mr14155895pjy.49.1689094878256; 
 Tue, 11 Jul 2023 10:01:18 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 gw10-20020a17090b0a4a00b00262fc84b931sm8381793pjb.44.2023.07.11.10.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:01:18 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, alistair23@gmail.com,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PATCH v8 12/15] target/riscv: Add Zvkg ISA extension support
Date: Wed, 12 Jul 2023 00:59:11 +0800
Message-Id: <20230711165917.2629866-13-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
References: <20230711165917.2629866-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x436.google.com
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

This commit adds support for the Zvkg vector-crypto extension, which
consists of the following instructions:

* vgmul.vv
* vghsh.vv

Translation functions are defined in
`target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
`target/riscv/vcrypto_helper.c`.

Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
[max.chou@sifive.com: Replaced vstart checking by TCG op]
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
[max.chou@sifive.com: Exposed x-zvkg property]
[max.chou@sifive.com: Replaced uint by int for cross win32 build]
---
 target/riscv/cpu.c                       |  6 +-
 target/riscv/cpu_cfg.h                   |  1 +
 target/riscv/helper.h                    |  3 +
 target/riscv/insn32.decode               |  4 ++
 target/riscv/insn_trans/trans_rvvk.c.inc | 30 ++++++++++
 target/riscv/vcrypto_helper.c            | 72 ++++++++++++++++++++++++
 6 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2546467f53b..075692582dd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -128,6 +128,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
@@ -1278,8 +1279,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * In principle Zve*x would also suffice here, were they supported
      * in qemu
      */
-    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha ||
-         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
+    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg || cpu->cfg.ext_zvkned ||
+         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
         error_setg(errp,
                    "Vector crypto extensions require V or Zve* extensions");
         return;
@@ -1872,6 +1873,7 @@ static Property riscv_cpu_extensions[] = {
     /* Vector cryptography extensions */
     DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
     DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
+    DEFINE_PROP_BOOL("x-zvkg", RISCVCPU, cfg.ext_zvkg, false),
     DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
     DEFINE_PROP_BOOL("x-zvknha", RISCVCPU, cfg.ext_zvknha, false),
     DEFINE_PROP_BOOL("x-zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index ab2d9294db6..b754ec23446 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -87,6 +87,7 @@ struct RISCVCPUConfig {
     bool ext_zve64d;
     bool ext_zvbb;
     bool ext_zvbc;
+    bool ext_zvkg;
     bool ext_zvkned;
     bool ext_zvknha;
     bool ext_zvknhb;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6d21347c39b..ceec97e1657 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1273,3 +1273,6 @@ DEF_HELPER_5(vsha2cl64_vv, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
+
+DEF_HELPER_5(vghsh_vv, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_4(vgmul_vv, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4050e843f7e..0fae01c6bb3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -995,3 +995,7 @@ vsha2cl_vv  101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
 # *** Zvksh vector crypto extension ***
 vsm3me_vv   100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsm3c_vi    101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** Zvkg vector crypto extension ***
+vghsh_vv    101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index 6469dd2f024..af7cd62e7d0 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -531,3 +531,33 @@ static inline bool vsm3c_check(DisasContext *s, arg_rmrr *a)
 
 GEN_VV_UNMASKED_TRANS(vsm3me_vv, vsm3me_check, ZVKSH_EGS)
 GEN_VI_UNMASKED_TRANS(vsm3c_vi, vsm3c_check, ZVKSH_EGS)
+
+/*
+ * Zvkg
+ */
+
+#define ZVKG_EGS 4
+
+static bool vgmul_check(DisasContext *s, arg_rmr *a)
+{
+    int egw_bytes = ZVKG_EGS << s->sew;
+    return s->cfg_ptr->ext_zvkg == true &&
+           vext_check_isa_ill(s) &&
+           require_rvv(s) &&
+           MAXSZ(s) >= egw_bytes &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           s->sew == MO_32;
+}
+
+GEN_V_UNMASKED_TRANS(vgmul_vv, vgmul_check, ZVKG_EGS)
+
+static bool vghsh_check(DisasContext *s, arg_rmrr *a)
+{
+    int egw_bytes = ZVKG_EGS << s->sew;
+    return s->cfg_ptr->ext_zvkg == true &&
+           opivv_check(s, a) &&
+           MAXSZ(s) >= egw_bytes &&
+           s->sew == MO_32;
+}
+
+GEN_VV_UNMASKED_TRANS(vghsh_vv, vghsh_check, ZVKG_EGS)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index e8bbb698c17..a5e2f7fbb04 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -769,3 +769,75 @@ void HELPER(vsm3c_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
     vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz);
     env->vstart = 0;
 }
+
+void HELPER(vghsh_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
+                      CPURISCVState *env, uint32_t desc)
+{
+    uint64_t *vd = vd_vptr;
+    uint64_t *vs1 = vs1_vptr;
+    uint64_t *vs2 = vs2_vptr;
+    uint32_t vta = vext_vta(desc);
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        uint64_t Y[2] = {vd[i * 2 + 0], vd[i * 2 + 1]};
+        uint64_t H[2] = {brev8(vs2[i * 2 + 0]), brev8(vs2[i * 2 + 1])};
+        uint64_t X[2] = {vs1[i * 2 + 0], vs1[i * 2 + 1]};
+        uint64_t Z[2] = {0, 0};
+
+        uint64_t S[2] = {brev8(Y[0] ^ X[0]), brev8(Y[1] ^ X[1])};
+
+        for (int j = 0; j < 128; j++) {
+            if ((S[j / 64] >> (j % 64)) & 1) {
+                Z[0] ^= H[0];
+                Z[1] ^= H[1];
+            }
+            bool reduce = ((H[1] >> 63) & 1);
+            H[1] = H[1] << 1 | H[0] >> 63;
+            H[0] = H[0] << 1;
+            if (reduce) {
+                H[0] ^= 0x87;
+            }
+        }
+
+        vd[i * 2 + 0] = brev8(Z[0]);
+        vd[i * 2 + 1] = brev8(Z[1]);
+    }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
+    env->vstart = 0;
+}
+
+void HELPER(vgmul_vv)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,
+                      uint32_t desc)
+{
+    uint64_t *vd = vd_vptr;
+    uint64_t *vs2 = vs2_vptr;
+    uint32_t vta = vext_vta(desc);
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        uint64_t Y[2] = {brev8(vd[i * 2 + 0]), brev8(vd[i * 2 + 1])};
+        uint64_t H[2] = {brev8(vs2[i * 2 + 0]), brev8(vs2[i * 2 + 1])};
+        uint64_t Z[2] = {0, 0};
+
+        for (int j = 0; j < 128; j++) {
+            if ((Y[j / 64] >> (j % 64)) & 1) {
+                Z[0] ^= H[0];
+                Z[1] ^= H[1];
+            }
+            bool reduce = ((H[1] >> 63) & 1);
+            H[1] = H[1] << 1 | H[0] >> 63;
+            H[0] = H[0] << 1;
+            if (reduce) {
+                H[0] ^= 0x87;
+            }
+        }
+
+        vd[i * 2 + 0] = brev8(Z[0]);
+        vd[i * 2 + 1] = brev8(Z[1]);
+    }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
+    env->vstart = 0;
+}
-- 
2.34.1


