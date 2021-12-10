Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaom-0006zV-Oh
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoU-0006SB-FT
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:31 -0500
Received: from [2607:f8b0:4864:20::1036] (port=41586
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoS-0006yo-L8
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:30 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso6909653pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0NqJMgbM7DNVXygxWPl0wbCbNZ+G4eD4PH0N1q66xZ8=;
 b=Dzu/aiRmEEOIN1lXx69STvEvZDZynZHl0LSRO0sjVNQcwOpJfEZe1ONAby6XVTdm5j
 qgALLCUWkA2wAz5x/Bd+IN2B+iovKWQWmkXkUS6WSVX+xTvxtjaVluUIBvKGMb7Mv6GM
 mqlAdQQS21VElXvypNpPBGyFx+ngbr6+STyHVA+zxo8CJZWkrM2GZh8Kqb8baCwo/gav
 u3G+igoWdUmgkop+d7Nv6GuQPoJXxbn+YV6yj5rnrL/Ao4Fu4kqA17KwVVNcpF75RURj
 l8fgcZS9n2IYdW/YgzOEHNi5/IgwVqH7I4WmgMWKDVrrJPF2wTTnxYM0BoocG8l6BszD
 rlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0NqJMgbM7DNVXygxWPl0wbCbNZ+G4eD4PH0N1q66xZ8=;
 b=ARmBWevnGYA6u5gyDNwPDVsJ2uLYWL/VLol6Ozb64lFfVSjN80Eui03pmMsJbnTiTq
 G6EGX9Um17cqZ460kWCtzhVV9sfmeyFdZqzILLAZxsQpQH+v1hhSL4RpukizabVyiEHQ
 0fLbdE27d0T0YC0tMQQNrob0HSSVyd9kBCmQloPGAz8ZtMGKKXNV81aGGqn1xbEszSo9
 42Ok+WEps6IXTYmekKz7bmhGbE6up2d9NAYIvOJzXt0UbwXZbq5/JesPusR519j/iMix
 wuDiYh1cszlMiTrcQepaZowQLfaX7fdtu1AKPBoUmTSVweksZ5ORttZfq+qvwf7/S/10
 C1yQ==
X-Gm-Message-State: AOAM532ebVkf3oJ/Qp2pafddHelTfx4dF1gREGYQWM8yo2RPEKTgVoGq
 B5i/VZZ5lfSqX0EeF2S+hysd9w==
X-Google-Smtp-Source: ABdhPJxJmdp9uBA8XRmJ9ptqNSMMecp6z5kZoQZ+TBqYnp4/Qya3b+XlG6asbwxkzQaHLvkiPFFnYg==
X-Received: by 2002:a17:902:d2cd:b0:141:fbe2:b658 with SMTP id
 n13-20020a170902d2cd00b00141fbe2b658mr73358553plc.49.1639123167215; 
 Thu, 09 Dec 2021 23:59:27 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 44/77] target/riscv: rvv-1.0: narrowing integer right
 shift instructions
Date: Fri, 10 Dec 2021 15:56:30 +0800
Message-Id: <20211210075704.23951-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 24 +++++++-------
 target/riscv/insn32.decode              | 12 +++----
 target/riscv/insn_trans/trans_rvv.c.inc | 42 ++++++++++++-------------
 target/riscv/vector_helper.c            | 24 +++++++-------
 4 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f2e8d107d2..304c12494d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -351,18 +351,18 @@ DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
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
index 9c4089d7a7..a3f1101cd6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -406,12 +406,12 @@ vsrl_vi         101000 . ..... ..... 011 ..... 1010111 @r_vm
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
index 357615a11c..f6202835ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1690,7 +1690,7 @@ GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
 GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
-static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1698,10 +1698,10 @@ static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
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
@@ -1724,10 +1724,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
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
@@ -1735,10 +1735,10 @@ static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
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
@@ -1749,14 +1749,14 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
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
@@ -1768,8 +1768,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
     return false;                                                        \
 }
 
-GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
-GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
+GEN_OPIWI_NARROW_TRANS(vnsra_wi, IMM_ZX, vnsra_wx)
+GEN_OPIWI_NARROW_TRANS(vnsrl_wi, IMM_ZX, vnsrl_wx)
 
 /* Vector Integer Comparison Instructions */
 /*
@@ -2034,12 +2034,12 @@ GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
 GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
-GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
-GEN_OPIVV_NARROW_TRANS(vnclip_vv)
-GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
-GEN_OPIVX_NARROW_TRANS(vnclip_vx)
-GEN_OPIVI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
-GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
+GEN_OPIWV_NARROW_TRANS(vnclipu_vv)
+GEN_OPIWV_NARROW_TRANS(vnclip_vv)
+GEN_OPIWX_NARROW_TRANS(vnclipu_vx)
+GEN_OPIWX_NARROW_TRANS(vnclip_vx)
+GEN_OPIWI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
+GEN_OPIWI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 
 /*
  *** Vector Float Point Arithmetic Instructions
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 54405d898b..e885d4d353 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1164,18 +1164,18 @@ GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f)
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
2.31.1


