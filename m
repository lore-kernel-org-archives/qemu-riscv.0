Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FAC48BF6
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 13:48:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rh8fS-00035d-9l; Mon, 04 Mar 2024 08:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rh8fQ-0002yy-VV
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 08:47:44 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rh8fP-0001Vb-0g
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 08:47:44 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6e125818649so2356695a34.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709560061; x=1710164861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D9rTFwWrmBiGRVkSfatNGszolevvlbeDe2scBpfLQlo=;
 b=Q9TCEITbqSMVPZXZjdXZSqWV/Zi1oEseio7rulJ4t3HiVzFSCOnHL9lz9wmSj5bQeT
 +PAlPGEGxNKjshFCLdDjFwGZAiBUt15YyvWOTVAiu9S4tlODsmAtOD7uN+825WnUV1WG
 W+2LLsvFH5UgDvgvv9m686zqeoHjBfq7K51z6c7bI10W6eu77vGa+8EmqyrIHC5kVmAc
 /+Nx+dgShLDcDxWz6aqsOynAKbaqPcZg+j5sPK/Ytxrb/B6nAg+Yg59EBhRISNTzuGxZ
 sRDimNkRLCmmdoxJCx6TqOTc7SIEX9JXuaOXpPOwyEhsQaGom+lN0a9wHP+zyWzHDo2f
 9DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560061; x=1710164861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D9rTFwWrmBiGRVkSfatNGszolevvlbeDe2scBpfLQlo=;
 b=r23DtUUyNTQuP3lpfAeDrZQTmjNTC3CCrWdU3gjENsYJyRv+5d1ZENMY4x7Q8GbkA1
 Qc74F6XHbmsrXHlFy72iooXRmhZsqtvfLxeRyZHTwmnAsDDjFWFJ7WEo202jWTdhEsNi
 SAqrbznSwgnCO566T4Y8xlelyOGFtf5Ifg13rH2h/SzQJdyHx6swaL4iwWsf8AzPHkz6
 kwDOGWUUN6lrx7w818S9eivrT/YxuUyPeJbvYsXAUa8UOSFgxBzIDhZoEOIz55rRSIB3
 yPuPo9prZBHSLBifUDALukWe/4gMJWW4V4knQlYiyeUaecU0Ozt3ujznY+O08sIO1OfF
 s0Og==
X-Gm-Message-State: AOJu0Yy6T678Fj/hxR/cGWUV1EICdDCUnKdgobbj2c5Hh/TMcejBVnpw
 JQ3dxsROx/xa/TxhEB8bzuASvO8rvnuDI6LUGQYQeK9ZKuRdOs37gJyvWbSKQ7w=
X-Google-Smtp-Source: AGHT+IEDTgZfM6CdNi0wuBEz71jsVCxJkLMnZ+OcOIyoTTUVXe+Zk5KXkyXaiEj1hTLVCEzSzs/GHg==
X-Received: by 2002:a9d:7559:0:b0:6e2:ea96:c9d8 with SMTP id
 b25-20020a9d7559000000b006e2ea96c9d8mr9269442otl.32.1709560061345; 
 Mon, 04 Mar 2024 05:47:41 -0800 (PST)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 23-20020a630d57000000b005dc87f5dfcfsm7285335pgn.78.2024.03.04.05.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 05:47:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv/kvm: update KVM exts to Linux 6.8
Date: Mon,  4 Mar 2024 10:47:30 -0300
Message-ID: <20240304134732.386590-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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

Hi,

Let's update QEMU KVM extension support up to 6.8-rc6 before the 9.0
freeze.

Patches based on alistair/riscv-to-apply.next.

Daniel Henrique Barboza (2):
  linux-headers: Update to Linux v6.8-rc6
  target/riscv/kvm: update KVM exts to Linux 6.8

 include/standard-headers/drm/drm_fourcc.h     |  10 +-
 include/standard-headers/linux/ethtool.h      |  41 +++--
 .../standard-headers/linux/virtio_config.h    |   8 +-
 include/standard-headers/linux/virtio_pci.h   |  68 +++++++++
 include/standard-headers/linux/virtio_pmem.h  |   7 +
 linux-headers/asm-generic/unistd.h            |  15 +-
 linux-headers/asm-mips/mman.h                 |   2 +-
 linux-headers/asm-mips/unistd_n32.h           |   5 +
 linux-headers/asm-mips/unistd_n64.h           |   5 +
 linux-headers/asm-mips/unistd_o32.h           |   5 +
 linux-headers/asm-powerpc/unistd_32.h         |   5 +
 linux-headers/asm-powerpc/unistd_64.h         |   5 +
 linux-headers/asm-riscv/kvm.h                 |  40 +++++
 linux-headers/asm-s390/unistd_32.h            |   5 +
 linux-headers/asm-s390/unistd_64.h            |   5 +
 linux-headers/asm-x86/kvm.h                   |   3 +
 linux-headers/asm-x86/unistd_32.h             |   5 +
 linux-headers/asm-x86/unistd_64.h             |   5 +
 linux-headers/asm-x86/unistd_x32.h            |   5 +
 linux-headers/linux/iommufd.h                 |  79 ++++++++++
 linux-headers/linux/kvm.h                     | 140 +++++++-----------
 linux-headers/linux/userfaultfd.h             |  29 +++-
 linux-headers/linux/vfio.h                    |   1 +
 target/riscv/kvm/kvm-cpu.c                    |  29 ++++
 24 files changed, 410 insertions(+), 112 deletions(-)

-- 
2.43.2


