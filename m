Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvanf-0005UX-3d
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanZ-0005Bq-53
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:33 -0500
Received: from [2607:f8b0:4864:20::52d] (port=35572
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanQ-0006mY-CD
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:32 -0500
Received: by mail-pg1-x52d.google.com with SMTP id j11so7400762pgs.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1/IwTzInEIeiRJI91UVu2BiqxCIUUNp1aUqKo1aUo8=;
 b=Vcgisl2bvqVcaTYHF7RIBdFEXvGLygw/QgH1dnst9ddiU9MoVYzjW3brYkmgDrDdcD
 zz9C6WiF9G9d4bOMR0DTvPgsRBVsFytbHc0xHeBHHynmh11+v+JMqJOJCe3kYRCvEwuo
 ViT2jRd89vHyyqNvE4wibJ8Q/BTHUVeOi3aFmLo7cEyOh83Y1LQhMrJbK+gI0dhFuDiR
 7bfBVs0vmLebGIQ3Jr4TqKz/1A6b/ULCs7r8KztBQooyoU7ub7XQm12zAPgNkyNTrWbj
 Er3qa+rUTQ/ERyMS5PuXD9aN6PyOkUmSbouWCODtn9F0Eb9YQZ79nC/jF2dvIh7T+bvq
 ZPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1/IwTzInEIeiRJI91UVu2BiqxCIUUNp1aUqKo1aUo8=;
 b=tk/ebzzTe3QlNFgfzKJMDVh3dFvqPD9Np7tp9i2wNOdnN0XmP02svjH4iBcwZc+mq5
 NtT5ZG9s7T6b1xK1hzrvnjvkDSaJKYSHF7OKYmsXrTtGlmTZ0tVFuP5c6Vh8c9bmpM/A
 9JsIV9W6Y2g8cuI/v3S/2biLdysvOJzHcU4dOZxIqvCGhFNKzyTNGHxPDoA5oC6qWk14
 X7a/PlewLjNbw0Fb9rEpFTOni7CKSOCkMj43i+UFCaMRl3Dc0MkBZN6N1LTJvYP2lQby
 MR0dSIfraY8pkdd8dATe7fBsZXuxXlNQmaNooy0u0GPi+WJYSGhIpHHe6uNc+jJyLAq6
 MkpQ==
X-Gm-Message-State: AOAM532dIBhOcp+St48aeQIOTYIY0IBNtO0oYNjs554BPiz2H+pMGP4r
 vMRBGH7lBReSWxKnHpJm+lOXiEAHvrDWysnx
X-Google-Smtp-Source: ABdhPJzs3vPOKdbnZ7LzkKhyuDqOfiyQovTf/3yJGFAFpf8GMScv90UPkxPSjW73l1mbFUvCuw7Yyg==
X-Received: by 2002:a63:920b:: with SMTP id o11mr39737445pgd.314.1639123103091; 
 Thu, 09 Dec 2021 23:58:23 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 21/77] target/riscv: rvv-1.0: index load and store
 instructions
Date: Fri, 10 Dec 2021 15:56:07 +0800
Message-Id: <20211210075704.23951-22-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:33 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  67 +++++++--------
 target/riscv/insn32.decode              |  21 +++--
 target/riscv/insn_trans/trans_rvv.c.inc | 110 +++++++++++++-----------
 target/riscv/vector_helper.c            |  98 +++++++++------------
 4 files changed, 145 insertions(+), 151 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5a760fa4a3..1beca6dc0d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -136,41 +136,38 @@ DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, i32)
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
index 2d8f0cbe7c..f34194d31c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -322,18 +322,17 @@ vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
 vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 
-vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlxw_v     ... 111 . ..... ..... 110 ..... 0000111 @r_nfvm
-vlxe_v     ... 011 . ..... ..... 111 ..... 0000111 @r_nfvm
-vlxbu_v    ... 011 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlxhu_v    ... 011 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlxwu_v    ... 011 . ..... ..... 110 ..... 0000111 @r_nfvm
+# Vector ordered-indexed and unordered-indexed load insns.
+vlxei8_v      ... 0-1 . ..... ..... 000 ..... 0000111 @r_nfvm
+vlxei16_v     ... 0-1 . ..... ..... 101 ..... 0000111 @r_nfvm
+vlxei32_v     ... 0-1 . ..... ..... 110 ..... 0000111 @r_nfvm
+vlxei64_v     ... 0-1 . ..... ..... 111 ..... 0000111 @r_nfvm
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
 
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8a4f75f724..6946d03340 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -803,31 +803,38 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
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
@@ -835,11 +842,6 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
-/*
- * For vector indexed segment loads, the destination vector register
- * groups cannot overlap the source vector register group (specified by
- * `vs2`), else an illegal instruction exception is raised.
- */
 static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
     return require_rvv(s) &&
@@ -847,33 +849,43 @@ static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
            vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew);
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
@@ -888,10 +900,10 @@ static bool st_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
            vext_check_st_index(s, a->rd, a->rs2, a->nf, eew);
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
index 9141292994..df45c1620c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -217,15 +217,6 @@ static void NAME(CPURISCVState *env, abi_ptr addr,         \
     cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
 }
 
-GEN_VEXT_ST_ELEM(stb_b, int8_t,  H1, stb)
-GEN_VEXT_ST_ELEM(stb_h, int16_t, H2, stb)
-GEN_VEXT_ST_ELEM(stb_w, int32_t, H4, stb)
-GEN_VEXT_ST_ELEM(stb_d, int64_t, H8, stb)
-GEN_VEXT_ST_ELEM(sth_h, int16_t, H2, stw)
-GEN_VEXT_ST_ELEM(sth_w, int32_t, H4, stw)
-GEN_VEXT_ST_ELEM(sth_d, int64_t, H8, stw)
-GEN_VEXT_ST_ELEM(stw_w, int32_t, H4, stl)
-GEN_VEXT_ST_ELEM(stw_d, int64_t, H8, stl)
 GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
 GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
@@ -393,8 +384,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                uint32_t esz, uint32_t msz, uintptr_t ra,
-                MMUAccessType access_type)
+                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
@@ -406,7 +396,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
+        probe_pages(env, get_index_addr(base, i, vs2), nf * esz, ra,
                     access_type);
     }
     /* load bytes from guest memory */
@@ -416,67 +406,63 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
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
2.31.1


