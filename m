Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX6b-0003wd-0N
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX6Y-0003rm-7Z
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:13:22 -0500
Received: from [2607:f8b0:4864:20::92f] (port=44855
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX6W-0001Tw-7c
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:13:21 -0500
Received: by mail-ua1-x92f.google.com with SMTP id p2so31012695uad.11
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFtSZUdjeBlKUIHHZ7AnuPxZmIzGa/DanIR24aLooS8=;
 b=BpMo5cT1fCrhOQw+ud1PsMPbFzGYly1XavyyejAK7u+BSMoBZjWDwXRmRE3yWZv/V3
 BD9l2c6jTh7K81s/3MPeaKR3cyVNZEtlTzjDUjzgwmi23/3AIcXD2WWxo07fXu5ivJh3
 hHbpdVlP1L+V8ceIQHK+XTA3dO+aa6HVm9S4NmjN1aWhU/vCw0TMPYPUfT4Uv/Ne6Phc
 qvJ2bDraiSmd764JH6A8PQBrDDJlZMqte7Lev/3EUYUGd4QjYRHt1FK7FFyngexV36wd
 Tk208GIVh26fS3DxkPk2PaRjVPRJRDSodOEXckKuHs/pYXD9lhx5aHxqCi2yUi2eowkC
 xV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFtSZUdjeBlKUIHHZ7AnuPxZmIzGa/DanIR24aLooS8=;
 b=5Hqce30S1e21Cj62Xs8/Ol+yF3/EBeeysOJ7mdGdalna0/dbN9YhQRyOnFZZv1iL5Y
 SgokT+2MNMSD3cs0OpJMDm6HAOxX1anp+C/GGWR6nFDvcXRNlGLWXKy9cqSzAi2vOn20
 wd68ig6YFxlWaaqt/OxD6u6/JRo89YcxhQ+IDFhsn/5PJxzyUxBFRdKTIUcmXtsJgl+x
 XZUMsP2wq4Iu7nFS/Z/7TKqxWWuSq3T7kauI6eIldyJXQVfccBXvZ76vSuPOaRvYMlpY
 mQ8xe3rG46k/rQXXEo2y2nHdFF1VMyhH3I+v2yowBcnZA0cOlkJjvJIHrdpYPT9uVz1u
 ObOA==
X-Gm-Message-State: AOAM53202VyRe1ZIP+JT3m0etc/gm690DDpttZVjEKaTP3nXyMm4NwRH
 fdTqYj2n75kV9w1QYfcA/92/hqlRXS2rvtRX
X-Google-Smtp-Source: ABdhPJxwrvbHyIGLc3sPAVuexHj+kKtsyD6A1H/pwh38zwcXxn5U1h43a4KlCtvD8Yezo9jZb3dA7w==
X-Received: by 2002:a17:903:286:b0:142:4abc:88b8 with SMTP id
 j6-20020a170903028600b001424abc88b8mr57116744plr.25.1638155169443; 
 Sun, 28 Nov 2021 19:06:09 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 30/77] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Mon, 29 Nov 2021 11:02:50 +0800
Message-Id: <20211129030340.429689-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=frank.chang@sifive.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:13:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3f30882aec4..7646567eb27 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1022,7 +1022,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e748f7ca714..4df2aa9cddc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -628,7 +628,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b53cd2e6f37..3645bb96356 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2696,7 +2696,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2715,7 +2715,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9451112b3da..f97783acf05 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4233,9 +4233,9 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
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
2.25.1


