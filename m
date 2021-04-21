Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4Fq-0006hU-50
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fo-0006cs-5V
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:20 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fj-0002vb-UR
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:19 -0400
Received: by mail-pg1-x536.google.com with SMTP id 31so13016248pgn.13
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EA1VakVSy8KKgmzlZy2S0QDEcM6PFoqkoum2F7ZUq2o=;
 b=ksW4Aape8AihmEuHh9N1ISGBiJ/F3gAQohsoVaKE7W34H3DQpf6g9PR/0838iz5f7O
 YKfeIzKdvzKmAAUXuBBJZjWJW5Kp/e54FnkZWi3KMWqupWp/itFlh6c7ZrrugWbc56gs
 6l/j1W83IXWYCIxNDkjZWAJyO9CRDZURE7KbtHXhPbspG3Zi39o5LjXGrpTzQnMf/4NH
 ftjlKe0fHRlC7kIbPw6rCmojA/J1u8CU/TnHM4eCWCeO4aA/7t7DyseT2eNjBQxPULsr
 baKLXdshdzIs0Z/aFGJTZFOdIqI2Idd9IiZht6RBZlVohDXxrzu03exw3uegXM6jUujE
 dPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EA1VakVSy8KKgmzlZy2S0QDEcM6PFoqkoum2F7ZUq2o=;
 b=OIsXuxiWVDvXSsye8DF451fM3ncL9WIbYBEvb0mOFvc+YEbUJTczOHqqArTxg6CKcq
 qFHMyeMebBECUIFrdW2clLNXsKLni9KDgMqgBf2yOz/v/XV6BpYuuPRmdQg1r/gCmc2p
 pAOYDk/FO/D8BS35kGhJ8P6cxT42jFPfwXB6TY8ni9wLGsqEu2TAAl9Py6d9DYB0gBtc
 9cmCPiKMV43Z+LndMwlSTbdHN/OYxAyFdMoKdXHqeR/ua1JcqO7ez2ENwI9qok72aTTT
 hbPtxyWHhAUgQGbd3Cp9DAkMzp5yjkl57cnxOiEncI5DrU9DXOadLQyCeNV0pFf6Up4b
 +N8g==
X-Gm-Message-State: AOAM533Z+Z5ihaaxQgIbVsM7YUQM0Un0Jq9n1i4OeGYY0tyt239z6irF
 2GLRzC+89l3JraR20IDeqwc5ZA==
X-Google-Smtp-Source: ABdhPJzJYnSvlLszI4WzK+hCTZArxULFKW4oJFWmyQYdUP7eJvKhMVnNYfeLI1T+DsAS4p00NH0COg==
X-Received: by 2002:a17:90b:50f:: with SMTP id
 r15mr8816828pjz.39.1618978454727; 
 Tue, 20 Apr 2021 21:14:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Kito Cheng <kito.cheng@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 03/17] target/riscv: rvb: count bits set
Date: Wed, 21 Apr 2021 12:13:45 +0800
Message-Id: <20210421041400.22243-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 04:14:20 -0000

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
index 4648c422f42..b20a58c63b4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -551,6 +551,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
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


