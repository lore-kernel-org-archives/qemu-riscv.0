Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB951C25B75
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 05:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0Xu-0008QU-3d; Mon, 03 Jun 2024 01:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0Xr-0008Ot-Jp
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:47:47 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0Xn-00059k-K6
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:47:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so28674935ad.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 22:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717393662; x=1717998462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TfMhfV8dvPnkBl/1AVtWU1jfvBLDGGE+d3x8Cnm3ugc=;
 b=L9sSUxCk6IupdHmIAKy8m5GzMjCfqxSsyohF+8wSmYk08ROP5Suw67SEdMgXgwrpGW
 HCBCHKd1ssHCboy0b0xLgleZGWhT/7YAv0gksv/mw7OFpJUjYO4e7JKUe/g7q3agwOWz
 BgsugpgIfLj6Jr+6GzxG9pdSZHKKMywf+dO7zl9jZLy8IoCsMOxtbWnYWxGtiL4cIzRz
 3jx5J7286hwvZ/cow1sGS2dEarIv5MfQCg3oKZ+uyIxhLhPF2q+qZM7ygtm8eFiZhzdf
 aBOYbNs8Z+EKyJyxD6D69Q/mtqsgPIx7cJAoXV8yX3Na4O6e4Negej0TlPRii9AIiWlH
 KMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717393662; x=1717998462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TfMhfV8dvPnkBl/1AVtWU1jfvBLDGGE+d3x8Cnm3ugc=;
 b=UyPbtbZi8vKGk3AHjUqr7SPzKMpbKsGJ2WorY4s7SEFC3+mWOUCBJZIfzSm8edFmpL
 B3XY4SCOLeU8raSVg38fOdxLowWdado67TqEAIGlJ7Rn+80tEnE1qQo2CYVzkoN10hr6
 tttr2tinV+yHwzdX/5KWFstr9ri3fbt0HDGhCDbopfW8Qcj1ml/GbePqS9eLT/JdJKfw
 Ah0o/l90vfLySYMpSzAJEjGlTarkBdlQy+ysbCXMua9f297BR0B2z3CrQ4DoEGw/xiyP
 E+u9ngmZ6I7hojoPQxjJnT+d7Qyvt/SGkB+Opop0OOnoi0D0YybeGsmFBDBB6bq+lhoX
 nNmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjgOj6YVm2Hs42Ds90Et27rehfzrgDgIeW2ijx74g4IAgxIo/LEmY5GSfIIALRdOKOPhQwFspGf0BdSEtvqotSpDjFDK0=
X-Gm-Message-State: AOJu0YyxvmZYfs8xEhPGviksvk9p4nZQkbi53ptBWfKI2MS9g+IUsNle
 6h3GccTK/9AEKFPRTrlC0NMOQ23gsHCWjeGIMlX15ls/yDvOJrkDEIfWb+KXB28=
X-Google-Smtp-Source: AGHT+IG8fwgrD6qGJdoObgw/d9nq3DJ7GQZeaTOt0e8MEHsP0l4TNZq+10y0RgwjmpYqwTM7KgcfIA==
X-Received: by 2002:a17:902:e5d1:b0:1f3:620:c92 with SMTP id
 d9443c01a7336-1f6359934d1mr130619955ad.7.1717393661589; 
 Sun, 02 Jun 2024 22:47:41 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63241e085sm55824135ad.299.2024.06.02.22.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 22:47:41 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 0/4] hw/dma: Add error handling for loading descriptions
 failing
Date: Mon,  3 Jun 2024 13:52:44 +0800
Message-Id: <20240603055248.3928469-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The original code assumes that memory transmission is always successful,
but in some cases, it gets bus-error.

Add error handling for DMA reading description failures. Do some
reasonable settings, and return the corrected transmission size.
Finally, return the error status.

base-commit: 1806da76cb81088ea026ca3441551782b850e393

Fea.Wang (4):
  hw/dma: Enhance error handling in loading description
  hw/dma: Break the loop when loading descriptions fails
  hw/dma: Add a trace log for a description loading failure
  hw/net: Fix the transmission return size

 hw/dma/trace-events     |  3 +++
 hw/dma/xilinx_axidma.c  | 27 +++++++++++++++++++++++----
 hw/net/xilinx_axienet.c |  2 +-
 3 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.34.1


