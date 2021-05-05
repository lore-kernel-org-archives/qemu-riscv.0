Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK33-0005bu-78
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK30-0005Vu-R5
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:50 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2y-0002N4-Sn
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:50 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 10so2468868pfl.1
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WDNvY/qw3qpaFfSGAmKakwm7H/nAtriANbcxbBIwKow=;
 b=M7r89aHpsnt+WXbCJC9dKnxdfllS9KJggcz7xJHltuv22gBKvA2eHDcWrkbJd3cozh
 v2AFeIvFD2nPbk8Ysg4/zuXGBnEaun75JdcV+yXZ6dM2gk+97fE/XuOP4QVuJ07Z+/rj
 qKPn1WRn8R0I+hSZA/PSeBvg+3XRucgT0izfPeM3a6TnggKTy5zuYfffb/6GO9xyKM7l
 ipEVx1R6xZIVpIbvnibdt0VZbTiUgco4q9ix36NU+BbW2zrQu+rKmIwSxy05ORAPFaiG
 Slv1AXiMlMPXrnx8BpaKXQo8igH6mFkzgCsvdoq6x28CppBPZJlV1PMEQIzuuq7rrdGg
 Fw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WDNvY/qw3qpaFfSGAmKakwm7H/nAtriANbcxbBIwKow=;
 b=HFJ9x1e7198SDGwNxs+6wOMYzcgYvdsh5Z0urPkrPwFSKfp0sc8PYtqKPMIAD9ez4F
 DAtgiD287n/FI0QP5pp+MUAMoqSwNSphy9XuyuU+1UAH9h4jE6y/IgGFqK96JICtZz7A
 X4dsUYcWuS1s9lCcnNglCFKsiMgt02lNG+4TuVvNUIMLWGVE41EWQdrP87tV857p+oNX
 mj5HT1O6rjdK6oUprakKA9fJFw+lFCktrChF0fhUCTl20q8tVXvrFkZ5M+v88TiKtAdZ
 A2SIDzxgC+pDQRvG3A+Xb/a2AyQPqRrNXX/vUt+vpo1gT6j/T1OK9+VvnuDZeU3EDYsR
 4vBg==
X-Gm-Message-State: AOAM533rm9k5tDFV1wgOU/FZrsd9S0YQ5Oxoo+seXWhTZjDli2u9ivig
 U7B88vPX/3olFwqjI68bsQkUEA==
X-Google-Smtp-Source: ABdhPJznwcRQ8os22XxSfMY3NJNhdg4prq5E+F2hgFA5jzmOgls+X49VdKqB0I9QxGk1lnGfOXnu5g==
X-Received: by 2002:a63:4607:: with SMTP id t7mr22212258pga.269.1620230807611; 
 Wed, 05 May 2021 09:06:47 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 06/17] target/riscv: rvb: min/max instructions
Date: Thu,  6 May 2021 00:06:07 +0800
Message-Id: <20210505160620.15723-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:06:51 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9b2fd4b6fe8..81dfdfbafdc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -669,6 +669,10 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 770205f96f7..5a4fc02f705 100644
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
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.17.1


