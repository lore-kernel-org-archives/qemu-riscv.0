Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7689C021AA
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:30:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlS7q-0006hU-6a; Fri, 21 Feb 2025 07:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlS72-0006CY-DF
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:26:37 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlS6y-0007YI-Mu
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:26:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-220ecbdb4c2so53971135ad.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 04:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740140791; x=1740745591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YlUi+5h+dTXEv6y1UjiRTHdMrFHrUViOPWH/ccJ3Rq4=;
 b=SlJmIfaNOEFyWiv+w9voDsKCAA45VLhm+WfGNv4HvDGu6LreyJPPQCkAHRKzMg9+pz
 HbPkfwyYlG9bFtuLOqnsWYZFc5ZsdpvK7AXBGhuvSSSVOYDFcYCYiWLwxdeWBjD1BGiB
 lne/ZoW+Ld//c2w4sGFSW/Fml0Qfwwnojl6Syl3tJlyGeg6Yv53drAbTNJgPJVKh6u7t
 8t8+4Y7XTvIozIymYnTWEGktY5tFUFuomsRelpTBOgLjEJaJycP9QICkRptBlBlMiey6
 OpxnRDts1qGktxgo6FM3fcJI8cromWlP0NsMdGxestONwQaPhFWg2jlYcIjSSAPdIYIT
 ynUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740140791; x=1740745591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YlUi+5h+dTXEv6y1UjiRTHdMrFHrUViOPWH/ccJ3Rq4=;
 b=iTM6z6jBZYIQntGfP5KZjclXjkQ64oszm17JqbjWSBVq6Ym4K720+VtO6dVf/tOePT
 mU56k2LoPqVqLnuKQYA/Y9BFQ4ebSaSORu2lz0MVvjP/87NuRou/ZCqDSBIbwkASpMFu
 gyHGIb6R3Q5S/jyo1nsTGhaZIS6tnCssTEOqKzUOzwghFoh1TF0AfSjHdQ4UcKjnlFJj
 DlecTg2r1eGV4KZdd6Ki6QMXG94V0FWHeWLAAz/6SrUuhzTXbzwEP7BX0H9Xwy1s7ggm
 bE+mKlulh7pY/s3vwdhFQ70B7Qq2a1kplout+n3O+mzIAVqs/sxAXEpWoWf4nZ/Fmpdr
 DvPQ==
X-Gm-Message-State: AOJu0Yx17F0HbshadVQd2Tkw0Yut3unQ0jadHEkSoSn4NxEFW6QEpued
 7Gr29l6dw7AQvF0WgQr38/z1AbxIOchynQTxrD8JzV2Goqi0a1D5FMmaKkp0esA=
X-Gm-Gg: ASbGncu/iOEOo/aXOBDd5c58atW+rfdlkgnXcoVO6R6iBhamUDyiYou+/ZHp89WAkOe
 V2eEA3YOxG4w5XmzwtmiChxUioR1l0vsUhtrvZUZM3dmdf4JuqDMfRN8xlpFqEJu+1zcV21mBQG
 HjWi743FkLJw5AUVHcRGaKCcSb9DOCRvoVGk49iIKjc2A6FJ/OXiP3X0M9cdRD+TMUkCV4vHFCQ
 Mx1CAJg2Fd16TExHaYgsJgnQhGPe+MSGhzwF3kCqhWBApHVOPD3z+ka5onrEEJt9LvRUPtonfTY
 kqILFS2pVLRTy5Ib2+3Ian+0piL8maMjewbk9yIR9DnmzXyB7shv/Q==
X-Google-Smtp-Source: AGHT+IFs+lcVpRK96QUKNEET6MbFYyxW+cnk2RRwLTjgmka03HhHmE+oqXYsBQoOzNPeF5bu43uJ9g==
X-Received: by 2002:a17:903:228d:b0:21f:1bd:efd4 with SMTP id
 d9443c01a7336-221a0ed7e4cmr43304115ad.19.1740140790922; 
 Fri, 21 Feb 2025 04:26:30 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.11.154.120])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545e39bsm137349855ad.124.2025.02.21.04.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:26:30 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/3] target/riscv/kvm: reset time changes
Date: Fri, 21 Feb 2025 09:26:20 -0300
Message-ID: <20250221122623.495188-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

In this version the following changes were made, based on feedback from
Drew in v1:

- patch 2: reworked. Instead of using a different existing 'env' field
  to get/put the 'sie' CSR, we're adding a new helper that contains all
  reset vals for the KVM CSRs we support
- patch 3: reworked. Add two KVM CSRs from the KVM UAPI that we're not
  using.

Link to v1: https://lore.kernel.org/qemu-riscv/20250220161313.127376-1-dbarboza@ventanamicro.com/ 

Patches based on alistair/riscv-to-apply.next. 

Daniel Henrique Barboza (3):
  target/riscv/cpu: ignore TCG init for KVM CPUs in reset_hold
  target/riscv/kvm: add kvm_riscv_reset_regs_csr()
  target/riscv/kvm: add missing KVM CSRs

 target/riscv/cpu.c         |  9 +++++----
 target/riscv/kvm/kvm-cpu.c | 32 +++++++++++++++++++++-----------
 2 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.48.1


