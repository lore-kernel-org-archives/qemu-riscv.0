Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94980C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:00:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhGc-0004Qj-UD; Thu, 31 Aug 2023 08:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEp-0002i1-Ua
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEj-0005Dw-Oi
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-401f503b529so7238805e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486644; x=1694091444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNsqCjIrn7zPEbmcPc2JoOkFxTFsvtPHpgJNrPfRe3k=;
 b=Dy2Oa8eUvBjrN+Piny9LuZZhv32bc7Pj6pUUp0rhZWO3ZSKp28fzJdyvxh16mvaWFQ
 olI5o134o2gavn3ocyvuFWordWMIKkYfMzaAPz4lI2XxkH5GXdPe9lnjrN2hVxHLJz23
 Mz+25Ksl2qAiJUMSoBibg1AjA+5oMLlKS3Cy0BA4VByJOmnPNqEgPjSuXywvyAp2Pgv0
 SYfPgwyymGV7vNHJhDEA5HTfV2gPOoRMfvE8TarEhJLW91a+LLr5FrAgW7O/xeRd18sO
 82J0lW2/63Qmlr7n9tkd9Vv+bODoJojUiNi/iTYghbt557sAobdbiKbOz36zpq0Xl5lr
 4Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486644; x=1694091444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNsqCjIrn7zPEbmcPc2JoOkFxTFsvtPHpgJNrPfRe3k=;
 b=lCjFiHdoGUM/y6PDA5OBPzQVGsjWvjQ7eVdXrj/foRSWNkxcFds0JQMUsW90FtJKcq
 CErawm0vrVsmqc0sKoCDdf4bq/07HfqNrJJKawSdKVI22w+FeN1rGNTQHZu4Gwi45krJ
 K8TTThUwOkHEG4mEUaMwuVzBp8IFZBkqRVRx0QteJ6Gd0XHTJPoDnxzi1cswT3c9CqpJ
 /Zc2CMySSXF3PGTSZpshxhzyDwzRSrEN03rlwEeLg2odyf3FC79HYflHY4JFrr0gx4fZ
 5JODOpEdzfc195xdfQGiZSOU7yOjeOOd/LjL9zDl9tfiskDw8pri2KDWr9a2t67NmW4o
 QV+Q==
X-Gm-Message-State: AOJu0Yy7kQcrb0Vyt4CxeVsyQY0TzWkUGpNZGmWTbi6RuYb7jkSfzqRU
 iO1g+c5sKwaBqHQMDUdC0pDvZw==
X-Google-Smtp-Source: AGHT+IG9JXS8zKS+njnm6ZrK4HS2Td/52k9bRc5OwER3l9a0ZyaQp8YjIaEZrq4e//IpPM3IKYyRcA==
X-Received: by 2002:a1c:4b14:0:b0:401:dc7c:2488 with SMTP id
 y20-20020a1c4b14000000b00401dc7c2488mr3945207wma.11.1693486644318; 
 Thu, 31 Aug 2023 05:57:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a7bcd09000000b003fe0a0e03fcsm5059538wmj.12.2023.08.31.05.57.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 06/41] hw/dma/etraxfs: Include missing 'exec/memory.h' header
Date: Thu, 31 Aug 2023 14:56:08 +0200
Message-ID: <20230831125646.67855-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

The 'fs_dma_ctrl' structure has a MemoryRegion 'mmio' field
which is initialized in etraxfs_dmac_init() calling
memory_region_init_io() and memory_region_add_subregion().

These functions are declared in "exec/memory.h", along with
the MemoryRegion structure. Include the missing header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230619074153.44268-3-philmd@linaro.org>
---
 hw/dma/etraxfs_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index a1068b19ea..9c0003de51 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,6 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
+#include "exec/memory.h"
 
 #include "hw/cris/etraxfs_dma.h"
 
-- 
2.41.0


