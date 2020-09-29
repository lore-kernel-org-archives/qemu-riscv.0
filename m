Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxH-0004JB-Qi
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxF-0004DD-FF
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxC-00022q-Fn
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kk9so3180180pjb.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/gTsAG/o9+PFFeWYAaGz7gtnBhWYcsEK+ArEgDYgXA=;
 b=TqcLAEkDl3lW+fkfekbj8Jh/r/31FtQR6L2G8MDp/qfpXkYqlRjKj7fbexzqF4BLzZ
 V/V6hZtQP2sHbLDDAMDR0hF9hhgc2HUhqAvecIU0TettCPgcV7lnFJUU3mPehBeQ+AXf
 56sWYTR2DpZ9H33auC2cKotGxONarjiUwwZrBz/XkLoBOdLk5whFlkkddIOFJMWuM2VN
 jAHY5QJJCIWB3xqf9W/2H6nwgXTqBf6i4Uw+rQFU0dxveWE3aHgWC9cBFDz6EaeRllVO
 6beV+xVNAJZ9Ij2FAH5Xaf/YP9uc/1FT1Oen7I9XDOo9Zqi5B8pdBD0oNpjsI8IfYKjM
 QSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/gTsAG/o9+PFFeWYAaGz7gtnBhWYcsEK+ArEgDYgXA=;
 b=lkGSF0b39lb+HYXnhhOsYPVgdD6O2V7OJnlAGjjElEb0DmMUYo8Dk8VN3d9OmW7GxW
 61jp/Oqup6sZxEpj3n35uillbxCQT8ZEYWwAMX2KBsG0ZwLvl0f77t/fJdFUQ0ZNZzhs
 wSQzSPxhpJPpiE9IE74ISbdFe1L0v+8iMzU+4o0Ti61morf8ituGkirV2LaP24/rvZss
 D2NFopsghIMvzOtZhebCfdxIGVnlDF54PNTVge20vtl8FDz7buDsBqY+bmJa2TLO3xti
 DdJb/LM8gcKJjdQfPWdIGCaW7Mh+v7xFcDkA3sBdXVYL7Saas57Ns9rkaZLUBYtX/SVt
 gr3g==
X-Gm-Message-State: AOAM5317S2MEitW5eLC4e0MmJLK18WQNDjn8Xn4bjHJFrO/EB91eaUzw
 Wi3WYnmrfGIAq+zS8u2otSoGJw==
X-Google-Smtp-Source: ABdhPJwbqnkrC2Jj+Dglnp/2kGBdKEH34qOiN8ltJvjFakrFpylkS6P7h+de5Io8FR3NsxN7PHQGtg==
X-Received: by 2002:a17:90a:1f07:: with SMTP id
 u7mr5080728pja.219.1601406381156; 
 Tue, 29 Sep 2020 12:06:21 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 19/68] target/riscv: rvv-1.0: index load and store
 instructions
Date: Wed, 30 Sep 2020 03:03:54 +0800
Message-Id: <20200929190448.31116-20-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:06:25 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  67 ++++-----
 target/riscv/insn32.decode              |  21 ++-
 target/riscv/insn_trans/trans_rvv.c.inc | 190 ++++++++++++++++--------
 target/riscv/vector_helper.c            |  89 ++++++-----
 4 files changed, 209 insertions(+), 158 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a772e28d5f..cb0f59460f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -112,41 +112,38 @@ DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vsse16_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vsse32_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vsse64_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxb_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxh_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxh_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxh_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxe_v_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxe_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxe_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxe_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxbu_v_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxbu_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxbu_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxbu_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxhu_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxhu_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxhu_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxwu_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxwu_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxb_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxh_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxh_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxh_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxe_v_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxe_v_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxe_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxe_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei16_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei16_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei32_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei32_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vlxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei16_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei16_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei32_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei32_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_5(vlbff_v_b, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlbff_v_h, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlbff_v_w, void, ptr, ptr, tl, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 63811c0bd1..4e88d21ac4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -268,18 +268,17 @@ vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
 vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 
-vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlxw_v     ... 111 . ..... ..... 110 ..... 0000111 @r_nfvm
-vlxe_v     ... 011 . ..... ..... 111 ..... 0000111 @r_nfvm
-vlxbu_v    ... 011 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlxhu_v    ... 011 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlxwu_v    ... 011 . ..... ..... 110 ..... 0000111 @r_nfvm
+# Vector indexed load insns.
+vlxei8_v      ... 011 . ..... ..... 000 ..... 0000111 @r_nfvm
+vlxei16_v     ... 011 . ..... ..... 101 ..... 0000111 @r_nfvm
+vlxei32_v     ... 011 . ..... ..... 110 ..... 0000111 @r_nfvm
+vlxei64_v     ... 011 . ..... ..... 111 ..... 0000111 @r_nfvm
+
 # Vector ordered-indexed and unordered-indexed store insns.
-vsxb_v     ... -11 . ..... ..... 000 ..... 0100111 @r_nfvm
-vsxh_v     ... -11 . ..... ..... 101 ..... 0100111 @r_nfvm
-vsxw_v     ... -11 . ..... ..... 110 ..... 0100111 @r_nfvm
-vsxe_v     ... -11 . ..... ..... 111 ..... 0100111 @r_nfvm
+vsxei8_v      ... 0-1 . ..... ..... 000 ..... 0100111 @r_nfvm
+vsxei16_v     ... 0-1 . ..... ..... 101 ..... 0100111 @r_nfvm
+vsxei32_v     ... 0-1 . ..... ..... 110 ..... 0100111 @r_nfvm
+vsxei64_v     ... 0-1 . ..... ..... 111 ..... 0100111 @r_nfvm
 
 #*** Vector AMO operations are encoded under the standard AMO major opcode ***
 vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6105a50f38..99aed12982 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -246,9 +246,63 @@ static bool vext_check_load(DisasContext *s, int vd, int nf, int vm,
     return vext_check_store(s, vd, nf, eew) && require_vm(vm, vd);
 }
 
-static bool vext_check_isa_ill(DisasContext *s)
+/*
+ * Vector indexed, indexed segment store check function.
+ *
+ * Rules to be checked here:
+ *   1. EMUL must within the range: 1/8 <= EMUL <= 8. (Section 7.3)
+ *   2. Index vector register number is multiples of EMUL.
+ *      (Section 3.3.2, 7.3)
+ *   3. Destination vector register number is multiples of LMUL.
+ *      (Section 3.3.2, 7.3)
+ *   4. The EMUL setting must be such that EMUL * NFIELDS ≤ 8. (Section 7.8)
+ *   5. Vector register numbers accessed by the segment load or store
+ *      cannot increment past 31. (Section 7.8)
+ */
+static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
+                                uint8_t eew)
 {
-    return !s->vill;
+    int8_t emul = eew - s->sew + s->lmul;
+    return (emul >= -3 && emul <= 3) &&
+            require_align(vs2, emul) &&
+            require_align(vd, s->lmul) &&
+            require_nf(vd, nf, s->lmul);
+}
+
+/*
+ * Vector indexed, indexed segment load check function.
+ *
+ * Rules to be checked here:
+ *   1. All rules applies to store instructions are applies
+ *      to load instructions.
+ *   2. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   3. Destination vector register cannot overlap a source vector
+ *      register (vs2) group.
+ *      (Section 5.2)
+ *   4. Destination vector register groups cannot overlap
+ *      the source vector register (vs2) group for
+ *      indexed segment load instructions. (Section 7.8.3)
+ */
+static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
+                                int nf, int vm, uint8_t eew)
+{
+    int8_t emul = eew - s->sew + s->lmul;
+    bool ret = vext_check_st_index(s, vd, vs2, nf, eew) &&
+        require_vm(vm, vd);
+    if (eew > s->sew) {
+        if (vd != vs2) {
+            ret &= require_noover(vd, s->lmul, vs2, emul);
+        }
+    } else if (eew < s->sew) {
+        ret &= require_noover(vd, s->lmul, vs2, emul);
+    }
+    if (nf > 1) {
+        ret &= require_noover(vd, s->lmul, vs2, emul) &&
+            require_noover_seg(vd, nf, vs2);
+    }
+    return ret;
 }
 
 static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
@@ -771,31 +825,38 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     return true;
 }
 
-static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
+static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 {
     uint32_t data = 0;
     gen_helper_ldst_index *fn;
-    static gen_helper_ldst_index * const fns[7][4] = {
-        { gen_helper_vlxb_v_b,  gen_helper_vlxb_v_h,
-          gen_helper_vlxb_v_w,  gen_helper_vlxb_v_d },
-        { NULL,                 gen_helper_vlxh_v_h,
-          gen_helper_vlxh_v_w,  gen_helper_vlxh_v_d },
-        { NULL,                 NULL,
-          gen_helper_vlxw_v_w,  gen_helper_vlxw_v_d },
-        { gen_helper_vlxe_v_b,  gen_helper_vlxe_v_h,
-          gen_helper_vlxe_v_w,  gen_helper_vlxe_v_d },
-        { gen_helper_vlxbu_v_b, gen_helper_vlxbu_v_h,
-          gen_helper_vlxbu_v_w, gen_helper_vlxbu_v_d },
-        { NULL,                 gen_helper_vlxhu_v_h,
-          gen_helper_vlxhu_v_w, gen_helper_vlxhu_v_d },
-        { NULL,                 NULL,
-          gen_helper_vlxwu_v_w, gen_helper_vlxwu_v_d },
+    static gen_helper_ldst_index * const fns[4][4] = {
+        /*
+         * offset vector register group EEW = 8,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vlxei8_8_v,  gen_helper_vlxei8_16_v,
+          gen_helper_vlxei8_32_v, gen_helper_vlxei8_64_v },
+        /*
+         * offset vector register group EEW = 16,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vlxei16_8_v, gen_helper_vlxei16_16_v,
+          gen_helper_vlxei16_32_v, gen_helper_vlxei16_64_v },
+        /*
+         * offset vector register group EEW = 32,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vlxei32_8_v, gen_helper_vlxei32_16_v,
+          gen_helper_vlxei32_32_v, gen_helper_vlxei32_64_v },
+        /*
+         * offset vector register group EEW = 64,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vlxei64_8_v, gen_helper_vlxei64_16_v,
+          gen_helper_vlxei64_32_v, gen_helper_vlxei64_64_v }
     };
 
-    fn =  fns[seq][s->sew];
-    if (fn == NULL) {
-        return false;
-    }
+    fn = fns[eew][s->sew];
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -803,50 +864,50 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
-/*
- * For vector indexed segment loads, the destination vector register
- * groups cannot overlap the source vector register group (specified by
- * `vs2`), else an illegal instruction exception is raised.
- */
-static bool ld_index_check(DisasContext *s, arg_rnfvm* a)
+static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_nf(s, a->nf) &&
-            ((a->nf == 1) ||
-             vext_check_overlap_group(a->rd, a->nf << s->lmul,
-                                      a->rs2, 1 << s->lmul)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew);
 }
 
-GEN_VEXT_TRANS(vlxb_v, 0, rnfvm, ld_index_op, ld_index_check)
-GEN_VEXT_TRANS(vlxh_v, 1, rnfvm, ld_index_op, ld_index_check)
-GEN_VEXT_TRANS(vlxw_v, 2, rnfvm, ld_index_op, ld_index_check)
-GEN_VEXT_TRANS(vlxe_v, 3, rnfvm, ld_index_op, ld_index_check)
-GEN_VEXT_TRANS(vlxbu_v, 4, rnfvm, ld_index_op, ld_index_check)
-GEN_VEXT_TRANS(vlxhu_v, 5, rnfvm, ld_index_op, ld_index_check)
-GEN_VEXT_TRANS(vlxwu_v, 6, rnfvm, ld_index_op, ld_index_check)
+GEN_VEXT_TRANS(vlxei8_v,  MO_8,  rnfvm, ld_index_op, ld_index_check)
+GEN_VEXT_TRANS(vlxei16_v, MO_16, rnfvm, ld_index_op, ld_index_check)
+GEN_VEXT_TRANS(vlxei32_v, MO_32, rnfvm, ld_index_op, ld_index_check)
+GEN_VEXT_TRANS(vlxei64_v, MO_64, rnfvm, ld_index_op, ld_index_check)
 
-static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
+static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 {
     uint32_t data = 0;
     gen_helper_ldst_index *fn;
     static gen_helper_ldst_index * const fns[4][4] = {
-        { gen_helper_vsxb_v_b,  gen_helper_vsxb_v_h,
-          gen_helper_vsxb_v_w,  gen_helper_vsxb_v_d },
-        { NULL,                 gen_helper_vsxh_v_h,
-          gen_helper_vsxh_v_w,  gen_helper_vsxh_v_d },
-        { NULL,                 NULL,
-          gen_helper_vsxw_v_w,  gen_helper_vsxw_v_d },
-        { gen_helper_vsxe_v_b,  gen_helper_vsxe_v_h,
-          gen_helper_vsxe_v_w,  gen_helper_vsxe_v_d }
+        /*
+         * offset vector register group EEW = 8,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vsxei8_8_v,  gen_helper_vsxei8_16_v,
+          gen_helper_vsxei8_32_v, gen_helper_vsxei8_64_v },
+        /*
+         * offset vector register group EEW = 16,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vsxei16_8_v, gen_helper_vsxei16_16_v,
+          gen_helper_vsxei16_32_v, gen_helper_vsxei16_64_v },
+        /*
+         * offset vector register group EEW = 32,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vsxei32_8_v, gen_helper_vsxei32_16_v,
+          gen_helper_vsxei32_32_v, gen_helper_vsxei32_64_v },
+        /*
+         * offset vector register group EEW = 64,
+         * data vector register group EEW = SEW
+         */
+        { gen_helper_vsxei64_8_v, gen_helper_vsxei64_16_v,
+          gen_helper_vsxei64_32_v, gen_helper_vsxei64_64_v }
     };
 
-    fn =  fns[seq][s->sew];
-    if (fn == NULL) {
-        return false;
-    }
+    fn = fns[eew][s->sew];
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -854,18 +915,17 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
 
-static bool st_index_check(DisasContext *s, arg_rnfvm* a)
+static bool st_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew);
 }
 
-GEN_VEXT_TRANS(vsxb_v, 0, rnfvm, st_index_op, st_index_check)
-GEN_VEXT_TRANS(vsxh_v, 1, rnfvm, st_index_op, st_index_check)
-GEN_VEXT_TRANS(vsxw_v, 2, rnfvm, st_index_op, st_index_check)
-GEN_VEXT_TRANS(vsxe_v, 3, rnfvm, st_index_op, st_index_check)
+GEN_VEXT_TRANS(vsxei8_v,  MO_8,  rnfvm, st_index_op, st_index_check)
+GEN_VEXT_TRANS(vsxei16_v, MO_16, rnfvm, st_index_op, st_index_check)
+GEN_VEXT_TRANS(vsxei32_v, MO_32, rnfvm, st_index_op, st_index_check)
+GEN_VEXT_TRANS(vsxei64_v, MO_64, rnfvm, st_index_op, st_index_check)
 
 /*
  *** unit stride fault-only-first load
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7ce6d0fb50..368259f75a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -371,8 +371,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                uint32_t esz, uint32_t msz, uintptr_t ra,
-                MMUAccessType access_type)
+                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
@@ -384,7 +383,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
+        probe_pages(env, get_index_addr(base, i, vs2), nf * esz, ra,
                     access_type);
     }
     /* load bytes from guest memory */
@@ -394,67 +393,63 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
             continue;
         }
         while (k < nf) {
-            abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
+            abi_ptr addr = get_index_addr(base, i, vs2) + k * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
     }
 }
 
-#define GEN_VEXT_LD_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, LOAD_FN)           \
+#define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
                   void *vs2, CPURISCVState *env, uint32_t desc)            \
 {                                                                          \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
-                    LOAD_FN, sizeof(ETYPE), sizeof(MTYPE),                 \
-                    GETPC(), MMU_DATA_LOAD);                               \
-}
-
-GEN_VEXT_LD_INDEX(vlxb_v_b,  int8_t,   int8_t,   idx_b, ldb_b)
-GEN_VEXT_LD_INDEX(vlxb_v_h,  int8_t,   int16_t,  idx_h, ldb_h)
-GEN_VEXT_LD_INDEX(vlxb_v_w,  int8_t,   int32_t,  idx_w, ldb_w)
-GEN_VEXT_LD_INDEX(vlxb_v_d,  int8_t,   int64_t,  idx_d, ldb_d)
-GEN_VEXT_LD_INDEX(vlxh_v_h,  int16_t,  int16_t,  idx_h, ldh_h)
-GEN_VEXT_LD_INDEX(vlxh_v_w,  int16_t,  int32_t,  idx_w, ldh_w)
-GEN_VEXT_LD_INDEX(vlxh_v_d,  int16_t,  int64_t,  idx_d, ldh_d)
-GEN_VEXT_LD_INDEX(vlxw_v_w,  int32_t,  int32_t,  idx_w, ldw_w)
-GEN_VEXT_LD_INDEX(vlxw_v_d,  int32_t,  int64_t,  idx_d, ldw_d)
-GEN_VEXT_LD_INDEX(vlxe_v_b,  int8_t,   int8_t,   idx_b, lde_b)
-GEN_VEXT_LD_INDEX(vlxe_v_h,  int16_t,  int16_t,  idx_h, lde_h)
-GEN_VEXT_LD_INDEX(vlxe_v_w,  int32_t,  int32_t,  idx_w, lde_w)
-GEN_VEXT_LD_INDEX(vlxe_v_d,  int64_t,  int64_t,  idx_d, lde_d)
-GEN_VEXT_LD_INDEX(vlxbu_v_b, uint8_t,  uint8_t,  idx_b, ldbu_b)
-GEN_VEXT_LD_INDEX(vlxbu_v_h, uint8_t,  uint16_t, idx_h, ldbu_h)
-GEN_VEXT_LD_INDEX(vlxbu_v_w, uint8_t,  uint32_t, idx_w, ldbu_w)
-GEN_VEXT_LD_INDEX(vlxbu_v_d, uint8_t,  uint64_t, idx_d, ldbu_d)
-GEN_VEXT_LD_INDEX(vlxhu_v_h, uint16_t, uint16_t, idx_h, ldhu_h)
-GEN_VEXT_LD_INDEX(vlxhu_v_w, uint16_t, uint32_t, idx_w, ldhu_w)
-GEN_VEXT_LD_INDEX(vlxhu_v_d, uint16_t, uint64_t, idx_d, ldhu_d)
-GEN_VEXT_LD_INDEX(vlxwu_v_w, uint32_t, uint32_t, idx_w, ldwu_w)
-GEN_VEXT_LD_INDEX(vlxwu_v_d, uint32_t, uint64_t, idx_d, ldwu_d)
-
-#define GEN_VEXT_ST_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, STORE_FN)\
+                    LOAD_FN, sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);       \
+}
+
+GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
+GEN_VEXT_LD_INDEX(vlxei8_16_v,  int16_t, idx_b, lde_h)
+GEN_VEXT_LD_INDEX(vlxei8_32_v,  int32_t, idx_b, lde_w)
+GEN_VEXT_LD_INDEX(vlxei8_64_v,  int64_t, idx_b, lde_d)
+GEN_VEXT_LD_INDEX(vlxei16_8_v,  int8_t,  idx_h, lde_b)
+GEN_VEXT_LD_INDEX(vlxei16_16_v, int16_t, idx_h, lde_h)
+GEN_VEXT_LD_INDEX(vlxei16_32_v, int32_t, idx_h, lde_w)
+GEN_VEXT_LD_INDEX(vlxei16_64_v, int64_t, idx_h, lde_d)
+GEN_VEXT_LD_INDEX(vlxei32_8_v,  int8_t,  idx_w, lde_b)
+GEN_VEXT_LD_INDEX(vlxei32_16_v, int16_t, idx_w, lde_h)
+GEN_VEXT_LD_INDEX(vlxei32_32_v, int32_t, idx_w, lde_w)
+GEN_VEXT_LD_INDEX(vlxei32_64_v, int64_t, idx_w, lde_d)
+GEN_VEXT_LD_INDEX(vlxei64_8_v,  int8_t,  idx_d, lde_b)
+GEN_VEXT_LD_INDEX(vlxei64_16_v, int16_t, idx_d, lde_h)
+GEN_VEXT_LD_INDEX(vlxei64_32_v, int32_t, idx_d, lde_w)
+GEN_VEXT_LD_INDEX(vlxei64_64_v, int64_t, idx_d, lde_d)
+
+#define GEN_VEXT_ST_INDEX(NAME, ETYPE, INDEX_FN, STORE_FN)       \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
                   void *vs2, CPURISCVState *env, uint32_t desc)  \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
-                    STORE_FN, sizeof(ETYPE), sizeof(MTYPE),      \
+                    STORE_FN, sizeof(ETYPE),                     \
                     GETPC(), MMU_DATA_STORE);                    \
 }
 
-GEN_VEXT_ST_INDEX(vsxb_v_b, int8_t,  int8_t,  idx_b, stb_b)
-GEN_VEXT_ST_INDEX(vsxb_v_h, int8_t,  int16_t, idx_h, stb_h)
-GEN_VEXT_ST_INDEX(vsxb_v_w, int8_t,  int32_t, idx_w, stb_w)
-GEN_VEXT_ST_INDEX(vsxb_v_d, int8_t,  int64_t, idx_d, stb_d)
-GEN_VEXT_ST_INDEX(vsxh_v_h, int16_t, int16_t, idx_h, sth_h)
-GEN_VEXT_ST_INDEX(vsxh_v_w, int16_t, int32_t, idx_w, sth_w)
-GEN_VEXT_ST_INDEX(vsxh_v_d, int16_t, int64_t, idx_d, sth_d)
-GEN_VEXT_ST_INDEX(vsxw_v_w, int32_t, int32_t, idx_w, stw_w)
-GEN_VEXT_ST_INDEX(vsxw_v_d, int32_t, int64_t, idx_d, stw_d)
-GEN_VEXT_ST_INDEX(vsxe_v_b, int8_t,  int8_t,  idx_b, ste_b)
-GEN_VEXT_ST_INDEX(vsxe_v_h, int16_t, int16_t, idx_h, ste_h)
-GEN_VEXT_ST_INDEX(vsxe_v_w, int32_t, int32_t, idx_w, ste_w)
-GEN_VEXT_ST_INDEX(vsxe_v_d, int64_t, int64_t, idx_d, ste_d)
+GEN_VEXT_ST_INDEX(vsxei8_8_v,   int8_t,  idx_b, ste_b)
+GEN_VEXT_ST_INDEX(vsxei8_16_v,  int16_t, idx_b, ste_h)
+GEN_VEXT_ST_INDEX(vsxei8_32_v,  int32_t, idx_b, ste_w)
+GEN_VEXT_ST_INDEX(vsxei8_64_v,  int64_t, idx_b, ste_d)
+GEN_VEXT_ST_INDEX(vsxei16_8_v,  int8_t,  idx_h, ste_b)
+GEN_VEXT_ST_INDEX(vsxei16_16_v, int16_t, idx_h, ste_h)
+GEN_VEXT_ST_INDEX(vsxei16_32_v, int32_t, idx_h, ste_w)
+GEN_VEXT_ST_INDEX(vsxei16_64_v, int64_t, idx_h, ste_d)
+GEN_VEXT_ST_INDEX(vsxei32_8_v,  int8_t,  idx_w, ste_b)
+GEN_VEXT_ST_INDEX(vsxei32_16_v, int16_t, idx_w, ste_h)
+GEN_VEXT_ST_INDEX(vsxei32_32_v, int32_t, idx_w, ste_w)
+GEN_VEXT_ST_INDEX(vsxei32_64_v, int64_t, idx_w, ste_d)
+GEN_VEXT_ST_INDEX(vsxei64_8_v,  int8_t,  idx_d, ste_b)
+GEN_VEXT_ST_INDEX(vsxei64_16_v, int16_t, idx_d, ste_h)
+GEN_VEXT_ST_INDEX(vsxei64_32_v, int32_t, idx_d, ste_w)
+GEN_VEXT_ST_INDEX(vsxei64_64_v, int64_t, idx_d, ste_d)
 
 /*
  *** unit-stride fault-only-fisrt load instructions
-- 
2.17.1


