Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30951C001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 18:33:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQXiB-0002tA-RK; Mon, 31 Jul 2023 14:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbagley@ventanamicro.com>)
 id 1qQXi7-0002r5-5J
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 14:33:40 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbagley@ventanamicro.com>)
 id 1qQXi5-0007w3-Ka
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 14:33:38 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a44fae863fso3687649b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 11:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690828416; x=1691433216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xHYBdGz4N7U1VASepPMDG7kS7w6jguArgFuCythYmKI=;
 b=Eb1oz2XSx+RTXHyhWW3zb+QDBppEX9aSdzamQx63cAuqOuYJJLe52cUV0deVjJ7u1a
 LhMVRbsaM6Wuj6lU3uNoa6zHO2KPJqUuAtQ1ebKbXo0+rzdFND7Gq2XB20bHdQlMtk4K
 H9cBHaIxyRvOuGAaU+nI97+W71aLXAyi2FvblHX5JlVD0mDYYscSBCCMUKhxdChAKVpV
 iYO74r6FVSMcL03nw+x19bhkR0Dhc/W5DQXEOmFHDqI7LECPLfOAywtwIOgydyJDmyI8
 +/uiZQQbaA9DAtR+tGtgne5cAbCLm4L1ACseiBjo2iMKVWpUWXT9OHXPDvxe1T5xRE8g
 j5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690828416; x=1691433216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xHYBdGz4N7U1VASepPMDG7kS7w6jguArgFuCythYmKI=;
 b=H1BABE7ohmWaDu9skEnaYKipV/9yfK5UpMq9Z4EYlHQVOoKsGNaU80l9pkywOnAnrs
 lBUKA3hFCQrBYE8vUxyZ+xMvTTkdE76LmP3TPSqAkDPitAq8YKEWUeukR9lWAXbaZJgN
 5MoHf0DUVS8KxlxI81dDVZ6VeaHuiOOyq2nml7BmlgXbxw2HnweJQfUfwfiGbSrMVinp
 E0qr4pgxOcPtzb4PoyP29b3OJPDeWFLlHL9AnB7/cMUdh7bixgdbKjGRhxsWTraLlgkq
 JbPXLHYv22QA5jLQfygd9E3ZjyHdyfHLJXUOYAAQoKODUCEnDRwgks+h0a8ZQr9jzALb
 ujuw==
X-Gm-Message-State: ABy/qLaGTFzqkiNQltzTlUqj/MwJTqD97WNOCiWrTToy/QMwGtAI8VQt
 l/qGxhLAFzpGatLUYGFlW95CsQ==
X-Google-Smtp-Source: APBJJlHluSToi76MpGLs67PDrz7nlgknW4XQw35EHdILIVIBIx2pJdA8xRX/Cja1kJhBhGSuqISFTQ==
X-Received: by 2002:a05:6808:f01:b0:3a7:48d4:8a7d with SMTP id
 m1-20020a0568080f0100b003a748d48a7dmr220251oiw.46.1690828415789; 
 Mon, 31 Jul 2023 11:33:35 -0700 (PDT)
Received: from richard-XPS-17-9710.dc1.ventanamicro.com
 (c-73-223-56-230.hsd1.ca.comcast.net. [73.223.56.230])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a17090ad25800b0025645ce761dsm8064330pjw.35.2023.07.31.11.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 11:33:35 -0700 (PDT)
From: Richard Bagley <rbagley@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 dbarboza@ventanamicro.com, Richard Bagley <rbagley@ventanamicro.com>
Subject: [PATCH] disas/riscv: Further correction to LUI disassembly
Date: Mon, 31 Jul 2023 11:33:20 -0700
Message-Id: <20230731183320.410922-1-rbagley@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=rbagley@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The recent commit 36df75a0a9 corrected one aspect of LUI disassembly
by recovering the immediate argument from the result of LUI with a
shift right by 12. However, the shift right will left-fill with the
sign. By applying a mask we recover an unsigned representation of the
20-bit field (which includes a sign bit).

Example:
0xfffff000 >> 12 = 0xffffffff
0xfffff000 >> 12 & 0xfffff = 0x000fffff

Fixes: 36df75a0a9 ("riscv/disas: Fix disas output of upper immediates")
Signed-off-by: Richard Bagley <rbagley@ventanamicro.com>
---
 disas/riscv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 4023e3fc65..690eb4a1ac 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4723,9 +4723,12 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             break;
         case 'U':
             fmt++;
-            snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12);
-            append(buf, tmp, buflen);
-            if (*fmt == 'o') {
+            if (*fmt == 'i') {
+                snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12 & 0xfffff);
+                append(buf, tmp, buflen);
+            } else if (*fmt == 'o') {
+                snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12);
+                append(buf, tmp, buflen);
                 while (strlen(buf) < tab * 2) {
                     append(buf, " ", buflen);
                 }
-- 
2.34.1


