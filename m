Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA674C02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 12:37:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiBzZ-0003R6-3H; Wed, 12 Feb 2025 07:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzG-0003NJ-1r
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzD-0000MQ-Lj
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dcf8009f0so2553946f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363822; x=1739968622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=leFbxDuw1M+6UQ+DVIc5aS33qKInR/m/tUBQajPUeGI=;
 b=bjF4z4oIw1QwSYwoM1PVwgmCGeoxlet/GGNLjCuFnSVspRRxzzuuQlvAc3QW4Fjmzb
 o1t1/0XZYFKjepdmDj+lig7imqcwN9w/pUfEOnl+sDS5cTQN+oJh3JpNuViRj/8hjyiZ
 /XVhjkVVFvnvsjvr+hC9FKNMqhDrlXmJKDoXMS3xOxhBPme7N2b8IHKTTlc+QIBhnExd
 +pfMGCT69UB/7+ruFwsmSD7T98EDR0I2xFDNipMi/lIYRc4oJiVB8yHfxTCZ5LbocIs4
 CVLAvLnMfa7dRYKrbnOvxeKv6EhEN33qhjly+cQ5tUN4RMGBUQAYKCR9mwZgAXCmgxsl
 31+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363822; x=1739968622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=leFbxDuw1M+6UQ+DVIc5aS33qKInR/m/tUBQajPUeGI=;
 b=aOX3+mhszNNHm8EIxoidSUOU3sNCNYj41JZBF5sWhQiWfbVuYSwTfgeyqUa7DVp6Uc
 9lfEO+msbcfeVmUwpFAP6gdStgwKagqiedSxJpsSwYVE31qsTW0QSmpvSLq8kFAwBctc
 PrBE2abFEsN7xCZX+xYK0NCq2V1TpJXxgWZoZTsHZylu9I+3UXjmyw2jmo7OANWWH4gY
 syg/E1afIlUTHArjxnZbXCn6E8WKGLXRsF/fX6AeDB1Ctpm3W+boURLGYNm8rhJKwi/z
 TE8htSm3NyftmAmVdNLW73tivD5xMW3zhEZ3NCvpeutIkCJD15nGU61A6zFBBOQZ02jA
 S8Og==
X-Gm-Message-State: AOJu0Yw6KZnlThZ4Cmsl0Bqh3888V5uCo1JRICxdTQXkYze9vxd8zZzT
 BMU/rbi4Rj9D/p9XGn5LLRFp6FwVpYbZeAHG9IR4eOFcfe9Mbu/BM7OwbRcztMA=
X-Gm-Gg: ASbGncupEP3Y4xASHncD/FkBx2GVsjzDb+ZIUkffTkxEkOyuvPjzow0rd3mmdNnUE0H
 4h6S5Vc95Wga4lcomcbVUDx9mmvpb8aDETJdGXIKaFOVCKHgPyHeA2C4Zc9Ol2Y9B0ZKtyvQRrI
 wFMH9pTrlyoRdP+VI56oRPAYbP1oA4mSXUBNTScluM4p8oeaj8MI/XXPoS/dS1pUrLbwtMhq48g
 RrIfbuAfOhAjnjzHVhxUumHD9cLmd0z+ITS+8Dd41AqzM2vRTue5V+HBBBAw6SYdvaE4Wxb6Zsw
 tQSDeFcROTNAqzzUy9+eaWvPbWXx5DQjrAK+JTU/IguHxdB9Leb+FHkdiLTY+ZMopg==
X-Google-Smtp-Source: AGHT+IEZhoYIq1stgyNi8tpYKiNn6mR54AxOhs8b9q3RuKhl+A7Rc+M2a2xLlgsUvxJ6QVw/9ZnGsA==
X-Received: by 2002:a5d:59ab:0:b0:38c:5d42:1516 with SMTP id
 ffacd0b85a97d-38dea2e9023mr2453934f8f.34.1739363821782; 
 Wed, 12 Feb 2025 04:37:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm13344942f8f.98.2025.02.12.04.37.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 00/10] hw/microblaze: Allow running cross-endian vCPUs
Date: Wed, 12 Feb 2025 13:36:49 +0100
Message-ID: <20250212123659.52764-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Since v6:
- Simplify MemoryRegionOps indexing (Thomas)

Since v5:
- Introduce QAPI EndianMode
- Update RISCV machine while rebasing
- Fixed INTC use on PPC (Thomas)
- Dropped patch adding more machines (Daniel)

Since v4 & v3:
- Addressed Thomas review comments

Since v2:
- Addressed Richard's review comments

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Philippe Mathieu-Daudé (10):
  hw/qdev-properties-system: Introduce EndianMode QAPI enum
  hw/intc/xilinx_intc: Make device endianness configurable
  hw/net/xilinx_ethlite: Make device endianness configurable
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Allow microblaze tests to take a machine name
    argument
  tests/functional: Remove sleep() kludges from microblaze tests
  tests/functional: Have microblaze tests inherit common parent class

 qapi/common.json                              | 16 +++++
 include/hw/qdev-properties-system.h           |  7 +++
 hw/char/xilinx_uartlite.c                     | 34 +++++++----
 hw/core/qdev-properties-system.c              | 11 ++++
 hw/intc/xilinx_intc.c                         | 59 ++++++++++++++-----
 hw/microblaze/petalogix_ml605_mmu.c           |  3 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c      |  6 ++
 hw/net/xilinx_ethlite.c                       | 29 +++++++--
 hw/ppc/virtex_ml507.c                         |  2 +
 hw/riscv/microblaze-v-generic.c               |  5 ++
 hw/ssi/xilinx_spi.c                           | 32 +++++++---
 hw/timer/xilinx_timer.c                       | 43 ++++++++++----
 .../functional/test_microblaze_s3adsp1800.py  | 34 +++++++++--
 .../test_microblazeel_s3adsp1800.py           | 32 ++--------
 14 files changed, 229 insertions(+), 84 deletions(-)

-- 
2.47.1


