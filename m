Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7atA-0002wy-1v
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7at6-0002s6-KQ
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7at4-0005LB-GQ
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:04 -0400
Received: by mail-pg1-x536.google.com with SMTP id 189so7156788pgg.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OVIoa5pL0hAbBoIG2iEh3hAfhhMpQtI8LpXe+cj17kY=;
 b=RSvacyv1abiTRUhpV69G7vZvwsR/Pmdsv2nEuFNiSDTSKoTZiDh5ogrxwsB1HubFHP
 ARZ5iuBAIwdqmLUdfzRPyFe56GmG1eb0wSvOQ+KPYgFXyoxRqRdOjojlX1/WkJ45Wtq+
 SS4ci47SZJKk+DqGQeY+Qlpuqm0PeeJYLUxP6p3OKf2dkarl+tXYWdr+J4A9G7BMZoUf
 USAjuIPPxNIKgjDK9mLJ2ax/CJXkwrnukpVAHFBHnNpoB3+hZIFl1I85H6gyrJqW3B1o
 dwdPFrKcgV4UxZRgdJfAm2ce8bYH4mwyQE7Zaj8QBaXZsKc3prxo/SiY9j3o6ku2RkPo
 Y1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OVIoa5pL0hAbBoIG2iEh3hAfhhMpQtI8LpXe+cj17kY=;
 b=aUouQ11E8SbJraKE1GiMypUKhsr/oAh0/lnpmMhbcwZSrDiiM647cCSh8knQJu5V+D
 z7euHDzmholqZS6WQZX4MUDfWfMNdBp1i3YLZORSxF/xEJeKGEuMUbMxrN6A3V5EAJ76
 ESBW1mqqZa89fI92FyLw4t7eSOT/r9U4VDmAmc8+FMp7Rm78vNJcQ4/4r7uWVdMiJg/x
 Jo8t7bk8qmR8L/tC5LCv5BAs3Kxv6fO1jFDT2OIk8+AtlTzj7aCJY5gQx6UIdOyjHT8S
 vAhCb1Cn/FghcwZiFbtYe4lUPzK0k2i+//e3eEKYsKf1gWC9zPNaOHhL3xMuUEzqx/8O
 4fhg==
X-Gm-Message-State: AOAM532t/zGFeA+oxynbR2+rllFq2/YwcG5zDeqcy9Ssu7UcPyEctT/2
 ICvTSPOWZgZkKcaA3W4iYCi/ow==
X-Google-Smtp-Source: ABdhPJxbK6nDVVQetsPNTZnvC2BC9NkWJNC+oG5q7eSQkXMfPtu+LbOvOROlTFfCzL/LjC8AR0I0XQ==
X-Received: by 2002:aa7:9705:: with SMTP id a5mr10754531pfg.3.1597654381187;
 Mon, 17 Aug 2020 01:53:01 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:53:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 63/70] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
Date: Mon, 17 Aug 2020 16:49:48 +0800
Message-Id: <20200817084955.28793-64-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2020 08:53:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfcvt.rtz.xu.f.v
* vfcvt.rtz.x.f.v

Also adjust GEN_OPFV_TRANS() to accept multiple floating-point rounding
modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ++++++
 target/riscv/insn32.decode              | 11 +++++++----
 target/riscv/insn_trans/trans_rvv.inc.c | 18 ++++++++++--------
 target/riscv/vector_helper.c            | 22 ++++++++++++++++++++++
 4 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a9ec14c49ad..5ef37b9dc49 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -984,6 +984,12 @@ DEF_HELPER_5(vfcvt_f_xu_v_d, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_d, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 425cfd7cb32..c25c03dfb7c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -556,10 +556,13 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
-vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
-vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
-vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+
+vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
+vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
+vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
+vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
+vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
 vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
 vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c148ed40c9f..9cc5e2315cd 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2710,7 +2710,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            (s->sew != 0);
 }
 
-#define GEN_OPFV_TRANS(NAME, CHECK)                                \
+#define GEN_OPFV_TRANS(NAME, CHECK, FRM)                           \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
@@ -2721,7 +2721,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM_DYN);                                        \
+        gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2736,7 +2736,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
+GEN_OPFV_TRANS(vfsqrt_v, opfv_check, FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
@@ -2782,7 +2782,7 @@ GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
-GEN_OPFV_TRANS(vfclass_v, opfv_check)
+GEN_OPFV_TRANS(vfclass_v, opfv_check, FRM_DYN)
 
 /* Vector Floating-Point Merge Instruction */
 GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
@@ -2832,10 +2832,12 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 }
 
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
-GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_rtz_xu_f_v, opfv_check, FRM_RTZ)
+GEN_OPFV_TRANS(vfcvt_rtz_x_f_v, opfv_check, FRM_RTZ)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4d9a1cf3651..644ebf8538e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4024,6 +4024,28 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
 
+/*
+ * vfcvt.rtz.xu.f.v vd, vs2, vm
+ * Convert float to unsigned integer, truncating.
+ */
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_d, 8, 8)
+
+/*
+ * vfcvt.rtz.x.f.v  vd, vs2, vm
+ * Convert float to signed integer, truncating.
+ */
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_d, 8, 8)
+
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
-- 
2.17.1


