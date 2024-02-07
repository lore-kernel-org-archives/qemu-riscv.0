Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C594C4828D
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 12:00:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rXgae-0000Dr-6w; Wed, 07 Feb 2024 06:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rXgad-0000Da-83
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 06:59:43 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rXgab-0008PD-OJ
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 06:59:43 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so668224a12.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Feb 2024 03:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1707307180; x=1707911980; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oHSK/y3sJR3GtAZLbH1e96ZNbJa/SUNy9xhqjabO6E8=;
 b=RFzcjKiLOkAxZHX4rQndtC8ARSrRggquZlQ9zsupWLBH/FeCQRY1WJ6akc/4Ynkw2w
 N6+M2biapn3o4lNN9C/4XkgT9e6ccaS8TD3HJKUMje9q5/EEioDgiBrCWJwHwxVux/WH
 kX67320yCqZG/IpkCUef9Ek7C/NjGTZH/zTIVJbYM/weyAE/rahGdohZqBDyHjy9PbZY
 mhH3B4WDfc9ezNLwUgRUG0D9qE6dVAfTMcWZWT7DbPNmnpFdiPjv7F0bvKzjAaGHHLwJ
 qU5LaNdjSLmIN0ZjfAyagNQuS67fE9uz7nCYIklsdAsTIXVZA7i6XYS07qSJPeM590Ns
 9Cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707307180; x=1707911980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHSK/y3sJR3GtAZLbH1e96ZNbJa/SUNy9xhqjabO6E8=;
 b=AKhjQwyO5iWu7WxpJOwxhB/bNL5lzE/U//20VgQ2QyDyl8VGITCkAaQhmk0SAQ6JNW
 hYMcLPHY7ltt83XCcqUNEe9K4R8WZ4LMKe9Jy3HQwLvYuBmDyTtZeNCGjHoCtC2PEssX
 pR60aYtecd88fZ8f0C9+Wr+sNJgEo29VVUC2aN1z18PWYiJrM7PpelTvcQN9UOnPy/NB
 LPBtpJWQM6R5DkVqDiFymW/rUHd/UNNE9c/uj028JT74Opb3ZXKs3/pQ23zV9OLxQ4rN
 FN9Ht4dtZInobipaYicj4DcnnPUBcxVy/+fHNBajrzoTK6r/j5Q8JcNvLvM/1wzNVd+B
 rpkg==
X-Gm-Message-State: AOJu0YzzQGUi+IYf4NMTbEBbRLLsPci2AH8aIbdlxS9d0wU/G+OsNJlr
 t1LYobUfOQMzUizqoHjTi6tNzZhGmlYwcUzgzqYXoH0x5Pa4ERStzLTPDIOzwLqxX/iycv8siAf
 PYaM=
X-Google-Smtp-Source: AGHT+IEYytWjmhzze2Isrscxm2cyHdidg4WaetHFUa6QWDc7yNRKMOj96QBY66x9LgeyFpoztV4GKA==
X-Received: by 2002:aa7:da98:0:b0:55f:f7bb:40fd with SMTP id
 q24-20020aa7da98000000b0055ff7bb40fdmr3884954eds.2.1707307179957; 
 Wed, 07 Feb 2024 03:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQCebfiB3VfkaYroZAbzHPu2oW3AwwVIm3ZNq2Xf1otDR2iDEQyDbVHJ+kdTRBT09kOKIy1DTzAJOfDnIzKhTGRpHctlxywhTUH/s7riz4fYKsEP/YlMqY1k9Ji9kcSxX0paQCPvU7YLundun4VpewHqcdPdZ2CqxQb9eYvCdBKrqmsU9A1hMCrsfs6Uv2dM6GgqPo5nOu2xHnM8G2/0P998TZrkGdUYIwW3lu6VI5UjXMGe/065sYAJoFaUlAd7BqHFlfvH+blC5yXZm327TeKl53p9/ZAXTxr4uuMZFKGyejEQe59DlJ69UOZn37gelnMkVS5ieeCvClEcWn/EgpSsQ5X/iIlkwIqQ==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020aa7d802000000b0055efaddeafdsm588455edq.86.2024.02.07.03.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 03:59:39 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] linux-user/riscv: Add Zicboz extensions to hwprobe
Date: Wed,  7 Feb 2024 12:59:25 +0100
Message-ID: <20240207115926.887816-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207115926.887816-1-christoph.muellner@vrull.eu>
References: <20240207115926.887816-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52e.google.com
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

Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
This patch introduces this for QEMU's user space emulator.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e384e14248..43467c9707 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
 #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
 #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
+#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
 
 #define RISCV_HWPROBE_KEY_CPUPERF_0     5
 #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
@@ -8857,6 +8858,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *env,
                      RISCV_HWPROBE_EXT_ZBB : 0;
             value |= cfg->ext_zbs ?
                      RISCV_HWPROBE_EXT_ZBS : 0;
+            value |= cfg->ext_zicboz ?
+                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
             __put_user(value, &pair->value);
             break;
         case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.43.0


