Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3W-0003VQ-7d
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3Q-0003Pk-QC
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3N-00031z-JR
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:52 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3K-0002Dx-BF
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:49 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i19so12037204pfd.0
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=wzFueIOd2NMWRKpqcwsHhGCHAjzVwBe15fea+TuSo0A=;
	b=iutiF618KOOCOxKZu/tPbjaH8bevTdwb60huFnW4Ll1NjaOBuVpAHU+jhHR5QfpC9b
	rWEBumXbByf6RPWpMSYbUhoT+3rB28MEc4natrHrcIqj72tT53SnRFDc3vyhMZHeqe4L
	yVfxtDaepzwdqCd97LzXOZqQni1fFyUEcr1Mih7rblWis4vk5B5IE4uiubOcuWN9Xp9G
	5ljQUw/2z0dO+cIj024hR9GXZtDKF1b6n3NcRpqxidy7ZH5bgOOsQwGGZ2wBk0EKt4UD
	Zc5vyJo0xZdJ1Y8ulRAUl44mgGOhO9hKzGE7haVDibqrvOac+5fAHUJjQDU0HTqxoDch
	CnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=wzFueIOd2NMWRKpqcwsHhGCHAjzVwBe15fea+TuSo0A=;
	b=Y6IWPXcYT+MxVYSXXIjGEJ9M2ntiaPYlSvSHuE24KzWoL9p2pViwCIvET6YE/U0dep
	afzD3vLh6WYQLV9n55UslezRSer3tPNiHzZ/YD3cbWa0HUBR5OJqu0aQNTV/VYEtL+DA
	pAf1rHqUVlse0yrhcshbDaO97pIsnrj+hOpykpkdookY6bCPXfEYOFQpGrPil1at28ZI
	BdH9ke/oyEaSTuj+O62UYrXwbR4i769UlR4n6TgfbX1dyfSJonTQvnEERJSWQMM7B9Jm
	5ic2FqK3bxJOuFtHbpCV/55MUuP8cVTRBoU249kpDBhBEjKnIq0VAjGszlwsP5/zd5Nq
	BQuw==
X-Gm-Message-State: APjAAAXKw5oa6ncZBvneY7KLF4Hs/URkbz3l+sFui6XMziUFV+InOEkw
	OXmtvIuUU2yk36Pc87R6zuLmig==
X-Google-Smtp-Source: APXvYqzeJOFxu3trK2yPmzcRav/S6238BOahGCA2os20FNdZK+4AZqJNLl2q0S/U0ZK807/6M8h5/w==
X-Received: by 2002:a63:83:: with SMTP id 125mr7021681pga.403.1551477016816;
	Fri, 01 Mar 2019 13:50:16 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w10sm32382745pge.8.2019.03.01.13.50.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:16 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:23 -0800
Message-Id: <20190301214945.4353-13-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42e
Subject: [Qemu-riscv] [PULL 12/34] target/riscv: Convert RV64F insns to
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:56 -0000

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
2.18.1


