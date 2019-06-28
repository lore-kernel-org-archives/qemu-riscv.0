Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulI-0000bn-Cp
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgul6-0000Ge-AB
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgul3-0000oW-UN
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgul3-0000np-OV
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id n2so2877300pgp.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jNAXnuen/EqceGboq9jqUh/HLce5kvK8361K7LpbToc=;
 b=pZ+WYp+KkseN3KcYCWrv9L0ChT/VBOF6q38KHZfg6Phcai8+nflMaUVLzhf0d0F6Bi
 CcUWOFW+1zxJaWie8C3kA1ifkDlK9YSrsGNeUm+KDW1OfX1kkBHbyxyv27i1OI1bDwmY
 DtGdBLU0u2ao/CIUOx5z1Z4T3iS2qtTeMW5J7xhILLPWisJDB7Mg99HnDwp4tYg4WdlM
 ypx/ZV7ANlzkRf/Z/v6isuNjb2PQfv/M89dvytbpu5EZxmLtAAEhyDWD0AYP1IgqJSt3
 dfSO0UFNW10VvHz5L9C4TvpsjdLGSCtevnb8pO05lcbTDkHKp1XVp2O+g23rMFHjPT8u
 uN9Q==
X-Gm-Message-State: APjAAAX4TePzZ01J67vmWc+fBc6jOIEWqXZ3NUeE38Maw8y4FP9339DY
 4VzqtLshZw6RsTP9L9h/iAnTCA==
X-Google-Smtp-Source: APXvYqwnP2hFW/AtATyhQwBOpKJnrqrl4lTyuacxW6X//VtVHbcz2SjozV4/ZtCOlODuDTzATX7Ktg==
X-Received: by 2002:a63:fa0d:: with SMTP id y13mr10325843pgh.258.1561743236575; 
 Fri, 28 Jun 2019 10:33:56 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id l68sm4845500pjb.8.2019.06.28.10.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:55 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:20 -0700
Message-Id: <20190628173227.31925-28-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 "Wladimir J. van der Laan" <laanwj@gmail.com>, Michael Clark <mjc@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
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
X-List-Received-Date: Fri, 28 Jun 2019 17:34:03 -0000

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


