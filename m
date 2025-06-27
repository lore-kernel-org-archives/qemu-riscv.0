Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D1DC77B7F
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 13:21:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uV90u-0003Lk-9Q; Fri, 27 Jun 2025 09:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uV90Z-00037R-Fy
 for qemu-riscv@nongnu.org; Fri, 27 Jun 2025 09:20:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uV90W-0003Nc-VK
 for qemu-riscv@nongnu.org; Fri, 27 Jun 2025 09:20:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b31f0ef5f7aso1280813a12.3
 for <qemu-riscv@nongnu.org>; Fri, 27 Jun 2025 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1751030443; x=1751635243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhEwdbXEy5NwBx8sO1ZDvg4qPAxKxqK/ec7o1GfsOJk=;
 b=c4X5wYJT4eYqjK9pqn6KSFfMRemldi8WeP5sjKX1tkaXa1tKeaF4MmYySvtoQtWKYn
 m6gg0sBvu9Lwml7VJVNdnodg/eLUYJLp9V1GXB3UUd1Ahiwudr136JHo64Ng4VI0q/zg
 OzOHMPvo5MA0KLJcIUSiPiAqzzRZ7gkcAFoCrBsVijOFJnXH1Zt3cgHNDQVnwD4cDJkC
 4OHlPl96hh75GyxtH5wujLj3Qh1Ldvi1io59p519kH1lbgWyzZZu51EHm9qdohgcJBRR
 2tMBAAWWXKTvlgLqqZfZJN3g/QTrwNrE0sq5abRmWy2sG18Ipoxjo8ENvP+Ji//C7FUf
 rH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751030443; x=1751635243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DhEwdbXEy5NwBx8sO1ZDvg4qPAxKxqK/ec7o1GfsOJk=;
 b=ealSLeH2/MhnoeqWKwSylUebTxaC8FV7GRSYf5qcwvg1vLb69MGSHB3Z8jAyTTVkQV
 4bbe5SQtB+OFQ0pW0/nrQdXPKO/WbiV859L1bZQfSCD/352gX0cjNnIgjyOklxfbpQSB
 U3kqlCU6wwcmxMoay/VoYH1WJ/Q6urHhaZ8w7o6fW8tzGj1vkGRpo/I/AydgLIJq7xUJ
 FrNQu9SKiLUWwiupr0qBCnFvDIKrUQ11399XkQH/pl9siQ7F60AWJh4Sp1DRt0fM5bT4
 IQYkjEfmRNKirs7WKsA/2nJox1Gx2lz2BTKMY1UtEJG1Tr5VxaNgWlQDZ28M/vZcuEuH
 YDIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDPJ130g2wPIES9iT5DOk+Ipk5OiZ+3A9AkIoKLXMNtZ62e+dQivFuvHde9AghP1FPiJtnPFNAVdBl@nongnu.org
X-Gm-Message-State: AOJu0YzQNXbFDLOSZEjWQOwodYvY/SpJCOi8CvrKoHbhpQx8g7pZ12W1
 wcC/0DA0fil44NNCJdSI3aK0DD2qnd4tCjZ4+UjbhnW62J4NJPyTfosV/t44pGDIPvE=
X-Gm-Gg: ASbGncsQiHiUy1RGWqE/hVoUQDDzrZ4mGrrai3Y49YNN7TLZTayFzPWTxWcgVXRCBPS
 zdhla6fL3ZLaG7FNAAX+li5kLBd1nGDkgYpKcQcC75MxEApvVjEfFIjAYX6SPKKKVD2DLEQe2qS
 D2q/RvXUvmun6pDGRhC8n5rb/q/Au0WgyahopseDcwSwACJGxEJAd18IwlRD3XSMKqiFgyWEtBe
 qkrUteVp5ZbVQbZs/HxQhj1EEC/gLNV/R0l9fOBPlDgLoGJQ8mypII5SbBZHMUezhXFx/thdXdm
 khMxehClFy3xCNvTei+lTdxDFrgBf2PR22gcgVmLO6k4Y1mQ/o3GZndb8YN5hnPE0sw+cPNeT9O
 XDet91HQFBbBryOmCXfp3jFzdaew6UnM=
X-Google-Smtp-Source: AGHT+IEPQcZueH4f7d7aHs2ifwYEYl7r8mam6U6rZ54pVxXwlcDOjfFuOZcVeI1le3cHOtDsjkPAGw==
X-Received: by 2002:a05:6a20:430f:b0:220:37a7:578f with SMTP id
 adf61e73a8af0-220a1142ce8mr5569938637.2.1751030442536; 
 Fri, 27 Jun 2025 06:20:42 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5573e71sm2393162b3a.98.2025.06.27.06.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 06:20:42 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 3/3] target/riscv: vadc and vsbc are vm=0 instructions
Date: Fri, 27 Jun 2025 21:20:22 +0800
Message-ID: <20250627132022.439315-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627132022.439315-1-max.chou@sifive.com>
References: <20250627132022.439315-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x534.google.com
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

We were marking vadc and vsbc as vm=1 instructions, which meant
vext_check_input_eew wouldn't detect mask vs source register
overlaps.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cd23b1f3a9b..5442203ecaa 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -451,14 +451,14 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
-vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
-vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
-vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
+vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_0
+vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_0
+vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_0
 vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
 vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
 vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
-vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
-vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_0
+vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_0
 vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
 vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
-- 
2.43.0


