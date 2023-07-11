Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC900EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCHx-0002OS-LB; Tue, 11 Jul 2023 08:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHg-0001wD-O6
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:16:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHe-0005T9-3l
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:16:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3141fa31c2bso5668699f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077756; x=1691669756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOf4sRqj1JacIZBtO+EghO5to1yWWTvpgRCfGeoL2hA=;
 b=eu71kST12V5GyzkShjJ+tQH7ZUMgeQef7EFjzQLKLs6Ux0yVPSLZJz8HPUlEMRVXum
 j6m+pQwMKoQjZPu4ZRF2zC5JXNCrWlx0XqFLv98OE+597kFK8Dg+5k1lb1GOjvg/K1Y2
 6Pm5hnFtymvkpSTLVmAPI0NzwU8ANnx2HxR+T1w2b2hN+YRgtUFaHcfvvHyinQ1qYmI7
 mUqMvNzVTvHlz/wl/Q3CK10ausCI23YiSxveU3Cxd+x7vyMu5UXg++mL2Bmw57cMPqG7
 fLPeZqcX0/hUuXa9GdQ7F2Ea2Uj4QyEYuWLjePkGzyXBINhk/4qWHKgyG0pEbsa2VEUq
 +6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077756; x=1691669756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOf4sRqj1JacIZBtO+EghO5to1yWWTvpgRCfGeoL2hA=;
 b=Vz5n1cvi42WT3A4ePBtEYtX/1v+zMDTB6L6JJVW1Dq0xTQfEUsJnjvz7YXtDZYIJFZ
 3TguySqmFgXQM3AgbX/ccAyw+1ZYVWEZlB/mhCCNctffclAupcDsKY1Z8kdSYCyiek/W
 ++uVRtwtUSbUJSpWwLL93AD7CmAmp18WU6Cm3iXVtQiZOjRhmYAjHTNkPNH1H0P9YxeB
 8YGsVSX5+N7dpaY+VbcxovxBZec2iiBzj5VeeCk2IP1j70FikWjU5S+VAbqI6sQdu1wu
 DDSrLjMge6otBp8p76wqtL8xi/jLg8F3LQ3RqV5JuFSmNKvqzMk2XIF5WaXtloOZn3Iz
 Exrw==
X-Gm-Message-State: ABy/qLYkxN4uF0879s5LfXIg3ErrmQYfUUdsqkIHBeppVx4OyI1P+lq7
 k8mosIIXjKmZARc6AvjP5pAjog==
X-Google-Smtp-Source: APBJJlHcgTtBgybhmzeCJ5XgL58Nomz8IqlXhWtVjvBdwYd1ts4WRcqq1hYnW7Oo/5uyR5otjfFSiA==
X-Received: by 2002:adf:cf0f:0:b0:314:1f6:2c24 with SMTP id
 o15-20020adfcf0f000000b0031401f62c24mr16107527wrj.36.1689077755873; 
 Tue, 11 Jul 2023 05:15:55 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 z13-20020adfe54d000000b003143ac73fd0sm2169096wrm.1.2023.07.11.05.15.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:15:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 11/16] target/riscv: Move sysemu-specific debug files to
 target/riscv/sysemu/
Date: Tue, 11 Jul 2023 14:14:48 +0200
Message-Id: <20230711121453.59138-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h                | 2 +-
 target/riscv/{ => sysemu}/debug.h | 0
 target/riscv/cpu_helper.c         | 2 +-
 target/riscv/{ => sysemu}/debug.c | 0
 target/riscv/meson.build          | 4 ----
 target/riscv/sysemu/meson.build   | 1 +
 6 files changed, 3 insertions(+), 6 deletions(-)
 rename target/riscv/{ => sysemu}/debug.h (100%)
 rename target/riscv/{ => sysemu}/debug.c (100%)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0602b948d4..8d8e30d6c1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -94,7 +94,7 @@ typedef enum {
 
 #if !defined(CONFIG_USER_ONLY)
 #include "sysemu/pmp.h"
-#include "debug.h"
+#include "sysemu/debug.h"
 #endif
 
 #define RV_VLEN_MAX 1024
diff --git a/target/riscv/debug.h b/target/riscv/sysemu/debug.h
similarity index 100%
rename from target/riscv/debug.h
rename to target/riscv/sysemu/debug.h
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6f8778c6d3..6c773000a5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -32,7 +32,7 @@
 #include "sysemu/cpu-timers.h"
 #endif
 #include "cpu_bits.h"
-#include "debug.h"
+#include "sysemu/debug.h"
 #include "tcg/oversized-guest.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
diff --git a/target/riscv/debug.c b/target/riscv/sysemu/debug.c
similarity index 100%
rename from target/riscv/debug.c
rename to target/riscv/sysemu/debug.c
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 8ef47f43f9..49cdcde679 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -8,10 +8,6 @@ riscv_ss.add(files(
   'gdbstub.c',
 ))
 
-riscv_system_ss.add(files(
-  'debug.c',
-))
-
 subdir('tcg')
 subdir('sysemu')
 
diff --git a/target/riscv/sysemu/meson.build b/target/riscv/sysemu/meson.build
index 64de0256a5..e902ba2dad 100644
--- a/target/riscv/sysemu/meson.build
+++ b/target/riscv/sysemu/meson.build
@@ -1,5 +1,6 @@
 riscv_system_ss.add(files(
   'arch_dump.c',
+  'debug.c',
   'machine.c',
   'monitor.c',
   'pmp.c',
-- 
2.38.1


