Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtG-0001pt-0s
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtD-0001nR-FI
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtB-0002eV-Ke
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:59 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtB-0001Cy-AB
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:57 -0500
Received: by mail-pl1-x635.google.com with SMTP id k15so1344276pls.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=keMqI9a4hazxI6Sn+pZrrOA4+U2MOLh3728gyXkiHuY=;
	b=em3cQ/iQFXda2aF2mv+Zo5+tKkTn4ztJ/eKaZhtyUDWS7k3pb1On7afg0btTlS2O3O
	hjRmryX01QUP1aI/KmUDuINpXi7hMpi5CcWzIOszdZYMzK+6kORqIk+hrAXOyLCRs+tB
	D7b33JzW2EgVWcJjPSeye9A2Ea5UlAv7j1XhJW1+IqckBVAOPzbOVLQR9I8UDN23kIjJ
	3pY+/3b3DqOAUWNa8aowtUOZScD0pHPUVM56VkZSYQW6IdJpxcJBDzh0W0102KFu7YlI
	8CxNznynj7mvwHdGTaxCXqXAjvKhINs4/ap0Pc8FN/EB/pKEgPt/UxJLQBlI3HUc5a7h
	solA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=keMqI9a4hazxI6Sn+pZrrOA4+U2MOLh3728gyXkiHuY=;
	b=PY1bsvudyMrvdfxfswRH+FF3W/Upq095EhtLBxQS+VSyK1aOB3kieqj1hyladkOOAx
	43hWxYaQ27ugJYWrOUl3Rrqso7JNQypfEjrunCND2IawDHO6PZs4EaCKUVRSo4u+zl9A
	oHu8W32T2XYy7LjJGSfYpVZvJFqketwSS59QlgovFumrHOJigg77kRtvgdiJg8U2qWrd
	Jb2CBieHZGnN7XlABD3uBXcbeZaBYIrOfkwsEh68xACchMMCtfKjxUDJXi/hUfqxcUVG
	5LI0lLT9/uxLNenzJMBpFKR5mwloVwqfY93heOObkNpBekM1fiDB/u0K5GNDBdI+RvA6
	rTLA==
X-Gm-Message-State: AHQUAuYH29phkg1g0B/Nx5gs/9aRnHa1bib5dVzmCy9OIhCwRnBXxDxV
	Ewddrog2MvhwQ9mp/7YFQBx/YA==
X-Google-Smtp-Source: AHgI3IbT7jgy0o3NVMEH1dwfee1AQLqGmMUeKNLyBogzmP1c7Zhsy1Pn8waqzy0f2BPp+gGqXX/g3Q==
X-Received: by 2002:a17:902:bd82:: with SMTP id
	q2mr1205026pls.156.1550073297818; 
	Wed, 13 Feb 2019 07:54:57 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	c18sm15684353pfc.63.2019.02.13.07.54.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:57 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:52 -0800
Message-Id: <20190213155414.22285-14-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::635
Subject: [Qemu-riscv] [PATCH v7 13/35] target/riscv: Convert RV64F insns to
 decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 15:56:00 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |  6 +++
 target/riscv/insn_trans/trans_rvf.inc.c | 58 ++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 0bee95c9840d..6319f872ac1d 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -56,3 +56,9 @@ amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
 amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
 amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
 amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
+
+# *** RV64F Standard Extension (in addition to RV32F) ***
+fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_lu_s  1100000  00011 ..... ... ..... 1010011 @r2_rm
+fcvt_s_l   1101000  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_s_lu  1101000  00011 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index bce4da0e79e9..3415051ff1c1 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -19,7 +19,7 @@
  */
 
 #define REQUIRE_FPU do {\
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) \
+    if (ctx->mstatus_fs == 0) \
         return false;                       \
 } while (0)
 
@@ -351,3 +351,59 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
 
     return true;
 }
+
+#ifdef TARGET_RISCV64
+static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+    return true;
+}
+#endif
-- 
2.18.1


