Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A6C87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:26:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0nK-0007Fp-QI; Mon, 04 Aug 2025 15:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06Y-0001EZ-Am
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:17 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06S-0001BP-Sv
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:14 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76bfabdbef5so1409053b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332807; x=1754937607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tr18OZZ52dyGR1rp5GdhWCgXctWVe7+fEbjUyyRt8KQ=;
 b=biy3ZF4rQ/36P6RS+EAl3H9zyBWfxHyr/GE5VnV3EyHhCEqe8zYDoRwaqQmGgrRlLA
 vkhnZhdx22nDR9uWP0VpaE5J4o8wX7jrH5h39RopweQUud8EDC1ilwHwnLw1Cokjhjjt
 /MPCzoXYMrncnBtPgDAvIqF7hSJTdt6GUCyrOfyz+cceLtNtXadURcsyq3EhDQqlxv33
 qd356ddJR85bAu8BaLqyLF3+kfKo3r6EpMFtYvNuXsO1GDaytJMBQmSL+si6d82mb7fq
 r7oCwIK7gN8l9FDWs6hZ+93dXbF0APQ0XoaremdVk8ASN2t8tdyf4nuIoF8PA+mAn42w
 5ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332807; x=1754937607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tr18OZZ52dyGR1rp5GdhWCgXctWVe7+fEbjUyyRt8KQ=;
 b=F6A1HXFLSwdBd48ZGze8SOKV7vWxkLcdTVnO6dZ3DUUfzd8wuwXDPVMHi2Rrffw4z5
 HYGkwJTAYpHTkNnIFky+UUFn5p3Ii7S0VsQMV4hNMnXNK+C6mR9EhpMnL0bVbtCtmPJz
 0xurE2l+DX541lV7q+qiFbVls07eSx+f8z+fQ6zkyb5/7G9sWGQRWGLdbaI5KFlVKfEf
 XyeXbY9ojXujvC7xcbatXLUe7rlFTZvbqUawotbF/Gk5l/0B4qJ3X3fvABobJ2UT2DUw
 YXq0dnukO0HbScyBoXqYw8vl682zHihj5YE59ey2q3lqqwafbqTDOx7+3wBaQ2748cKh
 mX+Q==
X-Gm-Message-State: AOJu0YxLlf7yNdIsF/zJXsn0KRSu5TzfgUDkHSIFTQRO+AgmUNcfRYV3
 aaCstAZQSae07rsnWsl3cWe05vnaiMzWyYEgPihm7WvEfIeCvi4Dv+an4FbxG1vO1n7s3ClDAQb
 fmnRe
X-Gm-Gg: ASbGncuwY0GKRVtVYrjBspIo7FqY8JB8nfZip2sOHzjKLgIAtnUhDj9l8xwN2A05wXP
 YspfUrR9fViFtBeVGcCgQSgoRBYD5/exzyinoQHwVcbAr9hnXTiGjHHJWx6Dk07dchopa9VXShm
 OAja55UHBX9ktZ1t4+9qLWGe9ZngFYLiVY1skYs9x9MgbLyEhB9NH09QSy9Qw4G5P0ux8SWPrFy
 S1fgLCQjiIvreGi7oSCpqU7SOamH6tDba4l+Rnd8CtRu8mDdl1peFd/QF07ze3RC38bBoqosID9
 4MDz+twjBYozQJScmWn6uh/EdaKGqtz9TlUEkwjSSYiY3uQcnIiFbYWrpDuEQ7xWQ7cKyOkVEis
 4y4Hf8V9IHicLqNlVML5WSw==
X-Google-Smtp-Source: AGHT+IG+4auJINEWuw5Xp9QJD1n1E3XGcsgPw/I6tC7S02jAt1aOzDdFIEiqKxwRiFNulspvUlxGAQ==
X-Received: by 2002:a05:6a20:9389:b0:240:1a3a:d7ec with SMTP id
 adf61e73a8af0-2401a3ada6emr2876682637.4.1754332807334; 
 Mon, 04 Aug 2025 11:40:07 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:40:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 11/12] semihosting/arm-compat-semi: remove dependency on
 cpu.h
Date: Mon,  4 Aug 2025 11:39:49 -0700
Message-ID: <20250804183950.3147154-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 55d7bf29ad6..a14de23d45a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


