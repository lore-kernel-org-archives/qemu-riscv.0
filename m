Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231CCC021B3
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 08:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmTlg-0000Aa-2Z; Mon, 24 Feb 2025 03:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTlQ-0008WR-U2
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:24:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTlM-000191-DK
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:24:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-220c8cf98bbso91498045ad.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740385466; x=1740990266; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZm4SwnsHhX6IEyNbi5W4P1owMVuTwdxKu0UJCplLGw=;
 b=KM90jKBydTTxkHiMT8QfLGG2Nnu4GqU5uWZx/w7Oey3XHrrW6NYfSEt6f3taftLpeO
 um4dugoGT4m3C2FjVc7vgpk+FF4ujwoP9KvT3/Xwk8nInwB3B1frnHpLvzOqeB0+oMIS
 TsbxSKxwZeQF4k4JQ6jr6kksLgHfa98Z2KxgR/QT+t8tVsVwdkfYrDk4T99ejX79pEPh
 OfHMF0g2BfgFay2wDEXKOI7OPJjvTkjM7k64guTZ15F6mqYmvO2xd4kwcYxvianDWKeV
 IACWJ51QHKj0CV+2ImftmwztOvkgfwNipk+4FTh6gJQ7Z2A9t5htb42Xzm927/ujGie/
 R/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740385466; x=1740990266;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZm4SwnsHhX6IEyNbi5W4P1owMVuTwdxKu0UJCplLGw=;
 b=p6hGHIHKi/Nqa2Xe7wg6+TMHPPLoCtDoV5awLR3VnIieH8IREpglaaCMH+Msv11kn7
 DD+PBHHJ0/Zk1CETDBeRCjBaHZS2aaVFMMySbut51OIHW8qkm8L8v7OfSb7oBQuenUF7
 DGj+0Fi5a0jCr76C6GGCaExSkiKndXdIuc0NgcX1dvMNYT0ZFHMsx8A+gEc7yI+fVHvB
 DPguC0HYYF+DMUsb2A1LxdYa1/bfFBLL+j9IfjHIuvAwoLLTBBYLtzNSQs6wCAO24FZQ
 qgNpSHbpM9pIjMuR8sL1HpnnlA3dwkx0WmXERT+tGr9pL2rXOTGBasg5DCN1Ynt7W961
 P7Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHFRDbuNGyDQzSoinHxZQWUFKkeRK9tlmG7TNsbOM/gt5OXV2V0CXYF2h+TZg6Dwc4pDdbnRZNYXjj@nongnu.org
X-Gm-Message-State: AOJu0Yzl66/tL0wxGnMX42DoyGdgidTk8ob/UZIwFgGdf17V938B2N74
 FHiFBhw/sW9St9Lrgbh0quPysmM2n/wU2P6/6eP8g139NOxqQVqjDPNyTUuWe2k=
X-Gm-Gg: ASbGncsIxJDR5KB5yZFCks3tVe6fcTUHZpyOiS2OgMvrmu8vUTPhzN0FETC2Kjd8+w2
 JYMzalNEbbOCuyG8SoPFF09HzEUApytP9dp2qcxpP2iU05mMOd/MIVVqSDpK8Ed28JAB1zmOruU
 mtY6NtpFsC87i8GBtfG71NwyEfrjPeAfhoaiWvljigKL4F/DC4R9vCpkQFs+j0OL69oaojtXa2b
 OzmB2LsATh/BMZR1g8Osv61CN2BKXUB01BjQBhXZh20tkXHcDGcgXAGHPLEZYfT9ooWlvBshn/f
 Ri03OotLqkKA4jceBcr6F3t8b46XvK7fPn24sGHcsScgyNSL3wutRJNZ
X-Google-Smtp-Source: AGHT+IGCbWT9LauH6yPFHhdqxuev0ZMS2teK5/iEimQuh3/6jvQU7seQBjtlXcG55CtEm8HEZ9s19g==
X-Received: by 2002:a17:902:d552:b0:21f:b483:2ad5 with SMTP id
 d9443c01a7336-221a0ed78d8mr160268165ad.20.1740385466658; 
 Mon, 24 Feb 2025 00:24:26 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325c88d74esm17714914b3a.149.2025.02.24.00.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 00:24:26 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 0/8] riscv: AIA: kernel-irqchip=off support
Date: Mon, 24 Feb 2025 16:24:07 +0800
Message-Id: <20250224082417.31382-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x629.google.com
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

This series introduces the user-space AIA MSI emulation when using KVM
acceleration.

After this series, RISC-V QEMU virt machine with KVM acceleration has
3 parameters to control the type of irqchip and its emulation method:
- Machine prop "aia" controls the type of irqchip
  - none: use PLIC and emulated in user-space
  - aplic: use AIA wired and emulated in user-space
  - aplic-imsic: use AIA MSI, emulation mode is determined by
    "kernel-irqchip" and "riscv-aia". This can only be used
    when the host machine support the AIA extension.
- Accel prop "kernel-irqchip", effective with AIA MSI
  - on: in-kernel APLIC and in-kernel IMSIC
  - off: user-space APLIC and user-space IMSIC
  - split: user-space APLIC and in-kernel IMSIC
- Accel prop "riscv-aia", effective with in-kernel IMSIC
  - emul: use MRIF as in-kernel IMSIC
  - hw: use hardware guest IMSIC file as in-kernel IMSIC
  - auto: use the hardware guest IMSICs whenever available otherwise
    fallback to MRIF

Glossary
- PLIC: Platform-Level Interrupt Controller
- AIA: Advanced Interrupt Architecture
- APLIC: Advanced Platform Level Interrupt Controller
- IMSIC: Incoming Message Signaled Interrupt Controller
- MSI: Message Signaled Interrupts
- MRIF: Message Routed Interrupt Facility

---
v2:
- Add glossary of RISC-V irqchips in cover letter (Kashyap)
- Add assertions in riscv_get_csr_name() of PATCH4 (Andrew)
- remove the changing of property name (Andrew)
- Add PATCH8 to prevent the usage of IMSIC devices when the host
  machine doesn't support the AIA extension.
- fix typo in cover letter

Yong-Xuan Wang (8):
  target/riscv/kvm: rewrite get/set for KVM_REG_RISCV_CSR
  target/riscv/kvm: add KVM_REG_RISCV_CSR_AIA
  target/riscv/kvm: add KVM_REG_RISCV_CSR_SMSTATEEN
  target/riscv: add helper to get CSR name
  target/riscv/kvm: rewrite kvm_riscv_handle_csr
  target/riscv/kvm: add CSR_SIREG and CSR_STOPEI emulation
  docs: update the description about RISC-V AIA
  hw/intc/imsic: prevent to use IMSIC when host doesn't support AIA
    extension

 docs/specs/riscv-aia.rst   |  24 +++-
 docs/system/riscv/virt.rst |  10 +-
 hw/intc/riscv_imsic.c      |  17 ++-
 target/riscv/cpu.h         |  10 +-
 target/riscv/csr.c         |  30 ++---
 target/riscv/kvm/kvm-cpu.c | 235 +++++++++++++++++++++++++++++++------
 6 files changed, 254 insertions(+), 72 deletions(-)

-- 
2.17.1


