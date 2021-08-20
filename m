Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YG-0005sb-Fu
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y9-0005cU-UZ
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y0-0003tq-RA
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id mq3so7775480pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pDXnUWS0BwMutSCt7YsEkS8Wc9bolLs5aemQ/b75V+c=;
 b=qVY97KXYvqZP8d7NWp5PqEoobd9AzeicdqoLs+P0HI8Pm/Xd3ov+x+8baWjIFKQb7z
 EvlPLdX7AufsZVrsp6mMr3PN3FhWrFkRDme3CsPXw+eBvBbKdqKCVZaiJx9oON3te12K
 V87DHNKpcOVm/frLpRvdZ+7h9oFUz1oUW3bKFDGI57dhjl//Ub9kphiJajUsQbozLDv8
 L3x4QBK6pX1aWYShlFi6yo0y6QhafNplLgsKOL4y6vV4u3z0cv9tKK1MLzGAJMwFjBBu
 cXtLuT2inWUAgi4DDS6YZ7O+qR1BHlZsLCA01x+HuRfaI5DV6Sw+r7Xh0C9X9sNIhkV6
 T58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDXnUWS0BwMutSCt7YsEkS8Wc9bolLs5aemQ/b75V+c=;
 b=B7wlPHEuYDyipPXknvncmr96U/UmdVYoXVpnUsXisGmcng+sGEs/zrizBAFGHsO5Qi
 qUDV7ut/3zqmkboFnHU6OClKzFB6qDauSHpiRfhoxCBDpckm9LvkO1qApQPhRwwEjTMC
 P31BrNLlZPuEunXa93V7zMKwpXPTNOCgQB5IXyzeLCcVcA/fumanyNQ/6RFhJeGtyqig
 xvuYmNNwMX0z2lQR49m8UOFGpNvTnys+6NRZD80/GLoekq6VDpprag1JtfcWMeiaL3UR
 e4KxOpqf4S+2h5qaoyAX1PpIfEJRy5x8NGcDCrRirGTSwrQbTxXmn3r6SLa4hmmhqiae
 k0FQ==
X-Gm-Message-State: AOAM533MnBBAa7Sau6ZTbaKXmxX9HLjSPl8b/sCPVMRSr0ccV0pZEkrH
 Z3Yn/mYKiuWT2gE/NoBlnvj4pw==
X-Google-Smtp-Source: ABdhPJxlOhk/wsDsvD3lAMYek6Zdhvfj4KHsiDw7Rr6n+/th1X+zNYtO8kw4f7H+yWlvbuBS+a0/Ag==
X-Received: by 2002:a17:90b:3694:: with SMTP id
 mj20mr5611031pjb.5.1629481395415; 
 Fri, 20 Aug 2021 10:43:15 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 09/21] target/riscv: Move gen_* helpers for RVM
Date: Fri, 20 Aug 2021 07:42:45 -1000
Message-Id: <20210820174257.548286-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:26 -0000

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvm.c.inc.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 127 ------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 127 ++++++++++++++++++++++++
 2 files changed, 127 insertions(+), 127 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1855eacbac..7fbacfa6ee 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -249,133 +249,6 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
-static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv rl = tcg_temp_new();
-    TCGv rh = tcg_temp_new();
-
-    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
-    /* fix up for one negative */
-    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
-    tcg_gen_and_tl(rl, rl, arg2);
-    tcg_gen_sub_tl(ret, rh, rl);
-
-    tcg_temp_free(rl);
-    tcg_temp_free(rh);
-}
-
-static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    /*
-     * If overflow, set temp2 to 1, else source2.
-     * This produces the required result of min.
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
-
-    /*
-     * If div by zero, set temp1 to -1 and temp2 to 1 to
-     * produce the required result of -1.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
-
-    tcg_gen_div_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, max;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    max = tcg_constant_tl(~0);
-
-    /*
-     * If div by zero, set temp1 to max and temp2 to 1 to
-     * produce the required result of max.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-    tcg_gen_divu_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    /*
-     * If overflow, set temp1 to 0, else source1.
-     * This avoids a possible host trap, and produces the required result of 0.
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
-
-    /*
-     * If div by zero, set temp2 to 1, else source2.
-     * This avoids a possible host trap, but produces an incorrect result.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-
-    tcg_gen_rem_tl(temp1, temp1, temp2);
-
-    /* If div by zero, the required result is the original dividend. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp, zero, one;
-
-    temp = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-
-    /*
-     * If div by zero, set temp to 1, else source2.
-     * This avoids a possible host trap, but produces an incorrect result.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
-
-    tcg_gen_remu_tl(temp, source1, temp);
-
-    /* If div by zero, the required result is the original dividend. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
-
-    tcg_temp_free(temp);
-}
-
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 80552be7a3..b89a85ad3a 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -39,6 +39,21 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
+static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv rl = tcg_temp_new();
+    TCGv rh = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
+    /* fix up for one negative */
+    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
+    tcg_gen_and_tl(rl, rl, arg2);
+    tcg_gen_sub_tl(ret, rh, rl);
+
+    tcg_temp_free(rl);
+    tcg_temp_free(rh);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
@@ -59,24 +74,136 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
+static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
+
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
+
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
+static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, max;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    max = tcg_constant_tl(~0);
+
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_divu_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
+static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp1 to 0, else source1.
+     * This avoids a possible host trap, and produces the required result of 0.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
+
+    /*
+     * If div by zero, set temp2 to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect result.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+
+    tcg_gen_rem_tl(temp1, temp1, temp2);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp, zero, one;
+
+    temp = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+
+    /*
+     * If div by zero, set temp to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect result.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
+
+    tcg_gen_remu_tl(temp, source1, temp);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
+
+    tcg_temp_free(temp);
+}
+
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-- 
2.25.1


