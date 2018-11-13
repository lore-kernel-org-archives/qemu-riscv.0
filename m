Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMiT1-0003Wj-4g
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 18:51:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSv-0003T5-5n
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSr-0006b6-Uc
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:28 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gMiSq-0006YQ-PO
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:25 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n4-v6so6823637plp.2
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 15:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=LrSNAK5VmQ6c5x3kGvqXMw47hLHndptPmbk4QMAiCLc=;
	b=VQmxS9mUaXnBt5okfj5aiQ5eNoB6vEicU2WVVT5hiTbMosDgZjc6dWKjTXbXxOvSlb
	bdvxvn5xSe0Q6cNdZKjJuQ5HRHcn3zH/AKbibnkkJjnqwTw/W2ZGNvQSz1cqFhT/zGPt
	c9uMLujT4gqCvB2YRcnRkLGPENkwmMUOBp+HXZDbC2g4RDn8JP0NJSCBgWrkfcLqKyCb
	8XdRYC48glbfDGUMDQMVTyel8Rv2buFc0dg3xeeJyKK7AJTvKQzOpCM+BdALX8rhORJw
	7qr0ni7xj6xaIsS3u4xHS0VupMsYrUpP7+fUt9YUWXncgB3mAeHAU48+kSfv2NvrQms1
	sNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=LrSNAK5VmQ6c5x3kGvqXMw47hLHndptPmbk4QMAiCLc=;
	b=BLQu1BjToO/8p2EwuAlMVGAu4qTja0PGAjiQaRrR6xKGknxnA0Uwl2nAx/pDH+o8YT
	YpeSevJObOn/GoejidYrgu52LwqZvF5SnDx3U/iIGKpENvrEpeE82BWTtkIdqtvl5+bT
	gvGXa6dfThAO1WOYRopMxGEOz/6kUNrVuiarhQDjH2Xpwrhw4DPsn/qsanBChKv0Dft6
	7o4XVHvi/h4sZVsocaINsOELb/IghqGJPYD1Z3EhmycTAQVJEAAWhuy1Rzgcda4lfMjM
	YNC2Jx8X302XLZZhOcmjHl48ZaSWUWog/oKf06dyBKlPmT9w7/7rVGek2a3TX6N7rh2L
	RtAg==
X-Gm-Message-State: AGRZ1gIo2U9DU856NiX02D1lZi1jk5cXlT6Vqcv8soQ1jum7o2yA8VA6
	ZjK+aoaN19EEhngx6/BpNVMHIg==
X-Google-Smtp-Source: AJdET5fAs7vwWEMIN7Kzqlp//nj+SDeCyjMZf6x3HpJZAGFrRLFcjf1Iee2yMoF/TRWjWf4xE3GBFw==
X-Received: by 2002:a17:902:3103:: with SMTP id
	w3-v6mr7308825plb.18.1542153080578; 
	Tue, 13 Nov 2018 15:51:20 -0800 (PST)
Received: from localhost ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
	g7-v6sm22813127pfo.139.2018.11.13.15.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 15:51:19 -0800 (PST)
Date: Tue, 13 Nov 2018 15:50:43 -0800
Message-Id: <20181113235045.14155-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113235045.14155-1-palmer@sifive.com>
References: <20181113235045.14155-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: [Qemu-riscv] [PULL 2/4] target/riscv: Fix FCLASS_D being treated as
 RV64 only
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
X-List-Received-Date: Tue, 13 Nov 2018 23:51:33 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18d7b6d1471d..5359088e24bc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1237,13 +1237,14 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         tcg_temp_free(t0);
         break;
 
-#if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_X_D:
         /* also OPC_RISC_FCLASS_D */
         switch (rm) {
+#if defined(TARGET_RISCV64)
         case 0: /* FMV */
             gen_set_gpr(rd, cpu_fpr[rs1]);
             break;
+#endif
         case 1:
             t0 = tcg_temp_new();
             gen_helper_fclass_d(t0, cpu_fpr[rs1]);
@@ -1255,6 +1256,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         break;
 
+#if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_D_X:
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
-- 
2.18.1


