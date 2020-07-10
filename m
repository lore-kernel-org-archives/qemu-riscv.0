Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscp-0006dQ-8F
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdZ-0005Pr-3P
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:13 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdX-0006fP-Et
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id a14so2396255pfi.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rFDAc1CQd4rrvwnoBKDlUzXCXmk7byxkcw3vHoQoCNI=;
 b=dti5C0lng5ymEIGZCNC+924Ev38Jz0/piKpkOEkX+yACdcq7sLQo9UmDyJSVpOvxIO
 5BqDm2fcoC2creb33gl5hhM9EimYH18aDvutrpcnzeTvt/auqRKJf1zqbZ+knG196Y03
 Z12KYsnS3gTu8AK8iEE/UDJsg3pzJOaufXq38jN/6A82PLHaf5RW/YcAJdHTJ+n8p6+k
 ZPAQ4wI4OrBLOmX+n4l512cCblAOOGc2eQVHOODVw34rUgvYttVxuV10Svdj0XUkyxdG
 aSOCD0cKdXBCCaTa0B6o9uxLCaP9DjgXMlKzElgCTTzaYsHcu6syRuiJTqDzngPCQl1p
 vIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rFDAc1CQd4rrvwnoBKDlUzXCXmk7byxkcw3vHoQoCNI=;
 b=FxTzREW86ca0W+d4aTRGsp5Z6gcyYGAXfzzb9L0ihBtV2i1L6eb5bzEM4ttiF9EK63
 sZrN8ArC//Rhbr97CX/xDQXOmPKHz+iDvC7ZB75hflEwTLk3FK7jtV5iVPHHL2u/xqpf
 nFdMGVaB4EStwQH8sC54EkCtVB0q/q7IEdIc2YRbpZaqMDIqLgIgEqgabFfMbKcN3C2g
 cX9g3CFArOJSiatqIUnhUdo7Hj+lxEMULElP8q5Dj8Y7nJmjrtuJUw5k2RmNFPnImIcM
 npWPRpZIH5Yjp4iX4CusgbNNaQ3EQGkpeUJFQMKl75foa8YBNrcaaZYClT69AVL4UrJ5
 DwQg==
X-Gm-Message-State: AOAM5308sZP1XKPm7NbOgE5DCvb1ojcPdiWbuNctqXb+uujj3sWp9lnJ
 GgpcgQ0+V4N8ahELHCrnodjtYkl68DMvWw==
X-Google-Smtp-Source: ABdhPJwWx9oE9uGf6tkROvhbAk+32DGJr4bd+x+GgAVQeoqrfVLPP2URhdmpMTw3VKJsmU1tNvUkCA==
X-Received: by 2002:a63:79c2:: with SMTP id u185mr55628394pgc.84.1594378330203; 
 Fri, 10 Jul 2020 03:52:10 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:09 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 24/65] target/riscv: rvv-0.9: mask population count instruction
Date: Fri, 10 Jul 2020 18:48:38 +0800
Message-Id: <20200710104920.13550-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 +-
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 51 +++++++++++++------------
 target/riscv/vector_helper.c            |  6 +--
 4 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 924c334f71..226f8e96a5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1048,7 +1048,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7ad936e605..c9c9f30742 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -573,7 +573,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 5b061c303b..8191326e94 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2686,36 +2686,37 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
-        TCGv_ptr src2, mask;
-        TCGv dst;
-        TCGv_i32 desc;
-        uint32_t data = 0;
-        data = FIELD_DP32(data, VDATA, VM, a->vm);
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-        data = FIELD_DP32(data, VDATA, VMA, s->vma);
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
 
-        mask = tcg_temp_new_ptr();
-        src2 = tcg_temp_new_ptr();
-        dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    TCGv_ptr src2, mask;
+    TCGv dst;
+    TCGv_i32 desc;
+    uint32_t data = 0;
+    data = FIELD_DP32(data, VDATA, VM, a->vm);
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
 
-        tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
-        tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+    mask = tcg_temp_new_ptr();
+    src2 = tcg_temp_new_ptr();
+    dst = tcg_temp_new();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
-        gen_set_gpr(a->rd, dst);
+    tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
+    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        tcg_temp_free_ptr(mask);
-        tcg_temp_free_ptr(src2);
-        tcg_temp_free(dst);
-        tcg_temp_free_i32(desc);
-        return true;
-    }
-    return false;
+    gen_helper_vpopc_m(dst, mask, src2, cpu_env, desc);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(src2);
+    tcg_temp_free(dst);
+    tcg_temp_free_i32(desc);
+
+    return true;
 }
 
 /* vmfirst find-first-set mask bit */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2a006f956c..bb7ca8aca7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4629,9 +4629,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector mask population count vpopc */
+target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.17.1


