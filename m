Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456G-0000yd-9R
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4565-0000I0-Rn
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450x-0004OX-JL
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:52 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450x-0004Mw-D9
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:51 -0400
Received: by mail-pf1-x432.google.com with SMTP id n22so1530790pfa.3
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=5rYctR7eI37R5sMwCD3qvyZIBLK3WZhWz7ppR4vewcU=;
	b=IUZ/SQMQ5xtlFJ3+KC5q+L0Xdu1Q9aAA7mLGEK1GaNUxztXJXevOlPaXOwygnNx0Py
	v3ys/iE/tlAmfNVhy9u5mSgo08qAHLiDDNruDgpyPjd3AShXIdQLWYoYAujNM1YdyTI5
	zxFctDisxvXZmjTGNjERCuWlzv0JeIcSkygTNWb4mSKLRe5Fo6vn8H2gY484nVJSsGKD
	M1L7gyCcENApfCKsdyt4JzXpwRbMmw63nMgG9K7MMLqdSjPtXu82XW9w/O3+ba4JSFGW
	Bco7oSl2c219QPWiZDPd980B+gniqt9pp/Bt6h9Ghtxoq1dDh81MBzYtim73Byzp1NkT
	qUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=5rYctR7eI37R5sMwCD3qvyZIBLK3WZhWz7ppR4vewcU=;
	b=D9z12MnVx30vbXQ87hDDcPkntUjhSXcLRJs+q8tgd0dw+LTemLpiNiyRutApl7/baj
	MM2rmKmvzhQk9jRkk1jOn/Upy03aCTwrqyAXFMqkCCx3NcRpTFEWtMgBgcCv6EmDIXML
	54QzdogXek4deZBJVVGJZwSBpPDKDj+FYK+7Tvt66oJKf8a+3XrQabRFWWqP4wd0TDx/
	PLMY0C9vBFPnfbwP7Gz4FHXCqiPB2IvQo38nC5J+p3kv5VMLT4AvZ8Vzmq+zk8A5o/Kp
	olrlVNgGQF9IEQ0uxZJYk9vkZH9uxTy1bl+OSA/024pw+UMEm8rQz4e+hq/2empT6eHP
	620Q==
X-Gm-Message-State: APjAAAXjBPa+NkzImhnyStARUy3iKP7EpFgrwBv5j9GiqlxNUGwQU5KQ
	E2wRKc9sSgxAIbVJpuKUlhVhlSsc85RlHCGf
X-Google-Smtp-Source: APXvYqwRoc+N8WdLYLtpWZsxutbAWY91Ka4izB/BLFQiH15qioXnh6UtXdBPzw1S+ERDjQH2tIcm8Q==
X-Received: by 2002:a63:6a88:: with SMTP id
	f130mr40090543pgc.114.1552487870170; 
	Wed, 13 Mar 2019 07:37:50 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	s79sm22414888pfa.61.2019.03.13.07.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:49 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:48 -0700
Message-Id: <20190313143705.29129-13-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-riscv] [PULL 12/29] target/riscv: Convert RV64F insns to
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:11 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |  6 +++
 target/riscv/insn_trans/trans_rvf.inc.c | 60 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

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
index 0f837903491b..172dbfa919b6 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -377,3 +377,63 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
 
     return true;
 }
+
+#ifdef TARGET_RISCV64
+static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
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
+    REQUIRE_EXT(ctx, RVF);
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
+    REQUIRE_EXT(ctx, RVF);
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
+    REQUIRE_EXT(ctx, RVF);
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
2.19.2


