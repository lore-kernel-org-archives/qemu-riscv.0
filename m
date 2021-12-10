Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoi-0006gg-8D
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoL-0006Oh-Hs
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:22 -0500
Received: from [2607:f8b0:4864:20::102d] (port=34603
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoG-0006wP-6w
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so7662338pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pbfUWmJfKnCRa/n1RTOSecxV8JasXIR4FxQWro96M8s=;
 b=FakaVMLpN2LEk1MAqO6itzOW7kN1J1Jz2F3ZYARiZyRwsFCNNuNWJKKpqPpBiKYrqF
 7HFyQonoceuy07fl95GVyLVln2FVMx5nkPNAEzs/0EGFxr1IeBIDhSb6b0SU3SMovKGO
 pkHli/OSobvizEgWgmAblVS538Td8CdZxqkHiBkDn317WNwjKBSngdNKsuByqr6nv/Pe
 r+5rYGdoa5ddcKzIxVwUKyfI/DqEGUvJ4YoNrjbs4w22GFqU8pSEpfiBmMooS9s8QlDB
 gDghsqO3dKDdmWTz2Ctx2hzbPpD4qwgLAjHHF41sheY6VUr3NwVkPa43hQUiUEUZ0GkQ
 Gw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pbfUWmJfKnCRa/n1RTOSecxV8JasXIR4FxQWro96M8s=;
 b=EF+a6DhT3qYu5MRpaqrGpk7MxMVZkJ3piW7hhBjixeAcBJOiwUKBJehkNuceYwiHeZ
 WrASjnt6uBdBbAcZKn+bWv35wM/JXZgEC72DKFV/pwQnWCPDOBLpnOlkoX3WJbk8/vzk
 Tiva38uo/pvsUx7dTRy7RER/pMKgjngU8wf8FaW8pUZ2r4x1p8m7ty3Al3649BM1QO4/
 XpL3CN6xlmhQbH5UAgit/Q4F741miD36QBqdsS4FNJBQrc5v97se8jsdm3DXOvWSN2ty
 vfJNNmH+RUdbaW3IYPuNsElwIMsGJdFTFs4x2JNiJ+4Latukmadk6+2jZL5SOvgSROB8
 RNtw==
X-Gm-Message-State: AOAM530lyOE4eVbr18Hr703/h8NC0qCfwyMH807gvm/oi1h/ifmRJw4s
 p67lJp79V6vtVD5qqzgsGcCJFA==
X-Google-Smtp-Source: ABdhPJztUJUzLc+b2RVni8xWlluSahrdynRJYM8mygOz4ME9hRZpJMVQFTRcOi4IpGa7waz6XSBgTw==
X-Received: by 2002:a17:902:f092:b0:141:ccb6:897 with SMTP id
 p18-20020a170902f09200b00141ccb60897mr74128414pla.89.1639123151035; 
 Thu, 09 Dec 2021 23:59:11 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 38/77] target/riscv: rvv-1.0: floating-point scalar move
 instructions
Date: Fri, 10 Dec 2021 15:56:24 +0800
Message-Id: <20211210075704.23951-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:26 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  4 +--
 target/riscv/insn_trans/trans_rvv.c.inc | 38 ++++++++++++-------------
 target/riscv/internals.h                |  5 ----
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e33ec82fdf..ab5fdbf9be 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -637,8 +637,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
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
index 2c8002af54..89f88a0ea7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3047,14 +3047,19 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
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
+            t_nan = tcg_constant_i64(UINT64_MAX);
+            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                                t_nan, ofs, len);
         }
 
         mark_fs_dirty(s);
@@ -3066,25 +3071,20 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
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
index 81f5dfa477..ac062dc0b4 100644
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
2.31.1


