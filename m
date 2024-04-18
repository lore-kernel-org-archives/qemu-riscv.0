Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4366C4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:30:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXSN-0007wx-3M; Thu, 18 Apr 2024 15:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXQC-0001V8-Hg
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:27:50 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXQA-0007e0-D1
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:27:47 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-570423c4f80so1256953a12.0
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468465; x=1714073265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuWZ6VCaeCTfKgGM+fcYzWiSC9LIi21t46RdwEg8Jqc=;
 b=x5wRfVcOKCY5n9oADH2ZhfSsE7uQ3MTtfu3jpEtNiUvAAHPMo1BquWtLKtkybqxbEm
 gPDRlQ3Mj0VkWEoUQ9OyDIB8CtJb1QdYZJxN7lVi6jvFB4gs9CpPSrVUb0EwBLeYUlT6
 JuZE0gTxGt1pcM9rGcvud/K99h+Y/rAOVPSR61hWV2uQ/p97UzO4AuuCVW/updWH9ug7
 G35x6dDVLgYjsCpXsfCp5Ya0G0eWuiL9vdjWvcwtOyBSmulb13vPTnn5HZRdExejIreg
 GGzzhWN5k/fBlDPyn0JHcTgrXac4s9qJlCoNDdGrV9rxpC6t654/oM839wBzGYwKhj69
 bxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468465; x=1714073265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuWZ6VCaeCTfKgGM+fcYzWiSC9LIi21t46RdwEg8Jqc=;
 b=d30AWWatu9czcTRkOJW7jbPxDdMpCjki19fiNh53W8yvB2V4Ydu/OdeM1r7uePSitA
 0Yp7A3IbyUNBTpPyERM1XNpFulQW1mplxobZH5pqpgsV3v9XCX4eVBiKvQlRRre3GX12
 5/0exyBPMQFAZw3/7RbvEKs1dYUJgHctc2tX8026Ix6QbNSzDdF35rJbO1b6i13Sfabe
 2roD4tYmQtlXy4KvSBQbj31ENyggaPbMg045YZL57vB7vyMNKDqG4W1lqoJtlTDG6l8f
 OTqzkzFCNvDhPmyKvbHmDSoFOOG2v+RyCz6Uf7FK+uaS2uYx+6DJeIi1FoiB1FaXFjS5
 TI7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4K3cO47W13gh3trZo2WLbJifb4ThFi4lIIhAY/SVaWh5oLIQtLlaDqMcmacUGoM4PWxQEd6Wlj/hVtdGtx+v6cwKGtIo=
X-Gm-Message-State: AOJu0YyS3tM60X6nITBEnVUPY5oHVwlGJWm+1kgh0N+kzxMTwU/2YhMC
 XJcpCC1H0reQ+3rMDIYisVW8nwYnPDSn6eNWc6y0apiVkiskKv4O3Drz4ueP3Qo=
X-Google-Smtp-Source: AGHT+IHNrvZlZ7Uei/H294UHaKVP1n4MPQEnwPA0Hao+SxNQsQzhpCkD7PK2coUvXZVR5L3VPti1CA==
X-Received: by 2002:a50:aad4:0:b0:56d:fca8:d209 with SMTP id
 r20-20020a50aad4000000b0056dfca8d209mr113241edc.10.1713468464845; 
 Thu, 18 Apr 2024 12:27:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 fi5-20020a056402550500b0056e598155fasm1213489edb.64.2024.04.18.12.27.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:27:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/24] exec: Include missing 'qemu/log-for-trace.h' header in
 'exec/log.h'
Date: Thu, 18 Apr 2024 21:25:16 +0200
Message-ID: <20240418192525.97451-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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

"exec/log.h" accesses the qemu_loglevel variable,
which is declared in "qemu/log-for-trace.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/log.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/log.h b/include/exec/log.h
index 4a7375a45f..e0ff778a10 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -2,6 +2,7 @@
 #define QEMU_EXEC_LOG_H
 
 #include "qemu/log.h"
+#include "qemu/log-for-trace.h"
 #include "hw/core/cpu.h"
 #include "disas/disas.h"
 
-- 
2.41.0


