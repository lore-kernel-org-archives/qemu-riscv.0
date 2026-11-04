Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79189608F126
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BzKu7frt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOguC-0006bN-Dq; Wed, 04 Nov 2026 14:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgu3-00068N-E5
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:11 -0500
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgu1-0002h7-Du
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:11 -0500
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-36dbde64409so518267eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821448; x=1794426248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c/Juck9GqN26BGexcmn+jBvq9fI6ET752RrJV65roSs=;
 b=BzKu7frte+ZiB2HeGf3tX0zvqFdu6x13Tg92xaAE4xp3Q2lti+5ZoRYqnUnSx76AjC
 IbJTa7sGQfpmoQFuCq7KwzU2iHqfzDRMtytIYTtkgxF24y0bRV158iBatWeiEVfMprg5
 Gt5wkE0+Ez4AEL87K3lbKLZn8103epDvawgeJxgymTIIZhUaHQ556R8pKvmtabFSeJ1F
 gz6tV61dXUbXGYp156XzVAAKweQOgZppbUHqx0N+LayDOIG19DLZbYCFEz1oqZRWspIB
 MqUyRPuH/UuM92Za2ydFEDtvQaY2LIdUH/PNIN6aCZ8UWJISvavmtVfvEm7HEcZRHhZT
 m43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821448; x=1794426248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c/Juck9GqN26BGexcmn+jBvq9fI6ET752RrJV65roSs=;
 b=hpfSuecDnD9E5KdxUT0YFM0x12n7dSAEhor0xY7XkWsb6nVRRfyhnKzDY0z8y8e/Bj
 UAhhThprH+38P7IpsSeJjQXFyDpMAD7pNcxO+21bT1ujzn41u5u31GG8rpmuzL/4fhmE
 EbdDSaT5rP2yJdA4WyCKpcqwy4MJAeG17f2/qZVFJ8IWgWFodDu1ZaHLv5sn5mu5/xwt
 ODS4W5kTFAKEQHZr80T9eSepke1u+7XWsidaWCu9X68kKPaRhAZx6oQuJpyqWgwcCKaI
 iyThisgd4O3o2CV47lRI5R5GYVw1bWJ0flBvcjclmGpLUiXCvbF48QsToF4HNRah/H4g
 dxyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwpSGsiCh6cQFI5sEfT1ivoaXh5Zt2nio3jBrXTfXhgXQclebgt3+PYETj37JRQjotjo4JveByfN9t3@nongnu.org
X-Gm-Message-State: APuU4Z86aGusc/MMq8rkQgUu3lHIHPD5O7Kzmq1/aRY0wA8KS3bzZWwb
 ef57msyQPtiNi9hW4/rB1hcm8JXpEgFCF7CSHDZcQFWGJVz5qDHWXLdGyR9bn4l5NkQ=
X-Gm-Gg: AYBFou0MVH6T4jSW1ckCbALg49P3veBvKw/sGQYWcrkX8XmrJk+wdLBO932cg67krWk
 cVDqeocRSVjD4TqUYbC/KuPAifCkJjUGXge1AH3609RWuTKOlymJHUBi5HesLcKvrajIUB3Y1iD
 05NUaEk3lbUrnirpsHHKQ6hILinH4Uv1QQClau5abY7yRL8r4eoI7kGIKjr2j5I0EFIqLBPAcxA
 JDZBt+6ga/YHNzgXvd8uyT9FsqTSv4cGc9HDkBn11wNVduyR9wLOFUnBFdkQomR4BHLl/7z/Bo/
 TmBgnHKVeCSlX2NmknwlioqhcACGviJreGAy4u03lXhLV0HOmaqhS4cXFRzzoqaWLIXuve2gVZG
 825km+DmDtlwDoQ9CINorGjzP5HTZh6P6N9K1ouIK59h7zh+W4vk8X4UKx8kntLe0kawdTcFai5
 AeVxMzP8VjiY2UoofHF40k9fuAz4eBmXqcosin6COjdG9t4JUfhM2a/wmKerekWvNPTkrs6aZ68
 Xfll5LNGrwsN6DO/PE5n7cMnhL6QHVT0S6qgcv3ZbbXXa4HqEyCKJxk85cDYsOlG37BKkVxYqic
 ON6NS7HCjIkUL7UNXuJMHftkWFUrVp5sxyr1R2CAd1qhOuqSLQCmaqu2tiG+0OkAvwTHzvwecXT
 HeTdo9iQHSAO4EOXGYcPwD3ZhPSJ4auGZfU1eG5xsNTwK4Wfusw==
X-Received: by 2002:a05:7300:ec82:b0:36d:7f5f:7e97 with SMTP id
 5a478bee46e88-36d7f5f8290mr1817184eec.40.1793821447886; 
 Wed, 04 Nov 2026 11:44:07 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:44:07 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 36/38] target/riscv: rvv: Implement Zvfbdota32f
 instructions
Date: Thu,  5 Nov 2026 03:41:51 +0800
Message-ID: <20261104194155.679241-37-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1334.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the Zvfbdota32f FP32 batched dot-product instruction.
The vfbdota.vv instruction performs 8 parallel dot products between
FP32 vectors, accumulating into FP32 elements.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/helper.h                       |  3 ++
 target/riscv/insn32.decode                  |  3 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 11 ++++
 target/riscv/tcg/vector_helper.c            | 58 +++++++++++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a257436fb31..94f4d9c40c6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1398,6 +1398,9 @@ DEF_HELPER_6(vfwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
 /* Zvfwbdota16bf - BF16 Batched Dot Product */
 DEF_HELPER_7(vfwbdota_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
 
+/* Zvfbdota32f - FP32 Batched Dot Product */
+DEF_HELPER_7(vfbdota_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
+
 /* Zvfqwbdota8f - OCP FP8 Batched Dot Product */
 DEF_HELPER_7(vfqwbdota_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
 DEF_HELPER_7(vfqwbdota_alt_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 48597915f7b..7fdb7eb54da 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1112,6 +1112,9 @@ vfwbdota_vv 101100 . ..... ..... 001 ..... 1110111 @r_vm
 vfqwbdota_vv     101110 . ..... ..... 001 ..... 1110111 @r_vm
 vfqwbdota_alt_vv 101111 . ..... ..... 001 ..... 1110111 @r_vm
 
+# *** Zvfbdota32f FP32 Batched Dot-Product Extension ***
+vfbdota_vv  101011 . ..... ..... 001 ..... 1110111 @r_vm
+
 # *** Zvfqwdota8f OCP FP8 Dot-Product Extension ***
 vfqwdota_vv     100110 . ..... ..... 001 ..... 1110111 @r_vm
 vfqwdota_alt_vv 100111 . ..... ..... 001 ..... 1110111 @r_vm
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index 50f0f67ea60..9b06c6a782c 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -4430,3 +4430,14 @@ static bool vext_vfqwbdota_check(DisasContext *s, arg_rmrr * a)
 
 GEN_ZVBDOTA_FP_TRANS(vfqwbdota_vv, vext_vfqwbdota_check, MO_32)
 GEN_ZVBDOTA_FP_TRANS(vfqwbdota_alt_vv, vext_vfqwbdota_check, MO_32)
+
+/* Zvfbdota32f FP32 Batched Dot-Product Extension */
+static bool vext_vfbdota_check(DisasContext *s, arg_rmrr * a)
+{
+    int32_t sew = s->sew;
+    return s->mstatus_fs != EXT_STATUS_DISABLED &&
+           vext_zvbdota_base_check(s, a, sew) &&
+           (s->cfg_ptr->ext_zvfbdota32f && sew == MO_32);
+}
+
+GEN_ZVBDOTA_FP_TRANS(vfbdota_vv, vext_vfbdota_check, MO_32)
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index e641e21d088..7d680747ddd 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -6327,3 +6327,61 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,              \
 
 GEN_VEXT_ZVBDOTA_FP8(vfqwbdota_vv, e4m3)
 GEN_VEXT_ZVBDOTA_FP8(vfqwbdota_alt_vv, e5m2)
+
+/*
+ * Zvfbdota32f: FP32 Batched Dot Product with Accumulation
+ */
+void HELPER(vfbdota_vv)(void *vd, void *v0, void *vs1, void *vs2, uint32_t ci,
+                        CPURISCVState *env, uint32_t desc)
+{
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+    uint32_t vta = vext_vta(desc);
+    uint32_t vta_all_1s = vext_vta_all_1s(desc);
+    uint32_t vlenb = riscv_cpu_cfg(env)->vlenb;
+    uint32_t vd_emul = vext_lmul(desc);
+    uint32_t log_esz = 2;
+    uint32_t vlmax = vlenb >> MO_32;
+    uint32_t total_elems = (vlenb << vd_emul) >> log_esz;
+    uint32_t n, k;
+    float32 *a_vec, *b_vec;
+    float32 acc, prod, a, b;
+
+    VSTART_CHECK_EARLY_EXIT(env, vl);
+
+    a_vec = g_new0(float32, vlmax);
+    b_vec = g_new0(float32, vlmax);
+
+    FloatExceptionFlags pre_fflag = get_float_exception_flags(&env->fp_status);
+    for (n = 0; n < 8; n++) {
+        if (!vm && !vext_elem_mask(v0, ci + n)) {
+            continue;
+        }
+
+        for (k = 0; k < vl; k++) {
+            a_vec[k] = *((float32 *)vs2 + n * vlmax + H4(k));
+            b_vec[k] = *((float32 *)vs1 + H4(k));
+        }
+
+        acc = *((float32 *)vd + H4(ci + n));
+        for (k = 0; k < vlmax; k++) {
+            a = a_vec[k];
+            b = b_vec[k];
+            prod = float32_mul(a, b, &env->fp_status);
+            acc = float32_add(acc, prod, &env->fp_status);
+        }
+        *((float32 *)vd + H4(ci + n)) = acc;
+    }
+    riscv_cpu_check_fflags(env, pre_fflag);
+
+    g_free(a_vec);
+    g_free(b_vec);
+
+    env->vstart = 0;
+
+    if (ci + 8 < total_elems) {
+        if (vta_all_1s) {
+            vext_set_elems_1s(vd, vta, (ci + 8) * 4, total_elems * 4);
+        }
+    }
+}
-- 
2.56.0


