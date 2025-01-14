Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AFBC02183
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 19:01:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXm9W-0006ml-2t; Tue, 14 Jan 2025 14:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXm9C-0006KK-AO
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 14:00:30 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXm99-00034c-GA
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 14:00:17 -0500
Received: by mail-ot1-x341.google.com with SMTP id
 46e09a7af769-71e22b2387cso3911724a34.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 11:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736881213; x=1737486013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GwRBr/J/aluGiNq2YcJIUMCt8ffzwsH0WGGSpusgcIY=;
 b=SM2yBiOAYRb8wg859VHV+cayGf7QVpJCp1gqCBXAG19ApMCVReRkLO6k9OvgK9puLv
 S6Eu4a+obD6NtecQ9NxeypDecYI0K8qhH4DWNsCYdvaWkG8yPLcUstZYvmeui6ZIANQe
 zo6n8d0eIlgM1g+ibaXpOGJzOmgArdzSX+g6Onz4w3N3vYvjsvpBYGpgdHdLdhtwrfYJ
 mW2i8c1UjkFXWQvWcX27AYnA/eYB13LQGAHs+QifKhWFXL7mbumewMJjJu5mcTxAf0sn
 nL6CcOeod7sIHm6oVznefCGf6rKzY5u32Jd8q7JRVxAXpPrFMs1QxbFh3KzVi2AyRBQX
 fLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736881213; x=1737486013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwRBr/J/aluGiNq2YcJIUMCt8ffzwsH0WGGSpusgcIY=;
 b=dckYVlR77S1EG3dVPnM50+skg91d4hmuKY31g+YOyTMX0CZsg4AfZmCK+/sbma7262
 +5OnSAUCu5IuZlBFuy7gbeZiaFsapb0Q2pu4bzwKkcmimq2ojatDmm2JMGV3d6JP8Y7o
 DPyobrjoZz/eZFYtWcK+WbFtH9cAXwKWg/5d0BoH73CZ43RuJPCFDE/9olKC/BfbasHn
 IUTnkuyvgvAkjD8LrTnZlmAyPbHapFww3s937HVt86Ynxr6QsgbTo6mRQhafILL5E+E2
 w6SXLGofpziVoHDxzI5vimHNaRUXyMLr07J97hdP3aSzhEfXtDUvIh8I5oUVSylakMPw
 zxZQ==
X-Gm-Message-State: AOJu0YzzinSvWgv8eErq/M++n2vo4JqgBkNha4bpgQKFf80EiNy7iFuh
 okMMqbb+0voDoO9S6nCGNhYvjEhjb2du1doefsWyGN93flGKnjPceiW+QfvOuTk=
X-Gm-Gg: ASbGncuQzOSYM9m+Q7MN2r3X6dChiYKphm1nBzPI5Ev8daJuUxwqw51DiywDnp/dFE3
 ZumnrTJWs5PHiZtQVZGHFVf3wqoPizLdupUtZKAgjM5Ym+y6ceX0OGsQdlfFmspF9cuF7hstUkl
 k0i5DNOU8Yhv5yg84PxCQj8D5Y3PP+N+E3X35JV+CnwVg6r9d7NIndKMipurKcbVTQFKrpTzhj+
 /IhgnkN14M2wfQajSmgKJYQJnfE00znQnUhCdqjeJkaEoTTUU1bynrtQz6O7w1G/d0Z3heRzT3w
 HIrQrJhATw==
X-Google-Smtp-Source: AGHT+IGiUftHDhrC7yQsWI6rUCip6T9bTbpSoTQS5OsyJnEoy/2ZEE/Yio6uiVvyPtizMudP31sxew==
X-Received: by 2002:a05:6830:2a9f:b0:71d:3faf:b652 with SMTP id
 46e09a7af769-721e2e0e976mr16015655a34.6.1736881213202; 
 Tue, 14 Jan 2025 11:00:13 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.107.205])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7231855ee1esm4875647a34.32.2025.01.14.11.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 11:00:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/4] target/riscv: RVA23 profile support
Date: Tue, 14 Jan 2025 15:59:57 -0300
Message-ID: <20250114190001.1650942-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x341.google.com
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

Hi,

This version implements changes based on Drew's feedback from v1.

Most notable change is the addition of zifencei in RVA23S64 that I
somehow missed in v1.

Patches based on alistair/riscv-to-apply.next.

Changes from v1:
- patch 2:
  - do not remove zba/zbb/zbs from the extension list
- patch 3:
  - fixed commit msg
  - treat supm as an extension rather than a named feature
- patch 4:
  - add zifencei
  - treat ssnpm as a extension rather than a named feature
v1 link: https://lore.kernel.org/qemu-riscv/20250114132012.1224941-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (4):
  target/riscv: add ssu64xl
  target/riscv: use RVB in RVA22U64
  target/riscv: add RVA23U64 profile
  target/riscv: add RVA23S64 profile

 target/riscv/cpu-qom.h            |   2 +
 target/riscv/cpu.c                |  77 +++++++++++++++++++++++++++++-
 tests/data/acpi/riscv64/virt/RHCT | Bin 390 -> 400 bytes
 3 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.47.1


