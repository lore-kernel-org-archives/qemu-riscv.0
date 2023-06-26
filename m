Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BFDEB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:21:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvWN-0005Yb-PF; Mon, 26 Jun 2023 19:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWM-0005VH-Px
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWL-0000HS-2S
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:22 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-991c786369cso188726666b.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821680; x=1690413680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umqULTLx7y1vximp4pWvumHBDvz4vkd4kJDrOMbD9Wk=;
 b=yEcu+IfU0alH0+8hkzstPE+C+cuVpwD7s3T/uXezMF7Rf6PR2T/hYdL2e0o1VfLnCF
 3UJuafXWXccI0g6ZauwVfF5b0JrUtkUOZjqEtpwz+NHbm+OnIYZmv069IPgz6M8D5DGO
 kP3a4OD7189IBFZHFYtBvO004id4+7HTgaaNmJAloe/z42hi+P1WgY251zsmVgVqOwYT
 2h+Kj3s+0ZWBJkjfO3vW4YxXaF/gYwSd4ccvwAq5uAXdsSrdfuggoZjbjw2HNXxrS0h5
 LcypWegrCS6y3qLf9r9IcgG8fexqB2cqSgHk43RaqlLJej6A7lvbl13m1p+9lAVxqSaD
 lqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821680; x=1690413680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umqULTLx7y1vximp4pWvumHBDvz4vkd4kJDrOMbD9Wk=;
 b=Y01mP6I0/+pal9GJ87NUhhbRq3eeeQFxCtqltZLCUA7PlVskPwl4kj5RO0xPKrHdyi
 H4/RJmrXlKIt29joYUv/ynxfG9kuQZX8kHUjbjpbVujFVw1vMYHgLaluI9CBzKP4tttG
 VACYStrVkrto3HgxjaeWboY70rMJ/zCsPzvBiiOBf9CKjsn0tCAp3mQHnJbc8rAlKyG/
 h6OSvPYmqAkapMOpCMcZJ1PbsuZQiot/L+btXYpvCqBt/Ud7LKP5kWN4Oows7VDghUAJ
 qWppgXhMmZ+qB2d9nO1rhvSwJypWG9aj35cNGcqjgn/SGquwmCnwNi9xu81sWJceVRrK
 X27Q==
X-Gm-Message-State: AC+VfDyyR3iKkiM31NB1ivGWUY56cqnfz99wRmg+optcl0fREcBnD+dq
 FbLQqhS4sNvpx7LKkcIktRPf7g==
X-Google-Smtp-Source: ACHHUZ6bwSx30VCAYO4LjunmM912mg5E/tapZ9zXCKAGD0Vyklv9x+o0cOVj6I5yzDH6sTodzk9JxQ==
X-Received: by 2002:a17:907:160d:b0:989:4776:11a1 with SMTP id
 hb13-20020a170907160d00b00989477611a1mr16111532ejc.47.1687821679888; 
 Mon, 26 Jun 2023 16:21:19 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a17090637ca00b00992025654c2sm393546ejc.150.2023.06.26.16.21.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:21:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Subject: [PATCH 11/16] target/riscv: Move sysemu-specific debug files to
 target/riscv/sysemu/
Date: Tue, 27 Jun 2023 01:20:02 +0200
Message-Id: <20230626232007.8933-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
index 288df4c2b1..6908dc395c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,7 @@ typedef enum {
 
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
index a1501fea76..88760248c0 100644
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
index 5f8e1edcf2..33fec8f11e 100644
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


