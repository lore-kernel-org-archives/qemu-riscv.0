Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1D4D5E141
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 07:06:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t9J3O-0008Pq-1r; Fri, 08 Nov 2024 02:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t9J3K-0008Nz-MV
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 02:05:06 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t9J3I-0006A0-Te
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 02:05:06 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7ea68af2f62so1472856a12.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Nov 2024 23:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731049502; x=1731654302; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WgDfftvdha+DgL2LjAUeMKUi9N9A+5jceZKQDE72GE=;
 b=h2rmhmCixlHFAzm6IC6YygLypibN64eKPVtykl6m/A5WzlY3AM+w25SwfeFisNLEfK
 ihZ3KVppl81JxggE5CEDBdRi5ss/J43oasifTrf0nIns0G+aCFVNPYjZrQyPHjd4zqdF
 idTcnhR2ufZbbpA1mmeWn9Ma1dMXk0jHEjkbx/whYEcXroFqEu05SrtCBktyv7M3mbCm
 NXM04zx58/qaZauCWIHkhMb3uR3nWnyvPTA/kWXzGM9LqegtevBq2kTrSXgjswTSQ8Ts
 xDWbjrDSKIbYOBY25dHzUbuSXVQn+5aKLclEzvF0m/YfuOW3rQ3ib+GiThf+5uKc4T9/
 IOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731049502; x=1731654302;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WgDfftvdha+DgL2LjAUeMKUi9N9A+5jceZKQDE72GE=;
 b=LOZikx40EmL/zfFlIxeOsZk2jMav626Lm9Ao5NNA2kjuk+/IY/XPk3grkK6EI98K2c
 WGnc9hv21IvYymq0eZAccr9PB02cReIor2YuuSctVIOtcxDzX3MDYqBNbLFlD0SKln7o
 xe0cETr7dh3DkTkX8qE3eqJAfHi+GQpeEJlbWEiK3e14dqZ02O5FyBXkLglyqX7tJMm0
 BVv0oj3ckzrquPpos7++ESGWMdIW9cRfi/Ji6+NQbxeyoUolGXRVnQqndmbFtsTRT86d
 Hu5zW6TA2g6X27RjQNz3xNjUU64PlrxjOOxz18H1Zzl5YC+R0xuc7GUdgePTqyBhJVuK
 9mcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIavCFGhSZbSFSZyI7EunAWF48pre7Of/ORm+Tp2ANF6VVyoCm3pV4wyUh36MpKJq7beVf62WvpXzp@nongnu.org
X-Gm-Message-State: AOJu0YwnbWko2e9sMrOOpbrNMnlWsF8JjdegYYXl/EoroCu8pnVsvnB8
 OKiNPfl0B+ZNcVNn72CUJJsfgef20MingiQJTO/ll0mDN1EaSIT/h7OB+AAg2TQ=
X-Google-Smtp-Source: AGHT+IEa3IeJfBQcxbVc7dZhFGRIi9AegOprKA2tl0uiM/4SxW6rgpkIGsL0wPGvZzW5gZYkLIbFbQ==
X-Received: by 2002:a05:6a20:1590:b0:1db:ee29:4f4c with SMTP id
 adf61e73a8af0-1dc22a1b545mr2131587637.23.1731049502467; 
 Thu, 07 Nov 2024 23:05:02 -0800 (PST)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a9058sm2900715b3a.77.2024.11.07.23.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 23:05:02 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 0/3] Support 64-bit address of initrd
Date: Fri,  8 Nov 2024 15:04:51 +0800
Message-Id: <20241108070454.12699-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x529.google.com
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

Support to load DTB after 3GB on RV64 system, so that larger initrd
doesn't be overlapped to DTB. DTB loading now will check if overlapping
to kernel/initrd and report this error.

Verify the patch via running 4GB initramfs on the virt machine.

Changes for v3:

  - Change struct RISCVBootInfo from machine state to local variables.

Changes for v2:

  - Add DTB overlapping checking and struct RISCVBootInfo
  - Remove the commit to change #address-cell of 'initrd-[start|end]'

Jim Shu (3):
  hw/riscv: Support to load DTB after 3GB memory on 64-bit system.
  hw/riscv: Add a new struct RISCVBootInfo
  hw/riscv: Add the checking if DTB overlaps to kernel or initrd

 hw/riscv/boot.c                    | 94 +++++++++++++++++++++---------
 hw/riscv/microchip_pfsoc.c         | 14 +++--
 hw/riscv/opentitan.c               |  5 +-
 hw/riscv/sifive_e.c                |  5 +-
 hw/riscv/sifive_u.c                | 15 ++---
 hw/riscv/spike.c                   | 15 ++---
 hw/riscv/virt.c                    | 14 +++--
 include/hw/riscv/boot.h            | 28 ++++++---
 include/hw/riscv/microchip_pfsoc.h |  1 +
 include/hw/riscv/opentitan.h       |  1 +
 include/hw/riscv/sifive_e.h        |  1 +
 include/hw/riscv/sifive_u.h        |  1 +
 include/hw/riscv/spike.h           |  1 +
 include/hw/riscv/virt.h            |  1 +
 14 files changed, 130 insertions(+), 66 deletions(-)

-- 
2.17.1


