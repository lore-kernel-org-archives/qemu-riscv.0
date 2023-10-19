Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA71DC46CA1
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 13:50:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtTO5-0002Sp-Br; Thu, 19 Oct 2023 09:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtTNw-0002MS-7e
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 09:48:26 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtTNu-00036j-BO
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 09:48:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b36e1fcea0so4924681b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Oct 2023 06:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697723299; x=1698328099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yOyWTz8Kx3JTuLtJa3OcB8g3zKWOaO0uiOsmwttm3zM=;
 b=olMe7vXeeOG5evdbbsxjPllVMsKtbXe1zYO8G51amDyJ4mTh3nmAmV5O3nZ5UGNGAy
 ADhuYl0tfz1MnSILcEk0Gu1l/v/+kw6Qx0J80LdF2StajoEyND+FiHTMqmo0DT2gz08O
 W/XnC+gVUeNo9usE6t7/8wRjhZjr3cUg73eBfVVrUNfRe/xi7/SUe4SnZfKkHk1KbjK8
 9CJUF12u7tO98qNAEAcMuXfkJ8SGCvb57ALsm0GrWgI9QDKjnc7QbStPpgEZSb2xuMlG
 AhyJeGpbZ+24cp/JgLIOOMxAq47R/SIpvg30mCvG3byyQfoQ+n0K83qTp+k1ypJvavaR
 1ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697723299; x=1698328099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yOyWTz8Kx3JTuLtJa3OcB8g3zKWOaO0uiOsmwttm3zM=;
 b=rATKQgthHOvIp8KjPIY6j2v2uLHsQw2vEyLDP9Zh++bmgvTfem6iD/W58WdnIGtxFQ
 GXScfiXRy+lWm1kwoc3Px/BQ1TIBWmvPe9mNEDm7Wa9k389WhGtaU5cr7VcdCASh0C89
 bpBqZTYfoW8AlOENDgkKjTvONz9jcLsr8hKiLFsOH0uD3of/OKOScTYQRgKYQ/ypC80W
 adGW3VzdmdSRqiXKF/qxhSE5AaJOIvxBWNEFA2awyJMqQlJRtvGewA8EYiGL66ACP3Q0
 7vkQY1WGPP63QijQFhlDqaudciEebw/V9Nmom5ctbnjhWrwr6IGoXzrMJCW97c+AegfQ
 7ogA==
X-Gm-Message-State: AOJu0YwnCDh3eO4ly9E+rIrnzbwsyJdHy+E9Ztxlxtumg/pGdPUlU1J+
 xiiAe4Fg84rgpau00LrHaKjLFGfTdA6hLM5PvQg=
X-Google-Smtp-Source: AGHT+IGDqq9NLn+W+Ww4IffXpkHEDj1za97C5SqgqZYElEUdZjIATgXuJbCMZnDZhqaM+rpZG53F7w==
X-Received: by 2002:a05:6a21:7891:b0:17b:6ef4:68a3 with SMTP id
 bf17-20020a056a21789100b0017b6ef468a3mr2243562pzc.57.1697723299632; 
 Thu, 19 Oct 2023 06:48:19 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001bbd1562e75sm1968126plw.55.2023.10.19.06.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:48:19 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] docs/system/riscv: remove core limit from virt machine
Date: Thu, 19 Oct 2023 10:48:12 -0300
Message-ID: <20231019134812.241044-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x431.google.com
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

The 'virt' RISC-V machine does not have a 8 core limit. The current
limit is set in include/hw/riscv/virt.h, VIRT_CPUS_MAX, set to 512 at
this moment.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1945
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/system/riscv/virt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index f9a2eac544..f5fa7b8b29 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -12,7 +12,7 @@ Supported devices
 
 The ``virt`` machine supports the following devices:
 
-* Up to 8 generic RV32GC/RV64GC cores, with optional extensions
+* Up to 512 generic RV32GC/RV64GC cores, with optional extensions
 * Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
 * CFI parallel NOR flash memory
-- 
2.41.0


