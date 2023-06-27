Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F86DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:46:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECln-0001Sh-09; Tue, 27 Jun 2023 13:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECli-0001Md-R2
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:22 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEClg-0004tB-Ib
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-55af0a816e4so1248934a12.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687887979; x=1690479979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3GGND+2pu6rv1ao1ogFFLnCQYU3b2OK1dFBVRrGN7w=;
 b=DcO7LGbhkc9B65lTEttF9T0OM8MLxNI7FI7QW1TQLf1o5l9Ab/0axWr3GulkzXmuLC
 L3t0MX2zlU6Xnm7A6O4fc4rzXfP0T57jbpb4zBmEJfLEgEZxrEp1zWSa4C1+jlCTexo2
 GeSicBrd/jXVjpK1bUp5S8d/bt1QsfFGnH+a6R+FmlOo0GzXXBR3VXEn1HN9sMaUlHJl
 lRRnDresP6aLXYVYDCPSuDRQ+XpOo3mCPcY6B0k5CvVZXZfVaRdWEexay4PkWfympCu3
 KTfkUUkZz8wu/XjrmdJkghntzw0bo6MsqjQVpx4+tlFdfP266dQRnizuL3qz0sK4SXiw
 OW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687887979; x=1690479979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3GGND+2pu6rv1ao1ogFFLnCQYU3b2OK1dFBVRrGN7w=;
 b=Ov/eLrp9/6qZk4pAKPP4UFxWorzvMLYNROfu0IrxNEpXERahYWn4lp2AeATyTzlyBK
 vndneOZwSkeu+u5xu3GL3IDArCJ3/gDjbO9zXxtHiWQycb79eLQUB71Uju6psOfO43w/
 88Lz8A8r9+3BH5u0RRoPOfaScbD7huT7k9iLGM3uiAig9Bq9012ewnw2xDnymQCjW9Vu
 EFQaiCqHk+AzUpLKrdn4z51Qdf6DKl1fcw1Rso6sDItD7tnF4V8nReRaNFyM54YlzAjp
 gFmKPNHcLDi8xF5M/Hq3BbcjwgInP40iL8yWTQuT/vlSffKlGO/Z9BocRqtzPDlCHi7w
 jZWw==
X-Gm-Message-State: AC+VfDy0yGe/TWAUZjxvzduwcfhHStnTU7nCBrNKK2HDFnBgVvNWFNJu
 A4xG11QoUro/9fagn0i090avJQ==
X-Google-Smtp-Source: ACHHUZ59D50Q6zeNtCPkzNEU+EoA80T6xZ7wMjcS81IK3FsP5epZWCim8RFK8J75E9V9k9cS2SUcKQ==
X-Received: by 2002:a05:6a21:6d86:b0:122:e4f:25c7 with SMTP id
 wl6-20020a056a216d8600b001220e4f25c7mr22417649pzb.31.1687887978657; 
 Tue, 27 Jun 2023 10:46:18 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa78b49000000b00666e883757fsm5705144pfd.123.2023.06.27.10.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:46:18 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PATCH v6 04/15] target/riscv: Add Zvbc ISA extension support
Date: Wed, 28 Jun 2023 01:45:38 +0800
Message-Id: <20230627174551.65498-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627174551.65498-1-max.chou@sifive.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52c.google.com
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

This commit adds support for the Zvbc vector-crypto extension, which
consists of the following instructions:

* vclmulh.[vx,vv]
* vclmul.[vx,vv]

Translation functions are defined in
`target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
`target/riscv/vcrypto_helper.c`.

Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Co-authored-by: Max Chou <max.chou@sifive.com>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: Max Chou <max.chou@sifive.com>
[max.chou@sifive.com: Exposed x-zvbc property]
---
 target/riscv/cpu.c                       |  9 ++++
 target/riscv/cpu_cfg.h                   |  1 +
 target/riscv/helper.h                    |  6 +++
 target/riscv/insn32.decode               |  6 +++
 target/riscv/insn_trans/trans_rvvk.c.inc | 62 ++++++++++++++++++++++++
 target/riscv/meson.build                 |  3 +-
 target/riscv/translate.c                 |  1 +
 target/riscv/vcrypto_helper.c            | 59 ++++++++++++++++++++++
 8 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 881bddf393..174ae9fe1a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -111,6 +111,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
     ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
     ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
+    ISA_EXT_DATA_ENTRY(zvbc, PRIV_VERSION_1_12_0, ext_zvbc),
     ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
     ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
@@ -1184,6 +1185,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvbc && !cpu->cfg.ext_zve64f) {
+        error_setg(errp, "Zvbc extension requires V or Zve64{f,d} extensions");
+        return;
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1683,6 +1689,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
     DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
 
+    /* Vector cryptography extensions */
+    DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c4a627d335..b6e9bd2e99 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -83,6 +83,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zve64d;
+    bool ext_zvbc;
     bool ext_zmmul;
     bool ext_zvfh;
     bool ext_zvfhmin;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 98e97810fd..be0f0f1058 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1153,3 +1153,9 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 
 /* Zce helper */
 DEF_HELPER_FLAGS_2(cm_jalt, TCG_CALL_NO_WG, tl, env, i32)
+
+/* Vector crypto functions */
+DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vclmulh_vx, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 73d5d1b045..52cd92e262 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -908,3 +908,9 @@ sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
 # *** RV32 Zicond Standard Extension ***
 czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
 czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
+
+# *** Zvbc vector crypto extension ***
+vclmul_vv   001100 . ..... ..... 010 ..... 1010111 @r_vm
+vclmul_vx   001100 . ..... ..... 110 ..... 1010111 @r_vm
+vclmulh_vv  001101 . ..... ..... 010 ..... 1010111 @r_vm
+vclmulh_vx  001101 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
new file mode 100644
index 0000000000..552b08a2fd
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -0,0 +1,62 @@
+/*
+ * RISC-V translation routines for the vector crypto extension.
+ *
+ * Copyright (C) 2023 SiFive, Inc.
+ * Written by Codethink Ltd and SiFive.
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
+/*
+ * Zvbc
+ */
+
+#define GEN_VV_MASKED_TRANS(NAME, CHECK)                     \
+    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)   \
+    {                                                        \
+        if (CHECK(s, a)) {                                   \
+            return opivv_trans(a->rd, a->rs1, a->rs2, a->vm, \
+                               gen_helper_##NAME, s);        \
+        }                                                    \
+        return false;                                        \
+    }
+
+static bool vclmul_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    return opivv_check(s, a) &&
+           s->cfg_ptr->ext_zvbc == true &&
+           s->sew == MO_64;
+}
+
+GEN_VV_MASKED_TRANS(vclmul_vv, vclmul_vv_check)
+GEN_VV_MASKED_TRANS(vclmulh_vv, vclmul_vv_check)
+
+#define GEN_VX_MASKED_TRANS(NAME, CHECK)                     \
+    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)   \
+    {                                                        \
+        if (CHECK(s, a)) {                                   \
+            return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, \
+                               gen_helper_##NAME, s);        \
+        }                                                    \
+        return false;                                        \
+    }
+
+static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    return opivx_check(s, a) &&
+           s->cfg_ptr->ext_zvbc == true &&
+           s->sew == MO_64;
+}
+
+GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
+GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index c3801ee5e0..660078bda1 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -21,7 +21,8 @@ riscv_ss.add(files(
   'translate.c',
   'm128_helper.c',
   'crypto_helper.c',
-  'zce_helper.c'
+  'zce_helper.c',
+  'vcrypto_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8a33da811e..b785f83cdc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1106,6 +1106,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzicbo.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
+#include "insn_trans/trans_rvvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "decode-xthead.c.inc"
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
new file mode 100644
index 0000000000..8b7c63d499
--- /dev/null
+++ b/target/riscv/vcrypto_helper.c
@@ -0,0 +1,59 @@
+/*
+ * RISC-V Vector Crypto Extension Helpers for QEMU.
+ *
+ * Copyright (C) 2023 SiFive, Inc.
+ * Written by Codethink Ltd and SiFive.
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
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/bitops.h"
+#include "cpu.h"
+#include "exec/memop.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "internals.h"
+#include "vector_internals.h"
+
+static uint64_t clmul64(uint64_t y, uint64_t x)
+{
+    uint64_t result = 0;
+    for (int j = 63; j >= 0; j--) {
+        if ((y >> j) & 1) {
+            result ^= (x << j);
+        }
+    }
+    return result;
+}
+
+static uint64_t clmulh64(uint64_t y, uint64_t x)
+{
+    uint64_t result = 0;
+    for (int j = 63; j >= 1; j--) {
+        if ((y >> j) & 1) {
+            result ^= (x >> (64 - j));
+        }
+    }
+    return result;
+}
+
+RVVCALL(OPIVV2, vclmul_vv, OP_UUU_D, H8, H8, H8, clmul64)
+GEN_VEXT_VV(vclmul_vv, 8)
+RVVCALL(OPIVX2, vclmul_vx, OP_UUU_D, H8, H8, clmul64)
+GEN_VEXT_VX(vclmul_vx, 8)
+RVVCALL(OPIVV2, vclmulh_vv, OP_UUU_D, H8, H8, H8, clmulh64)
+GEN_VEXT_VV(vclmulh_vv, 8)
+RVVCALL(OPIVX2, vclmulh_vx, OP_UUU_D, H8, H8, clmulh64)
+GEN_VEXT_VX(vclmulh_vx, 8)
-- 
2.31.1


