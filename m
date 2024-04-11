Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC341CD1284
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 10:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ruruG-0002jO-8W; Thu, 11 Apr 2024 06:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruF-0002jC-28
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:43:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruD-000488-1J
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:43:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so4713488f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832223; x=1713437023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=StAg582IsYUfzw7jTeYwZAGK85x75PWnZXDo6iqC+rM=;
 b=jUJhgtshcfKZbJ3KL3IFB8D3BAMZNSnSbsLDimh9H2aDa+ZgUwCLa9IDHvxuRRsxoZ
 P+qpTuxPO8YhVszlq/M5kYG4oaZc4vRYNeEtoBFcF5exfwjMZKdNDmNAo9gpeU/8BO0H
 HIavHQvuzwgLg1rEFQ6+DEFioXnZ9b9gj/3g1IRGr8pmfT5rNUs0b6JRQ/XTJDnkF+31
 avEgkcdVZVpDYp/pA9NYPCUpbpkLzLsNimVAjQToUXNI2BYnQarHDEOfIn0jiovAhGsp
 Vl4NUXNbiZhqnH+zH5k4RCNobaRCj1qZwQ26OzjGEeyEZIHoHocMXgcIS9kds4xbHv0B
 Rolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832223; x=1713437023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StAg582IsYUfzw7jTeYwZAGK85x75PWnZXDo6iqC+rM=;
 b=JRynRPA+8OMcDErocsSkmFIrWup+vIKZx1zP5oqPXKSwmL4XFkmLoJonqUsgA/7D/j
 8AiorbL/GAxpiLpASEX8fq6Va7CakhMAkiAofr/JNL+ZqDAfgGhgYrpd73qe6kAhI/hS
 aayl4jNQvkMU8k7+Tg2c4L8Ts69tGKjQIQxEDgpyiu45pIDkP6ItRQk/+i42Pu00NwGB
 t15L+iJfGzoken69XabwSny99MamnxrCupoFmzwsCJ9WE5jiAI68B78qNvu1Azyyh0B+
 CEZa/vqVSf6/lbzbwlPYPrOHAxATj1zotPd4NwGA9I7j0OzWXMFgXtupYAsIql3B40fK
 ovHA==
X-Gm-Message-State: AOJu0YyuzOprt5tDMSMo2of7RIiDC/izWTD88v4ZBHeA9+iZUW2EGUp2
 tYhZDk+OjuyBqnIFkBZKh67T1EZLbfLmUaPiRmnXKM+2tixVahljvjCX8G4j77oLd4jFm1gEy22
 N9Ic=
X-Google-Smtp-Source: AGHT+IFi9/8iv6Qesk2ck+iKMFQl0VhFPHk3PrG4jLviJ88A8hvuZ0qNjj9KAPOtFpNX9gIPVohOig==
X-Received: by 2002:a5d:5885:0:b0:346:b8cf:b61d with SMTP id
 n5-20020a5d5885000000b00346b8cfb61dmr1142647wrf.43.1712832223279; 
 Thu, 11 Apr 2024 03:43:43 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a5d5046000000b00346df659e7dsm98738wrt.17.2024.04.11.03.43.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:43:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] misc: Replace sprintf() by snprintf() due to macOS
 deprecation
Date: Thu, 11 Apr 2024 12:43:31 +0200
Message-ID: <20240411104340.6617-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Continuation of:
https://lore.kernel.org/qemu-devel/20240411101550.99392-1-philmd@linaro.org/

*** BLURB HERE ***

Philippe Mathieu-Daudé (9):
  disas/m68k: Replace sprintf() by snprintf()
  disas/microblaze: Replace sprintf() by snprintf()
  disas/riscv: Replace sprintf() by snprintf()
  linux-user/flatload: Replace sprintf() by snprintf()
  hw/misc/imx: Replace sprintf() by snprintf()
  hw/net/rocker: Replace sprintf() by snprintf()
  hw/riscv/virt: Replace sprintf() by snprintf()
  target/arm: Replace sprintf() by snprintf()
  target/i386: Replace sprintf() by snprintf()

 disas/m68k.c           |  2 +-
 disas/microblaze.c     | 25 ++++++++++++++++---------
 disas/riscv.c          | 10 +++++-----
 hw/misc/imx25_ccm.c    |  2 +-
 hw/misc/imx31_ccm.c    |  2 +-
 hw/misc/imx6_ccm.c     |  4 ++--
 hw/misc/imx6_src.c     |  2 +-
 hw/misc/imx6ul_ccm.c   |  4 ++--
 hw/misc/imx7_src.c     |  2 +-
 hw/net/imx_fec.c       |  2 +-
 hw/net/rocker/rocker.c | 24 ++++++++++++------------
 hw/riscv/virt.c        |  5 +++--
 hw/ssi/imx_spi.c       |  2 +-
 linux-user/flatload.c  |  2 +-
 target/arm/cpu64.c     |  4 ++--
 target/i386/kvm/kvm.c  |  3 ++-
 16 files changed, 52 insertions(+), 43 deletions(-)

-- 
2.41.0


