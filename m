Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2559EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 16:21:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCN1I-0003dk-22; Thu, 22 Jun 2023 12:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCN17-0002gR-Qh
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 12:18:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCN15-0005pv-IT
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 12:18:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b4f9583404so56131555ad.2
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687450718; x=1690042718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlQQfJpt5YP/8KFD0EcLOqkCH1ejvEd65Ipu6QGIQug=;
 b=k2NcTbi3yI/+XTDWKlajGhb64ywr9u6rsprBLhGF5MERwZJ0EXYA+lV0k7SAR5krUj
 RNit3xrmFYm/MqW2ofKO6t8Xq4qXtebfYUdUZZtSYN+P5k8fOo+TrPEejNikhXaA404l
 RRuGJJGyoyvE1tzOqre5in9shz99GIYKljv6pKjvmqhfbykNlzIci4j0ALJjo7a23qAL
 4VhelBURG4JNG54GRNb1Jxk7a+GxWH8KOoTnXD1rJAOCnMkUvAgm4kGEUW91jFT06gjQ
 BRG1SAMI0cPwPuSMOLcKja6/vEmdQYHtVY4bH7JxnAGDNfRc56myVZis+QTZX0yVBmjQ
 JtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687450718; x=1690042718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlQQfJpt5YP/8KFD0EcLOqkCH1ejvEd65Ipu6QGIQug=;
 b=HABxfkJi0OVRDNA+37MvYqnXkUjSzfCla5qjSJwF6RIFZCjrnGn6uTGowCOSIzz6F5
 RvclgSa0PrLqdOcUq/Qd8tiTq3d64aTC2rPZBkhfSsV0o5VvQidkAuECupvpplYeDmer
 n+20PTq3LYsCY5+Dh+rqA8qE+UCkRkVXR2GMrnGZIpsUpbzc6ZlR2wL1/S69nZMxkacC
 gW4K0f4N1TBtlql0+Krk04Csk9oowHhbe2/1KpkjgKhzTZQi0hzboT55c2KOi1CI0nA2
 zw5wjA3Q8FunrLtOtN4FfeMLzHLHJtro2ugJyF13f8721hBe1HcWfeng9/Ir6oeNZjGR
 urLw==
X-Gm-Message-State: AC+VfDy3FIBHpoiqwjdw3Uck5EtNl9yZBXpYrMI/J/SJaltCzXjbCzpQ
 emxQi0sUtjRUGRjab9CgVDKogA==
X-Google-Smtp-Source: ACHHUZ6gBaCSWr6lVlrxYdzQgzR+8PuDt9jhsLBHGjdmeQYONJSOXzTJcqAZh5W0iFcqJslnBhAVEA==
X-Received: by 2002:a17:902:e810:b0:1ab:11c8:777a with SMTP id
 u16-20020a170902e81000b001ab11c8777amr24437115plg.13.1687450718178; 
 Thu, 22 Jun 2023 09:18:38 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b001b3f039f8a8sm5609683plg.61.2023.06.22.09.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 09:18:37 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>,
 William Salmon <will.salmon@codethink.co.uk>
Subject: [PATCH v4 13/17] target/riscv: Add Zvkg ISA extension support
Date: Fri, 23 Jun 2023 00:16:29 +0800
Message-Id: <20230622161646.32005-14-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230622161646.32005-1-max.chou@sifive.com>
References: <20230622161646.32005-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x636.google.com
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
---
 target/riscv/cpu.c                       |  5 +-
 target/riscv/cpu_cfg.h                   |  1 +
 target/riscv/helper.h                    |  3 +
 target/riscv/insn32.decode               |  4 ++
 target/riscv/insn_trans/trans_rvvk.c.inc | 30 ++++++++++
 target/riscv/vcrypto_helper.c            | 72 ++++++++++++++++++++++++
 6 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c9a9ff80cd..8e60a122d4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
@@ -1198,8 +1199,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f859d9e2f5..b125b0b33f 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -85,6 +85,7 @@ struct RISCVCPUConfig {
     bool ext_zve64d;
     bool ext_zvbb;
     bool ext_zvbc;
+    bool ext_zvkg;
     bool ext_zvkned;
     bool ext_zvknha;
     bool ext_zvknhb;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9220af18e6..a4fe1ff5ca 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1241,3 +1241,6 @@ DEF_HELPER_5(vsha2cl_vv, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
+
+DEF_HELPER_5(vghsh_vv, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_4(vgmul_vv, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5ca83e8462..b10497afd3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -957,3 +957,7 @@ vsha2cl_vv  101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
 # *** Zvksh vector crypto extension ***
 vsm3me_vv   100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsm3c_vi    101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** Zvkg vector crypto extension ***
+vghsh_vv    101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index af1fb74c38..e5ccb26c45 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -510,3 +510,33 @@ static inline bool vsm3c_check(DisasContext *s, arg_rmrr *a)
 
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
index 06c8f4adc7..04e6374211 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -851,3 +851,75 @@ void HELPER(vsm3c_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
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
+        for (uint j = 0; j < 128; j++) {
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
+        for (uint j = 0; j < 128; j++) {
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
2.31.1


