Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A4CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 11:34:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbcv6-0001g1-3i; Mon, 22 Jun 2026 07:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <inochiama@gmail.com>)
 id 1wbcv3-0001fD-Be
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 07:34:25 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <inochiama@gmail.com>)
 id 1wbcv1-00049n-QR
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 07:34:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c899550c840so2988853a12.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782128062; x=1782732862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3d1w/Ecvpo9SAU0olHhh8kvv0qpHefNp4PB+eSWQeIU=;
 b=FgAhdWOFtjE8YMS0yNZEg9c5sizhnslTHKQRCBoo11PU/O0gfcCpxgcgcjgtXwzg9P
 3IiiV6RffIxr3TP/La4DZWhxLwWQuB3Z0HOhxMq/DjxFNbLUKJgzcHVArT7nQIWAoiMG
 8Cd2xIaQ2/9RkgslLd3nBip0GZRwyN+fDzfQGlwkDo5Aq1xi25+vjgbUnfg3rRX1XfbZ
 T02c+A5UwzRKxLrGCcOV5PpAvk7ol7BOSbCw8DYWJJFpAnP9aaKqUpxCES0IjNcGmyDb
 o21n+KJrPU6w4CyUQ46qtePUSUX+BA1xq/oTP2su75o4f0EGUMnyQ1u90TrNivIwfU5o
 YrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782128062; x=1782732862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3d1w/Ecvpo9SAU0olHhh8kvv0qpHefNp4PB+eSWQeIU=;
 b=r4lSYc5xJ3c4T83fwm1RbKiEXY6hAjRgAau1Uz37vjFgqTysdj2ckZ4mQNFT2u7ixU
 zm+WK4G8bKwelc2aBG7WZzcIIeUURPyo03Wu0by78GTyjfgH65xKwMK3FoCXNidpXKJ+
 SXVVpbUCt8HBLx5ymJvVfhyfRbzsBiN042rUjTkcDT5Q5+cNxqwkwSYDiiRXjx5wpzvF
 NpuyTZGdDfhIfN2GFVjKEYpc+KZrFL+3u0FSNidLhrQ4XWs80BRJqRSCkXwFittFNdGo
 0JGW0oSHheDxkZvEyHBfQNlJdxawIQTBoGEbvwxvhlPZ8MDdEYLlJpFpV6wXsV+l2bUq
 xkBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9CpZMTnKEEHk4GV/Qvu8jdT9dmHRAsICdWGzsL9b8WDgTMUuS9ZXBCLQExTt6M21WJHJXy6ortB97@nongnu.org
X-Gm-Message-State: AOJu0Yxhug+jZvMJ12M8X2Bob7NUFi/DPY81pgBQ7RbkFB9HHWcrJmzC
 62BJ0FifufrmjLtfWsdTHvr+fwqehHrKOWBEeb8BYdZktEu66LV7z++2
X-Gm-Gg: AfdE7cnd6q9nzBiiCP58sFtY8qoV7zkH4gHZnzxLON5y/m+8yobl6pHZOuHON/vzNZB
 MAL1wR3aXA4mwXIv9MQtXu9jiI9L7ie35SiGOODvSwlaaVAaL8nJHPKI5RcT4u0+CKC9HuTzF8m
 ios0ecHQ2wjK2gEowWtnJ6Xp5VrsQE5kgkp+XF6djpdIwGWSre6//klWbWnrZrwHISDkJzQceBA
 CFifnwDPHWv98paM1Yalsy3kryd7U7WoD4V2ZxLBrrnsDLSFjniPp7WC3wjIZusMOGbCJcJ0a+N
 HV8ZJ3+UE+tWhKB8J5qgiFLtJeQXOnZmX/i/AGA0A7tAfyHQ4wc0UPekvpC5gRjpaszRBUKoowO
 7artRFH4oW8XGiFJVbbxJawazEGJdAzotJobtcvsTllK5cKu/H9PTsoyUfNKdVuhH+tCW3Vl5f+
 fpTK+k4y4moSk=
X-Received: by 2002:a05:6a21:4684:b0:3b3:f46:1eea with SMTP id
 adf61e73a8af0-3bb69ca4180mr14911100637.7.1782128062170; 
 Mon, 22 Jun 2026 04:34:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8bc5a1d583sm6634124a12.25.2026.06.22.04.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 04:34:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] target/riscv: Check PMP before updating PTE
Date: Mon, 22 Jun 2026 19:34:01 +0800
Message-ID: <20260622113402.563196-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=inochiama@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

According to the RISC-V spec, the PTE update is a supervisor write
operations, and it should also follow the CPU PMP configuration like
the PTE read.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Changed from v1:
1. Separate code statements and declarations.
---
 target/riscv/cpu_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59edcdd370..2db07f5dfb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1655,10 +1655,18 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,

     /* Page table updates need to be atomic with MTTCG enabled */
     if (updated_pte != pte && !is_debug) {
+        int pmp_prot, pmp_ret;
+
         if (!adue) {
             return TRANSLATE_FAIL;
         }

+        pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
+                                           sxlen_bytes, MMU_DATA_STORE, PRV_S);
+        if (pmp_ret != TRANSLATE_SUCCESS) {
+            return TRANSLATE_PMP_FAIL;
+        }
+
         /*
          * - if accessed or dirty bits need updating, and the PTE is
          *   in RAM, then we do so atomically with a compare and swap.
--
2.54.0


