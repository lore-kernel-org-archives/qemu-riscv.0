Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWza-0004o3-2S
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:06:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzY-0004iT-Ic
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:08 -0500
Received: from [2607:f8b0:4864:20::530] (port=37668
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzW-0000Sr-AJ
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:08 -0500
Received: by mail-pg1-x530.google.com with SMTP id 71so14504995pgb.4
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Y3FhA0ad1ZQT03uAy1dWdFsTfodzIKAvn9Is60nw5s=;
 b=OdgzzCkbQidt1BannB1MSJevsdEt1LToB/+rgsrkAgBbH6LD/F3/NT6piV7M5ztI0E
 ixSDhBQL3iYQN2DLG8tOt/VXq8IxuIWm9WvpQG0PsGgdUH7yzembhVy9CIocFXv9Aib4
 /lfvaF7Eijq6RrP51PLab4cfBDiAaL35tQHzqZpFLUtjKGeWkOIDF6BdIPkPQ/VJAqHm
 U1ANBwdkBX+Cgq9dJ1OqWxdMpi6RFlZ3WeaYrVBYZ98Hm+dmIP+DFw7s0C3d0f2I7jks
 kPxd3XEtFlh3JrNK1GZ5rbE3I1gfoInMGYZbWokBusICpKxCVFJLmbzjMdHIbC68wcO6
 Mz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Y3FhA0ad1ZQT03uAy1dWdFsTfodzIKAvn9Is60nw5s=;
 b=dqrd5hRCT8CWvZWWN8yfdFHbszWDxSHnnLabZOPf0DWzlKuAycfVRshJHhvqerLnV3
 PLIH4Do4yzX584HPYt9R5cu+Zc4MhK/kW4e823DzqtAgc03TrxwcIia4A0jYPZlU8RLm
 C6iaV5X4F++HmYOJhaoS/BBtpw5yxqDzRjdzDm9yZy6D6bkUTaT/X5wQY0z6yM26KNVo
 7rPUjKr62HBpvUotrAm+ewPtsO3p5NUWROsS8Jam+5PlpGBPktre7X0d0f0f5aP2p/br
 pkrtDLGwYyI+UmXHSue6NfHd+zVMB4sAcP71QVnzM9/djUHyRqWpvFykgZj0FrvmUkaq
 pn4A==
X-Gm-Message-State: AOAM5319rSjye8kiKAl/RQPEjGpm7FpHfs56kBCDAATdc+Qo1ty6NXgn
 FnuU81cm6FHfwtubdXqnTlD9oA==
X-Google-Smtp-Source: ABdhPJznqrMLHkkoPT+T4ezI8XbJ7uxJWpcE1mjAnrvV9PDFx9ymYX+JmFT4Tha4Tj4xn7qHkCpoKA==
X-Received: by 2002:a63:f047:: with SMTP id s7mr33404687pgj.389.1638155165082; 
 Sun, 28 Nov 2021 19:06:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 29/77] target/riscv: rvv-1.0: count population in mask
 instruction
Date: Mon, 29 Nov 2021 11:02:49 +0800
Message-Id: <20211129030340.429689-30-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:06:09 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b8894d61510..3f30882aec4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1020,7 +1020,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f61eaf7c6ba..e748f7ca714 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -627,7 +627,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5c04ac90dae..b53cd2e6f37 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2664,8 +2664,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector count population in mask vcpop */
+static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2684,11 +2684,12 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vcpop_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
+
         return true;
     }
     return false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f9919273dca..9451112b3da 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4214,9 +4214,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector count population in mask vcpop */
+target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.25.1


