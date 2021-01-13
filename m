Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaMW-0007CN-Mc
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMU-0007Aa-ET
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:34 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMP-0003wO-MP
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:33 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q4so558897plr.7
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=YcfbKCTAs1Fv1fjn6L2+hxziMDGCTukfWNQJt9c4dxlfmLsVUySVRgLTxtCcM7P3RD
 4XTFKBaJgxtyomRWeHzBdOicMOaRv8uabtkfY8MbQxmSwZXuEXFWZKorURCe5A9ov2ws
 GYS1SlYfwRxdQ5GWQuFc9azCR7VNRbJ/igx6zLc+xJOG+eCi+n8wGWOO0GJSHpdLwqj3
 goOpCpEpXKblOuDupYnw6yASpOTi4TLW7taeDZTJpHlcV1HtWejXFNfeBaVxOuw0ff2h
 /Y73swlgIP+5RcvFRNz68hwck89JglQ+pUzaunl8BVgooWHSbeTqn76rk8dRvUQmP57r
 cDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=ZRxR1Q03ZPEvFwscvA6z4oE9AHBiWiGgmpfniEh/jsmyqpaYA1b54eHINQDRDxekhb
 tITFMjITpSlL4FyyzUIb2cfC3Gbi7671qpG1pZhrk5bZ90llH+SAFzCaoLCGvYJOI7mg
 LYHAzCiJOy58v3s0tbTNlY9VccGqjeY058QKPQdjGCFTgAlfmdWnhxu/kY3RLgjf4VyS
 0r7jOLqOHCadNVFkWInuIExNwONP5Sm2cBHOSqCuSpwXo/ZsMF2bBsfg9JIci0APB+Fx
 XXgWF11OvjZC+dzW7Q+VyRMFa1RsgbgiODpOErs8nbckIfB7EfbLbhUGN2rVWJqZSHny
 i6AQ==
X-Gm-Message-State: AOAM5324yrqWbWvqr0JDL11UCR+i+7NXNhdUNWAWLQGf/a66WbuODCPv
 +rzlU33LSHF2FW7f9HKpWCQRBQ==
X-Google-Smtp-Source: ABdhPJzpgJtCPtUCCKlBCJsFWgO8WCUeyUFnns8Syj/j/mn1xL/7UiO0vN45JEc8fZEhm24u+QWaBw==
X-Received: by 2002:a17:90b:b0d:: with SMTP id
 bf13mr829211pjb.194.1610522068306; 
 Tue, 12 Jan 2021 23:14:28 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 06/16] target/riscv: rvb: min/max instructions
Date: Wed, 13 Jan 2021 15:13:38 +0800
Message-Id: <20210113071350.24852-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 07:14:34 -0000

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


