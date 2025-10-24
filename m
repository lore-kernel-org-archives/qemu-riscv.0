Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FACCCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNXr-00029s-Ng; Fri, 24 Oct 2025 15:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNXp-000293-W1
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:33:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNXm-0001WQ-U8
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:33:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso2322162f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334425; x=1761939225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oW3kM/3oARNy2RW6YInbEGkmlrAbvhqLZNt15hfyFU=;
 b=kCn4fne0SYfExI4hVKpKprFTB2AsLI15tdyssFGkxCYzlt3Sc90RVMNpeP4mBGHK6P
 h+QX4NkDT0Vy81Za78vyD765Wg4LrnNzSptg5ffDwgvhg4GV1Jz/0TP7MGBF3duib3aA
 j4oA+tCfPw65n/fLAJDWjFJwfJtXcYjT9vJy22osxhxcCTublhPz8BRiZLfrJyJUtplC
 f6i20HpxoClHqKm56XnldJYqs1JNM0QrKnyc3eUm/r0IC9RViBe5Ufw0Sw5W9S26VBVQ
 bX40rjx3ZmstE2hPs/8/pzJABu6Y7jULjJWOWxJDh2ecm1POWUNIxxyCqfcrEkyDfsgc
 ZUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334425; x=1761939225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oW3kM/3oARNy2RW6YInbEGkmlrAbvhqLZNt15hfyFU=;
 b=oWrtRwANYaTz15tYpr08T2pDuCjRXiv3vyPvUeSlTxLKUa/2wq4TdgShCU87m6qzDn
 J89cH50qPTDMpPDnKdAlop0p4K2HLLVJ/wsHuFGYKLYs61ESWiQja0yFR7/HzSPde4aH
 M//vb8NHSG6M7woeR9hYYf9IMqXAtXJpHhwn2CzDTrC7i03bt5q4PFDmzMVVwuSqaAyV
 +kP7tyU3NhgCq8pnrrEqz/1R3WNR2UZbbw4VButNQnD/6dIfbDfgd/WK4KQ8rWjXOeg2
 qesNaVUzCdCmjuAv756Th4xnEi5jPRLiq3h7Jwh1GAp213nRKzRAS/PvF5FLS5wWyhkt
 KqVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViEG2yttJdldPsveEwp9RALVdwPX/ZdP459OYyBEesUZT0ccb+/QzbS5w7Mv3VbFBpcoixAxVAbt0q@nongnu.org
X-Gm-Message-State: AOJu0YxOjZAhDU4rf0Y8j98u8Ma5awCUjP0IVQQ6fu4wGLAkrHBLR33x
 KPdZ2mvs9C0MPVvRjzMjmYx9WECE4n1Yj5w45T63vPvvfcPkhf4kwK1x3l6Lb49eRvg=
X-Gm-Gg: ASbGncvsYrG+ytQTpH8TFR3RIx8fzyyI//WipB9gOWNsEvz67WYcD6MutEuVHm6sreX
 9bUk60K6NA4MVcb0PlrxsSKxjqUAZojijd0cb6QICtamTaMbWUlg28m45qMWPKF81BuqLndC2d4
 2qIkImY+S7+MR/HAGhk9Cj3zg3FbF+SuzB/eJPsoanuQOsKRILhmyxsbsLxKO7ezz1JL8PPK16X
 I8chK3A+dD36cs5eaLV+gL1RSP9FI2LUGT9HuIMUiIEPhvgM2KLuV9Bz46Wqnek89vuzhKc5Xi3
 mzT4r9rhh67IjowhpKKQOfWN6rRcZEeNQzNx46CWZWxfE5uDxu1svO9NLJjh07FH333mPbqUX1X
 KvINiib319XJhAZAalVknEP/k3NQySlmGs0UDbWp8KrVpVaJf35SP4hVu6cDRHjLTRZs4MjGkEW
 NtnCTEA6VyX21pJ3giDmIkGYSfNMFMv4L6I8qDxxi9kRALI2eDKiU+QwchsDpn
X-Google-Smtp-Source: AGHT+IH3sVraY9UzOiUmgqIAZfHGC9NuCzcLxWSPWLL0hHm0cCzMFDWXm0YYL7vX9i3JJbK5n3x1Ng==
X-Received: by 2002:a5d:5d10:0:b0:425:86da:325f with SMTP id
 ffacd0b85a97d-4298f58257fmr3644090f8f.27.1761334424881; 
 Fri, 24 Oct 2025 12:33:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d9e80sm7223f8f.28.2025.10.24.12.33.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:33:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 19/27] hw/tricore: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:06 +0200
Message-ID: <20251024190416.8803-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  include/hw/tricore/tricore_testdevice.h:30:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     30 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/tricore/tc27x_soc.h          | 1 +
 include/hw/tricore/tricore_testdevice.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/tricore/tc27x_soc.h b/include/hw/tricore/tc27x_soc.h
index dd3a7485c85..40962eab04d 100644
--- a/include/hw/tricore/tc27x_soc.h
+++ b/include/hw/tricore/tc27x_soc.h
@@ -24,6 +24,7 @@
 #include "hw/sysbus.h"
 #include "target/tricore/cpu.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define TYPE_TC27X_SOC ("tc27x-soc")
 OBJECT_DECLARE_TYPE(TC27XSoCState, TC27XSoCClass, TC27X_SOC)
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 2c57b62f222..98ef6e7a3d0 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -19,6 +19,7 @@
 #define HW_TRICORE_TESTDEVICE_H
 
 #include "hw/sysbus.h"
+#include "system/memory.h"
 
 #define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
 #define TRICORE_TESTDEVICE(obj) \
-- 
2.51.0


