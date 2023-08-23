Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1BEEE49B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 07:07:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYhxP-0006XF-UE; Wed, 23 Aug 2023 03:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qYhxO-0006Wr-E8
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 03:07:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qYhxM-00044J-RK
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 03:07:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31969580797so4716058f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Aug 2023 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1692774427; x=1693379227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XhD97iO9Cr9UC31aJ5SoAXRsEoQS/yz+IXBL36dUT+0=;
 b=QkeCfdMVbNKGr09S+IC/2GgrzcZ/sL4AkI1PX7gmq146WTu91SExg51vLQo7S9pp78
 x6N/rNfc+xfhFnBgT3uLnl9X63A29EFYBWjc+eezcUA0FO8mWnD5MXB3CPoVBc1m6XPH
 us3/LSUKi0ETSFXRlggh0Spaqig6xmZi5xD3O6V3O9C1m3td7A3p+Z3gTWH7bFswUctb
 ZAEnDRZF6wfNBJfPYehuHOE0Hs+5v2cG0zTNsysBP8ZuZKNNZDLhvwss1zBDmY4fsFQq
 RcYHeukIyyDsfG1eSOLPnmlGkC9vWTR/S46wFPrOO6K7lfYtEc/t1HBNOAuxiy8QpDib
 Wbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692774427; x=1693379227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XhD97iO9Cr9UC31aJ5SoAXRsEoQS/yz+IXBL36dUT+0=;
 b=QP8h2VdwEG9Pyt7TBot6W1paKkRGZYB1p+B6TR32GQ23TuUD/jCQg9bRyt32suFUBZ
 o7ewyvYklYUhXkaAA91S48sfxms2b/wneiZPcnKj7r+jTpU+ype6iH2SrbMTIAlk8rdw
 ma+1bKjdUp9/7gigtZYyPD8e/kXfirIMOkeoYLHH1Z5fggNNrl5kd1cmagBn/P15XyLj
 yOCjOCcs9iBPRVq8FU54vcEmfTGLZfauqnfUwoBb6gmOaNkI1yNIaP3g+1KpRsy3FD3X
 zuKYC4m8tFzeT6Z0WUd+WRa8HDoc80GWInbyIta2GS3WhSjqIuVYCfLWvHc58JD1HGOz
 DKPA==
X-Gm-Message-State: AOJu0YxFisbdGPbMD+vlihW6N9fdgtcysB/iDoVIgT60P1sFwHVdveCl
 tc389GXrolNwpwRaTcgZZv3+lA==
X-Google-Smtp-Source: AGHT+IFkgUUI8BS2Ce2Cpm9VkzCGS4qcldZ1sZgkQXpFMBofifVVcTX+vINuY6E6VyA3eHHQmb2siA==
X-Received: by 2002:adf:f64c:0:b0:319:77dd:61f9 with SMTP id
 x12-20020adff64c000000b0031977dd61f9mr8845679wrp.35.1692774427389; 
 Wed, 23 Aug 2023 00:07:07 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:d434:6b1d:751:97d0])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d58c1000000b003180155493esm17750970wrf.67.2023.08.23.00.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 00:07:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 2/3] hw/char: riscv_htif: replace exit(0) with proper
 shutdown
Date: Wed, 23 Aug 2023 09:07:04 +0200
Message-Id: <20230823070704.363098-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x431.google.com
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

This replaces the exit(0) call by a shutdown request, ensuring a proper
cleanup of Qemu. Otherwise, some connections like gdb could be broken
without being correctly flushed.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/riscv_htif.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 37d3ccc76b..c49d20a221 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "sysemu/dma.h"
+#include "sysemu/runstate.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -205,7 +206,16 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
                     g_free(sig_data);
                 }
 
-                exit(exit_code);
+                /*
+                 * Shutdown request is a clean way to stop the QEMU, compared
+                 * to a direct call to exit(). But we can't pass the exit code
+                 * through it so avoid doing that when it can matter.
+                 */
+                if (exit_code) {
+                    exit(exit_code);
+                } else {
+                    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+                }
             } else {
                 uint64_t syscall[8];
                 cpu_physical_memory_read(payload, syscall, sizeof(syscall));
-- 
2.25.1


