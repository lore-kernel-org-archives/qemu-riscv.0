Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK32-0005Zx-LH
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2t-0005RV-II
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:44 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2o-0002IB-KE
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:43 -0400
Received: by mail-pg1-x52e.google.com with SMTP id c21so2121837pgg.3
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T+989AocJ42ZgQVR+3+zF/iXoOOPxw2Wzmf9oPeMcyI=;
 b=gGGXq6ha9VkvAhDUXbb+ov9Kz7EczMHIOJnatWdQTUGRCuBtn03QCWuPWszmlEdkXE
 WMiOTi/ypmz5FoqeuL+U62kAaa+JHv5nOrpOUpEaUDNTQMi+AILrLJ5KzEqYljorFm2g
 unC2KFEBFiHheGoIP3HbcAx8M7bGTyVpV9NaFDpjqqceFPWnV4LxPP9uZravyCuxS7vJ
 fUFZAM3iunksUo3GqdhE1OlCMuG8Suf/73cw4EViZdicXt/J0Pt6XBcu9lN/T4G02eUw
 x8AnjTuegVYiVRz0WrVDgu6IMtf1uyTR3eE0Y0PKVi0wk7FoxiX4+lwnrOUqX7PmXaL6
 0vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T+989AocJ42ZgQVR+3+zF/iXoOOPxw2Wzmf9oPeMcyI=;
 b=a+aVrIyVRLgia6i5wf/81WKNnU9Q5P0xL540n4tM5xoK2b9cJGwcZ9TBODMnGyHF+m
 UYQGTDY1dGbsO3IbzaISECOzY1EzZWZhCZOtQTewXjtFGlUnzG4Iw8DxbQp2Yx9PzZDB
 iHQflfy/ySr00CLCS9kRRAnc9e4LcK4vF/N1FWOXQwDehEw7X1Hkrf1AVLHpyJpdZ+JY
 0BPUeGW6rCG/6RcVJ2eEZU6M//7YTXfklAy71EYDjDF2n+zCvvhq1su+ivdLPnYKQ74y
 Ne5nxBMeL5iDr2pje/RxPPCEudyklodnpTl57YO5d/cNedtYomaiPcjYWlLshDU0WptF
 Iw2A==
X-Gm-Message-State: AOAM532XRUxCkjR1/aKeUGsHqUXDnDthhpchlQSf9QA0ywJ3nWg24CB/
 auGUA4QpiMF7Ikh9z/Fs4LoRcQ==
X-Google-Smtp-Source: ABdhPJxdja+Ul1BtNikk9PWZdDFsGWGgJDz/gALjHUYCiNr94TKiSkS0QDldQ9lClbpUMQ2kk1JBDA==
X-Received: by 2002:aa7:95b6:0:b029:28e:aa31:dd3c with SMTP id
 a22-20020aa795b60000b029028eaa31dd3cmr14247134pfk.43.1620230797287; 
 Wed, 05 May 2021 09:06:37 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:36 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Kito Cheng <kito.cheng@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 03/17] target/riscv: rvb: count bits set
Date: Thu,  6 May 2021 00:06:04 +0800
Message-Id: <20210505160620.15723-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:06:45 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9a2ffab1504..6f7671872d2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -662,7 +662,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
+cpop       011000 000010 ..... 001 ..... 0010011 @r2
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 157b4e3c41d..4a5d271b438 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
     return gen_unary(ctx, a, gen_ctz);
 }
 
+static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -42,3 +48,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_ctzw);
 }
+
+static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_cpopw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 60fac0fe27e..c1a30c21723 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -561,6 +561,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
     tcg_gen_subi_tl(ret, ret, 32);
 }
 
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


