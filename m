Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaNF-0007pW-O6
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaND-0007kU-ML
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:19 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaNA-0004FX-7P
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id v1so563537pjr.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1kUMsBJeTTaJT5hWSf4ZQEPL/s217cbvOOKIMRYR0N0=;
 b=b+XknbpNwBpEMuL0GwPYUWdX7zZKDfEC/shgM3WPCFsCezNmXORsZwb6beYB9rqFth
 DycAB0DnDN95ACQ3RXP6IcqYaWLOjLcpk1AellXRLD79IWKkhvcFxmKcq9H2zM/n//J+
 kSr4fwPiItdNfN0E3bZwov4BbP2297qnPg0vewaDGkC0sZ1j6UEl/sZAPvhYXnHOMZqQ
 eKQujST+SHLPfoQQ4yFa2hQCUZ6jb+ZuMDCKEz1OAu74OCvdW+DwNFnXURNdEJ1BXnjA
 k2yrqhEpyut5S5EknK0ygiTr0cSKqoKutXXWGaJXVfOYEmgZarOtIxTuoW8VGHD/8SY3
 6MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1kUMsBJeTTaJT5hWSf4ZQEPL/s217cbvOOKIMRYR0N0=;
 b=RGfvxLj/koiwGwyoup5Aw+j4HCmw91i+LdXfbXGT5EcEd+gBaITzAsrfb1r8lg4j3a
 sV2RVn/HzOAhHmXp/WeQhcGf53jjON600qWdC+Slksq/tmZGBY2ZqG25iVk5Hk5zH1Nr
 JMoj9iIbjsU1geSsS/LQp80JlsYHi1wDGAdq/fLy7Ak0tuZzND5P322aE17wOQVC7M2s
 q1RRdbG65V41gD/utyBaYpAD5mHp9MTLsgzJ01Uq6ap/eEXgA3fam4gD44Se9h9s1L0G
 ySk1fEKUkqnKbSvY++yU++QffycqvL2xRJE5iZpk4c0CHC9vhJcZVdoXHHAeaNxH1CkZ
 6kBg==
X-Gm-Message-State: AOAM532h8+VAHbOnLL3VIP8IFncWUurfT4pg2Xh+UUny9BAg6jJAWJ3i
 KGunNxsWM5itzqq9ypMFWubrmw==
X-Google-Smtp-Source: ABdhPJz2wn1RzhnIQOe5OVvSEqlBXLI8wW7P35YqY5Dj4Oro9DmDJioWYwSV199lDdjPPzFsuzsYeQ==
X-Received: by 2002:a17:90a:f408:: with SMTP id
 ch8mr823116pjb.222.1610522114506; 
 Tue, 12 Jan 2021 23:15:14 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:15:14 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 14/16] target/riscv: rvb: address calculation
Date: Wed, 13 Jan 2021 15:13:46 +0800
Message-Id: <20210113071350.24852-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 13 Jan 2021 07:15:20 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++++++++++
 target/riscv/translate.c                | 32 +++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 894db5e3abf..2f80b0c07ae 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -104,6 +104,9 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0756ea5cc28..b90c1c0a350 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -621,6 +621,9 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index a4181dbf0de..ca987f2705f 100644
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
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -367,4 +378,16 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     return gen_shiftiw(ctx, a, gen_gorcw);
 }
 
+#define GEN_TRANS_SHADD_UW(SHAMT)                             \
+static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
+                                    arg_sh##SHAMT##add_uw *a) \
+{                                                             \
+    REQUIRE_EXT(ctx, RVB);                                    \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
+}
+
+GEN_TRANS_SHADD_UW(1)
+GEN_TRANS_SHADD_UW(2)
+GEN_TRANS_SHADD_UW(3)
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e845b311a3d..7365e591eb7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -812,6 +812,21 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
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
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -898,6 +913,23 @@ static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
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
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


