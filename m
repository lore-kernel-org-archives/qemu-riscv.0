Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CEE7716C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 13:31:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJBx5-0001XK-DS; Thu, 05 Dec 2024 08:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwH-0001Aj-Px
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:42 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBw9-0004XD-Cs
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:38 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7253bc4d25eso760701b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 05:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733405410; x=1734010210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=La9AioGkA3IusDhLuH/rTBZX5ITtR1iR2EKKg8Y6I7E=;
 b=R5Cepis8O6ONBsroFE+hz49VtpvdAaTK9apT5Nv+DtuP1ydDhkN66HCjcMbD/27/4G
 mcJ36t50fkTd7hYgAraFCnnD4HdGZAzlUR53G7yQixUWt7j50AqnZDgMcXJmDUI/IhQd
 L5sy2FnZhpMM+5FEeUIbIrs8JTbsb6GOO36k3GmS01oL/cG4E8cnLTAIO696D8fSUUXA
 CnGA6SVamR20ocUhJkYueqzL7ST6F+r14I0ND/m4ar3S+SnKT5Gs6qBOqWef6/8u/h+K
 vCqoaNjIYEljGxCHthkGBb5GCx+ILs/cNDESfNDfQ5b5sjINfo9p4Xs5eLbn0HFuyDMW
 zRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733405410; x=1734010210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=La9AioGkA3IusDhLuH/rTBZX5ITtR1iR2EKKg8Y6I7E=;
 b=BpSvbyZM/8tERG5+iEe5SSK5pCkXWFkdSJ9HUy5OQriSnnaVkNACVrzTuE6YyPnePA
 vENnQN3WR4kPvqqQLj1T2GX3MUaacogs88wr6xsOZTs0YlUBY0GLf/88YJMf0YcUkXlK
 55V8eFM9uEtQmuzt7++y8hbXCQzZoZAxIYpjZme5G6Mkn5oCbvd/2cWzSRdZ88jGkWKW
 VyO0picLrfAGuHbOwjNvAa1nJnSI415ZN/BSXV0ZmCkFfoY5UyZkz6sTNRV+MQUa+GHo
 qu17J7IXFFRQ/KD6TSInuUcpxnBJQ0I+D6W7eM03lQ3GVoBJ1Fy1b47jvDEyLKc/wcY7
 ZuoA==
X-Gm-Message-State: AOJu0YxEt2lzSvwc9r3O8u+t8kQwDgK4rIPgzByzk3pyuVnfhYVZ77PI
 TtmVnXzvOsKr9uMbzjzGTUOSnXYANr+x6VHn2NQSXw/y6sInetz32Sn3/hoburI=
X-Gm-Gg: ASbGnctqTAnm2c4D9k+yeJM/+wQndD0r98HYhsCuLKk1z9jbkPFIzrXUpKNeh0qGo0U
 96iUo+ytAJXdvXHTJqPiFgdYEisgHm+R5E3OQ9YR+oIAY4T0iVQ7xu9zxLTEgEnjSBeEJRaZvb8
 FlQXCio95AFVPpMibzWyCyK6g42g99GLFOCC6kEcjEx53S7yJSEwz/UCNTGKmxQLVWexZb4twto
 NFJ01Y1UdOg5GYV6u9erDCVDCEU79GCbkSO9+dfJNAQe+LScx5H8Z92BF2XFDcqWhcIB+yDAfPr
 JJoW
X-Google-Smtp-Source: AGHT+IF9YYzqlSAKUXfyaj4VMeZmZAOzTxHX46IijiI1A4xpHtgYf2Y39ev7oO2iREwvdyXWUgJ7pw==
X-Received: by 2002:a05:6a00:2789:b0:725:9253:62c8 with SMTP id
 d2e1a72fcca58-7259d5734afmr5469096b3a.2.1733405410097; 
 Thu, 05 Dec 2024 05:30:10 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a8f512sm1250315b3a.126.2024.12.05.05.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:30:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: [PATCH for-10.0 00/11] riscv: IOMMU HPM support
Date: Thu,  5 Dec 2024 10:29:52 -0300
Message-ID: <20241205133003.184581-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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

This is a re-submission of the original Hardware Performance Monitor
IOMMU support sent by Tomasz back in July 2023 [1] in the first version
of the IOMMU emulation. In the second version of that work [2] sent in
February 2024 I said:

----
- I'm not contributing the HPM support that was present in v1. It shaved
  off 600 lines of code from the series, which is already large enough
  as is. We'll introduce HPM in later versions or as a follow-up;
-----

So here I am keeping my end of the deal. The code is basically the same that
Tomasz sent in v1 with some tweaks:

- Code was split across several patches for easier review;
- A separated file was created, riscv-iommu-hpm.c, to host all the HPM
  related code. The base emulation will use HPM via public helpers. The
  idea is to avoid clogging riscv-iommu.c;
- There was a lock in use to read/write the HPM registers in the
  original posting. Based on the current design of the merged IOMMU
  support, a lock-less design, I also removed the locks from HPM;
- Other minor tweaks such as not naming functions using "__name" and so
  on.

Patch 1 is a header fix required to put the helpers in riscv-iommu-hpm.
Patches 10 and 11 are new. The original HPM code is split in patches
2-9.

Series based on alistair/riscv-to-apply.next.

[1] https://lore.kernel.org/qemu-riscv/cover.1689819031.git.tjeznach@rivosinc.com/
[2] https://lore.kernel.org/qemu-riscv/20240307160319.675044-1-dbarboza@ventanamicro.com/

Cc: Tomasz Jeznach <tjeznach@rivosinc.com>

Daniel Henrique Barboza (3):
  hw/riscv/riscv-iommu.h: add missing headers
  hw/riscv: add IOMMU HPM trace events
  docs/specs/riscv-iommu.rst: add HPM support info

Tomasz Jeznach (8):
  hw/riscv/riscv-iommu-bits.h: HPM bits
  hw/riscv/riscv-iommu: add riscv-iommu-hpm file
  hw/riscv/riscv-iommu: add riscv_iommu_hpm_incr_ctr()
  hw/riscv/riscv-iommu: instantiate hpm_timer
  hw/riscv/riscv-iommu: add IOCOUNTINH mmio writes
  hw/riscv/riscv-iommu: add IOHPMCYCLES mmio write
  hw/riscv/riscv-iommu: add hpm events mmio write
  hw/riscv/riscv-iommu.c: add RISCV_IOMMU_CAP_HPM cap

 docs/specs/riscv-iommu.rst  |   2 +
 hw/riscv/meson.build        |   3 +-
 hw/riscv/riscv-iommu-bits.h |  47 +++++
 hw/riscv/riscv-iommu-hpm.c  | 381 ++++++++++++++++++++++++++++++++++++
 hw/riscv/riscv-iommu-hpm.h  |  33 ++++
 hw/riscv/riscv-iommu.c      | 131 +++++++++++--
 hw/riscv/riscv-iommu.h      |  27 +++
 hw/riscv/trace-events       |   5 +
 8 files changed, 612 insertions(+), 17 deletions(-)
 create mode 100644 hw/riscv/riscv-iommu-hpm.c
 create mode 100644 hw/riscv/riscv-iommu-hpm.h

-- 
2.47.1


