Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F655C9830E
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 08:27:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAkCu-00044N-SO; Sun, 27 Sep 2026 04:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xAkCp-00042a-3r
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 04:25:55 -0400
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xAkCl-0004g2-W5
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 04:25:54 -0400
Received: by mail-pj2-x0e.google.com with SMTP id
 d9443c01a7336-2df8818fe1eso6282075ad.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1790497550; x=1791102350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ucQ9hpBuHKQDRQGJKG7PC5iFGUXj/Gji10OSPQI1sI0=;
 b=OW0LJXBrynyotHQTx71AbPwN0nTF47eg9SoXe0zvJkcqJUheKwx82UQF4pfQjfb09r
 VL2h2KNJgDqx80SgIq7srzEuvOj4Y8qXmOUOqFDKDELiR9LOUqK0shKo2uY+bIUJoHdb
 dWkiM12UwOW2yu9z51s3XkPziPHY6lBurVKp9Dzfbtm1/cin83th/3wcXhSokB5IOznn
 lDwS8tOlrX88at+l6p/0WSQQyjwRCXGRkXwFmfCxSi7HMryeY6msjN6mycVcAQbEkykM
 4DXYKJplTf74+HSjsgqthNKdHDWDdAHWTvVa6Bq9eNawPeytKdPV1RhRisY07VvW0Ec+
 Mx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790497550; x=1791102350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ucQ9hpBuHKQDRQGJKG7PC5iFGUXj/Gji10OSPQI1sI0=;
 b=dhdxkPMng+/o2Utf9lMxVngfAJyO3Dkby43IDwSfrZ6Jt33zJmiheKhmNid/6fk2RS
 /eXOlAV3/Jv3rjN64DUX46rB/Sko3j8v1/sRlEO8jiEc/LGv8QEUJoWqzj0xVeZbwKA5
 Hy0Quu6XaJmcIUMFPBVFwl8DLJt5+5gttCjCQzPZpEyjBzzE1bSrgaoNOydKdHuEX2Ho
 FUrg3UZyhwwPHBMtAQH9StAOThkzk68+HEQBV9cj09cxJGXPUGSnoaKdnj43gaTHKqfa
 hE6sA/QuhggRJZ9XgpAn+w7kJEumjxesC0WCtlc6q9TYhxXkOO2DnrZkqFn/7pgNrDF8
 tOdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBynUwqkrhWKn6+pOfhvoAZm10QaDs7x/aAZ/PB/1nbZYaxM0veftGiAxfpymLJ57m4Uuv1sVQTTFgcG@nongnu.org
X-Gm-Message-State: AFq9FYJKGu4P5Rw9OiZC0Ox6P0G5xzkOxxnnvaEnqZyqxYnW/g4xXjxl
 nPIlxKMvkA+W8sGGDXLfMDYPw2KsHn5MBQ5cPkjVQgrClq4j+zvxAr8teyigXIJpoUg=
X-Gm-Gg: AYBFou09OttMraak4gqNmFS07zqF+wdQNX+OpMlXhIzESj9h/4SHUpyp0Nqd+kJQJ/P
 M5YpGl4vjlMy4URTerEcxVbMwy2PHl8hcGJPltigvOgtrxKc69tEHUqrGXQa2tZbsZnNmMkR/B1
 zQnKzhPmlJVENjT+aKjIBrmVKDQSzYbCj0p2Y00S0NoyAqRP5TElUJBme6KDKNuaVByGpHtcMsH
 xisrhtGsDP4tZtCDWpUMJcXXnN8tRq747ru4ENI5TYxyBd6kg9mta3ZEVGi8Hn1j2MyJsJ8DnUK
 QjIY/Ka6Jj7QyvzPgJ8qQtS3BzfINdEr82LZd118Dz+Eehd9oorpWCRleB+3i4tMj25Cys10f4d
 /jmFZeBxYfzoi+DnQYPlkCEL9S5o9IoEtOA0edFAVrCm12w1A1UmyqBRG8HFz0LSVzOwARoGmxV
 JBQxb3HdFVStfTL4SWTzECRV7Gbx7uPidlNeDZkToq6yaOydCjan/wm8H8Sb7XiUyK3ESriQ284
 3hdch/sOqbVwkUseRGPI0pvVBO8K5MYhR2B0njfbeZlWLY8V1HmgopoCjJS5Z8EgkvW63HfYg==
X-Received: by 2002:a17:90b:524d:b0:39e:3d38:7ef1 with SMTP id
 98e67ed59e1d1-3a09864b133mr5814301a91.10.1790497550212; 
 Sun, 27 Sep 2026 01:25:50 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0b9357f64sm14498871a91.3.2026.09.27.01.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 01:25:49 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/6] target/riscv: rvv: Add SiFive custom int8 matmul
 instructions
Date: Sun, 27 Sep 2026 16:25:32 +0800
Message-ID: <20260927082534.3228237-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927082534.3228237-1-max.chou@sifive.com>
References: <20260927082534.3228237-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::e;
 envelope-from=max.chou@sifive.com; helo=mail-pj2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Frank Chang <frank.chang@sifive.com>

Add the 8 SiFive custom int8 matrix-multiply vector instructions:
sf.vqmacc{u,,us,su}.4x8x4 and sf.vqmacc{u,,us,su}.2x8x2. Each name
suffix encodes the signedness of vs1/vs2.
The 4x8x4 forms multiply-accumulate a 4x8 by 8x4 int8 tile into a
4x4 int32 result; the 2x8x2 forms use a 2x8 by 8x2 tile producing a
2x2 int32 result. Both Xsfvqmaccqoq/Xsfvqmaccdod extensions are
gated on vlenb >= 32, sew == 8 and vm == 1, per the SiFive Int8
Matrix Multiplication Extensions Specification.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 MAINTAINERS                                 |  8 ++
 target/riscv/cpu_cfg.h                      |  5 ++
 target/riscv/helper.h                       | 10 +++
 target/riscv/meson.build                    |  1 +
 target/riscv/tcg/insn_trans/trans_xsf.c.inc | 98 +++++++++++++++++++++
 target/riscv/tcg/meson.build                |  1 +
 target/riscv/tcg/translate.c                |  3 +
 target/riscv/tcg/xsf_helper.c               | 87 ++++++++++++++++++
 target/riscv/xsf.decode                     | 30 +++++++
 9 files changed, 243 insertions(+)
 create mode 100644 target/riscv/tcg/insn_trans/trans_xsf.c.inc
 create mode 100644 target/riscv/tcg/xsf_helper.c
 create mode 100644 target/riscv/xsf.decode

diff --git a/MAINTAINERS b/MAINTAINERS
index 43d5d3715e4..a3a8199840f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -399,6 +399,14 @@ F: target/riscv/XVentanaCondOps.decode
 F: target/riscv/insn_trans/trans_xventanacondops.c.inc
 F: disas/riscv-xventana*
 
+RISC-V SiFive (Xsf*) extensions
+M: Max Chou <max.chou@sifive.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/xsf.decode
+F: target/riscv/tcg/insn_trans/trans_xsf.c.inc
+F: target/riscv/tcg/xsf_helper.c
+
 RENESAS RX CPUs
 R: Yoshinori Sato <yoshinori.sato@nifty.com>
 S: Orphan
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 211d0708ba4..d6db1cfb7cc 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -51,6 +51,11 @@ static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
            cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
 }
 
+static inline bool has_xsf_p(const RISCVCPUConfig *cfg)
+{
+    return cfg->ext_xsfvqmaccdod || cfg->ext_xsfvqmaccqoq;
+}
+
 #define MATERIALISE_EXT_PREDICATE(ext) \
     static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
     { \
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index aab92bf132a..43ef6b3ff92 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1362,3 +1362,13 @@ DEF_HELPER_FLAGS_3(sc_probe_write, TCG_CALL_NO_WG, void, env, tl, tl)
 /* Invalidate reservations overlapping a completed linux-user store. */
 DEF_HELPER_3(riscv_invalidate_reservations, void, env, tl, tl)
 #endif
+
+/* SiFive Custom int8 Matrix-Multiply */
+DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmacc_4x8x4, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmaccus_4x8x4, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmaccsu_4x8x4, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmaccu_2x8x2, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmacc_2x8x2, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmaccus_2x8x2, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(sf_vqmaccsu_2x8x2, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index e1b51d2bd4d..da1df1e74e6 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -6,6 +6,7 @@ gen = [
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
   decodetree.process('xmips.decode', extra_args: '--static-decode=decode_xmips'),
   decodetree.process('xlrbr.decode', extra_args: '--static-decode=decode_xlrbr'),
+  decodetree.process('xsf.decode', extra_args: '--static-decode=decode_xsf'),
 ]
 
 riscv_ss = ss.source_set()
diff --git a/target/riscv/tcg/insn_trans/trans_xsf.c.inc b/target/riscv/tcg/insn_trans/trans_xsf.c.inc
new file mode 100644
index 00000000000..1677352689f
--- /dev/null
+++ b/target/riscv/tcg/insn_trans/trans_xsf.c.inc
@@ -0,0 +1,98 @@
+/*
+ * RISC-V translation routines for the SiFive vendor extensions (xsf*)
+ *
+ * Copyright (c) 2023 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+
+/*
+ * SiFive Xsfvqmaccdod/Xsfvqmaccqoq custom int8 matrix-multiply extensions
+ */
+static bool sf_int8_matmul_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           s->vstart_eq_zero &&
+           (s->cfg_ptr->vlenb >= 32) &&
+           (s->sew == MO_8) &&
+           (a->vm == 1);
+}
+
+static bool sf_int8_matmul_4x8x4_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * vd  has EMUL=2*LMUL
+     * vs2 has EMUL=LMUL
+     * vs1 has EMUL=1
+     * vd must not overlap vs1
+     */
+    return sf_int8_matmul_check(s, a) &&
+           (s->cfg_ptr->ext_xsfvqmaccqoq) &&
+           (s->lmul <= 2) &&
+           require_align(a->rd, s->lmul + 1) &&
+           require_align(a->rs2, s->lmul) &&
+           require_align(a->rs1, 0) &&
+           require_noover(a->rd, s->lmul + 1, a->rs2, s->lmul) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul + 1, 0), a->rs1, 1);
+}
+
+static bool sf_int8_matmul_2x8x2_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * vd  has EMUL=LMUL
+     * vs2 has EMUL=LMUL
+     * vs1 has EMUL=1
+     * vd must not overlap vs1
+     */
+    return sf_int8_matmul_check(s, a) &&
+           (s->cfg_ptr->ext_xsfvqmaccdod) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           require_align(a->rs1, 0) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
+}
+
+static bool sf_int8_matmul_op(DisasContext *s, arg_rmrr *a, uint8_t seq)
+{
+    static gen_helper_gvec_3_ptr * const fns[8] = {
+        gen_helper_sf_vqmaccu_4x8x4, gen_helper_sf_vqmacc_4x8x4,
+        gen_helper_sf_vqmaccus_4x8x4, gen_helper_sf_vqmaccsu_4x8x4,
+        gen_helper_sf_vqmaccu_2x8x2, gen_helper_sf_vqmacc_2x8x2,
+        gen_helper_sf_vqmaccus_2x8x2, gen_helper_sf_vqmaccsu_2x8x2,
+    };
+
+    /*
+     * The helper raises an illegal-instruction exception when vl is not a
+     * multiple of the tile size; save the opcode so mtval/stval report the
+     * faulting instruction if that exception is thrown.
+     */
+    decode_save_opc(s, 0);
+
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
+                       vreg_ofs(s, a->rs2), tcg_env,
+                       s->cfg_ptr->vlenb, s->cfg_ptr->vlenb, 0, fns[seq]);
+
+    finalize_rvv_inst(s);
+
+    return true;
+}
+
+#define GEN_SF_INT8_MATMUL_TRANS(NAME, CHECK, SEQ)       \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)   \
+{                                                        \
+    if (CHECK(s, a)) {                                   \
+        return sf_int8_matmul_op(s, a, SEQ);             \
+    }                                                    \
+    return false;                                        \
+}
+
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccu_4x8x4,  sf_int8_matmul_4x8x4_check, 0)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmacc_4x8x4,   sf_int8_matmul_4x8x4_check, 1)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccus_4x8x4, sf_int8_matmul_4x8x4_check, 2)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccsu_4x8x4, sf_int8_matmul_4x8x4_check, 3)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccu_2x8x2,  sf_int8_matmul_2x8x2_check, 4)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmacc_2x8x2,   sf_int8_matmul_2x8x2_check, 5)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccus_2x8x2, sf_int8_matmul_2x8x2_check, 6)
+GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccsu_2x8x2, sf_int8_matmul_2x8x2_check, 7)
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
index a05ab642f41..86805b30cbc 100644
--- a/target/riscv/tcg/meson.build
+++ b/target/riscv/tcg/meson.build
@@ -15,6 +15,7 @@ riscv_ss.add(files(
   'vcrypto_helper.c',
   'vector_helper.c',
   'vector_internals.c',
+  'xsf_helper.c',
   'zce_helper.c'))
 
 
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index cce3b6dc721..f88997c859c 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -1246,10 +1246,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "decode-xthead.c.inc"
 #include "decode-xmips.c.inc"
 #include "decode-xlrbr.c.inc"
+#include "decode-xsf.c.inc"
 #include "insn_trans/trans_xthead.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
 #include "insn_trans/trans_xmips.c.inc"
 #include "insn_trans/trans_xlrbr.c.inc"
+#include "insn_trans/trans_xsf.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
@@ -1270,6 +1272,7 @@ const RISCVDecoder decoder_table[] = {
     { has_xthead_p, decode_xthead},
     { has_XVentanaCondOps_p, decode_XVentanaCodeOps},
     { has_xlrbr_p, decode_xlrbr},
+    { has_xsf_p, decode_xsf },
 };
 
 const size_t decoder_table_size = ARRAY_SIZE(decoder_table);
diff --git a/target/riscv/tcg/xsf_helper.c b/target/riscv/tcg/xsf_helper.c
new file mode 100644
index 00000000000..6e953d12493
--- /dev/null
+++ b/target/riscv/tcg/xsf_helper.c
@@ -0,0 +1,87 @@
+/*
+ * RISC-V translation helpers for the SiFive vendor extensions (xsf*)
+ *
+ * Copyright (c) 2023 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "internals.h"
+#include "vector_internals.h"
+
+#define QOP_SUU_B int32_t, uint8_t, uint8_t, int32_t, int32_t
+#define QOP_SUS_B int32_t, uint8_t, int8_t, int32_t, int32_t
+#define QOP_SSU_B int32_t, int8_t, uint8_t, int32_t, int32_t
+#define QOP_SSS_B int32_t, int8_t, int8_t, int32_t, int32_t
+
+/* SiFive Custom int8 Matrix-Multiply */
+/*
+ * vd may overlap vs2, we need to allocate an additional vd array
+ * to save temporary results of vd and write them back at the end.
+ */
+#define GEN_VEXT_SF_INT8_MATMUL(NAME, TD, T1, T2, TX1, TX2,           \
+                                HD, HS1, HS2, ROWS, COLS, TILE_SIZE)  \
+void HELPER(NAME)(void *vd, void *vs1, void *vs2,                     \
+                  CPURISCVState *env, uint32_t desc)                  \
+{                                                                     \
+    int it, il, in, im, ivd, ivs1, ivs2;                              \
+    TD *vds;                                                          \
+                                                                      \
+    if (env->vl % TILE_SIZE) {                                        \
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC()); \
+        return;                                                       \
+    }                                                                 \
+                                                                      \
+    VSTART_CHECK_EARLY_EXIT(env, env->vl);                            \
+                                                                      \
+    vds = g_malloc0(sizeof(TD) *                                      \
+                    ROWS * ROWS * (env->vl / TILE_SIZE));             \
+                                                                      \
+    for (it = 0; it < (env->vl / TILE_SIZE); it++) {                  \
+        for (il = 0; il < ROWS; il++) {                               \
+            for (in = 0; in < ROWS; in++) {                           \
+                ivd = ROWS * ROWS * it + ROWS * il + in;              \
+                vds[ivd] = *((TD *)vd + HD(ivd));                     \
+                for (im = 0; im < COLS; im++) {                       \
+                    ivs1 = il * COLS + im;                            \
+                    ivs2 = TILE_SIZE * it + im * ROWS + in;           \
+                    T1 s1 = *((T1 *)vs1 + HS1(ivs1));                 \
+                    T2 s2 = *((T2 *)vs2 + HS2(ivs2));                 \
+                    vds[ivd] += (TX1)s1 * (TX2)s2;                    \
+                }                                                     \
+            }                                                         \
+        }                                                             \
+    }                                                                 \
+                                                                      \
+    for (it = 0; it < (env->vl / TILE_SIZE); it++) {                  \
+        for (il = 0; il < ROWS; il++) {                               \
+            for (in = 0; in < ROWS; in++) {                           \
+                ivd = ROWS * ROWS * it + ROWS * il + in;              \
+                *((TD *)vd + HD(ivd)) = vds[ivd];                     \
+            }                                                         \
+        }                                                             \
+    }                                                                 \
+                                                                      \
+    env->vstart = 0;                                                  \
+    g_free(vds);                                                      \
+}
+
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccu_4x8x4, QOP_SUU_B, H4, H1, H1,
+        4, 8, 32)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmacc_4x8x4, QOP_SSS_B, H4, H1, H1,
+        4, 8, 32)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccus_4x8x4, QOP_SUS_B, H4, H1, H1,
+        4, 8, 32)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccsu_4x8x4, QOP_SSU_B, H4, H1, H1,
+        4, 8, 32)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccu_2x8x2, QOP_SUU_B, H4, H1, H1,
+        2, 8, 16)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmacc_2x8x2, QOP_SSS_B, H4, H1, H1,
+        2, 8, 16)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccus_2x8x2, QOP_SUS_B, H4, H1, H1,
+        2, 8, 16)
+RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccsu_2x8x2, QOP_SSU_B, H4, H1, H1,
+        2, 8, 16)
diff --git a/target/riscv/xsf.decode b/target/riscv/xsf.decode
new file mode 100644
index 00000000000..bb585046ab1
--- /dev/null
+++ b/target/riscv/xsf.decode
@@ -0,0 +1,30 @@
+#
+# RISC-V translation routines for the SiFive vendor extensions
+#
+# Copyright (c) 2023 SiFive, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Fields:
+%rs2       20:5
+%rs1       15:5
+%rd        7:5
+%vm        25:1
+
+# Argument sets:
+&rmrr      vm rd rs1 rs2                           !extern
+
+# Formats:
+@r_vm_1    ......  . ..... ..... ... ..... ....... &rmrr vm=1 %rs2 %rs1 %rd
+
+# *** Xsfvqmaccqoq: SiFive custom int8 matrix-multiply (4x8x4 tile) ***
+sf_vqmaccu_4x8x4    111100 1 ..... ..... 010 ..... 1011011 @r_vm_1
+sf_vqmacc_4x8x4     111101 1 ..... ..... 010 ..... 1011011 @r_vm_1
+sf_vqmaccus_4x8x4   111110 1 ..... ..... 010 ..... 1011011 @r_vm_1
+sf_vqmaccsu_4x8x4   111111 1 ..... ..... 010 ..... 1011011 @r_vm_1
+
+# *** Xsfvqmaccdod: SiFive custom int8 matrix-multiply (2x8x2 tile) ***
+sf_vqmaccu_2x8x2    101100 1 ..... ..... 010 ..... 1011011 @r_vm_1
+sf_vqmacc_2x8x2     101101 1 ..... ..... 010 ..... 1011011 @r_vm_1
+sf_vqmaccus_2x8x2   101110 1 ..... ..... 010 ..... 1011011 @r_vm_1
+sf_vqmaccsu_2x8x2   101111 1 ..... ..... 010 ..... 1011011 @r_vm_1
-- 
2.43.0


