Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbw-0003QM-2B
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTr8-00031R-RE; Sat, 18 Sep 2021 02:29:46 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTr7-0003zq-9J; Sat, 18 Sep 2021 02:29:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id j14so484474plx.4;
 Fri, 17 Sep 2021 23:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yJ5Hy1smq6A7DzNmyfSRxxVHKv5+jjXK2R1bnXb9l40=;
 b=DnNrx8Fz1zwVIbW/40FnXPlvb5ej7fuZyS9Axuexptclb04yCeqBzRP1esN6o0Tr1G
 vTdqExkYomDZvlXJKru/0luTICQHHhJzeyD+srTNcePDFmw0Ta1dI3ke745VWYf6ZslT
 1+Z5RK2YzpRsFwT6peDkCV5+2vZBR2OMbR+5WD1snstKGwT2renqXvW+WeW1u6wJN67x
 tCmkcjf8GmioktNgY8l/CxGP19vdf/wXqvBlOz5caFaG1yXDmKVEewat3wpItQ5tMVUI
 u/Y+BkOE4AWk21bKWLooFY2q7gybZ8hiH/bg5W5LkGhq0O1YBq/K7oC28y0Ls5TQrFml
 Ga7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yJ5Hy1smq6A7DzNmyfSRxxVHKv5+jjXK2R1bnXb9l40=;
 b=b4sjJgH/Diq0yWZCQ5V+a7oU8MNmVzry2U6S2wZ5kBFVSbyo8VnaUE56Vw+fbvdqYw
 sf+jRQUXb5VrFcAft8l6YG+L7VQ3Jg3eNyPHySQ5uFtqUHjo5tjpIC9+eUM5sWEmiX3s
 FWXX8FQFT6J5w+l90ZDcWGRFvqIGRezfxy1uh+z2cP8b8/5XrUWRfTwaPeIFJQ4xnL9w
 IPCo4vWcb3uwt3kn3O6pJdQp8C+q/XOzRLikI6ldbfJMS965tnsz7HKfn4NwrWbnQ+nM
 noOSUgnjwuUzYbWfcuJ732EB/5nLELFf/YJ8KPqy4NuF08hXFmn3s+cq6Bhjzycr1MWe
 EoPQ==
X-Gm-Message-State: AOAM533elmU7/PdE5SINFFTcf4HY/1xcTnYaWcY5I6Qq0N18DDVWzPRR
 XVYsiF5vx35ZjRGksLWlsu1Z7zjL5ysk8obM
X-Google-Smtp-Source: ABdhPJxAMelvYv7Np4lFGFv+Zdaf85K4llIRfSRvBwtB76osvE5fmh8+lTq5VvyR2AKAfcUGuvZiog==
X-Received: by 2002:a17:90a:9310:: with SMTP id
 p16mr25466588pjo.193.1631946583403; 
 Fri, 17 Sep 2021 23:29:43 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:43 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 10/10] target/riscv: rvb: add funnel shfit instructions
Date: Sat, 18 Sep 2021 14:28:16 +0800
Message-Id: <20210918062816.7546-11-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:22:10 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:29:47 -0000

    Add funnel shfit instructions except fsri/fsriw for opcode ecoding
    reason.

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index e936444c12..08a2fbb376 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -124,6 +124,43 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
     return do_clmulr(rs1, rs2, TARGET_LONG_BITS);
 }
 
+static target_ulong do_fsl(target_ulong rs1,
+                           target_ulong rs2,
+                           target_ulong rs3,
+                           int bits)
+{
+    int shamt = rs2 & ((2 * bits) - 1);
+    target_ulong a = rs1, b = rs3;
+
+    if (shamt >= bits) {
+        shamt -= bits;
+        a = rs3;
+        b = rs1;
+    }
+
+    return shamt ? (a << shamt) | (b >> (bits - shamt)) : a;
+}
+
+target_ulong HELPER(fsl)(target_ulong rs1, target_ulong rs2, target_ulong rs3)
+{
+    return do_fsl(rs1, rs2, rs3, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(fsr)(target_ulong rs1, target_ulong rs2, target_ulong rs3)
+{
+    return do_fsl(rs1, -rs2, rs3, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(fslw)(target_ulong rs1, target_ulong rs2, target_ulong rs3)
+{
+    return do_fsl(rs1, rs2, rs3, 32);
+}
+
+target_ulong HELPER(fsrw)(target_ulong rs1, target_ulong rs2, target_ulong rs3)
+{
+    return do_fsl(rs1, -rs2, rs3, 32);
+}
+
 static target_ulong shuffle_stage(target_ulong src,
                                   uint64_t maskl,
                                   uint64_t maskr,
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8c8fb71bb4..619f635b6d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -87,6 +87,10 @@ DEF_HELPER_FLAGS_1(crc32c_d, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(bmatxor, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(bmator, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_1(bmatflip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_3(fsl, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(fsr, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(fslw, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(fsrw, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 73f956486b..65e574709a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -713,6 +713,8 @@ xperm_h    0010100 .......... 110 ..... 0110011 @r
 bfp        0100100 .......... 111 ..... 0110011 @r
 cmix       .....11 .......... 001 ..... 0110011 @r4
 cmov       .....11 .......... 101 ..... 0110011 @r4
+fsl        .....10 .......... 001 ..... 0110011 @r4
+fsr        .....10 .......... 101 ..... 0110011 @r4
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -754,6 +756,8 @@ xperm_w    0010100 .......... 000 ..... 0110011 @r
 bfpw       0100100 .......... 111 ..... 0111011 @r
 bmator     0000100 .......... 011 ..... 0110011 @r
 bmatxor    0100100 .......... 011 ..... 0110011 @r
+fslw       .....10 .......... 001 ..... 0111011 @r4
+fsrw       .....10 .......... 101 ..... 0111011 @r4
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 4523a5cd4c..5315baa185 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -428,6 +428,18 @@ static bool trans_cmov(DisasContext *ctx, arg_cmov *a)
     return gen_quat(ctx, a, EXT_NONE, gen_cmov);
 }
 
+static bool trans_fsl(DisasContext *ctx, arg_fsl *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_quat(ctx, a, EXT_NONE, gen_helper_fsl);
+}
+
+static bool trans_fsr(DisasContext *ctx, arg_fsr *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_quat(ctx, a, EXT_NONE, gen_helper_fsr);
+}
+
 #define GEN_SHADD(SHAMT)                                       \
 static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                              \
@@ -827,3 +839,19 @@ static bool trans_bmator(DisasContext *ctx, arg_bmator *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_bmator);
 }
+
+static bool trans_fslw(DisasContext *ctx, arg_fslw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
+    return gen_quat(ctx, a, EXT_ZERO, gen_helper_fslw);
+}
+
+static bool trans_fsrw(DisasContext *ctx, arg_fsrw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
+    return gen_quat(ctx, a, EXT_ZERO, gen_helper_fsrw);
+}
-- 
2.17.1


