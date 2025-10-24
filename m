Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5228DCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:43:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNgy-0000fw-Om; Fri, 24 Oct 2025 15:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNgn-0000di-Jn
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:43:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNgk-00038t-Af
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:43:05 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475c1f433d8so20143585e9.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334980; x=1761939780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=769iWgY60OlZK01l+9XhxEq7r89R7EBa1iwDi8rTPRg=;
 b=Chld+oy/m6QQ3IJTFlAYwJqBj468NnB+ZUbzV8qWtc3o44GfLLCGLdpBNIbnyh8s0E
 cFCnK/H1b4R/zUOODW8/U0ZNhZH3Dph3G3sdwnewatpFKF7ndeFHdGdHZw/bxH1Lj63G
 qp5FqbQ8BirKtdu7GWY5UqYjE1QdDvjK2/dODTqhZML0rEFtlb7+S3OmUaqd1vsKbgcu
 rVp8mV1EVSEsNrujT9L8TqzR4BXCEgM+1Yeq6b+Y1ijoI8hoe7/aA1SaIPOHL8KWfItr
 SuatA/5lM/0trDA+DUfC6xQXsxh9oRW78EOhYwlGZBaJMzsF4aQHQA6FPuIMdkbUMtD1
 tw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334980; x=1761939780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=769iWgY60OlZK01l+9XhxEq7r89R7EBa1iwDi8rTPRg=;
 b=ELdZTH8pDciLGrUVUOhhdy6d5kVTlUwK0mldB+f5VPG9aVj2CTY2NpVUFgPSWkgRKs
 fRLIYxDVV6qt8o+3OnZh0vSj3l4REYZidKiwteZBFkuReXAY+1OmIioH15bN9CloiMEv
 3/Rjcx+8p1b8abcnnVMUXJxqC+vklWZP966Xh97eUMQDLKX0iYjvD7QBBnJWHKEh9pNj
 DBIPsNkU2pIVzk9X+nJRt/L1NshKGG4OwM1H7qMDyGueJkfY+XvvBHwbaacMEhFn8LOG
 YdawiCorIW+0YCVC6DYWbbXUUZYUx6NxzR9yrrR5jbikrg4N19824LV8nyUoY3eURKBX
 ZxWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlK8HLdcILKqgy+BqZeQd0Dj0kk6CaBkDXR3pYLpZtUV/pQVbEPQbbomNk3wezSO3acZ7kfuUNbeqa@nongnu.org
X-Gm-Message-State: AOJu0YxZgIVmB0RPBQK6HSUrx/n41wq2XLmTpS7LFFeBrtOrn6NqsaIR
 4X3XcGTNQLMI3l3KtBfG2x9qTdQ1h+YdyHx9lC9/fBXhknFvlqRd0tTmPRxijOPvuTY=
X-Gm-Gg: ASbGncvHULZ2AmQ78OI4FfJsAZ2kafzCAKQmyZLO26KcdZtZULbseuevT4ZQxjZcNqb
 ev0JAvpqECLBhA1YrrUjZ/i8KhTHtAArsosS8j+na84MPwjXFrh7pW3DqSOBSXZZlIbpSzMjGjb
 qhdSIp/VPVRPolF7LIw5vWr7llqB/bKqNFun0shwJUsnG42/6yZ59mxv23v3Fz4YnLy9vC7foNh
 naz04NkjV9nxOy2yf/a/cf1MMOaADdwU1rWld5xoRUgWqf4JPv0t9LDD2/tnLtQzE+rkUcBSY+W
 m/teU2sIN3LZftNcbzwn4k0i65+sjVMPbZKyjMFMRrNIYXnI1DMZ7rrm/fjPVzqEdb7N6gcxpsf
 4y4+LH95xzM9iGWr/F3Vv6CiAw6smcPo1pUuSkLusUyBbKlObyfykyoG1xg04D3uJ211O2av5fs
 hrVg41ZTbs2PTZdpuRVnhkbHcRpwfjowu4YssNhH8mnRJ/5yyMqw==
X-Google-Smtp-Source: AGHT+IFWb29gcfQca/ER+BJPqO7aaqpfQSFwUlsK9eveXaILCnQc1djGh0p3zJ6qYEW4EAd1XFXiAg==
X-Received: by 2002:a05:600c:470d:b0:471:a98:998d with SMTP id
 5b1f17b1804b1-471178a4ac3mr203706195e9.12.1761334980264; 
 Fri, 24 Oct 2025 12:43:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2eb9csm105240475e9.14.2025.10.24.12.42.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:42:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 25/27] hw/sparc: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:12 +0200
Message-ID: <20251024190416.8803-26-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  In file included from ../../hw/sparc/sun4m_iommu.c:28:
  include/hw/sparc/sun4m_iommu.h:36:18: error: field has incomplete type 'AddressSpace' (aka 'struct AddressSpace')
     36 |     AddressSpace iommu_as;
        |                  ^
  In file included from ../../hw/sparc64/sun4u_iommu.c:29:
  include/hw/sparc/sun4u_iommu.h:38:18: error: field has incomplete type 'AddressSpace' (aka 'struct AddressSpace')
     38 |     AddressSpace iommu_as;
        |                  ^
  include/qemu/typedefs.h:27:16: note: forward declaration of 'struct AddressSpace'
     27 | typedef struct AddressSpace AddressSpace;
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sparc/sparc32_dma.h | 1 +
 include/hw/sparc/sun4m_iommu.h | 1 +
 include/hw/sparc/sun4u_iommu.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index cde8ec02cb6..46ed0a20d88 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -5,6 +5,7 @@
 #include "hw/scsi/esp.h"
 #include "hw/net/lance.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define DMA_REGS 4
 
diff --git a/include/hw/sparc/sun4m_iommu.h b/include/hw/sparc/sun4m_iommu.h
index 4e2ab34cdef..dd09a72c525 100644
--- a/include/hw/sparc/sun4m_iommu.h
+++ b/include/hw/sparc/sun4m_iommu.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define IOMMU_NREGS         (4 * 4096 / 4)
 
diff --git a/include/hw/sparc/sun4u_iommu.h b/include/hw/sparc/sun4u_iommu.h
index f94566a72c9..fad71264408 100644
--- a/include/hw/sparc/sun4u_iommu.h
+++ b/include/hw/sparc/sun4u_iommu.h
@@ -29,6 +29,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define IOMMU_NREGS             3
 
-- 
2.51.0


