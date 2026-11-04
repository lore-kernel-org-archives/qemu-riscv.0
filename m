Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661FA607264F
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ESPOr1Yp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtD-0002se-Ao; Wed, 04 Nov 2026 14:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgt4-0002kD-NT
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:10 -0500
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgt2-0002Tl-OY
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:10 -0500
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-36a18fc7a38so310831eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821387; x=1794426187; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8acSz67SEMp3v6xtI7qoWxZME8sNQUJ6Qw3trWuzqS4=;
 b=ESPOr1YpJUHbZOjw63CXMf6f+6dHhv/I0K2plRhf2Ch9x+WYroAT1tuNKig+yFFTWW
 3PDropyINlzorJAvhTZBfmNwCDdW4kcyTxyiISo+GrefiKe0RWnfB8nIU09GSxJIgELE
 2DJ1nOL4hoQtQb5qsiyehoz+7lbyTNAX2VoTLSr5y7bwxiEv9d3L7CAb8UeN23q3+U+t
 gQ7qqNvVGeEeZfW8IhAm5RpEkavF0iXHNqvp/HSnmO5+vSh5JiD8WKKHENBR6Qw2gyGZ
 YAVeMBGiSxa3nwAHzwGzrRZOpL1fGOFDZQti5HSlc7Tp9CSlL/76k+/xRa8e1Zp4ChnL
 mx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821387; x=1794426187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8acSz67SEMp3v6xtI7qoWxZME8sNQUJ6Qw3trWuzqS4=;
 b=MlZnrGidgJZHAp7IvW/anMr14lWdMUMy5+2oY1YsADIVXeW01X/huI9rGOXDaduBSW
 BXnM0Xe6mgqgmzVhXCrZkSnwnmfSc8W/gkWeIyMYTn/Ws3NVMoMK3wOBehzoyPYKpuV/
 Ooik6hU/QSVrkw/swknJtLw6xNqKnTDTqhJUBa7ejk2peEnyEQTQfzeL150Jzj9G2xed
 Rig7qhQinlYAnwhMw4C0YFMKB/uTXfqB7w3HyLJ/9rGp/ZCB/PlyQkiVNxdJB8hHRp3x
 3k89PzGUE5NGVk+CrzaVmVn53Adb1F3yXOVs+vZZlqo+6gC52bS5xBKEFEZBD4StF+Eh
 oZyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwU9YOIx8YRDOlilc8ZkQAi6U3NEbe+ZhcfP4LlhSqcEgtakVkBSPmPbtmHWRTukfARnUuGg/egcvM3@nongnu.org
X-Gm-Message-State: APuU4Z9rjlcZnbktGDul9u81ifyhUgo8PFhF4fNCWrBBXunh89+hNVid
 QMlvp90TS+H+73ckM1JmvH0Wthr6TchBp8dKti75tyhTBoQrewyWFmisioijlK0Nhcp0QT1zghe
 TuKB/CP8=
X-Gm-Gg: AYBFou1D6az5zHlm7UWwp2nVusMjojj3CJYiTmKl3n7dmKxZI4d/bkUzhu5+xYNW/CW
 6iNNw9dYu5IMFNAfKAcrHiDuccN6GGIANdS3JwwlXKR3l43+jKSyZb2gEYQcXEhkla0tOjK+JnI
 JXVXctm2YIE+pNjCInXmKUBDWt1ptZBttnvnRRR+UicugD80yEsXhIO/EBA1e/eYv+b/KoHWDMY
 IAN9HDO3HJ/QuAgWbKRiBHf6N/1almSP2vZGqYF/t5ts3w+VGVU9I690revR3vV3Be/23u6EykB
 okgv2wWBP1xl4QB/3NU93zF4eCmgRK4rUlvoZ7IXOD8hnQTvdS/e4e66HlWiIVCHJVweRdY/dSs
 /ftE0lqMOIBDg/vhas21CQ3RIcZHij/uY+YXufy/oyqgbyGOI1bXVi99NDfZFB8R0aG8ijKqPnm
 gETrbwKe6QxYTA9ezkTjKlkM+c+aVESms7MU6jsn+CXa/AlJ/jUTUKCexomS6C0bNm+jB38sG4c
 iSkwVMDJfMg+/CuCUx+J2UOwVz/TcE7NWXTdDRDmBLNNEhUarjlI1r82u+tmrmU+2BkI45d8N8a
 ArR/jyKH87pSENbYz4n7RtBj0e2L2wVTiQpK8Qba484jiiWvBCwU/i+WV7WfqGNcTjzGeplQxmA
 mic8klLUO27oCoT5Ys2a7wxE+RK1l
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id
 5a478bee46e88-36a423e52c8mr29866359eec.23.1793821387091; 
 Wed, 04 Nov 2026 11:43:07 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:06 -0800 (PST)
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
Subject: [RFC PATCH 17/38] target/riscv: rvv: Implement Zvfqwdota8f
 instructions
Date: Thu,  5 Nov 2026 03:41:32 +0800
Message-ID: <20261104194155.679241-18-max.chou@sifive.com>
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implements the Zvfqwdota8f OCP FP8 dot-product instructions:
- vfqwdota.vv: vs2 is E4M3, vs1 format selected by altfmt (0=E4M3, 1=E5M2)
- vfqwdota.alt.vv: vs2 is E5M2, vs1 format selected by altfmt (0=E4M3, 1=E5M2)

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/helper.h                       |  5 ++
 target/riscv/insn32.decode                  |  4 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 47 ++++++++++++++++
 target/riscv/tcg/vector_helper.c            | 62 +++++++++++++++++++++
 4 files changed, 118 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 918ff21b3e2..48c64f45748 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1395,6 +1395,11 @@ DEF_HELPER_6(vqwdotas_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 
 /* Zvfwdota16bf - BF16 Dot Product */
 DEF_HELPER_6(vfwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* Zvfqwdota8f - OCP FP8 Dot Product */
+DEF_HELPER_6(vfqwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfqwdota_alt_vv, void, ptr, ptr, ptr, ptr, env, i32)
+
 /* SiFive Custom int8 Matrix-Multiply */
 DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(sf_vqmacc_4x8x4, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d800ad99451..def5785f8e2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1104,3 +1104,7 @@ vqwdotas_vv  100111 . ..... ..... 000 ..... 1110111 @r_vm
 
 # *** Zvfwdota16bf BF16 Dot-Product Extension ***
 vfwdota_vv  100100 . ..... ..... 001 ..... 1110111 @r_vm
+
+# *** Zvfqwdota8f OCP FP8 Dot-Product Extension ***
+vfqwdota_vv     100110 . ..... ..... 001 ..... 1110111 @r_vm
+vfqwdota_alt_vv 100111 . ..... ..... 001 ..... 1110111 @r_vm
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index c50f863ea0b..6eb22494838 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -4242,3 +4242,50 @@ static bool trans_vfwdota_vv(DisasContext *s, arg_rmrr * a)
     }
     return false;
 }
+
+/* Zvfqwdota8f OCP FP8 Dot-Product Extension */
+static bool vext_vfqwdota_check(DisasContext *s, arg_rmrr *a)
+{
+    return s->mstatus_fs != EXT_STATUS_DISABLED &&
+           vext_zvdota_base_check(s, a) &&
+           (s->cfg_ptr->ext_zvfqwdota8f && s->sew == MO_8);
+}
+
+#define GEN_ZVDOTA_FP8_TRANS(NAME, CHECK)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
+{                                                                       \
+    if (CHECK(s, a)) {                                                  \
+        TCGv_ptr dest, src1, src2, mask;                                \
+        TCGv_i32 desc;                                                  \
+        uint32_t data = 0;                                              \
+                                                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                                   \
+                                                                        \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                      \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                  \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                    \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);  \
+                                                                        \
+        dest = tcg_temp_new_ptr();                                      \
+        mask = tcg_temp_new_ptr();                                      \
+        src1 = tcg_temp_new_ptr();                                      \
+        src2 = tcg_temp_new_ptr();                                      \
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,            \
+                                          s->cfg_ptr->vlenb, data));    \
+                                                                        \
+        tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));            \
+        tcg_gen_addi_ptr(src1, tcg_env, vreg_ofs(s, a->rs1));           \
+        tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2));           \
+        tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));                \
+                                                                        \
+        gen_helper_##NAME(dest, mask, src1, src2, tcg_env, desc);       \
+                                                                        \
+        finalize_rvv_inst(s);                                           \
+                                                                        \
+        return true;                                                    \
+    }                                                                   \
+    return false;                                                       \
+}
+
+GEN_ZVDOTA_FP8_TRANS(vfqwdota_vv, vext_vfqwdota_check)
+GEN_ZVDOTA_FP8_TRANS(vfqwdota_alt_vv, vext_vfqwdota_check)
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index a4c52ed296a..5cb44326200 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -6075,3 +6075,65 @@ void HELPER(vfwdota_vv)(void *vd, void *v0, void *vs1, void *vs2,
         vext_set_elems_1s(vd, vta, 1 * 4, total_elems * 4);
     }
 }
+
+/*
+ * Zvfqwdota8f: OCP FP8 Dot Product with Accumulation
+ */
+#define GEN_VEXT_ZVDOTA_FP8(NAME, TYPE_VS2)                              \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,              \
+                  CPURISCVState *env, uint32_t desc)                     \
+{                                                                        \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(uint8_t)));        \
+    uint32_t vm = vext_vm(desc);                                         \
+    uint32_t vl = env->vl;                                               \
+    uint32_t vta = vext_vta(desc);                                       \
+    uint32_t vta_all_1s = vext_vta_all_1s(desc);                         \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb >> 2;               \
+    uint32_t altfmt = FIELD_EX64(env->vtype, VTYPE, ALTFMT);             \
+    uint32_t i;                                                          \
+    uint8_t *a_vec, *b_vec;                                              \
+    uint32_t dot_result, acc;                                            \
+                                                                         \
+    VSTART_CHECK_EARLY_EXIT(env, vl);                                    \
+                                                                         \
+    a_vec = g_new0(uint8_t, vlmax);                                      \
+    b_vec = g_new0(uint8_t, vlmax);                                      \
+                                                                         \
+    for (i = 0; i < vl; i++) {                                           \
+        if (!vm && !vext_elem_mask(v0, i)) {                             \
+            continue;                                                    \
+        }                                                                \
+        a_vec[i] = *((uint8_t *)vs2 + H1(i));                            \
+        b_vec[i] = *((uint8_t *)vs1 + H1(i));                            \
+    }                                                                    \
+                                                                         \
+    FloatExceptionFlags pre_fflag =                                      \
+        get_float_exception_flags(&env->fp_status);                      \
+    FloatSNaNRule pre_snan_rule = get_snan_rule(&env->fp_status);        \
+    set_snan_rule(float_snan_never, &env->fp_status);                    \
+    if (altfmt == 0) {                                                   \
+        dot_result = rvbna_dot_float8_##TYPE_VS2##_float8_e4m3(          \
+            a_vec, b_vec, vlmax, &env->fp_status);                       \
+    } else {                                                             \
+        dot_result = rvbna_dot_float8_##TYPE_VS2##_float8_e5m2(          \
+            a_vec, b_vec, vlmax, &env->fp_status);                       \
+    }                                                                    \
+    set_snan_rule(pre_snan_rule, &env->fp_status);                       \
+                                                                         \
+    acc = *((uint32_t *)vd + H4(0));                                     \
+    *((uint32_t *)vd + H4(0)) = rvbna_final_f32_add(dot_result, acc,     \
+                                                    &env->fp_status);    \
+    riscv_cpu_check_fflags(env, pre_fflag);                              \
+                                                                         \
+    g_free(a_vec);                                                       \
+    g_free(b_vec);                                                       \
+                                                                         \
+    env->vstart = 0;                                                     \
+                                                                         \
+    if (vta_all_1s) {                                                    \
+        vext_set_elems_1s(vd, vta, 1 * 4, total_elems * 4);              \
+    }                                                                    \
+}
+
+GEN_VEXT_ZVDOTA_FP8(vfqwdota_vv, e4m3)
+GEN_VEXT_ZVDOTA_FP8(vfqwdota_alt_vv, e5m2)
-- 
2.56.0


