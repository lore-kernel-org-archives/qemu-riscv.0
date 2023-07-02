Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B77DEB64D9
	for <qemu-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 15:57:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFzQc-0004sl-E0; Sun, 02 Jul 2023 11:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzQK-0004c0-LG
 for qemu-riscv@nongnu.org; Sun, 02 Jul 2023 11:55:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzQI-0000Jj-3Q
 for qemu-riscv@nongnu.org; Sun, 02 Jul 2023 11:55:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-666e5f0d60bso1848710b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 02 Jul 2023 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688313337; x=1690905337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aS0dXTLkW+u7nmcwpFCMg/zLai0IpZoABvi8bFk3m00=;
 b=TbGXtNCeOQ7OkaOmiPjfuC3JLz9tAPWoaQxv5WYuXkaoSsyIJXfI0k6UtJz65wjhbu
 mDzIR6b5XEQN+h46DNoDXwLHPlNjgSbkucpdFZGKnCZ/WZ6FAgpdireBifk8CNscwkW/
 yihfdUDKEKIVsIR33x/Jaavbfx+A5PXrJuZHgQX2dxYE6uWqRc/uDjPhiz9L015Mghzl
 mL5d160xuMkNgTCc09MLsYCZZ/mIcF8eVaeqqIFxd5y21AMZl0yeDWQ9hQKu2r65U6eO
 t7OPPUoAWbVTBGln9gRjb8cA5Wg0zvQzSenRUm3biwKRf9DSiAvEabDa4rTr2qoB1aA0
 hX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688313337; x=1690905337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aS0dXTLkW+u7nmcwpFCMg/zLai0IpZoABvi8bFk3m00=;
 b=hkMh2fMY0oDyjerShj5Lk58Yrc8L0/PfWqUhKbllrc/81Bcv2NA6/GjUkO+cMYbpJM
 Ftxm6l8xITDDyPM3/7AsPQEeXsT8ugo8YNYcKMnRDK73hmaF9wF4w1C9+a213Vu4NBKU
 Rw8O0rH3wlHt6PUQY169SzBuS/thT+oKyYH3O/Mjq9bP+3ikHjDGXZ+51fljgL9YG05M
 Y1EIXoCH8nwS2TNwD7EBFeO/zXN8jnzI0XJF18C9JPf7N7jHP7zw+8qkJXd32VkVlqKH
 fa3GWgjUHU+F4CCOADmEDwF6hJqm2hWNJUMuiDzPZqa8+CQi7H1vNSCLCJTwcdbxDOv9
 gEJQ==
X-Gm-Message-State: ABy/qLb2saM7HhB9uqLuE4FtNOIvcRDHgLWWHz6Px++oM7+YoynF4HZc
 mbBo2wjhwKAku4JdlASxKVEb2Q==
X-Google-Smtp-Source: APBJJlFhgH5kwKMjoKH2LQNOS8YVNkZTuoBqGZatSovQ7W3x6Dg2J/eTZ2w/pebuuXD9rPqdMN8Smw==
X-Received: by 2002:a05:6a00:21d1:b0:647:4dee:62b7 with SMTP id
 t17-20020a056a0021d100b006474dee62b7mr8488769pfj.29.1688313336697; 
 Sun, 02 Jul 2023 08:55:36 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 y19-20020aa78553000000b0066f37665a63sm8231969pfn.73.2023.07.02.08.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 08:55:36 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PATCH v7 15/15] target/riscv: Add Zvksed ISA extension support
Date: Sun,  2 Jul 2023 23:53:49 +0800
Message-Id: <20230702155354.2478495-16-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702155354.2478495-1-max.chou@sifive.com>
References: <20230702155354.2478495-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x435.google.com
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

This commit adds support for the Zvksed vector-crypto extension, which
consists of the following instructions:

* vsm4k.vi
* vsm4r.[vv,vs]

Translation functions are defined in
`target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
`target/riscv/vcrypto_helper.c`.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
[lawrence.hunter@codethink.co.uk: Moved SM4 functions from
crypto_helper.c to vcrypto_helper.c]
[nazar.kazakov@codethink.co.uk: Added alignment checks, refactored code to
use macros, and minor style changes]
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                       |   5 +-
 target/riscv/cpu_cfg.h                   |   1 +
 target/riscv/helper.h                    |   4 +
 target/riscv/insn32.decode               |   5 +
 target/riscv/insn_trans/trans_rvvk.c.inc |  43 ++++++++
 target/riscv/vcrypto_helper.c            | 127 +++++++++++++++++++++++
 6 files changed, 184 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 699ab5e9fa..d4c2f77d44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -122,6 +122,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
+    ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
@@ -1196,7 +1197,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * in qemu
      */
     if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg || cpu->cfg.ext_zvkned ||
-         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
+         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed || cpu->cfg.ext_zvksh) &&
+        !cpu->cfg.ext_zve32f) {
         error_setg(errp,
                    "Vector crypto extensions require V or Zve* extensions");
         return;
@@ -1715,6 +1717,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
     DEFINE_PROP_BOOL("x-zvknha", RISCVCPU, cfg.ext_zvknha, false),
     DEFINE_PROP_BOOL("x-zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
+    DEFINE_PROP_BOOL("x-zvksed", RISCVCPU, cfg.ext_zvksed, false),
     DEFINE_PROP_BOOL("x-zvksh", RISCVCPU, cfg.ext_zvksh, false),
 
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 960761c479..a4b60f8a51 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -89,6 +89,7 @@ struct RISCVCPUConfig {
     bool ext_zvkned;
     bool ext_zvknha;
     bool ext_zvknhb;
+    bool ext_zvksed;
     bool ext_zvksh;
     bool ext_zmmul;
     bool ext_zvfh;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 238343cb42..5b9dbc61a0 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1247,3 +1247,7 @@ DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
 
 DEF_HELPER_5(vghsh_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_4(vgmul_vv, void, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsm4k_vi, void, ptr, ptr, i32, env, i32)
+DEF_HELPER_4(vsm4r_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vsm4r_vs, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b10497afd3..dab38e23e3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -961,3 +961,8 @@ vsm3c_vi    101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
 # *** Zvkg vector crypto extension ***
 vghsh_vv    101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 @r2_vm_1
+
+# *** Zvksed vector crypto extension ***
+vsm4k_vi    100001 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vsm4r_vv    101000 1 ..... 10000 010 ..... 1110111 @r2_vm_1
+vsm4r_vs    101001 1 ..... 10000 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index af7cd62e7d..c00c70dfc6 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -561,3 +561,46 @@ static bool vghsh_check(DisasContext *s, arg_rmrr *a)
 }
 
 GEN_VV_UNMASKED_TRANS(vghsh_vv, vghsh_check, ZVKG_EGS)
+
+/*
+ * Zvksed
+ */
+
+#define ZVKSED_EGS 4
+
+static bool zvksed_check(DisasContext *s)
+{
+    int egw_bytes = ZVKSED_EGS << s->sew;
+    return s->cfg_ptr->ext_zvksed == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           MAXSZ(s) >= egw_bytes &&
+           s->sew == MO_32;
+}
+
+static bool vsm4k_vi_check(DisasContext *s, arg_rmrr *a)
+{
+    return zvksed_check(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul);
+}
+
+GEN_VI_UNMASKED_TRANS(vsm4k_vi, vsm4k_vi_check, ZVKSED_EGS)
+
+static bool vsm4r_vv_check(DisasContext *s, arg_rmr *a)
+{
+    return zvksed_check(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul);
+}
+
+GEN_V_UNMASKED_TRANS(vsm4r_vv, vsm4r_vv_check, ZVKSED_EGS)
+
+static bool vsm4r_vs_check(DisasContext *s, arg_rmr *a)
+{
+    return zvksed_check(s) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
+           require_align(a->rd, s->lmul);
+}
+
+GEN_V_UNMASKED_TRANS(vsm4r_vs, vsm4r_vs_check, ZVKSED_EGS)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index f127fc0d3a..5ce77e3934 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "crypto/aes.h"
 #include "crypto/aes-round.h"
+#include "crypto/sm4.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -841,3 +842,129 @@ void HELPER(vgmul_vv)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,
     vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
     env->vstart = 0;
 }
+
+void HELPER(vsm4k_vi)(void *vd, void *vs2, uint32_t uimm5, CPURISCVState *env,
+                      uint32_t desc)
+{
+    const uint32_t egs = 4;
+    uint32_t rnd = uimm5 & 0x7;
+    uint32_t group_start = env->vstart / egs;
+    uint32_t group_end = env->vl / egs;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+
+    for (uint32_t i = group_start; i < group_end; ++i) {
+        uint32_t vstart = i * egs;
+        uint32_t vend = (i + 1) * egs;
+        uint32_t rk[4] = {0};
+        uint32_t tmp[8] = {0};
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            rk[j - vstart] = *((uint32_t *)vs2 + H4(j));
+        }
+
+        for (uint32_t j = 0; j < egs; ++j) {
+            tmp[j] = rk[j];
+        }
+
+        for (uint32_t j = 0; j < egs; ++j) {
+            uint32_t b, s;
+            b = tmp[j + 1] ^ tmp[j + 2] ^ tmp[j + 3] ^ sm4_ck[rnd * 4 + j];
+
+            s = sm4_subword(b);
+
+            tmp[j + 4] = tmp[j] ^ (s ^ rol32(s, 13) ^ rol32(s, 23));
+        }
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            *((uint32_t *)vd + H4(j)) = tmp[egs + (j - vstart)];
+        }
+    }
+
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vext_vta(desc), env->vl * esz, total_elems * esz);
+}
+
+static void do_sm4_round(uint32_t *rk, uint32_t *buf)
+{
+    const uint32_t egs = 4;
+    uint32_t s, b;
+
+    for (uint32_t j = egs; j < egs * 2; ++j) {
+        b = buf[j - 3] ^ buf[j - 2] ^ buf[j - 1] ^ rk[j - 4];
+
+        s = sm4_subword(b);
+
+        buf[j] = buf[j - 4] ^ (s ^ rol32(s, 2) ^ rol32(s, 10) ^ rol32(s, 18) ^
+                               rol32(s, 24));
+    }
+}
+
+void HELPER(vsm4r_vv)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    const uint32_t egs = 4;
+    uint32_t group_start = env->vstart / egs;
+    uint32_t group_end = env->vl / egs;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+
+    for (uint32_t i = group_start; i < group_end; ++i) {
+        uint32_t vstart = i * egs;
+        uint32_t vend = (i + 1) * egs;
+        uint32_t rk[4] = {0};
+        uint32_t tmp[8] = {0};
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            rk[j - vstart] = *((uint32_t *)vs2 + H4(j));
+        }
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            tmp[j - vstart] = *((uint32_t *)vd + H4(j));
+        }
+
+        do_sm4_round(rk, tmp);
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            *((uint32_t *)vd + H4(j)) = tmp[egs + (j - vstart)];
+        }
+    }
+
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vext_vta(desc), env->vl * esz, total_elems * esz);
+}
+
+void HELPER(vsm4r_vs)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    const uint32_t egs = 4;
+    uint32_t group_start = env->vstart / egs;
+    uint32_t group_end = env->vl / egs;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+
+    for (uint32_t i = group_start; i < group_end; ++i) {
+        uint32_t vstart = i * egs;
+        uint32_t vend = (i + 1) * egs;
+        uint32_t rk[4] = {0};
+        uint32_t tmp[8] = {0};
+
+        for (uint32_t j = 0; j < egs; ++j) {
+            rk[j] = *((uint32_t *)vs2 + H4(j));
+        }
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            tmp[j - vstart] = *((uint32_t *)vd + H4(j));
+        }
+
+        do_sm4_round(rk, tmp);
+
+        for (uint32_t j = vstart; j < vend; ++j) {
+            *((uint32_t *)vd + H4(j)) = tmp[egs + (j - vstart)];
+        }
+    }
+
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vext_vta(desc), env->vl * esz, total_elems * esz);
+}
-- 
2.34.1


