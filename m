Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCh-0005og-Op
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCd-0005lp-Jo
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:04 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCZ-00082h-2v
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:02 -0500
Received: by mail-pl1-x62c.google.com with SMTP id g3so1120705plp.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5HpLdnkVTyG3J12vkzaoSQShFiVf7Hlo5ZNk9P1QNg0=;
 b=GegoB2P+SWutIki1xdT2y3C4gW15RgBAQw02Olx4HtHwvGL6GhdRjbFGfqK6JtweYG
 SrN1q64ci+h+ccOWf4UEBfBHAh6VoCGIeMtmMWgyAvzvYKyC+Es4XGHVs7fryZskdWyx
 uwOK+TpJaXtSjrA1k9vzZNXUtXj+S8YlurA3jPR/vlgH5dsUmw2u7ebpw1A2x4pVPFSe
 M6L4iMF8khei1NrM36cF8Wtx8kKH5xp5HwcE8FgcChrjNIvpUabkix2y4GR+rjsuV2Uy
 aMqGIvqP2Gsdu6v503yUoo31ttsRYai/EKV9kIIvujjnn0drh8hp4dKJ2zmpGTkn3c9j
 3o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5HpLdnkVTyG3J12vkzaoSQShFiVf7Hlo5ZNk9P1QNg0=;
 b=RGjrQYxtr/nhVxqyiIA6OD/lsyyt9gaolMG5f95vLH67WKBJ3CZ7nSc2+mXmV0LQ0I
 9X2oD0nE84An2JQyTLGdQLZuigfBodM8b7tNTrDkzxJ1pRTnTxIbeAGPKg6mxJkmsnAc
 EtXbtgB6rJ2FxuOD58jHY2Tu5MV0airxead2xe7yvmGezl8eOwP/8ecTEdJ/oKgbhXpt
 2+fj/7K6XlE1Si+12UASrGViYYW7a+HVBQYv161ocStGlWI0dItb1qfAzrfJGUjYLRrn
 0wROxV0Aey4/5UZiCraCrHAfPuKFBTz5o7fBAPsPB7bcYRRycME5HPCCq6RzBiO5Bm9g
 hwrA==
X-Gm-Message-State: AOAM531RtExVu1tq/wonrAkgZwrjkiv+Io/zfoJbW6lXD7o1eVrBoTsV
 +Vg6SjR49AAAIgTD3/62RTg0vg==
X-Google-Smtp-Source: ABdhPJzUlQ/1CwdPdzjlW6pK/eO/eF++aKzR23YJibedimRvx8I+M64VneaGc1fOcxzwFlP9O/CptA==
X-Received: by 2002:a17:90b:1218:: with SMTP id
 gl24mr3606398pjb.130.1610444577919; 
 Tue, 12 Jan 2021 01:42:57 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 43/72] target/riscv: rvv-1.0: narrowing integer right shift
 instructions
Date: Tue, 12 Jan 2021 17:39:17 +0800
Message-Id: <20210112093950.17530-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 24 ++++++++++----------
 target/riscv/insn32.decode              | 12 +++++-----
 target/riscv/insn_trans/trans_rvv.c.inc | 30 ++++++++++++-------------
 target/riscv/vector_helper.c            | 24 ++++++++++----------
 4 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 421bc423c98..f5f34c2dcdb 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -392,18 +392,18 @@ DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
-DEF_HELPER_6(vnsrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_w, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_6(vmseq_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmseq_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2806334a31c..022530697ec 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -381,12 +381,12 @@ vsrl_vi         101000 . ..... ..... 011 ..... 1010111 @r_vm
 vsra_vv         101001 . ..... ..... 000 ..... 1010111 @r_vm
 vsra_vx         101001 . ..... ..... 100 ..... 1010111 @r_vm
 vsra_vi         101001 . ..... ..... 011 ..... 1010111 @r_vm
-vnsrl_vv        101100 . ..... ..... 000 ..... 1010111 @r_vm
-vnsrl_vx        101100 . ..... ..... 100 ..... 1010111 @r_vm
-vnsrl_vi        101100 . ..... ..... 011 ..... 1010111 @r_vm
-vnsra_vv        101101 . ..... ..... 000 ..... 1010111 @r_vm
-vnsra_vx        101101 . ..... ..... 100 ..... 1010111 @r_vm
-vnsra_vi        101101 . ..... ..... 011 ..... 1010111 @r_vm
+vnsrl_wv        101100 . ..... ..... 000 ..... 1010111 @r_vm
+vnsrl_wx        101100 . ..... ..... 100 ..... 1010111 @r_vm
+vnsrl_wi        101100 . ..... ..... 011 ..... 1010111 @r_vm
+vnsra_wv        101101 . ..... ..... 000 ..... 1010111 @r_vm
+vnsra_wx        101101 . ..... ..... 100 ..... 1010111 @r_vm
+vnsra_wi        101101 . ..... ..... 011 ..... 1010111 @r_vm
 vmseq_vv        011000 . ..... ..... 000 ..... 1010111 @r_vm
 vmseq_vx        011000 . ..... ..... 100 ..... 1010111 @r_vm
 vmseq_vi        011000 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7711f86230c..113a20af4d7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1920,7 +1920,7 @@ GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
 GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
-static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1928,10 +1928,10 @@ static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
 }
 
 /* OPIVV with NARROW */
-#define GEN_OPIVV_NARROW_TRANS(NAME)                               \
+#define GEN_OPIWV_NARROW_TRANS(NAME)                               \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 {                                                                  \
-    if (opivv_narrow_check(s, a)) {                                \
+    if (opiwv_narrow_check(s, a)) {                                \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_4_ptr * const fns[3] = {            \
             gen_helper_##NAME##_b,                                 \
@@ -1953,10 +1953,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
     }                                                              \
     return false;                                                  \
 }
-GEN_OPIVV_NARROW_TRANS(vnsra_vv)
-GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
+GEN_OPIWV_NARROW_TRANS(vnsra_wv)
+GEN_OPIWV_NARROW_TRANS(vnsrl_wv)
 
-static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwx_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1964,10 +1964,10 @@ static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
 }
 
 /* OPIVX with NARROW */
-#define GEN_OPIVX_NARROW_TRANS(NAME)                                     \
+#define GEN_OPIWX_NARROW_TRANS(NAME)                                     \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
-    if (opivx_narrow_check(s, a)) {                                      \
+    if (opiwx_narrow_check(s, a)) {                                      \
         static gen_helper_opivx * const fns[3] = {                       \
             gen_helper_##NAME##_b,                                       \
             gen_helper_##NAME##_h,                                       \
@@ -1978,14 +1978,14 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
     return false;                                                        \
 }
 
-GEN_OPIVX_NARROW_TRANS(vnsra_vx)
-GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
+GEN_OPIWX_NARROW_TRANS(vnsra_wx)
+GEN_OPIWX_NARROW_TRANS(vnsrl_wx)
 
-/* OPIVI with NARROW */
-#define GEN_OPIVI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                    \
+/* OPIWI with NARROW */
+#define GEN_OPIWI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                    \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
-    if (opivx_narrow_check(s, a)) {                                      \
+    if (opiwx_narrow_check(s, a)) {                                      \
         static gen_helper_opivx * const fns[3] = {                       \
             gen_helper_##OPIVX##_b,                                      \
             gen_helper_##OPIVX##_h,                                      \
@@ -1997,8 +1997,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
     return false;                                                        \
 }
 
-GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
-GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
+GEN_OPIWI_NARROW_TRANS(vnsra_wi, IMM_ZX, vnsra_wx)
+GEN_OPIWI_NARROW_TRANS(vnsrl_wi, IMM_ZX, vnsrl_wx)
 
 /* Vector Integer Comparison Instructions */
 /*
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e122ba41d0..e14626b40bb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1373,18 +1373,18 @@ GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f)
 GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f)
 
 /* Vector Narrowing Integer Right Shift Instructions */
-GEN_VEXT_SHIFT_VV(vnsrl_vv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VV(vnsra_vv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VV(vnsra_vv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VV(vnsra_vv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsra_wv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsra_wv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsra_wv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsra_wx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsra_wx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsra_wx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
 
 /* Vector Integer Comparison Instructions */
 #define DO_MSEQ(N, M) (N == M)
-- 
2.17.1


