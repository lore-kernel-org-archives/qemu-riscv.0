Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD8C44500
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG7-0005to-Mp; Tue, 30 Jun 2026 23:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFv-0005h2-NZ
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFs-0002p4-Ao
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c9f44ddf26so666975ad.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875091; x=1783479891; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iDK5Y5tKY1GYf0B8NSrA3z/u0Rrzqvpx7FoJxemUn0=;
 b=QH2K5EC6fZGDBuX0KzzCD9IHdFIELb3gu96gDdlS/Ldq72hOndf5oC4YkJQSFSOXrY
 +oNRPnjkPeZngPIP+OlizmQcT9uLlRI1KomZdMNZP9AxLgPgzAX+gEk5f1mCHXrZ6try
 1e6c4hObDNjJ7fN/hTR9qVjnxiHmOy59iulxlrKCxPitoTZmD+r30xGsn3MQDH0hwdXS
 SaD6kFRNL/zlpSf1fgc/82yUNbgcRNfJmMq4kdY31vrwvJWNYRG2Sjz2Om/FEf8riZQh
 qtIg0jiGo4xc5icdtnJb8wKZUtjaGqKUF0ygyoubhPH2q8Ycvtr4TZaKtioQVcqvPpaR
 xf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875091; x=1783479891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5iDK5Y5tKY1GYf0B8NSrA3z/u0Rrzqvpx7FoJxemUn0=;
 b=rWH0SOryCdFecgItTawBRgLxqKiSTCgusPdTaJqrqbZ3sBc17LO2tdmEmjokhyqG7c
 eZtItH51ETYvmSZkmgRze7vbM5ieCx17JftMdeAkTQHUdOcqfbL82ja0NoIdj/Kpn+RR
 jQNX9y3hlgyBiAYA4GmELzBy3PILjRvHPuKrz5McEw8S6J83Y450jnzvi27jTLarbOyc
 KZWTLZIyojqgs1ZZjQP9WpROb2bgFxiXef+yrC/ivn3sJIAbNQolIplc9P0WiCSsrZYq
 gsyzN4pgCjx/Ga1a0pB84QVS7DQ/cjRoqqF7dXC2h5Qi4kqfJxXecEgrQmUIJORbcfy+
 QKRQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+MRhUR4JkxEtt56IwOiNgWvYV8YD72oQl0K8FckkvL0vrSgbN9NPE/6IWDyATee0dzkw2zr0pNVdw@nongnu.org
X-Gm-Message-State: AOJu0YxrOyQUU9+D7MrjbgXG6Mq3GFSyBUF9EWcaFkdsnGo5A4H4IOlc
 aPlLDPmJEgwdRmMlGAD3iCxi6Mr3h4p8nDXcBqBkLGucl8VvV7rcESKXDVyMDMFLSN0=
X-Gm-Gg: AfdE7cnBqavAuDucQ+pS3CEoQjtkI/7WTgRCR6yvbb0WIoiM6w6XlWtE46O8Lj8q11E
 v91XeHg7+DQN5g6GMr5/BUq15l8cK1VkvSmezTJbBzoLuoYpGlZ98CVFQ79j7gmLLy0o05BhWf1
 WEcPc/ikI3QrGpW7q5oJORzNiBDDHmZy8ezVIw+B5cuy5WBh4MuZh923/gITnwedtNPY8SxQ7a7
 FgfLf0YgJyRULsXU4c7xz2VfTN/CXUjouJSJ7Pf5TzhUX3jEaY7l6Ubi6dPibw3nhy3V6Z0DGRx
 bc4zHz+koCP3GvHIkjcEZBwZWhjbZEbjpiQsaPEYqFZ+U2EMd1KntU5XUp2Ss9JJWZco7i3ZZAN
 rvvYKyada5dazc4smy0j5zaWrluWmUkjyt4Qtaj4D0TwQXoZzLvq2i6xpVoLYqbMnDKgY8+2fGH
 7o8C4EDp6eXE2HZ6O6K34XHwjXPUisSSYMFM6IyAzPZ6Kh4HeDTA==
X-Received: by 2002:a17:902:f143:b0:2ca:de3:15e3 with SMTP id
 d9443c01a7336-2ca5a537e6fmr16157985ad.4.1782875090794; 
 Tue, 30 Jun 2026 20:04:50 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 07/17] hw/core/cpu: Remove exec/breakpoint.h include
Date: Tue, 30 Jun 2026 20:04:33 -0700
Message-ID: <20260701030443.1382447-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This is no longer required in the generic header.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e05e261883..ae8daa1159 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,7 +22,6 @@
 
 #include "hw/core/qdev.h"
 #include "disas/dis-asm.h"
-#include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
-- 
2.43.0


