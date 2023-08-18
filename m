Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C2C7112B
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 09:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWvNU-0006ra-PV; Fri, 18 Aug 2023 05:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qWvNP-0006q5-BR
 for qemu-riscv@nongnu.org; Fri, 18 Aug 2023 05:02:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qWvNL-00078v-Er
 for qemu-riscv@nongnu.org; Fri, 18 Aug 2023 05:02:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-319559fd67dso633521f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 18 Aug 2023 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1692349354; x=1692954154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJ5t67+FDfvzZ0dWVUldRJx4lTAjCwJdvkLnuACeRjU=;
 b=Q2UmLkhbys13sGk8RmNEIdjJgChHpbRLtkIlR48D7loZBOaIYDdBu/S1MqS18Irawz
 vejGzkh+bb6lwfmAZSiBO2IgILpT2znQrEpPU+fVFRQiSFolrJBbhh6xBKNVdVPwYYkG
 nMoqR6EewD469AkPbPDsDWktWCQOeL69FSN91ooS2ZwTq+/GDBJHhZssnbbcvIY7blJU
 HjbBgrutB2kXzSRYOoCWiio8OMmSAIkHCjnZn/2PBOMWi7SU/1Bcxhd9J7mwb8JvLcKe
 fWZLLT+4TjlAqXZu2tJr15ImcxzLiVA6GkpCcQ12iQGjyaF1NgpByvKhyunMzLVV4vMI
 Gd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692349354; x=1692954154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJ5t67+FDfvzZ0dWVUldRJx4lTAjCwJdvkLnuACeRjU=;
 b=jgMTxEXZsKz/Ic1apk0ikbnUnxtWEhQkVFDNvIt7acHPRJwSflzlHMDyUb4xKcJa8W
 VN52yekFQyutGYWdqWJD7WhGoFz5Mw7NQhjVBNubxNNMacIqAVKNHHPxn8WxVE3oXXvc
 Dcjdcwx5NO+Jd5FSTOQrhBy1afC5b5kGDolp6ZCH6AXL4kCmVjRDFa01agkWiWUrTQJe
 m6CN3WX0C0wIh95dp/nO1ggHiorjX4hDhbLnUUqBL6QJqq0ZUA1+84n+Qc6iErWwQSZt
 HQd2+pPNBYAoQM5UV3D4VWOZrBktBY64E/1JS9KcQO26HusJ87HDvQmsX0DpKBzDAaad
 f0sg==
X-Gm-Message-State: AOJu0YxHUIatBYvRBawUce8ybvEwmGxTS4ysGs1xoqui4aRiseD9TZP/
 fxumlAdLJmTO5vYBD2f0I5OEupbfcDEl9Yj6e8c=
X-Google-Smtp-Source: AGHT+IGpAsaY9O3yjm/gDAAoHr2MxTB8k6mCLHG9dFR9KKib1U/8NwDofYZUIjBzMCIxRIV6U2zggw==
X-Received: by 2002:adf:face:0:b0:314:1416:3be3 with SMTP id
 a14-20020adfface000000b0031414163be3mr1265199wrs.70.1692349354106; 
 Fri, 18 Aug 2023 02:02:34 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:44f6:7cae:4aa1:4fb7])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b0030647449730sm2085745wrm.74.2023.08.18.02.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 02:02:33 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 2/3] hw/char: riscv_htif: replace exit(0) with proper shutdown
Date: Fri, 18 Aug 2023 11:02:23 +0200
Message-Id: <20230818090224.409192-3-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818090224.409192-1-chigot@adacore.com>
References: <20230818090224.409192-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x42f.google.com
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


