Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCG-0004zq-7N
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCD-0004sh-U8
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:37 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCB-0007tD-NJ
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:37 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so1081541pgj.4
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9rUGyOu7x57v5zXLH0XImFN4ThGv9n62M+D/Ikm1OhU=;
 b=NsDejnhiHpIWdIU7NasTBQM4Hlyz3E22TMvxCpwOmf+jE9hG8MuJZurkCfOLnYDoQt
 UC35G4g3HgU8iaQmeizdHncP9nNKU6vygIsInML1DXMeYTivlF143VhENsVO7JRVidH0
 EHRvrj4+sh2tR34uKqcjimKpwZYm4GH95LQNN/3vkLRfHD1ZrrxuXyvcHTrms6OZ+A/z
 aoT1ictMMISl0HqNrusYoN2owdqPPTCNfwSQBpZfjfU7kNckAiXR5DkbTtbr1n5UWcEG
 GTZ0YSiLeNYO2XPj8cmlMQRDddbbVoD/962nJcePYxJbMO2OchafMuOmckgtcEzV/6UU
 d02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9rUGyOu7x57v5zXLH0XImFN4ThGv9n62M+D/Ikm1OhU=;
 b=eBziLx1olu9FaWd5ezsQIGXzFuLuWra/XSitPav4VluP6NhSIeUkFC1ikFJkKVVOvs
 cQwnB8axH9JlOLmTDJ316dyGA/ROnohVgAm/5fWO2iiUSa6bkCgSK8y2Eg2IKV2RR98j
 zy7xQJ05S+I02yhjUNUWMMZ+gJWWD1ucO/G/N3unu46jU4Oj1NbDaZpIEw/+bGJwMqgQ
 neBD5EckvXO8nb5nKXC4uuuKKEqmquiStBf5GPAHveSsE18CSeRJYsgaReX/KyEUy+Xx
 WglVh7109bgE7STO2QHeLmeBXVLH8qX7gEepU459kyVW9aO1BdqbVRPOGxGDEbitgGON
 rwIA==
X-Gm-Message-State: AOAM531ArLExtYxB+pZo8mx3UjuVf92GLsknUUwUKn6srTIOGoTV2fKV
 kZj3ykuJtwRr29bwhzQP1q8UCQ==
X-Google-Smtp-Source: ABdhPJwXydUaWSF0qYl37CzxME3i23XCE1KXiPlSlxQdpWwWWnJwql2wVEU/uUIOfb3t2H59t1QI+w==
X-Received: by 2002:a63:a556:: with SMTP id r22mr3906506pgu.296.1610444553537; 
 Tue, 12 Jan 2021 01:42:33 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 37/72] target/riscv: rvv-1.0: floating-point scalar move
 instructions
Date: Tue, 12 Jan 2021 17:39:11 +0800
Message-Id: <20210112093950.17530-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:38 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 +--
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++------------
 target/riscv/internals.h                |  5 ----
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f26723a4d27..8516a12b126 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -612,8 +612,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
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
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7ac7d6a2b92..63e31299b3b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3282,14 +3282,20 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
 /* Floating-Point Scalar Move Instructions */
 static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
-    if (!s->vill && has_ext(s, RVF) &&
-        (s->mstatus_fs != 0) && (s->sew != 0)) {
-        unsigned int len = 8 << s->sew;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
+        unsigned int ofs = (8 << s->sew);
+        unsigned int len = 64 - ofs;
+        TCGv_i64 t_nan;
 
         vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
-        if (len < 64) {
-            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
-                            MAKE_64BIT_MASK(len, 64 - len));
+        /* NaN-box f[rd] as necessary for SEW */
+        if (len) {
+            t_nan = tcg_const_i64(UINT64_MAX);
+            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                                t_nan, ofs, len);
+            tcg_temp_free_i64(t_nan);
         }
 
         mark_fs_dirty(s);
@@ -3301,25 +3307,20 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 /* vfmv.s.f vd, rs1 # vd[0] = rs1 (vs2=0) */
 static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
-    if (!s->vill && has_ext(s, RVF) && (s->sew != 0)) {
-        TCGv_i64 t1;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
         /* The instructions ignore LMUL and vector register group. */
-        uint32_t vlmax = s->vlen >> 3;
+        TCGv_i64 t1;
+        TCGLabel *over = gen_new_label();
 
         /* if vl == 0, skip vector register write back */
-        TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        /* zeroed all elements */
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), vlmax, vlmax, 0);
-
-        /* NaN-box f[rs1] as necessary for SEW */
+        /* NaN-box f[rs1] */
         t1 = tcg_temp_new_i64();
-        if (s->sew == MO_64 && !has_ext(s, RVD)) {
-            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));
-        } else {
-            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
-        }
+        do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
         mark_vs_dirty(s);
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index c3bbeea9a94..959b81b3016 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -32,11 +32,6 @@ target_ulong fclass_h(uint64_t frs1);
 target_ulong fclass_s(uint64_t frs1);
 target_ulong fclass_d(uint64_t frs1);
 
-#define SEW8  0
-#define SEW16 1
-#define SEW32 2
-#define SEW64 3
-
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
-- 
2.17.1


