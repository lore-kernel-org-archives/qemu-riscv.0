Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3Y-0006RG-A1
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3W-0006NV-36
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:22 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3U-0002dx-1z
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:21 -0400
Received: by mail-pj1-x102f.google.com with SMTP id md17so1059833pjb.0
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eMwKxP8kBxGD3pejD3y8l1qWIdfzVtSUG680AHrIPSo=;
 b=hYBpmUeeQChu9fNQGUOVzF6kZU8DWSilkHMMRUfmdeU32WXKGshQYjEldX80uxdQsh
 Xq2eFklIDkl55Z9nh1phf3/975xePRe6UwGG1kYVRD3Izj1Do25QRzO5CY2N5adCnC8f
 8bm5KwRV1NTvAsRKHvgABt6eum/WMqGvrNjDbIpf4YFevoAdnSuhC3E3+eLgUU6WwWcW
 SNpYEJvik/Js87fqR0dwXoGCRrUoYsTDWcS1/YtjEm2YuOJ7dkZY2P5ruPClMnyeNEc1
 y5EQrcRbxkSOtm5/05oLJExaEveYVjM9+bvTGNyHiG2TkpRFhUx5bh9DVh2K3eFti3XJ
 D6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eMwKxP8kBxGD3pejD3y8l1qWIdfzVtSUG680AHrIPSo=;
 b=tRBiQbSdklBQ5Wb+SF5/jd9Wmo1T686yU+V0k/+OYoMrbtWv5cIK+MNI7VQZ/GsKh2
 kGbDmaqt+1e2U1dkUdLE0M/CoVVxzR6njGC8Z/hDplRulLUAuYxkiryevNn1PFppC6Ya
 d4RU7o8FNaaNTh+zX5tGQrzdyNFH6l67elZNq6596+mpb5/nc19MatEtGXvv4h1S8t4V
 dGLNCmt2BW9Cp/2E8fTKc+AfBX/tQKp9ujgSJTdez5w7JMxjhfQunET2kcuz0EKEXEr3
 4poPXyUq182Sz6vaMY7icTPUYH8hWgwbdrTWT5w9TyOYgbT2zz3pCltmVJxKzx0prQnt
 ylEQ==
X-Gm-Message-State: AOAM533hRHDaunUXrxtMBS/pGPDCBmeqA7TrM/wAYxEEaW7a81alsUBf
 kVQKxaNagGau+FDjttNMeqjOOA==
X-Google-Smtp-Source: ABdhPJyDMXjQ4RU+3ZVycwFStrAzGUHCb2Ap5zPQqdMPaStTC8RUSCL1TdSXYBrVEXghVSAO7UDT1Q==
X-Received: by 2002:a17:90a:f3d3:: with SMTP id
 ha19mr34754375pjb.166.1620230838692; 
 Wed, 05 May 2021 09:07:18 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:18 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 14/17] target/riscv: rvb: address calculation
Date: Thu,  6 May 2021 00:06:15 +0800
Message-Id: <20210505160620.15723-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:07:22 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  6 +++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++++++
 target/riscv/translate.c                | 32 +++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e6dab8dbbc1..287920ee9bf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -686,6 +686,9 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -714,6 +717,9 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ec9f9d2ef24..b27114a068d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -226,6 +226,17 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shifti(ctx, a, gen_helper_gorc);
 }
 
+#define GEN_TRANS_SHADD(SHAMT)                                             \
+static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
+{                                                                          \
+    REQUIRE_EXT(ctx, RVB);                                                 \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
+}
+
+GEN_TRANS_SHADD(1)
+GEN_TRANS_SHADD(2)
+GEN_TRANS_SHADD(3)
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -386,3 +397,16 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_gorcw);
 }
+
+#define GEN_TRANS_SHADD_UW(SHAMT)                             \
+static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
+                                    arg_sh##SHAMT##add_uw *a) \
+{                                                             \
+    REQUIRE_64BIT(ctx);                                       \
+    REQUIRE_EXT(ctx, RVB);                                    \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
+}
+
+GEN_TRANS_SHADD_UW(1)
+GEN_TRANS_SHADD_UW(2)
+GEN_TRANS_SHADD_UW(3)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 35d4d36eef8..ae9b5f7a2e2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -649,6 +649,21 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
     return true;
 }
 
+#define GEN_SHADD(SHAMT)                                       \
+static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                              \
+    TCGv t = tcg_temp_new();                                   \
+                                                               \
+    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
+    tcg_gen_add_tl(ret, t, arg2);                              \
+                                                               \
+    tcg_temp_free(t);                                          \
+}
+
+GEN_SHADD(1)
+GEN_SHADD(2)
+GEN_SHADD(3)
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -733,6 +748,23 @@ static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_gorcw(ret, arg1, arg2);
 }
 
+#define GEN_SHADD_UW(SHAMT)                                       \
+static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                                 \
+    TCGv t = tcg_temp_new();                                      \
+                                                                  \
+    tcg_gen_ext32u_tl(t, arg1);                                   \
+                                                                  \
+    tcg_gen_shli_tl(t, t, SHAMT);                                 \
+    tcg_gen_add_tl(ret, t, arg2);                                 \
+                                                                  \
+    tcg_temp_free(t);                                             \
+}
+
+GEN_SHADD_UW(1)
+GEN_SHADD_UW(2)
+GEN_SHADD_UW(3)
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


