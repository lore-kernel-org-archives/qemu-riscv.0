Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscY-00060B-JW
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdc-0005RC-Pa
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdb-0006g1-4R
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:16 -0400
Received: by mail-pf1-x429.google.com with SMTP id 1so2376502pfn.9
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7+Phgr47Js30IrnaYEobO0zdh9saSWyAbNz69kU125E=;
 b=JNCRTnBHGjWhvVrCJK6coy5FAJAd3yV4S7+wt3D+uVztHERTN7XeUDB77GkWLQ363h
 R6kZkSdKk2jsvVRQl8W+VUl72oLW01u+1O3kaRCYygWsvb++vOQeOKUF3Yx/vc7FTShb
 6+Y3y1Y8uPcNT+EPc/yX26G3yizVFUpyzAQV3SNbMpwAPnroRIRWSCz3dLI+VAD9jyOn
 OxEZENAkid6UTMnZ+3o6WJhhsWjOkbOUNtR+1hT27gou2VeBdBh/GPMUOk+3U+lWbFPQ
 B9hp0/sbMz5JLuEXJCsEVcaNMLewhxWnvFN1nv/7Su4fqVFGJVEb55PUCIrVzFS2Iv/Y
 VN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7+Phgr47Js30IrnaYEobO0zdh9saSWyAbNz69kU125E=;
 b=E+2vZ5cTE9Jjbk+gpQAVs/piP5vsIauqPfTrdR9mUxIZw3xL52/kLjqKA5M8sUqoXa
 VlAIvBzQYelnvWrxCoxvFmKV2k5204hyJjSVFxScsL2EOVICHX7jF2meHWc2HLtz+5JE
 13O/WRGcMcROcglw8xbRpR5L5Sr+0uwr1nUl7oy0ZDI6fOfNNHtvT16dJJKjPoDwuTH5
 /6ssbjGQsWyjGax/9LgOU50FkjjnFBkjZCRBSAevaKrllrxQ5t4ZQl92J5Wna9fA4N2s
 NH8KoodNE4+njl3F7DUB8RqzIGK89DloYuTtZZIOUU8hcWUVikYYmMh9oPcugw43I01q
 Jy2A==
X-Gm-Message-State: AOAM532L9yC2v1bZHfFRUfArkaOEOB7bQuG6VwKvHB8vnwP55LoYkOxy
 vX4ie4fiX5DQNSQD3Aom2Hf2QrjCZBgWjw==
X-Google-Smtp-Source: ABdhPJxe24ZhSMARmUqwj7d+UjKl+Q8YSPHaLhDYfrF2ze7iS5lqAhpyXf6mqOHr0Dy7K5hwKMc7eQ==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr57264897pgn.111.1594378334029; 
 Fri, 10 Jul 2020 03:52:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 25/65] target/riscv: rvv-0.9: find-first-set mask bit instruction
Date: Fri, 10 Jul 2020 18:48:39 +0800
Message-Id: <20200710104920.13550-26-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 +-
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 49 +++++++++++++------------
 target/riscv/vector_helper.c            |  6 +--
 4 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 226f8e96a5..f759d4cbc6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1050,7 +1050,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c9c9f30742..b5b59fe6dd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -574,7 +574,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 8191326e94..2db7e7f58f 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2720,35 +2720,36 @@ static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
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
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
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
+    gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(src2);
+    tcg_temp_free(dst);
+    tcg_temp_free_i32(desc);
+
+    return true;
 }
 
 /* vmsbf.m set-before-first mask bit */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bb7ca8aca7..f13f6c6dda 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4648,9 +4648,9 @@ target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
     return cnt;
 }
 
-/* vmfirst find-first-set mask bit*/
-target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
-                               uint32_t desc)
+/* vfirst find-first-set mask bit*/
+target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
+                              uint32_t desc)
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-- 
2.17.1


