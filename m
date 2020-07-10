Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscp-0006ed-LT
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdx-0005YA-GQ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:37 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdv-0006jO-Ei
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:37 -0400
Received: by mail-pf1-x444.google.com with SMTP id j20so2391217pfe.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IJYP8eiQZTgRGTSkrq0d4RfHPO79A2MzF5YfBqyHD/Y=;
 b=nWsASwCIQuz4lGtX74bsk4hOjHZzDp7fdD+uLNe3mlrFBdwyc/1kYk59vdqFkAIR1j
 wKkAIBWfEQ4w31witAF1PhNlhhghhMJ/tDBqxOmY/Xz0iW9Ahf+R8qzd308Tpi08RQlV
 FbjdybtEgUU+/R+gys9OLlyJGqK4Ioz3hPWOqE6uh4XlE1tcN8lxC83AOsCtg2OsCBA8
 oGlPz4eQGjeaPwhI7K7Keq++nZIh4ZWp0ue5vuI9ZS30XXv6vWqvSShmBG3sVl8ptNio
 jB2KQXjy15ydvKXsxje9fv/o+xiw2/XfligBNwn5keEQRgOOLzXX9o/qnzQ8GLmnFs7U
 gSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IJYP8eiQZTgRGTSkrq0d4RfHPO79A2MzF5YfBqyHD/Y=;
 b=hC1UbmIyQc3a8IUPcn5Q4jyuWb/ygg8VhSHUAzy6Dolj7tvWCzENBKKRYqn4w2xn0p
 omaLXXGXiT6ducFx4R9oNvodCHiw9NdszU7X++sJc4QoY1epbm6tKzuM4LVEjhSVkn4T
 GmM6CbrulDH9GoX5e8mbTecDB+vCsJCTmUSvJAytOpJjmjI7Cwhi1jkDuDK/IKmZO3aU
 IIW4/3L/Hotx3QGySDiHK5iJSQbhx+v3hgcDtApIi52g21BbANrnlr0KohcBsQDGe956
 LpefonUkv36HaXMFABYBFF4f3MROsaZISNzIq28cUoTq1I67gxbg5fLQE3fmX1WjHJuJ
 XKDg==
X-Gm-Message-State: AOAM531Y5G0UUDTG/NBcg/Vq23hXEtpUejZfhYjvwk3hWWgql+PZchQN
 UKX83gghHzp4TfLVde6YpryBUQ==
X-Google-Smtp-Source: ABdhPJyYJrRX1FZ3tlsG5ssJt9O2j8nZ5EIr/BBMVEko/cLGZoMPfMlzTExkzXaicOCY21S/rN7ATA==
X-Received: by 2002:aa7:9e0e:: with SMTP id y14mr48592975pfq.77.1594378354184; 
 Fri, 10 Jul 2020 03:52:34 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 30/65] target/riscv: rvv-0.9: floating-point scalar move
 instructions
Date: Fri, 10 Jul 2020 18:48:44 +0800
Message-Id: <20200710104920.13550-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x444.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 66 ++++++++++++-------------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ef53df7c73..4be1b88e2d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -583,8 +583,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
+vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
+vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
 vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 801b9319a5..fcbcfda050 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3038,50 +3038,50 @@ done:
 /* Floating-Point Scalar Move Instructions */
 static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
-    if (!s->vill && has_ext(s, RVF) &&
-        (s->mstatus_fs != 0) && (s->sew != 0)) {
-        unsigned int len = 8 << s->sew;
-
-        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
-        if (len < 64) {
-            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
-                            MAKE_64BIT_MASK(len, 64 - len));
-        }
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    require(has_ext(s, RVF));
+    require(s->mstatus_fs != 0);
+    require(s->sew != 0);
 
-        mark_fs_dirty(s);
-        return true;
+    unsigned int len = 8 << s->sew;
+
+    vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
+    if (len < 64) {
+        tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                        MAKE_64BIT_MASK(len, 64 - len));
     }
-    return false;
+
+    mark_fs_dirty(s);
+    return true;
 }
 
 /* vfmv.s.f vd, rs1 # vd[0] = rs1 (vs2=0) */
 static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
-    if (!s->vill && has_ext(s, RVF) && (s->sew != 0)) {
-        TCGv_i64 t1;
-        /* The instructions ignore LMUL and vector register group. */
-        uint32_t vlmax = s->vlen >> 3;
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    require(has_ext(s, RVF));
+    require(s->sew != 0);
 
-        /* if vl == 0, skip vector register write back */
-        TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    /* The instructions ignore LMUL and vector register group. */
+    TCGv_i64 t1;
+    TCGLabel *over = gen_new_label();
 
-        /* zeroed all elements */
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), vlmax, vlmax, 0);
+    /* if vl == 0, skip vector register write back */
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        /* NaN-box f[rs1] as necessary for SEW */
-        t1 = tcg_temp_new_i64();
-        if (s->sew == MO_64 && !has_ext(s, RVD)) {
-            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));
-        } else {
-            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
-        }
-        vec_element_storei(s, a->rd, 0, t1);
-        tcg_temp_free_i64(t1);
-        gen_set_label(over);
-        return true;
+    /* NaN-box f[rs1] as necessary for SEW */
+    t1 = tcg_temp_new_i64();
+    if (s->sew == MO_64 && !has_ext(s, RVD)) {
+        tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));
+    } else {
+        tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
     }
-    return false;
+    vec_element_storei(s, a->rd, 0, t1);
+    tcg_temp_free_i64(t1);
+    gen_set_label(over);
+    return true;
 }
 
 /* Vector Slide Instructions */
-- 
2.17.1


