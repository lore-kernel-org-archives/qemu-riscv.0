Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHQ-000300-DU
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60951)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGp-0001pv-Ph
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGn-0007q9-6v
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWGk-0007HL-Av
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:04 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so1187973pgn.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jNAXnuen/EqceGboq9jqUh/HLce5kvK8361K7LpbToc=;
 b=tdF6K4X4iqb+izhf4Ewp9OI/g++4N+wulBp92CMvM2ZDaflafG/FN/QcezlH5rE1xn
 9v0aRAqFsNAtvXzxtdaZvuxqMT5Db/y7nrmkDpjn0TYYxshQWvnEeOPDRkkURcg28G3s
 +DV6E0iO2A+WIzF1Iixpam2k66/UQq3+nkBaYuwZ49sjDx1t8Ey5e6drmZvO62h65zsd
 DJmi2zgCclA0PP/RR0bSL+QZCDReB48zrNUiN/ZaIvlQ8dewsU9+05SbNuTrvXIFNz48
 j+bRxOVfGluChul7LdMnex0kNvCu/sUK4MwA/PSydbysx5ygdjBd/vfJKHj6lxSLio5+
 3jzA==
X-Gm-Message-State: APjAAAUesMOIJHFwcidWHVvhV1q/Ab6YEDZty1mPxhO1H6SVKxqNzAYT
 ps0yQo9NWOK9aQKtIOBzLWCMSQL+QPGcWw==
X-Google-Smtp-Source: APXvYqzWMlnaE1X5C4yiofYhLiuqPsrEf8BZb+R6LZa9V7v6zwnulh0AdTxVJXGYiVDMXNA1xiNb8Q==
X-Received: by 2002:a17:90a:71cb:: with SMTP id
 m11mr6419278pjs.40.1561649068364; 
 Thu, 27 Jun 2019 08:24:28 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id k3sm2637153pgo.81.2019.06.27.08.24.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:27 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:20:04 -0700
Message-Id: <20190627152011.18686-28-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 "Wladimir J. van der Laan" <laanwj@gmail.com>, Michael Clark <mjc@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 27/34] disas/riscv: Fix `rdinstreth` constraint
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:20 -0000
X-List-Received-Date: Thu, 27 Jun 2019 15:25:20 -0000

From: "Wladimir J. van der Laan" <laanwj@gmail.com>

The constraint for `rdinstreth` was comparing the csr number to 0xc80,
which is `cycleh` instead. Fix this.

Signed-off-by: Wladimir J. van der Laan <laanwj@gmail.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 disas/riscv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d37312705516..278d9be9247e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -614,7 +614,8 @@ static const rvc_constraint rvcc_rdtime[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc01, r
 static const rvc_constraint rvcc_rdinstret[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc02, rvc_end };
 static const rvc_constraint rvcc_rdcycleh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
 static const rvc_constraint rvcc_rdtimeh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc81, rvc_end };
-static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
+static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0,
+                                                  rvc_csr_eq_0xc82, rvc_end };
 static const rvc_constraint rvcc_frcsr[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x003, rvc_end };
 static const rvc_constraint rvcc_frrm[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x002, rvc_end };
 static const rvc_constraint rvcc_frflags[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x001, rvc_end };
@@ -1038,7 +1039,7 @@ const rv_opcode_data opcode_data[] = {
     { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai,
       rv_op_srai, rv_op_srai, rvcd_imm_nz },
     { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi,
-      rv_op_andi, rv_op_andi, rvcd_imm_nz },
+      rv_op_andi, rv_op_andi },
     { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_sub, rv_op_sub },
     { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xor, rv_op_xor },
     { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or, rv_op_or },
-- 
2.21.0


