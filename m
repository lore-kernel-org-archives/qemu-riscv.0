Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB29E7542F
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:15:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnZcE-0007UC-IS; Tue, 03 Oct 2023 03:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZcB-0007Sw-Ol
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZcA-0001h4-Ck
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d20548adso592868f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 00:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1696317280; x=1696922080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWJXBWm1ZYHjW4EfBm3crjEQsee3HSWCWajh4JJ9oZc=;
 b=ZlGFTWzP51koOAmxhDWGxWWKriJO28bbPAiE/i/yDfr/klQFlVpPUNgX3KwfkmLVRh
 711oadsT8njF7NRmVOo7Bc4h3JIsxDKDATpez5pA4KNC6lelTi6vFi2HBKGpBcO7DCbh
 qAuEH6o1j4goj24fvYAJSjldjzezuPGzAw1NfVlwjKnHTT46AM7j1Bu6gmq2LZtuFE4Y
 Y4BP3RpcGznBXztP1itFTSKDuPskxYE9RgOfrEzgleg6fMrSJc0SyYVmI+SxeM+hct73
 eJ5951Z4066COx7pu4NpobwojLlwQU6fwA5xvY03awA4B9wkKBLPyXIywIUd7HgnNBZh
 lIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696317280; x=1696922080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWJXBWm1ZYHjW4EfBm3crjEQsee3HSWCWajh4JJ9oZc=;
 b=jhhDYinfpLG770M5OeyfE5x5W/8n1lVgVduVZdpUioaP6NyyP1Sw6vAYFWvg94H7Q3
 i1RMzOQ4qeusbudGcpc8IT5wRfmIcb9BLpuwh+a6ZIrsg+NXG1smsyWIqn6o9R9eEvO6
 D352dpYTyI7sAwxspweVT+PNeCdOXYGn3qZA296N+SxhZqypR0KuFKuSBNgcxElHetGF
 ukzhpFNsDYDZXYCLcXcDvubVpFC4siSwHontt+YcZjQs05n7TK86P+Djgj5OlC8uIAEX
 2Xxzsdj8t0NooBT/F/a0GZn3TUg+5GXplDCvYjmrZfVh0xtZtE1ZgGWfbmc1CMqqsTFZ
 ZDMg==
X-Gm-Message-State: AOJu0YzVjRyol4t/GptWtzluUVQm4Z0QWgTqNLoTGsFOmfPBuZh7xbdE
 aheipa3/DOwC7X1GFAeRdwEKDg==
X-Google-Smtp-Source: AGHT+IHtOSY6DoWRRNrGgpDloH5PKYgXaG6fSiMgh9Wmc9JgOFHAwYKXQes7ZilnQ3LuYi3lQnDsLg==
X-Received: by 2002:a5d:5390:0:b0:324:7bdb:873a with SMTP id
 d16-20020a5d5390000000b003247bdb873amr11996172wrv.58.1696317280120; 
 Tue, 03 Oct 2023 00:14:40 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b003179d5aee67sm832196wrq.94.2023.10.03.00.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 00:14:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/5] hw/char: riscv_htif: replace exit calls with proper
 shutdown
Date: Tue,  3 Oct 2023 09:14:26 +0200
Message-Id: <20231003071427.188697-5-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003071427.188697-1-chigot@adacore.com>
References: <20231003071427.188697-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x433.google.com
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

This replaces the exit calls by shutdown requests, ensuring a proper
cleanup of Qemu. Otherwise, some connections like gdb could be broken
before its final packet ("Wxx") is being sent. This part, being done
inside qemu_cleanup function, can be reached only when the main loop
exits after a shutdown request.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/riscv_htif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 40de6b8b77..9bef60def1 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -32,6 +32,7 @@
 #include "exec/address-spaces.h"
 #include "exec/tswap.h"
 #include "sysemu/dma.h"
+#include "sysemu/runstate.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -206,7 +207,9 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
                     g_free(sig_data);
                 }
 
-                exit(exit_code);
+                qemu_system_shutdown_request_with_code(
+                    SHUTDOWN_CAUSE_GUEST_SHUTDOWN, exit_code);
+                return;
             } else {
                 uint64_t syscall[8];
                 cpu_physical_memory_read(payload, syscall, sizeof(syscall));
-- 
2.25.1


