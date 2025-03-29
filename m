Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B97C36008
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:48:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXRJ-0008JJ-Kv; Sat, 29 Mar 2025 10:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXRF-0008EM-Us
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXRC-0004Tx-TP
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-300fefb8e06so5016463a91.0
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259529; x=1743864329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Vo5qxIjpxhp4phxz9X1WKzMuv5ynzuiARrverr9UNE=;
 b=kTVwSsAmAXqkUjPWsgodvCDpGQlJHwRxiDo06o5Yeew7yogcz1LsGIaFZKzpDJUNDu
 sGDLV8AprET2KRbpXMEYmMDUwMA0VV1MqHNuf1h1wLPjF6fAasYJItXtkUaW7PgyF61G
 zsbVIcgEnRA6dwUJL2kWDYYI9A/vA8wLsvejb++OT6Y58NlT1x1LJXG7TNJb70EMqkSr
 OAIumArLqhXGqnQHRz4X7hiw1bEYbSuu+TMPFB50BgA7uCHDSJBEEl7/tY2aj4fgdjp3
 IUb6nZ9yRGkX7S6YlTskZp/uDprI4ip7b2MBxtD+9FRl3VMnah9HUgKWyDaSu2d89Fux
 oPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259529; x=1743864329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Vo5qxIjpxhp4phxz9X1WKzMuv5ynzuiARrverr9UNE=;
 b=wWlzWHBD22qGjsr+HreN7rzAKPcTJ8rbeX8UW/sLdvYDkZ1FF2VpmVvGSX67UkIDiD
 IfJzqmOBG3+30Cy+mj3KcHlqg+rneR4RXSv66+FsDbGVYWEoDeJfSVA1EhbVpTxM2XhG
 Ge8LfJdBha5pAlOWTrBBpiJLEZ74/NlyxpAyAEI6UK94x/jiwBFedmlAOIkwrwogTEWx
 +ftO+AdMAuYJA9oLQ3DYEpky73nVm78K/RMly7US0lYxnEz4A16IOpMEGAXtv4KiFzkW
 BhFaWdfctihKIMZPPdjKLP4DI70+q+yZ3crO0fPnL1B5D8tgk0mkGNwy7jXsSCl1GLDr
 0LBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU55uW1RNqRruuQ/laTty65O7dY8/eAkP8r2JXdaAR8CgRzjogmLYuwu61WjVTPWityS5IR27suGsKM@nongnu.org
X-Gm-Message-State: AOJu0YzkBAdK7AX2PFtZhXDXblH4X3QcKY6gKXYBN9oT1ov9EaGJ24tq
 eAFrMLNjn4H7qpoBacIi/wSNsl5178/N4N3768LHgesSaW4+lfaGQ4U5N+2DUfE=
X-Gm-Gg: ASbGncvbcricvDZrvRE5BaU9XxWGdKsyF0ztzgGiJArR8dLfiRyEJHDxX2oYYFuvA54
 xLAOm0jgDdC/7ZP9c+vN2SkPLf3cEnnZWQPLr6qezBKytOduOPRtBU0qLgIs8xwg1IyCqlm+zbD
 kz9RFgDNqnkOLZ91+TGm+5ZntP3scA6bF3FIPcOO26f9G78aV/uvf+yprzlltuN8isc1Uf+tKEO
 MSSqGVtilrdO3fBYCK/tBah/xWRLO3FqI89/3Wynsctztq07l4y+4xsjHz0pxsfYQP44a0Y2iU5
 tMv+noEXs0/fHmqJ9+CRN3/60wakeupyIfiZ7ueoW8JrD5VKsEbfGJ99ZqB20Jm0lisNc6HhD/D
 LEJ21/BpLNOs/1g==
X-Google-Smtp-Source: AGHT+IEOWCLh2a3PbwlRfd6nTlAnPvOMV0PTK1t81qputTkUKhB69gUcx6ut2hhJBp7JRYax7snISA==
X-Received: by 2002:a17:90b:384b:b0:2ff:6ac2:c5a6 with SMTP id
 98e67ed59e1d1-30532178e82mr4237860a91.31.1743259529310; 
 Sat, 29 Mar 2025 07:45:29 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:45:28 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 12/12] target/riscv: Fix the rvv reserved encoding of
 unmasked instructions
Date: Sat, 29 Mar 2025 22:44:46 +0800
Message-ID: <20250329144446.2619306-13-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329144446.2619306-1-max.chou@sifive.com>
References: <20250329144446.2619306-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1031.google.com
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

According to the v spec, the encodings of vcomoress.vm and vector
mask-register logical instructions with vm=0 are reserved.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn32.decode | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6d1a13c8260..cd23b1f3a9b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -703,14 +703,14 @@ vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 # Vector widening ordered and unordered float reduction sum
 vfwredusum_vs   110001 . ..... ..... 001 ..... 1010111 @r_vm
 vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
-vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
-vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
-vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
-vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
-vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
-vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
-vmorn_mm        011100 - ..... ..... 010 ..... 1010111 @r
-vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
+vmand_mm        011001 1 ..... ..... 010 ..... 1010111 @r
+vmnand_mm       011101 1 ..... ..... 010 ..... 1010111 @r
+vmandn_mm       011000 1 ..... ..... 010 ..... 1010111 @r
+vmxor_mm        011011 1 ..... ..... 010 ..... 1010111 @r
+vmor_mm         011010 1 ..... ..... 010 ..... 1010111 @r
+vmnor_mm        011110 1 ..... ..... 010 ..... 1010111 @r
+vmorn_mm        011100 1 ..... ..... 010 ..... 1010111 @r
+vmxnor_mm       011111 1 ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
@@ -732,7 +732,7 @@ vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
 vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
-vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vcompress_vm    010111 1 ..... ..... 010 ..... 1010111 @r
 vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
 vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
 vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
-- 
2.43.0


