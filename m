Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352F606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=XU1Geb8d
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW2tE-0000EM-Gq; Tue, 24 Nov 2026 21:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW2t1-0000CY-Ac
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:37:31 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW2sy-0006aM-GR
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:37:30 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8b10d24345dso48350537b3.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795574247; x=1796179047; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ZUJnef1s+/hKLLsbhakYrcipAWwt5gZkfwyi8V+KTLw=;
 b=XU1Geb8d9iOuo0Nr1FoMWnBO51Sm981tR6hGyQM7k1W0630wcOVzqg8AtAZljEUSSO
 O7WtLzxbjzkr75jZbYflBWE0yWLXhslbcI2tkrGYzlsju7q9v97sn/NtyoC5HRgVBjjq
 A8zKueNpv5Ofc1pAG/c02ilRXCwfx8wsBtUQOnR4uNX8Y0faECP3cK9Yuq6rgHuaDfOX
 3uRngZJLoN2O8S6uigjPoOLlVUGlqdm8gD9KHzpqNvASZUIvv5GNj38kk2ckMG0zo4iq
 BAxTtfeJ5QSLS1iUpvQSz14MKRJOCGtTowNg0Qi/YtgxJ2aT4n6PuMkUU8jWaZ3Qfake
 JWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795574247; x=1796179047;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZUJnef1s+/hKLLsbhakYrcipAWwt5gZkfwyi8V+KTLw=;
 b=nw0ThXgCvjG2pKVTJ8xI67iqkvbDqpG95WTjXxpC+SQoV3CjvEqXXv1n6nYVQJ3ydM
 C5w/Cl9Pf7NSOaB8DJx6uAgKF3U3HuzEuwjRNeeovhTlN5k/BcWEMq6UX6bJ/eaXE9GZ
 tJPnARAWCSlaU0XE7KXnKMU7iqHAsqWeLGUYaq2bJj1cruNBcRmO14S3vjOVh/uJpy9J
 H+5uwIhzziJPClLdTE31z8Ndb/gWXFTPtAO8DyIWDD7zyoQwH+7gGoPcJo81XTLTyZCJ
 doBtVMPstqEWPScyKQ02er1XJUxpxJ1cwuCuX8zjmG4O+XVO8wc0cOgHYGNF6AN5X/F1
 HX2Q==
X-Forwarded-Encrypted: i=1;
 AL+hErGIPT7SWyGkN08AMVfB6ovCe8XNnsH38/7kJtT9V4l2c12nawaxnLKJhcwz9vi8IixIAvxFGX3hgYBO@nongnu.org
X-Gm-Message-State: APuU4Z/JVT1RmMkXbDk5nROtZMzkcA8QawOcg1kE+4hFBcDPvz1YJIiC
 od2IXUwXd24XD4ZhSgQiZyAvagxnGg8pgwjuPDleekcrOjZNiTcgqPlxyFSLWbUVBKw=
X-Gm-Gg: AZFdTZeiJz0Rb+8ELoNaRtro5IOjZsyospj9fdKCQpWKY9Sy5jy8lTMnkA7llypr/YB
 P/FHgB2enjw2PFVuTh/hhPGlNB7nsxZ7Ln9yg2a3x5vfC2ZA2nenG2C5TTVPyRpQYPcs+SklG+p
 kqHG6z5uKSCoHnKnQk5aMexJZhgNYIJz1bL0BkYATncR5VNoq2d8c3kOsigPZK6uIKjo5mJDw2E
 eC9379nma0dvv+JRIqO8gOnsotymq2RDRmA0voNMZIZuZZHpwbvk0kA9M5op9lsogKvqYraSUbk
 oALEvKa5y4FrfMRm0R0UdMOeTzxUqqE/7HMbjFeYXg9jAJEVJw5KoqIw7ra6msOAEuwiyYx9LBP
 j+aWJvK1P5o4v82ByyZFBwOD9cAnWetuR3xJ7danzdDAF1oGdCo5jde2tngZ0yO1YVNh0Q/wC2j
 Ianm0u4Z9fqO/tp9TFqiJTqxRLU5wsIqQUszcBDA8jKeGq8UhNvXJacfmiKWpmYF3wuQyf8MRVy
 zt+WehAxzj4+QgPSwHiJqmMeaorihHgQJcD7OKaXfyGHaNM7scrCVti0W5C7M6zo8Mw7C4MgKS/
 KxjThbUq1bKFxseSZPGn7aENNshdOpHCVGYjIbXBM+mbNErxHC+YY8WuRLap5YCo7WI7AafK3o9
 +81ES3rgO
X-Received: by 2002:a05:690c:370a:b0:8b3:2eb4:1429 with SMTP id
 00721157ae682-8b52052505emr61890127b3.65.1795574246935; 
 Tue, 24 Nov 2026 18:37:26 -0800 (PST)
Received: from [192.168.2.129] ([2600:1700:220:59e0:ea8f:7897:2f4d:9891])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b52028d628sm65626717b3.8.2026.11.24.18.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 18:37:26 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH 0/8] Add Spacemit K3 Machine
Date: Tue, 24 Nov 2026 20:37:19 -0600
Message-Id: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9JBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMj3eKCxOTU3MyS+GxjXbM0S+Ok1NQkQ0OTRCWgjoKi1LTMCrBp0bG
 1tQCyij3gXQAAAA==
X-Change-ID: 20261122-spacemit_k3-6f93beeb114a
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Jeuk Kim <jeuk20.kim@samsung.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a spacemit-k3 machine to QEMU. The main intended usage
of this machine is for firmware develeopment. This series models 8 X100
harts, has SMP support, uart output, minimal implementation of syscons/
clock controllers needed to boot, 4 types of boot media (SPI NOR, SD
EMMC, UFS) and boot mode selection.

The machine allows the user to boot with the bootrom dumped from real
spacemit k3 hardware. If the user doesn't supply this, QEMU emulates the
bootrom and loads the next stage from boot media in the same manner in
which the bootrom would. 

SMP support was somewhat complicated to implement because the K3 doesn't
have one clear way to do so. A single hart is released at reset, and the
remaining can be woken up by M-mode IPIs or writes to a wakeup register.
One of the syscons applies an overlay over the M-IMSIC to intercept IPIs
while in reset and wake up the non-boot harts.

If there are better ways to implement the bootrom emultion/boot media
loading and the SMP support patch, please let me know. 

The model does not implement the 8 A100 harts, the Realtime CPU,
I2C, PCIe, networking.

This series[1] is needed for the SPI controller to work in EDK2
properly.

A sample boot log is here[2].

[1] https://lore.kernel.org/qemu-devel/20261123-m25p80_write_enable_fix-v2-0-0ac94f99e91f@oss.tenstorrent.com/
[2] https://gist.github.com/asrinivasanTT/77e692e00d305051533c828fbb2d1ecc

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
Anirudh Srinivasan (8):
      target/riscv: Add Spacemit X100 CPU type
      hw/ufs: Add Spacemit K3 UFS controller
      hw/ssi: Add Spacemit K3 SPI controller
      hw/misc: Add a model for Spacemit K3 syscons
      riscv: Add Spacemit K3 machine
      hw/riscv/spacemit-k3: Load next stage from boot media if bootrom is not supplied
      hw/riscv/spacemit-k3: SMP support for Spacemit K3 machine
      docs: Document spacemit-k3 machine

 MAINTAINERS                          |  14 +
 docs/system/riscv/spacemit_k3.rst    | 259 ++++++++++++
 docs/system/target-riscv.rst         |   1 +
 hw/misc/meson.build                  |   1 +
 hw/misc/spacemit_k3_syscon.c         | 524 ++++++++++++++++++++++++
 hw/misc/trace-events                 |  10 +
 hw/riscv/Kconfig                     |  16 +
 hw/riscv/meson.build                 |   1 +
 hw/riscv/spacemit_k3.c               | 745 +++++++++++++++++++++++++++++++++++
 hw/ssi/meson.build                   |   1 +
 hw/ssi/spacemit_k3_spi.c             | 273 +++++++++++++
 hw/ssi/trace-events                  |   5 +
 hw/ufs/meson.build                   |   1 +
 hw/ufs/spacemit_k3_ufs.c             | 109 +++++
 hw/ufs/spacemit_k3_ufs.h             |  27 ++
 hw/ufs/trace-events                  |   4 +
 include/hw/misc/spacemit_k3_syscon.h | 103 +++++
 include/hw/riscv/spacemit_k3.h       | 104 +++++
 include/hw/ssi/spacemit_k3_spi.h     |  49 +++
 target/riscv/cpu-qom.h               |   1 +
 target/riscv/cpu.c                   |  87 ++++
 target/riscv/cpu_vendorid.h          |   4 +
 target/riscv/tcg/csr.h               |   3 +
 target/riscv/tcg/meson.build         |   1 +
 target/riscv/tcg/spacemit_csr.c      |  82 ++++
 25 files changed, 2425 insertions(+)
---
base-commit: 8f66cb79044c370e3813c56ceb7a75a5ca2d0a0e
change-id: 20261122-spacemit_k3-6f93beeb114a

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


