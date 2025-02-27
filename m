Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C00C021BE
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 07:31:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnYMU-0003xo-K2; Thu, 27 Feb 2025 02:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tnYMJ-0003uy-BT
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2025 02:31:03 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tnYMF-0004Mf-1p
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2025 02:31:03 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2212a930001so15582515ad.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2025 23:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740641455; x=1741246255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W1cRaC5gQFqx4sw4ws+KyDi9AyCOSvamK2A+8kQRjfk=;
 b=KNn6rE69nbePLfv3ugS0yOcP5Wpjftgf722O3giL6xf8327aH1ySk5QGYbNm0ilhb1
 hKnfC5yYgQfU9xqJzTOTuZ7vM1tZ7le1qnmeVKY9E4T0w1Z+g6NEt3DHy59hq9nmUaQh
 Vi2FlTKD533y7Mk7eDBhJ4lxFlgg/lRtshVe6oXkC1ws59pEPXm0hTy64G0G6k/DnGw/
 a3XcZGyb5bRz/doX/+p2UL8Ymuc2nYxIHwLSUskb0gCj619pJ8PDLY8J5bSu+FYSS2dL
 YzONPAo7E9sNzRYSUlUcF2LvnjITgREddOoFiuvVuJfhJik3Fwu8/FGokG5tWptAg+K2
 b9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740641455; x=1741246255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1cRaC5gQFqx4sw4ws+KyDi9AyCOSvamK2A+8kQRjfk=;
 b=Bc0MXTQrTaDRECae/HjjJeO4iUll+S+Teqs1CJY3rlSLNj/xGLVfll2VjqVhrehorg
 hTsZEfKbshrd5+b1GZwy2x9StrIV2VabVyfsvPnJuqpoaUPhGFRQ5qpfrygi/mUP5nNx
 Bh813FNWEE3xEJYs36LOEjUKLZZ53czE1RC1rM+/n+xpwO1Soj81W18tn3+5CX7kOtb9
 7RtC25ESzsZ9pUJ7uYRwT0K3gbc1Mma9YYQa2j01D4Gw1JcpT30yFDbOOyK2J6AzGBQ2
 nuHYgIJav0mqdD/MD67NShoQc0DR2lAfLmZLCAAFXQJSDf7EsZk+Lg1u9cWfDuYLsE/Y
 2sMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmqhO8L1fnKlzMVcsXv1bJ9aRieZOiP16b7PRvQZ9Gdkd2ptWAtHD5Bg5t9RGYBCpYOr4fjUSA3WKQ@nongnu.org
X-Gm-Message-State: AOJu0Yw9jUrIrKx2unPhhB13TsPZZex+/ek1enYksTAbiJ9tQQY4jzZc
 aycwlcq6mEecD6WYRqTuwJ8OBItJeMHHhESn5n6k3qeux09oJaKt3IpQnzectno=
X-Gm-Gg: ASbGncs7NN7iYVokGGJLpPtT3picGFZXUzwGRcsfSwYD6VcIJ0wm46OJxQMns7AnJfe
 LpUZCEKYUQrUMsmJVqzS4DNv6GIZWe11NVh4NZ6DMd0Xs5t00InI8gV/gQpyzAQG0ChliQA98Hz
 xjX71G6V+Q6S2UzYTwR8HWN2uRqD3tWZUA1EDLh+uP93AjUo2BleN9UoQPKbCnHfrqrco/Wtw5u
 AsGjtngh14sj5yhdY6IKNDYhUAx8/xSZyT+jqnrCVisD0cSE53b51flUjTO4lCA9AUxAcr/bF4f
 sRU2vtDNBkA7aJbcjW0qfIktckwZH59E7ieSuIvlOXAp+VHlpfObpw==
X-Google-Smtp-Source: AGHT+IFDxKXagRZxdP/bUaV7OZcddxqG+Egy14RcpjwohSoEoHaJNhvo4C47QQbATRh45ZyZXkt7QQ==
X-Received: by 2002:a05:6a21:8801:b0:1f0:e3b9:6b17 with SMTP id
 adf61e73a8af0-1f0e3b96b1amr21723557637.26.1740641455623; 
 Wed, 26 Feb 2025 23:30:55 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7dec6727sm716764a12.51.2025.02.26.23.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 23:30:55 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jiri Slaby <jslaby@suse.cz>,
	Jason Chien <jason.chien@sifive.com>
Subject: [PATCH] hw/misc/edu: Rename macros indicating the direction of DMA
 operations
Date: Thu, 27 Feb 2025 15:30:49 +0800
Message-ID: <20250227073049.32655-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This commit renames the macros to accurately reflect the direction of
DMA operations.

EDU_DMA_TO_PCI now represents reading memory content into the EDU buffer,
while EDU_DMA_FROM_PCI represents writing EDU buffer content to memory.

The previous naming was misleading, as the definitions were reversed.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/misc/edu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 504178b4a2..1353c67dc2 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -63,8 +63,8 @@ struct EduState {
 
 #define EDU_DMA_RUN             0x1
 #define EDU_DMA_DIR(cmd)        (((cmd) & 0x2) >> 1)
-# define EDU_DMA_FROM_PCI       0
-# define EDU_DMA_TO_PCI         1
+# define EDU_DMA_TO_PCI         0
+# define EDU_DMA_FROM_PCI       1
 #define EDU_DMA_IRQ             0x4
     struct dma_state {
         dma_addr_t src;
@@ -146,7 +146,7 @@ static void edu_dma_timer(void *opaque)
         return;
     }
 
-    if (EDU_DMA_DIR(edu->dma.cmd) == EDU_DMA_FROM_PCI) {
+    if (EDU_DMA_DIR(edu->dma.cmd) == EDU_DMA_TO_PCI) {
         uint64_t dst = edu->dma.dst;
         edu_check_range(dst, edu->dma.cnt, DMA_START, DMA_SIZE);
         dst -= DMA_START;
-- 
2.43.2


