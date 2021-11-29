Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX0z-0000Dj-4n
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX0v-00009v-Ce
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:33 -0500
Received: from [2607:f8b0:4864:20::102f] (port=54987
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX0s-0000fG-G9
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:32 -0500
Received: by mail-pj1-x102f.google.com with SMTP id np3so11500065pjb.4
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Ye4CULASMSNzvpQQSPRGMWxcSeeU8VeGUR2jimoV6w=;
 b=gt0o97L4AZBLZgsbTFYoRx91HXrToUbPBtGY4nGh46nBDp8NQvz+/yU/ORFvs5rJ0J
 R4onzlMutl8sTDqUVB4iwWBh7Ufw/Plgrw155mysgrIfrtZoDbhuR1++TBazupB4crMV
 ZCb2rYQA8YlorFYSKKqUdodxtH512gcmrmSPlne0QDmaa1Qb0T+s/U02OG/FWI051EUE
 noG5DkfFaiCEmi5H5pHBR+y6hDqtC0Og1a9iKMnX2iu9v8V+ZfnSf+4ajwhN6+x2HfHN
 lQKfA+5h0pmoioNxlnnx4JY6++pPjy+i9hlbJTnUwI4SDkMlUCLZe3X+p5FkqW6sJ9zr
 txVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Ye4CULASMSNzvpQQSPRGMWxcSeeU8VeGUR2jimoV6w=;
 b=k0SYBeAvETMDhnD1Tx1TVIQzTFuIubSXsErqlP0edAoloStqrGvSFCZVcEZZz8WUpk
 OEeYJNZ1PnVcjlATeimsEMPllViHyWwbUE7VZgmRNatpNMOsC45fAzbKwdj68TUEqnxO
 3nx6LqBNdFaq2Zi/BUA/qiQKTPEcdZKeZ9s3+Y6DLYaYStBM+ym+W3R7aFVNab1TYaTJ
 HSofQynluf6wWzcDwIZpNfLC5pqRAKZcOV3CWbmUZOObX/ei1WEarNEUBUwU3g0fPpzU
 KTi5kI0BTwNsXkAPlX+SOk3+Or7VxnXSBvp5ejNVgM6J4Vm6iuCor9lggK+lEbg8cBdh
 Kjbw==
X-Gm-Message-State: AOAM531NAB68C16uXhw+npvyF2qPuc8fxq8mpfMohVbzxjilfIQ7F3L4
 7tGTB0ua+OSgLGbyzl6CSmS2Yg==
X-Google-Smtp-Source: ABdhPJyX8fxWs6djP7xsmsBgEqwtn351wLHx7qZ2O8144ljevBaHKJ85mlTud2HFgz8xFDKbWbgcWg==
X-Received: by 2002:a17:902:bd88:b0:143:d318:76e6 with SMTP id
 q8-20020a170902bd8800b00143d31876e6mr57953704pls.66.1638155249230; 
 Sun, 28 Nov 2021 19:07:29 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:29 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 44/77] target/riscv: rvv-1.0: narrowing integer right
 shift instructions
Date: Mon, 29 Nov 2021 11:03:04 +0800
Message-Id: <20211129030340.429689-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:07:33 -0000

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
index f2e8d107d2f..304c12494d4 100644
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
index 9c4089d7a7b..a3f1101cd63 100644
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
index 357615a11c3..f6202835ff4 100644
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
index 54405d898b9..e885d4d3539 100644
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
2.25.1


