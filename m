Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7424EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:03:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGkp-0004al-94; Tue, 11 Jul 2023 13:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjk-0003oB-8m
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:23 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjh-0001Jd-UM
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-55767141512so3163878a12.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689094872; x=1691686872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rEYjOvzgzkdV85fKq22oP94BiDf4VlEL1CiKRHCYYBI=;
 b=lai8REpcHEX+7QzoU/6kDTunOI6mxRPKjfORo7kd8aZU6dlRlKCShww1hrwlao4lr/
 E9plWdXHkKjyETVg4tjKkbbnFQ89ixhw3x1Td5s4YVPIdfNdaven8sgs0vkGysBDljFU
 n2Z/2XLmgJkr3nT5iPEASNlBgrlDEYfPdZN2I3DkWDi/sGX76BafRETRvwV4FdoOc+Ji
 uqHznTUewsrKEJU+F8hphrytO9Wm7mKyehSX5crPBIt97zhkixn58UiV7yEI0W8LZss5
 CGaEjIvxbdYV7BzGgkfAlJFfZCG2zDNZgO4mGJVia99SeQV5vXT9n+qXWb48pQPz462m
 3rwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094872; x=1691686872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rEYjOvzgzkdV85fKq22oP94BiDf4VlEL1CiKRHCYYBI=;
 b=VU36paOjp7zs6edqgxDKeSXMqUF7p4XF+kmKHatAhS8sUVsvlTGkRmxmmXd3Ixs788
 PvitvICAR8fDNKD8JLIKho9/C2cSiVATpJEHgW3X7JOc6Q2//Kznd+XKvVypSYzrfmqL
 N0HSATHDL1L8A+GXIVEXTBk/P1XbiLMvLKebr2mBkUtDPonbPyLMLDhOuYS4manKlrHc
 EtVxxRmA4M/77eZNZ9xKy/Uex2JQ8/Yux2xuZ7M7EYC5QggtW4KoK18bSr76KTH7CZl3
 oBwye2EnO27+YpEFLzetRs5U7s2s0wnn/dgfQu7h7c4MTOQrtKyms9ErPj7k/nD/T2/v
 7U0g==
X-Gm-Message-State: ABy/qLbjDoWTBJpeNtmajuTAvvM+DtngeFcWo4eYHWXJ0raxvBVId+dI
 Tcr9ouVnHRPJEImARkNvFr6lSA==
X-Google-Smtp-Source: APBJJlHVVxQcogWs0ceUNOoidsOYuQmmwT7axNIiRIbE+9ov776iRH2nIYbFa8YoFIGco6y3mI5C6g==
X-Received: by 2002:a17:90b:17c4:b0:256:807e:6bd with SMTP id
 me4-20020a17090b17c400b00256807e06bdmr14052286pjb.28.1689094872011; 
 Tue, 11 Jul 2023 10:01:12 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 gw10-20020a17090b0a4a00b00262fc84b931sm8381793pjb.44.2023.07.11.10.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:01:11 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, alistair23@gmail.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [PATCH v8 11/15] target/riscv: Add Zvksh ISA extension support
Date: Wed, 12 Jul 2023 00:59:10 +0800
Message-Id: <20230711165917.2629866-12-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
References: <20230711165917.2629866-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x536.google.com
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

From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>

This commit adds support for the Zvksh vector-crypto extension, which
consists of the following instructions:

* vsm3me.vv
* vsm3c.vi

Translation functions are defined in
`target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
`target/riscv/vcrypto_helper.c`.

Co-authored-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
[max.chou@sifive.com: Replaced vstart checking by TCG op]
Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
[max.chou@sifive.com: Exposed x-zvksh property]
---
 target/riscv/cpu.c                       |   6 +-
 target/riscv/cpu_cfg.h                   |   1 +
 target/riscv/helper.h                    |   3 +
 target/riscv/insn32.decode               |   4 +
 target/riscv/insn_trans/trans_rvvk.c.inc |  31 ++++++
 target/riscv/vcrypto_helper.c            | 134 +++++++++++++++++++++++
 6 files changed, 177 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e66d9639e20..2546467f53b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -131,6 +131,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
+    ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1277,8 +1278,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * In principle Zve*x would also suffice here, were they supported
      * in qemu
      */
-    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha) &&
-        !cpu->cfg.ext_zve32f) {
+    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha ||
+         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
         error_setg(errp,
                    "Vector crypto extensions require V or Zve* extensions");
         return;
@@ -1874,6 +1875,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
     DEFINE_PROP_BOOL("x-zvknha", RISCVCPU, cfg.ext_zvknha, false),
     DEFINE_PROP_BOOL("x-zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
+    DEFINE_PROP_BOOL("x-zvksh", RISCVCPU, cfg.ext_zvksh, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 800b8783c14..ab2d9294db6 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -90,6 +90,7 @@ struct RISCVCPUConfig {
     bool ext_zvkned;
     bool ext_zvknha;
     bool ext_zvknhb;
+    bool ext_zvksh;
     bool ext_zmmul;
     bool ext_zvfbfmin;
     bool ext_zvfbfwma;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 34329b52fe1..6d21347c39b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1270,3 +1270,6 @@ DEF_HELPER_5(vsha2ch32_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsha2ch64_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsha2cl32_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsha2cl64_vv, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e2b83186dc7..4050e843f7e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -991,3 +991,7 @@ vaeskf2_vi  101010 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsha2ms_vv  101101 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsha2ch_vv  101110 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsha2cl_vv  101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** Zvksh vector crypto extension ***
+vsm3me_vv   100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vsm3c_vi    101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index a35be11b95e..6469dd2f024 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -500,3 +500,34 @@ static bool trans_vsha2ch_vv(DisasContext *s, arg_rmrr *a)
     }
     return false;
 }
+
+/*
+ * Zvksh
+ */
+
+#define ZVKSH_EGS 8
+
+static inline bool vsm3_check(DisasContext *s, arg_rmrr *a)
+{
+    int egw_bytes = ZVKSH_EGS << s->sew;
+    int mult = 1 << MAX(s->lmul, 0);
+    return s->cfg_ptr->ext_zvksh == true &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           !is_overlapped(a->rd, mult, a->rs2, mult) &&
+           MAXSZ(s) >= egw_bytes &&
+           s->sew == MO_32;
+}
+
+static inline bool vsm3me_check(DisasContext *s, arg_rmrr *a)
+{
+    return vsm3_check(s, a) && vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
+}
+
+static inline bool vsm3c_check(DisasContext *s, arg_rmrr *a)
+{
+    return vsm3_check(s, a) && vext_check_ss(s, a->rd, a->rs2, a->vm);
+}
+
+GEN_VV_UNMASKED_TRANS(vsm3me_vv, vsm3me_check, ZVKSH_EGS)
+GEN_VI_UNMASKED_TRANS(vsm3c_vi, vsm3c_check, ZVKSH_EGS)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 2f2099b6fb5..e8bbb698c17 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -635,3 +635,137 @@ void HELPER(vsha2cl64_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
     vext_set_elems_1s(vd, vta, env->vl * esz, total_elems * esz);
     env->vstart = 0;
 }
+
+static inline uint32_t p1(uint32_t x)
+{
+    return x ^ rol32(x, 15) ^ rol32(x, 23);
+}
+
+static inline uint32_t zvksh_w(uint32_t m16, uint32_t m9, uint32_t m3,
+                               uint32_t m13, uint32_t m6)
+{
+    return p1(m16 ^ m9 ^ rol32(m3, 15)) ^ rol32(m13, 7) ^ m6;
+}
+
+void HELPER(vsm3me_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
+                       CPURISCVState *env, uint32_t desc)
+{
+    uint32_t esz = memop_size(FIELD_EX64(env->vtype, VTYPE, VSEW));
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+    uint32_t vta = vext_vta(desc);
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs1 = vs1_vptr;
+    uint32_t *vs2 = vs2_vptr;
+
+    for (int i = env->vstart / 8; i < env->vl / 8; i++) {
+        uint32_t w[24];
+        for (int j = 0; j < 8; j++) {
+            w[j] = bswap32(vs1[H4((i * 8) + j)]);
+            w[j + 8] = bswap32(vs2[H4((i * 8) + j)]);
+        }
+        for (int j = 0; j < 8; j++) {
+            w[j + 16] =
+                zvksh_w(w[j], w[j + 7], w[j + 13], w[j + 3], w[j + 10]);
+        }
+        for (int j = 0; j < 8; j++) {
+            vd[(i * 8) + j] = bswap32(w[H4(j + 16)]);
+        }
+    }
+    vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz);
+    env->vstart = 0;
+}
+
+static inline uint32_t ff1(uint32_t x, uint32_t y, uint32_t z)
+{
+    return x ^ y ^ z;
+}
+
+static inline uint32_t ff2(uint32_t x, uint32_t y, uint32_t z)
+{
+    return (x & y) | (x & z) | (y & z);
+}
+
+static inline uint32_t ff_j(uint32_t x, uint32_t y, uint32_t z, uint32_t j)
+{
+    return (j <= 15) ? ff1(x, y, z) : ff2(x, y, z);
+}
+
+static inline uint32_t gg1(uint32_t x, uint32_t y, uint32_t z)
+{
+    return x ^ y ^ z;
+}
+
+static inline uint32_t gg2(uint32_t x, uint32_t y, uint32_t z)
+{
+    return (x & y) | (~x & z);
+}
+
+static inline uint32_t gg_j(uint32_t x, uint32_t y, uint32_t z, uint32_t j)
+{
+    return (j <= 15) ? gg1(x, y, z) : gg2(x, y, z);
+}
+
+static inline uint32_t t_j(uint32_t j)
+{
+    return (j <= 15) ? 0x79cc4519 : 0x7a879d8a;
+}
+
+static inline uint32_t p_0(uint32_t x)
+{
+    return x ^ rol32(x, 9) ^ rol32(x, 17);
+}
+
+static void sm3c(uint32_t *vd, uint32_t *vs1, uint32_t *vs2, uint32_t uimm)
+{
+    uint32_t x0, x1;
+    uint32_t j;
+    uint32_t ss1, ss2, tt1, tt2;
+    x0 = vs2[0] ^ vs2[4];
+    x1 = vs2[1] ^ vs2[5];
+    j = 2 * uimm;
+    ss1 = rol32(rol32(vs1[0], 12) + vs1[4] + rol32(t_j(j), j % 32), 7);
+    ss2 = ss1 ^ rol32(vs1[0], 12);
+    tt1 = ff_j(vs1[0], vs1[1], vs1[2], j) + vs1[3] + ss2 + x0;
+    tt2 = gg_j(vs1[4], vs1[5], vs1[6], j) + vs1[7] + ss1 + vs2[0];
+    vs1[3] = vs1[2];
+    vd[3] = rol32(vs1[1], 9);
+    vs1[1] = vs1[0];
+    vd[1] = tt1;
+    vs1[7] = vs1[6];
+    vd[7] = rol32(vs1[5], 19);
+    vs1[5] = vs1[4];
+    vd[5] = p_0(tt2);
+    j = 2 * uimm + 1;
+    ss1 = rol32(rol32(vd[1], 12) + vd[5] + rol32(t_j(j), j % 32), 7);
+    ss2 = ss1 ^ rol32(vd[1], 12);
+    tt1 = ff_j(vd[1], vs1[1], vd[3], j) + vs1[3] + ss2 + x1;
+    tt2 = gg_j(vd[5], vs1[5], vd[7], j) + vs1[7] + ss1 + vs2[1];
+    vd[2] = rol32(vs1[1], 9);
+    vd[0] = tt1;
+    vd[6] = rol32(vs1[5], 19);
+    vd[4] = p_0(tt2);
+}
+
+void HELPER(vsm3c_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
+                      CPURISCVState *env, uint32_t desc)
+{
+    uint32_t esz = memop_size(FIELD_EX64(env->vtype, VTYPE, VSEW));
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+    uint32_t vta = vext_vta(desc);
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs2 = vs2_vptr;
+    uint32_t v1[8], v2[8], v3[8];
+
+    for (int i = env->vstart / 8; i < env->vl / 8; i++) {
+        for (int k = 0; k < 8; k++) {
+            v2[k] = bswap32(vd[H4(i * 8 + k)]);
+            v3[k] = bswap32(vs2[H4(i * 8 + k)]);
+        }
+        sm3c(v1, v2, v3, uimm);
+        for (int k = 0; k < 8; k++) {
+            vd[i * 8 + k] = bswap32(v1[H4(k)]);
+        }
+    }
+    vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz);
+    env->vstart = 0;
+}
-- 
2.34.1


