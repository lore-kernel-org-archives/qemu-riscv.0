Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337FCC7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 13:31:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7FjX-0001DF-48; Thu, 08 Jun 2023 09:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7FjU-00017R-Ts
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7FjT-0005id-3y
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6e4554453so4016255e9.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231077; x=1688823077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QX7oEag8EHw5/rO2IwkanQ9xp1UV8fgADH4pyLkBN/8=;
 b=Yty491Tz/CLkQDSwq+5sZgxbDG7fw7qXKqg0I2+qqFNlYiT0oe+BLvr1I9fRtno99Y
 3wm+0fYUFbVJNzXFKo6oW+bpOF2rTcqGWoL2W9HqvNeeLIyDQy8LmSb2wCUSvpJFPxl9
 m0JFSV7phvOItASvAbXPHx+PrnsLtMkKiHbbLs0du3kluYxjMYsdIImMf89tg6QCtlV6
 TCoKwMQpYqT9s3iCVMvKQ6XtLoO0jNlqKWhSA1Ai5Q4JIgoiEImHDYM+F14RpKAjgH+u
 wiBvGPy/6F/Jds5Jwkr+gGCy1YuJi44biORmwvI/BzEAdLRatA59FiZST2qsTno6FOdW
 Ze4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231077; x=1688823077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QX7oEag8EHw5/rO2IwkanQ9xp1UV8fgADH4pyLkBN/8=;
 b=kiLIgKA3kC0uZNp3whanS1+p35hpjxiX2ZBrXRxrXAVO+I3GSH0bFDBpW7v2pFHlSk
 5Too0LdVV9yh5wxqrXDM/HF+soqimb6kEli6Ai6TZ6O3eqxoSX8ZQDJ7QY9/jzD7pxTH
 uqxIrtC79Z6x4N2jSZbjXgLk85+H+PYQkgwHw3Jt+u2KlmMmvW88lF+ovw+CffVAbioC
 1gpwr/H86Ynlz8QAhonybNC2yiB+WdZ7Ln2Gr8Q/mx/YA3+Wuqn6lUG8FS2B6MCZabZi
 ZdRXg1NSmiLu7teiU1f4qduc1LnlQ4Qcto8u29LAcXR+vAOJ6E5Xt7xI77rbPyjdZeY5
 AQTw==
X-Gm-Message-State: AC+VfDzrZd2cmwA5Dbd1y6t9yUtHShdUlhB991Jk2dcdYzUsyAtl5iZU
 +H0T3P6TCiUMYqprwCa86+DB4Q==
X-Google-Smtp-Source: ACHHUZ61tn6vHEAKVl/Vp8pTCAPiqntWPPZLSlOp6Lcuf5M8SqY3aUUWqSkuekw2FlRNU1IkN5xc/g==
X-Received: by 2002:adf:dd46:0:b0:30a:e9cb:1a2e with SMTP id
 u6-20020adfdd46000000b0030ae9cb1a2emr6312547wrm.65.1686231077545; 
 Thu, 08 Jun 2023 06:31:17 -0700 (PDT)
Received: from localhost.localdomain ([176.176.169.168])
 by smtp.gmail.com with ESMTPSA id
 cr5-20020a05600004e500b0030c6751a49dsm1596961wrb.115.2023.06.08.06.31.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jun 2023 06:31:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/5] hw/remote/proxy: Remove dubious
 'event_notifier-posix.c' include
Date: Thu,  8 Jun 2023 15:31:04 +0200
Message-Id: <20230608133108.72655-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608133108.72655-1-philmd@linaro.org>
References: <20230608133108.72655-1-philmd@linaro.org>
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

event_notifier-posix.c is registered in meson's util_ss[] source
set, which is built as libqemuutil.a.p library. Both tools and
system emulation binaries are linked with qemuutil, so there is
no point in including this source file.

Introduced in commit bd36adb8df ("multi-process: create IOHUB
object to handle irq").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Note, --enable-multiprocess doesn't seem to be covered in CI.
---
 hw/remote/proxy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 1c7786b52c..2052d721e5 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -22,7 +22,6 @@
 #include "qom/object.h"
 #include "qemu/event_notifier.h"
 #include "sysemu/kvm.h"
-#include "util/event_notifier-posix.c"
 
 static void probe_pci_info(PCIDevice *dev, Error **errp);
 static void proxy_device_reset(DeviceState *dev);
-- 
2.38.1


