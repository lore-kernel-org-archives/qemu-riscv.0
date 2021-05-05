Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3A-0005mS-EZ
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK38-0005hk-T4
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:58 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK33-0002Pp-9A
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:58 -0400
Received: by mail-pg1-x530.google.com with SMTP id d29so2120416pgd.4
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y25XCxl0bqw4d4z7YG7X5EfReMRIRItYwt7ssBNZbp8=;
 b=gZPzgh5E6/wWlg/H1RMiepTrUoPPiaifCNtXBvlSyGSBs286vysNAvEML+bLBLO0Jr
 7YzhnJFiZA9TyS8Ej59eQLQf43yzOz6YORr3ivtouawOYl1jBehUiXVkdgtos4Auss9R
 LDd4RVFhILrh0hfr+Nik8C/0KwRoTd7LpbCHKljd2WZ0BocCRA1VmngraJ55XGAsetym
 Vu79ud4hCsPxwkAL73RdT8tnCLwergIxuhOKx8PI5s2AFEFysSrfb950qkNHElSP3HFU
 GXeZTMx9u3kOMbbUKMuHN6/lCOqhrfrkJmoXt/C72MZBBZVCQn0ixtav3gzV0MapWPG5
 s7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y25XCxl0bqw4d4z7YG7X5EfReMRIRItYwt7ssBNZbp8=;
 b=KDi28rZwmXVg6cBa8DMO7npV41AlRl+28cenFTa5vIOgQW2RVJyW1t5pTIA7YSTMko
 6GP/Iw7Cg4duqsVfFNaChsVzAzUpXnVue21QHGH5IY+2GfE7x3f8wKSmz1JoHSs2Cljy
 gqFvfqsV13WDCrGZqLwSzIvk7/PGGNE/4Ubl5jin/DPCI16qyWwWkq4zOxotAQEuasd4
 f8Pt7CHh9T0J/IDebKQQ3O+8+lPGv+/RKBSwMJ6jFToQ9dn/tE96f97hbFaddE73bpoA
 4oNUSfEp7RfLn3zndnoanOW69p0wl1Xh0TzZpmlCU2R19UHyHQPeyIE198P8jXcbInIs
 LGCg==
X-Gm-Message-State: AOAM532vvuMHz7KnPUFyhtqhCPQaIuNab0+06k83R6FMPZJwm+nH3Vix
 oVAmJ25c4VwY9WDRpa9tdB9/3g==
X-Google-Smtp-Source: ABdhPJyatirh/3fH2BmGYQp2rnn/YGuIXe7mWFSgSMbLg647EGvwQ1OsX6m2QCMbvA/z0sdkPX2PSQ==
X-Received: by 2002:a63:1b55:: with SMTP id b21mr29570366pgm.160.1620230811941; 
 Wed, 05 May 2021 09:06:51 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 07/17] target/riscv: rvb: sign-extend instructions
Date: Thu,  6 May 2021 00:06:08 +0800
Message-Id: <20210505160620.15723-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:06:59 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 81dfdfbafdc..93619846349 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -663,6 +663,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
+
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 5a4fc02f705..3d594e8cb40 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,18 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.17.1


