Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A91C021AD
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 16:39:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tkQcj-0006po-Aa; Tue, 18 Feb 2025 11:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tkQch-0006pY-LW
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2025 11:39:03 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tkQcf-0002Ki-Re
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2025 11:39:03 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so8234002a91.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Feb 2025 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739896740; x=1740501540; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fl0Tqxaz2PzXbJb4Af+tTD/1mJfnRKKhXco3/bT6eew=;
 b=XZjgaGbSxwHa3BQ4+RurtXz7UeGxaVYKiICFK4tKleBo7EJjd9Tz6QSb5Hk68xeIMC
 P6bydfHOBivy/mT2GPryuwbGZTz6Y4B6pk6ZNyKBX9AF84cUsfEcOdF/Ex+lUyQ+9eP+
 z1ZHG24DZ2pIUQipjnYOltXwxS7hbOCjOY+kZrfIsIIY3LIAB6TfzaEfygV0aaoy5TKZ
 3vTGtfAd1yQg0FtbSzPgLsYDjcE24csEy3jRlFMKQrX8dYrVOiMrg8LBL1BcRCh2fdZS
 XsbgyoQAkoNi7IwvGZ9heCCXQ+yas7n0vdRQ0SijYa4gSvmwG5A42wL1f7zY8RV9UGL4
 t8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739896740; x=1740501540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fl0Tqxaz2PzXbJb4Af+tTD/1mJfnRKKhXco3/bT6eew=;
 b=wHlzuIH1ZsjOVmS625HNUVaq0xalKfcufUhUqzIuSNfekilY3LGbwAsEQpQpRnEaAg
 MWEndD3+EtHJHxCwP3j/j40gkP+sbXXoF6HWBQj+/AHfTZ+PzYHzhHGnan9VRQNXEFlc
 uWunT2CxBhmVY5oG1OINqgedw/ZZJEhA9nm5vaWICvVMYL73AiiloQlaUg9RLitK7Wrz
 b6a3JjMPBEX/e105RvQqaaw1HXt1eQz+ThcxJ4CvKWImkFGZkQ6QdXN8uOuzEQtr6+vl
 Xvb7CR1i9OqpRD7KPPWZuzSk1V/xumLwUzje76Z7x7LftR4VKhqavUDVT53RpJTN5mbz
 gN7w==
X-Gm-Message-State: AOJu0YzsKOpMMbY/kCLPFGZXvs/Vurnqh0vMGeaeOW+TxPrnL8uER3SF
 CZLtpoakqbPxDiBKtZ8n6FQ6kmTu8s6OTOtHChStbBruYcElNJocFClQqhaw+ig=
X-Gm-Gg: ASbGncu5f++1cChz/I0oUV9oRedAmIfyo04ZbKfHbTEfPXZo170s1AK3T6EsMO/49My
 YoJZAE13t9DXBjrfTJFxxiGuu/So4xnFdDEA6T1kKjsF6t8OeTHKddhukOJi4R7CBTvO0LRKOZe
 RPSJADkt9FBqJttVSfjgCgLTrTiCMWF9/Lsp/Xm6tml7zmnRfBEh8G0p/P0T5oRiO9o/9XN8tam
 ICdCveTYabedMFXcf2c3+I40Q1qOjoXJTbUyfu95lEfR3KISPW9NK1c5THYcMJ7PlZusmrODH3X
 cQDB1y8JRMLbI/CkekbcCbpULla3yEAXKXhm1t8rfqehNbNAb5Yu
X-Google-Smtp-Source: AGHT+IHh3YcraYbvA5G21lrqSIFtbb1CCWYTmRYBZgcHd+isrt09zo8zmW4gZfKOccAPag8L7jfTDw==
X-Received: by 2002:a05:6a00:3a07:b0:732:5b10:572b with SMTP id
 d2e1a72fcca58-732617bd3c5mr21617989b3a.10.1739896739947; 
 Tue, 18 Feb 2025 08:38:59 -0800 (PST)
Received: from grind.. (201-68-240-180.dsl.telesp.net.br. [201.68.240.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73278d09228sm4595533b3a.117.2025.02.18.08.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:38:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/3] target/riscv/kvm: update to Linux 6.14-rc3
Date: Tue, 18 Feb 2025 13:38:51 -0300
Message-ID: <20250218163854.425607-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

Hi,

I'm sending our usual KVM capabilities update, following an update on
linux-headers.

This time I had to include an extra patch (patch 2) because KVM is
exporting ziccrse to be enabled/disabled by users, while our current
implementation treats the ext as always enabled in TCG.

Daniel Henrique Barboza (3):
  linux-headers: Update to Linux v6.14-rc3
  target/riscv/cpu.c: create flag for ziccrse
  target/riscv/kvm: add extensions after 6.14-rc3 update

 include/standard-headers/linux/ethtool.h      |  4 +
 include/standard-headers/linux/fuse.h         | 76 ++++++++++++++++++-
 .../linux/input-event-codes.h                 |  1 +
 include/standard-headers/linux/pci_regs.h     | 16 ++--
 include/standard-headers/linux/virtio_pci.h   | 14 ++++
 linux-headers/asm-arm64/kvm.h                 |  3 -
 linux-headers/asm-loongarch/kvm_para.h        |  1 +
 linux-headers/asm-riscv/kvm.h                 |  7 +-
 linux-headers/asm-x86/kvm.h                   |  1 +
 linux-headers/linux/iommufd.h                 | 35 ++++++---
 linux-headers/linux/kvm.h                     |  8 +-
 linux-headers/linux/stddef.h                  | 13 +++-
 linux-headers/linux/vduse.h                   |  2 +-
 target/riscv/cpu.c                            |  5 ++
 target/riscv/cpu_cfg.h                        |  3 +
 target/riscv/kvm/kvm-cpu.c                    |  3 +
 16 files changed, 157 insertions(+), 35 deletions(-)

-- 
2.48.1


