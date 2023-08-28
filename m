Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6114AC83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakVH-0007Sp-30; Mon, 28 Aug 2023 18:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakVF-0007RY-Th
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakVB-0004KM-SW
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fee8af9cb9so34943195e9.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260868; x=1693865668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcV1pV5u9SuvcmRud4Mp8xFzvcnx8scdTw95EYi68HA=;
 b=bxys3YdYXJMKN8Kf6vU6UW4r1EKUcN2fNWrONVtP01NlPtiYRw27SKaD6bmMD6VRzW
 Ky+oyZgPLMcQPvgufNSDSpXcCknrPeDiP9zKOetvIJuqurbAko6sc+5bx7BZ8HSwJCgV
 FtkBLRA0dPESqjxg/BOjyt8+VacRJ6A1AHkwr1mHSIsWTwhKEqXJPkYH+guOhIhSF0Uz
 ZeUEOaAGzlfWwnEoBoeyJs0oYWrnER9CyXCwxkUof+5v4ymtz/UpT4omvWZlK+FPNfk8
 6aMlIGhiLwFU37h3a1A44dktaQK7OC0l1GsiI9aw8at5iunAWKy9padnz+SMFX3yGPmF
 Sl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260868; x=1693865668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DcV1pV5u9SuvcmRud4Mp8xFzvcnx8scdTw95EYi68HA=;
 b=RyHqhhj4i8OI4/MvNKnK5xd6uh5XMaCzk8iu1HZLo7EKEzyujJ7Rd8uo2669rublFg
 9HhLtXcANkiWjxP5mWYH2gPu+GmlXcgevLhWx8VIiEd2X29kYapGrvAfhzhT4ReSSm1y
 XUsZkWRC+1smvCl84GWcXfN8+bOQFYF6armjTFopfb1G8OEXES1ynzUQrFlXUarIWqS/
 6GHl6HZuS6AOl3It/eJYYmHuc8q9x/ZahedIwo4LR4xhQqfyVuSK30qyb8zSvGUvaEKS
 zoB/1sjXi4MYSEVMMvvhEyMAeyQmcJ85HJnJzGhkB+KVetGl47faJ2F5yxETcUxyLGTr
 X92A==
X-Gm-Message-State: AOJu0YxJHI7h4dCJBXpr+dp+UTKC0wnwlwTMrVaG1q0n/A91JRYEP+D0
 4U+JUqxWRsqIJ2f3tqG1uSYPTIOyLqbnQwDQr7A=
X-Google-Smtp-Source: AGHT+IFpSwWHdeitvfzjQL2Qo7QEnZZexfoyi5OWqkugfCiTnY9cz8wLwSAWbi3uVZuaV7EGQhAhhA==
X-Received: by 2002:a05:600c:b42:b0:3fe:2b76:3d7 with SMTP id
 k2-20020a05600c0b4200b003fe2b7603d7mr19786764wmr.10.1693260868477; 
 Mon, 28 Aug 2023 15:14:28 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bca58000000b00401b242e2e6sm13062052wml.47.2023.08.28.15.14.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] exec/translation-block: Clean up includes
Date: Tue, 29 Aug 2023 00:13:14 +0200
Message-ID: <20230828221314.18435-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

'qemu/atomic.h' and 'exec/target_page.h' are not used.
'qemu/interval-tree.h' is only required for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/translation-block.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 5119924927..b785751774 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -7,11 +7,11 @@
 #ifndef EXEC_TRANSLATION_BLOCK_H
 #define EXEC_TRANSLATION_BLOCK_H
 
-#include "qemu/atomic.h"
 #include "qemu/thread.h"
-#include "qemu/interval-tree.h"
 #include "exec/cpu-common.h"
-#include "exec/target_page.h"
+#ifdef CONFIG_USER_ONLY
+#include "qemu/interval-tree.h"
+#endif
 
 /*
  * Page tracking code uses ram addresses in system mode, and virtual
-- 
2.41.0


