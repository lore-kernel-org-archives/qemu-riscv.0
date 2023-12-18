Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6BEC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:43:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFKSj-000506-CK; Mon, 18 Dec 2023 15:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKSh-0004zw-HR
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:43:39 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKSX-0001qp-Gs
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:43:31 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5c690c3d113so2867520a12.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 12:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702932208; x=1703537008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ET6346FMv/aS4tuFwFxVb6aJAc95gn4IUJ1WbjYh/VU=;
 b=eSosoQ3oAtokOX0psAQasTaaDrdeHib4E2XuV/9v+JSqUP7uFhve06cVI+MKdnTl5F
 GNMoX3FKCkctRVBalBubztLzOM2w5yzHICAVSlRToki8tF87mkAPS/fy2dvY5eUWXNcf
 GcwRPYUbp7+wOPhwOQJBkXQcQLtafnDP0X8lJ8bLyFjrUrlHu7afLp309CiuqzQaLf40
 Itl7LpdmtqSzDBdlk14nhH4HjO48FEJOzVuIxgUEGEGfw75MpPACzMqHIdqkWzuG3zyk
 AsTDk80Z1qBJmpk3/TNCEVOjdksiFoMVgJjbs/g/B8XaW5FXPfAGMavj3GGURQzHeTzA
 /4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702932208; x=1703537008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ET6346FMv/aS4tuFwFxVb6aJAc95gn4IUJ1WbjYh/VU=;
 b=EQArQkcckRGUKyZdJpDVu3P4ItrcX2REKwDX6lbUiF2GhNviJrce5El4PDDltEEUB3
 tPDI27hAYQ2SR4ertI+8HjxpZPHZIdt/RbNdj16VX9APKv4BxwT/wUIyWsqiyK48QKS4
 eHGRR5HDmSRGfuqQDT8Zy1vsXQOvOiDnRntLfliDWWDB2e7+0PKJe2ALt8T4uCK2eNRw
 FeRH5zRtZiDA09SkoTS/8gL9419exJJE0pkKUNDgboU0T42PxqOMSd5lXYep6FvpxNWM
 hJU9SEey2hRGlx444SjoCu8O7fG961ylw+WbddA/YYlBp3YTtGIoY054MdJW4JglPUvU
 ZF6A==
X-Gm-Message-State: AOJu0YxI3Tq26s23WbCtNv7ukDZbNF3zKk1A2CQ6TSrM+/CeleAMPNeK
 MAbcVADmzf9vcDP6+XXJgGzGvQ==
X-Google-Smtp-Source: AGHT+IH9gmISc804xyqr8pl22NH0wI1EriUEqt6/FgYbx/fVL6OOKqqelGP66NYE0LX3Yi4X9oQZkg==
X-Received: by 2002:a05:6a20:3942:b0:187:3643:ecce with SMTP id
 r2-20020a056a20394200b001873643eccemr21399472pzg.56.1702932207996; 
 Mon, 18 Dec 2023 12:43:27 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 x20-20020aa793b4000000b006ce7e65159bsm2627905pff.28.2023.12.18.12.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 12:43:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/4] target/riscv: add RVV CSRs 
Date: Mon, 18 Dec 2023 17:43:17 -0300
Message-ID: <20231218204321.75757-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
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

This version was rebased on top of Alistair's riscv-to-apply.next. A
small tweak was needed in patch 4 due to changes in the branch.

I took the chance to update linux-headers to 6.7-rc5, although the
differences from the rc3 headers from v1 were minimal.

All patches acked.

Changes from v1:
- rebased to Alistair's riscv-to-apply.next
- patch 1:
  - updated headers to v6.7-rc5 
- patch 4:
  - use kvm_riscv_reg_id_ulong() instead of kvm_riscv_reg_id()
- v1 link: https://lore.kernel.org/qemu-riscv/20231130182748.1894790-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (4):
  linux-headers: Update to Linux v6.7-rc5
  linux-headers: riscv: add ptrace.h
  target/riscv/kvm: do PR_RISCV_V_SET_CONTROL during realize()
  target/riscv/kvm: add RVV and Vector CSR regs

 include/standard-headers/drm/drm_fourcc.h     |   2 +
 include/standard-headers/linux/pci_regs.h     |  24 ++-
 include/standard-headers/linux/vhost_types.h  |   7 +
 .../standard-headers/linux/virtio_config.h    |   5 +
 include/standard-headers/linux/virtio_pci.h   |  11 ++
 linux-headers/asm-arm64/kvm.h                 |  32 ++++
 linux-headers/asm-generic/unistd.h            |  14 +-
 linux-headers/asm-loongarch/bitsperlong.h     |   1 +
 linux-headers/asm-loongarch/kvm.h             | 108 +++++++++++
 linux-headers/asm-loongarch/mman.h            |   1 +
 linux-headers/asm-loongarch/unistd.h          |   5 +
 linux-headers/asm-mips/unistd_n32.h           |   4 +
 linux-headers/asm-mips/unistd_n64.h           |   4 +
 linux-headers/asm-mips/unistd_o32.h           |   4 +
 linux-headers/asm-powerpc/unistd_32.h         |   4 +
 linux-headers/asm-powerpc/unistd_64.h         |   4 +
 linux-headers/asm-riscv/kvm.h                 |  12 ++
 linux-headers/asm-riscv/ptrace.h              | 132 +++++++++++++
 linux-headers/asm-s390/unistd_32.h            |   4 +
 linux-headers/asm-s390/unistd_64.h            |   4 +
 linux-headers/asm-x86/unistd_32.h             |   4 +
 linux-headers/asm-x86/unistd_64.h             |   3 +
 linux-headers/asm-x86/unistd_x32.h            |   3 +
 linux-headers/linux/iommufd.h                 | 180 +++++++++++++++++-
 linux-headers/linux/kvm.h                     |  11 ++
 linux-headers/linux/psp-sev.h                 |   1 +
 linux-headers/linux/stddef.h                  |   9 +-
 linux-headers/linux/userfaultfd.h             |   9 +-
 linux-headers/linux/vfio.h                    |  47 +++--
 linux-headers/linux/vhost.h                   |   8 +
 scripts/update-linux-headers.sh               |   3 +
 target/riscv/kvm/kvm-cpu.c                    | 103 ++++++++++
 32 files changed, 736 insertions(+), 27 deletions(-)
 create mode 100644 linux-headers/asm-loongarch/bitsperlong.h
 create mode 100644 linux-headers/asm-loongarch/kvm.h
 create mode 100644 linux-headers/asm-loongarch/mman.h
 create mode 100644 linux-headers/asm-loongarch/unistd.h
 create mode 100644 linux-headers/asm-riscv/ptrace.h

-- 
2.43.0


