Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9IN-0000ce-AT
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IM-0000aX-BD
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:30 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IK-00022t-Oa
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:30 -0500
Received: by mail-pj1-x102f.google.com with SMTP id b5so717268pjl.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wuNjl3EjuCZSjORBEPTCtDvkvtn3BPGc4wwp49Q4nUg=;
 b=cGWExW/7DtVhYtewmhfXtATJtaKUYo8IoNl/TkhyUF7vx+wjh/Y/w2dtdrJhLBkLfE
 GWlUtjurJZAB3JCELmC0Ri05WhUTfrJSuX6g8iW+M0mdpPGg3dHkxgQtYfFqEAsNxjpj
 KiMwSnxszh6+TOg2lPq90aowtSOIozec1KDcaoCiWmT/it91sx9yNIUDxnZfOxaJXLXr
 O5vCGXk2cw7cfkn7I798B/jen5TZv4JHsYJccGiWjW+zRbq8AJtc9fxUrZ5zStUOYMv4
 GSBbDAUKqOgDk1hgCCiggBVtyxBHek5faceSUwwWRvXTOrZ3NkCyJ36rJDrGsHBx3RBM
 lPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wuNjl3EjuCZSjORBEPTCtDvkvtn3BPGc4wwp49Q4nUg=;
 b=shy4TvYALms+8dW5Pbqg67GyjLDNP2JriL1gckxjW66A0CVE8oZeNS1SxoMuHl2ws3
 klYXGBC9kzyM/TpgI8g8Mkr0ye1CxMV69eOsut35rlvqFePIT97ofJTY8YPIrZ89BLGd
 3fNbjBo6LGpntfzMpM9lb/AZnv/hGLSURVWpTHPWadPzhVKtyvgMVRGWQD/qzipqi4l6
 HZybK952kvej/3fRoc2Tv1aQBBgArjIOne1NvVEhCBbc677uyYdf27xRtSt1/MGU7aUg
 Hr5StHyXMAw+Uw7tByoPeyzaGVl2Qz1PJ2rUt1FOMU36h8FN4kLxhaW54w/yHWvX/JQe
 0Nkw==
X-Gm-Message-State: AOAM533Nb4NN7p7Lc7VKpZuvAughKueKd3VXy75QVBuQcnBsTPlBIcoz
 EHESvAbF9j3wplpLD1U6I/Sd/w==
X-Google-Smtp-Source: ABdhPJxdzl54RRs7ISSg2tNuPVNWnYLaNyh2EymrT5o5ce7D6JnI/BmhGYG/FaEbmQEWocaUmatXqQ==
X-Received: by 2002:a17:90a:4887:: with SMTP id
 b7mr1929860pjh.40.1610418027492; 
 Mon, 11 Jan 2021 18:20:27 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Kito Cheng <kito.cheng@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 03/16] target/riscv: rvb: count bits set
Date: Tue, 12 Jan 2021 10:19:44 +0800
Message-Id: <20210112022001.20521-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
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
X-List-Received-Date: Tue, 12 Jan 2021 02:20:30 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  1 +
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 target/riscv/translate.c                |  6 ++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index f4c42720fc7..89498a9a28a 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -90,3 +90,4 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8fe838cf0d0..0e321da37f4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -597,3 +597,4 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
+cpop       011000 000010 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 76788c2f353..dbbd94e1015 100644
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
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -44,4 +50,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     return gen_unary(ctx, a, gen_ctzw);
 }
 
+static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_cpopw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fac111d465c..3a14bdba194 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -726,6 +726,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
     tcg_gen_subi_i64(ret, ret, 32);
 }
 
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


