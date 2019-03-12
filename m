Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUh-00041h-3D
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUZ-0002y0-JT
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGf-0008Qx-Nh
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGd-0008L5-Nj
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:28 -0400
Received: by mail-pg1-x52d.google.com with SMTP id a22so1786946pgg.13
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=ZQKpTwr5WyyGu1Wu6xm0rzGnLLhdjJ3hu+pK4iK0pIY=;
	b=elQbmI8VeiNEmkvxjaHwXxluz6BlckAheQfHVAzZLcbxMTD8eCaGMyP5JZHyU3OC6A
	J518YU/tKXBs1JP71DoJ3il9I4SJTi/7SjpcM5FtKZkQKzMQd3uh6tCEWBRp9UX9ckNh
	QrowVEEoCA5/WWvzgkoN/V86QaCF/1MeDzdQMhz9X/AfMLGk0/uL1CY0nhfPxKx660+k
	dDoeJG4DhlRGihMrIY0FtAXkXJdgRR9M3qSeLW4v6zxeMFRfyk57TLdvVIcleqVdKO0M
	vBAGbbPY8+EN9/blpW8VPL4M3eba0+Q1mHe0uPAthb44Wy3h8dC02AiMBDFCpE/SdyD3
	QiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=ZQKpTwr5WyyGu1Wu6xm0rzGnLLhdjJ3hu+pK4iK0pIY=;
	b=AZlJ9ArO7IPn3CWUah2hAHzr1A52qJY8ZV7SsgoS9rs2zQE2LhWljZkqeZR4wVuM3S
	MXgxnG1lPPGV7XDmw/p6YzKYef8MZMz7c4tYIeFUPrGx8J3zi08ptpaL70HMsGh0hLxs
	cfWft6io6x9nlnaVpGqOAl+4jMh0fPPewf8LJZG0+5rxhQ+MQu/WRCKlEimm2w6nwo7Z
	7+Ib2efC+ynpcqYo1RPNwgt0l3YbCIhDrwCoV6mEhNlU0Nx+/BRleqPH0kxzFuOOvFjT
	K0QzOPlI9YU4cBa6Z+qulP7U8khfHm5Y0Cl3Lymxk5bj1ktDiE1lHbJEsUGNDb535y2C
	9eKw==
X-Gm-Message-State: APjAAAWYwqf7iZYWSVOzHxseROKrvO7V1t7Uy/4Tf8+QDKlDi/x7M6TJ
	8HBP2hXcQkaao3jT6KkRdsZ3ug==
X-Google-Smtp-Source: APXvYqywCC3+sjqEZB5wUX6Wp27dKBOgnFllzVlxfHnqXESj1JSs19BVVWgGsWFoLKYV1L8YL18bbw==
X-Received: by 2002:a17:902:1e6:: with SMTP id
	b93mr39412707plb.325.1552396577835; 
	Tue, 12 Mar 2019 06:16:17 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	x23sm31443770pfe.0.2019.03.12.06.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:17 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:09 -0700
Message-Id: <20190312131526.14710-13-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:53 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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


