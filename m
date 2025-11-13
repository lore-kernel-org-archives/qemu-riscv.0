Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B38CD8CAD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 17:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vJawj-0001Tm-Gi; Thu, 13 Nov 2025 12:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vJavj-0000So-0g
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 12:16:20 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vJavh-0006Zm-BE
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 12:16:18 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7b0246b27b2so1330910b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Nov 2025 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763054176; x=1763658976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSZeOBRdaJtR4VSZeBosQBp8vrblOwFu5a8eIkNfB8Y=;
 b=m7CIWtr30j5cCa/UEm2u/pD7xFPxej8G9DT3hUIOOQ0q28DuP5XOQh6IthcimVL0aj
 aqmiZYkqbV8sr1x6QPD3gE0Cax/C/ODz6WFqokKC5KM4HC+BYt+Z4WF61ngLjGBthAm5
 HQZNN7uNq74xRysvapOTMysR6Gt9+VQ8La1i3l4E5qHPYZH/ZtHaRvlk4UvxJEHe6xoY
 PVz8afIuFIUolbx+QNlhAUxyb8RQB7PQm+GCeRV3fyN/2WsRR/jTfVwPGrawd9xxkqIE
 dVdub3UBXTK7jNhHHvi7/V4lbDT9dv3EgD1+IekWQBbgt37GJABRE1cscu2EAOrrhZxa
 WF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763054176; x=1763658976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CSZeOBRdaJtR4VSZeBosQBp8vrblOwFu5a8eIkNfB8Y=;
 b=hL3o6+pDQ9zs30Lz4My17OtT20K5voc9EkcgqTRrx6N2JXCNeKHQ46HZEetTGELcwk
 hXdDdkeD69cnRCIXqJR7fmBc5XwbdobFCHhxE2RxhZlEkzqjGBUai4hzxBgdEdThkYnt
 3YsfuqFycIkuKfw3V7WLP6xJE/aH/WJ+RLPmIwXEJKCU3QujLscpGIXa6S6fFXT7NhS/
 nKBy/30toT/yxH3fUXItCPQ/DqkoxOLXkiIkduP+jb3mQ3GYfQEmtFxtjGFIorkPnFu7
 ZVxbupJmE0bmg+QnK5o1wY9ogYeyF8+SGzZoFgV2Nwg0V4SXSNV9/cbua1Z7SkeOrwF0
 NBhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIyq5Gd0TIhZBM3CwP5iGhvMEfzQAzGxKmzFf+moUHSOXgMg9O7iWEdaAv+U9Vu80HqqI4nxiUB0Yf@nongnu.org
X-Gm-Message-State: AOJu0YwxCRl2gKsJzWjOcDWS6xvmeKlIE1vChKr/RCXuZNdvHl2rpU4u
 vxcVPcmjX+mIYIr8zPi4EhIHc2VbPk5oODw4NSvb0tZN/AxaIjXIQcnKa1NvA3mkea0=
X-Gm-Gg: ASbGncsBOfMSiQyt9QqfTGugt4rBrU/qEaW5Odk7lSdhPIMzbUmFxDDNIaM++gaWH6a
 Wnsl3eI6zksyit3svz9bwk+/NIHmGELjeO0LYoCGcKBrnUlhz1UFGUf9lF0MCtDunZqgRDLnoPC
 2GDWoQvSdxxtjS+TPzjDl6zRC+2etFbcYK0+HBJyP79o/Z3baArHOeJ3F9uQwrFAkPBFqOAkd22
 Bg1+sovCHqcva1TeRm3m7JmlgFfFyNynJPJuP6Qir3s5sBPd/tdpacEMKjjEbJC62FEJu0svU21
 B7pEvDxH2dKOD73x7oA/AB7DluRsaQJWtIE8Dbhpxt1pfIDJR0E1/L4oKxMeJ/FZPMKggLeQWe1
 6j+5YT//r9Pffm4zjA6I/Jof4CIXNpwpHYuNdguzbsIwbRQUmh2qMsrjPLNA16W0F99ZZqPdf0m
 nsSXL8ovM7YBa99YhnPvNogeW8QOaGbZGOSNM9dIllAG2pwipfAx4J1FY=
X-Google-Smtp-Source: AGHT+IHOQO+2owWcCKWIyQ3fBALgs8pKDWv/mNb1FtumrHARR+2+DKcMOHjAytEjVM3Teu7qEPdOpQ==
X-Received: by 2002:a05:6a20:72ab:b0:334:a784:3046 with SMTP id
 adf61e73a8af0-35ba17aa0e5mr367978637.38.1763054175723; 
 Thu, 13 Nov 2025 09:16:15 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc375081023sm2712992a12.21.2025.11.13.09.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 09:16:15 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anton Blanchard <antonb@tenstorrent.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 2/3] target/riscv: rvv: Apply vext_check_input_eew to
 vector reduction instructions
Date: Fri, 14 Nov 2025 01:16:03 +0800
Message-ID: <20251113171604.3034161-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113171604.3034161-1-max.chou@sifive.com>
References: <20251113171604.3034161-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Anton Blanchard <antonb@tenstorrent.com>

Handle the overlap of source registers with different EEWs for vector
reduction instructions.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 422e1a21185..2d9cf27ef76 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3076,6 +3076,7 @@ static bool reduction_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
+           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew, a->vm) &&
            vext_check_reduction(s, a->rs2);
 }
 
@@ -3092,7 +3093,8 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) && (s->sew < MO_64) &&
-           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4));
+           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4)) &&
+           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew + 1, a->vm);
 }
 
 GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
-- 
2.43.0


