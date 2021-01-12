Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9Ir-0000zK-9s
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IZ-0000yF-Sx
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:49 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IY-000275-7N
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:43 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 4so564129plk.5
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=GJZ8Uph0uvMvprkuNJHQT9mmvXL+NmackZN5+SBO6Gp4oUg81+tjequm/k18V7TNUi
 IReLapVoWA/kFpzGyjQta6Mdrfg3w1kI3P2fsaJlHxDhzrh1cbSLKz7cqFWJYCXn8/bF
 wOFDR/WTphWcxQ3wB96w2XXfnaVVVOKEw8/CP32d2Og2j+qvTXk4/41R2uOZ3MvSxaUQ
 p5clnHixQPCLMiX+xqsI/982smZOQuIaM/fZTT9Av4CTtcKfOvegwb9AEnGlPS+EJEt4
 TlaACKDsTxVFHSxpuCOlASayS9n9GPt/FH8P+8bMQldFDhlnSUVkXegIqlKfCYl4EU0w
 3hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=GODoLFdzOwtnePGmzw7+MOhx8I7zr/PdPT/uR1q0h7Ruq6fJfhFHBXyB0ZnAtSIu1F
 Uv1EsFEEg47f5mMsDQjWi8Y4TFY+M/OOzBGlN1n8DrtNm2egG1eedBYCTJzWFbIUDqSW
 uEim0ATYdYtHYCUOjOniQH/cWsrqHgmDaquH4JCbxTE5SgFriF+4FB+g+dJWaMyojsm3
 lBcwWLBelS0SlEvCM5gVNFNOMTVaiuXc1TRxYB9fETrfc1qlI3sJnJC6Q9sbTwIyITOo
 LTQOvoKlWV+PDoE9tBqldCbqe1+36g1V/IB3K05O+spCOIVIXw2XI9ZOB+up+NaIGSCQ
 Tqsw==
X-Gm-Message-State: AOAM530ZoCmqFK0EoGWUHfYsBaFyj02FuMA6xZ1+dkfYyYQUsYuV/Zn5
 s9wzqf4bzlQLa6M2hKR0QF5H4Iu3kBcy+igH
X-Google-Smtp-Source: ABdhPJxpJVJ6x2FB5FoPXUB2CXIvRwZUJEG1IEXpiZwkhX8w7h/diaWNb6sLea9Ph0KzjDDuBke8ug==
X-Received: by 2002:a17:90a:7085:: with SMTP id
 g5mr1932677pjk.132.1610418041008; 
 Mon, 11 Jan 2021 18:20:41 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 06/16] target/riscv: rvb: min/max instructions
Date: Tue, 12 Jan 2021 10:19:47 +0800
Message-Id: <20210112022001.20521-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:20:53 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7f32b8c6d15..d64326fd864 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -605,3 +605,7 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2d24dafac09..2aa4515fe31 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umax_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


