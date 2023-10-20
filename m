Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D9BCDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtkC5-0002cG-2h; Fri, 20 Oct 2023 03:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtkC2-0002bi-P8
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 03:45:14 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtkC1-0002oq-2O
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 03:45:14 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-581e5a9413bso305658eaf.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697787908; x=1698392708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LvEO44krOC11m1g0j0FkwdjEkwOo9erBx/Axdtbc58Y=;
 b=HIiS/UdAD2NTxN/hbl+/VAtOFDipSOR2yfCU0Xw/QanMCsqY/ZIY9PU2TCt+CA4oD4
 mt937w+fWoufkXFXycoIt7/+dj2ycurUbUBobQWNSYUD3Gl/30GynASfdOAAtrpBlgMe
 1zgdc/fQRimtHqWPrjAkFOiG4fXHtRXXVHtTeGqR9VeXJjbaXevM9wRHPHySXwJmNqCU
 zWGpVISvlno+YBJg9AvbLNLfnDp+z5zZlp66hTJyZhTcGaH2yIcspJ5m1r9WZ4jhy4rQ
 frkSxRsBxhXJZJejphjCvO4+qppmauAqY3zFw6Nl/D4907JWzGfdxIRkJnDnWr2lsxyB
 VwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697787908; x=1698392708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LvEO44krOC11m1g0j0FkwdjEkwOo9erBx/Axdtbc58Y=;
 b=hOSFBcko93G/PhaLwAtPHN1iPrtdsLEfer30v0FgUFl1dIQKLQo7BUjIxBtQJVw8+5
 7yHAn/6Kr/f+kyoZC09xU0TUzCr5CnXnqaUUhsGWPtvSb7uwZpyfucc7QKZNKRwKCTH+
 b/ZhwkSIEmrnVb69wldmeBVG0yq3GVmGLchhgJhcB09cPVqO3ccO5XGnvzIl6w+fijLV
 lc19egWE2XZLGpVyqJ2IYCtcP5rAaIcDcl19W8tNZkX2BT8wgfruYoyBDCWXbw7SpKXW
 iG3Ppr6EitGaT2VMMzma0Y9XdQp4gpNequIb6xxACTMDDQyAwa5J/pvD0pnxcEljaIQ/
 qeew==
X-Gm-Message-State: AOJu0YxlucJbrVgy0NSzW59ZpQy7RtCwjw0WtGfM+cGASm2tBp9X7TJ9
 noguKat2gavX2so3h4nMPb/4Qw==
X-Google-Smtp-Source: AGHT+IGe74ejE/7KdbcTTPc7Eac6KVsSqy5gApdtEpFRWhtYeDof/CrPRek/Kc8sote9fquKSd38JA==
X-Received: by 2002:a05:6358:729:b0:166:d4ec:f616 with SMTP id
 e41-20020a056358072900b00166d4ecf616mr945986rwj.4.1697787908084; 
 Fri, 20 Oct 2023 00:45:08 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 a6-20020aa79706000000b006b22218cb92sm919756pfg.43.2023.10.20.00.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 00:45:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] linux-user/riscv: change default cpu to 'max'
Date: Fri, 20 Oct 2023 04:45:01 -0300
Message-ID: <20231020074501.283063-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
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

Commit f57d5f8004 deprecated the 'any' CPU type but failed to change the
default CPU for linux-user. The result is that all linux-users
invocations that doesn't specify a different CPU started to show a
deprecation warning:

$ ./build/qemu-riscv64  ./foo-novect.out
qemu-riscv64: warning: The 'any' CPU is deprecated and will be removed in the future.

Change the default CPU for RISC-V linux-user from 'any' to 'max'.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 linux-user/riscv/target_elf.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.h
index 9dd65652ee..dedd5956f3 100644
--- a/linux-user/riscv/target_elf.h
+++ b/linux-user/riscv/target_elf.h
@@ -9,7 +9,6 @@
 #define RISCV_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    /* TYPE_RISCV_CPU_ANY */
-    return "any";
+    return "max";
 }
 #endif
-- 
2.41.0


