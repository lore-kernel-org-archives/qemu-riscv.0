Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31644CD98E4
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 19:02:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZZ3D-0001IE-37; Tue, 16 Jun 2026 15:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wZZ34-0001HQ-Nz
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 15:02:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wZZ32-0007T6-LP
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 15:02:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-842848fd613so4326071b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781636523; x=1782241323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=baUIBYzyyEeC7t3l0h6UMGuNFHnGmb9FmCceeSW/S0c=;
 b=VPtI8OPCuoAN2z7+yBMQdn64Do+/duLsmO6KC3zNLlDa6vxak3v2pq7OClMufOF4y8
 orUpKbW7jjhQMAyYVt+YfD+rAZwinzIW9BxhM29V7yUIa738XdcA5cHp72iz30V2pWpD
 rgZO4M8qrUpZmHCqIob8O0jCKhLnuH3JR8UfNrHf5dhWgAuLo0NemuIfGs0s/ZqpgPdH
 7zfjFcMd+/DXDOWTxUjmlC5Qr0L5yArYTPTNzAllKT2dufDh6lyQXho7v1m5jdorHx7p
 JEWUZj3Oe8jhkGXQmjcuLu1fJEN1bskJTIIxo+q5dAuKCdCII+hm/lDEMp9ifhMURYKO
 lvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781636523; x=1782241323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baUIBYzyyEeC7t3l0h6UMGuNFHnGmb9FmCceeSW/S0c=;
 b=ZOyGTtrG7mhIYT3X17UxvjWhNY/k1axK2xiPIYkObRqy6DdFU1x3vCiUlDOXcAoDZU
 KjQ/wcuUAfTdrVqQGLgI9NN9vetOmaJFfzFKW+C+x6Hl9c3738LfDprqFmuVI8PgEpfK
 6TQURN8Jn56XLwqzQ6HtVCVD3hJR6+nGYKQHXkUUSwo5YUHkHvvdpGNxVqFxcV7EpDUX
 XoN6SGQvXyy6ucrjBRIdcxN4aMIzCwk9RfZkU9lYX24ZNKXwxWtjcWG5nrWR0CmD0mks
 3a50a8t+XbJRW+2RvXPZNee56dt1Ce+Vx1m0AWl+ftgAno/Erh9VYS1ogCZO6Jx1tZhE
 dBuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8z+rUfAeaA+GzVP+dvEpNduals1o89KG2N5+prBjwXz/G+CfQ79nvg1biaSeBnIQHUxcyValnvEC8+@nongnu.org
X-Gm-Message-State: AOJu0Yw5V4Jx1SOwLY/Od7/qpCnLSt215cSoTPpeAH0lhsOvSqnuK+cI
 J6E3/U+nPqismRIXmCG4S5ernsNw8hg+te/W9ScjBWRGP/Fg42R00D/Q
X-Gm-Gg: Acq92OFS6NFE+Ea/akLM2vpUFzUxmxcV4O9Vnz9wRwUo7xGeQ/mkEN079SB2bobZfQy
 fueW2I4pxbFqjEzvLvjWqogJhMeaQKBxLGv7WBRf/61TzGJiDRiDGsq92d+8sQEf0CwWb++ciJ5
 Hmr8k/U0eP1WXYsjDjwH8El6r1DsOUrrtyOtsC90LRHWfyEsEBav45vWsMeaWevAhRNg9OXfPMD
 Z6ap6A9lXxmAFVVN82numLj1igOAAyGpLE08LpPT4aBoNBiEVSrjFetuscUMAVPC1P8dpT1b2/N
 5Ud68nQGPLa1NWbiABc4/Xv8nvxzvj8mF3WU2gDFtvBheG1JGrez24GLXE4pAJr+0inOjRRB+Rt
 wKFU9f958S2CC+l/hMq0MyjKNi9DQrhPe3ssKzWXuMvNPOMH5rz+k0TJn1Vo4dHr6FYjB3fLFvs
 RNMRfT9COXg/8+QVqSsqUW+5pNUssUGnI1w4njFGoDxhoXbnS+nNm18b8TaIHSyaPcBJt5u3sV+
 GaKoy0zVTgsRUYh9S8KDZU=
X-Received: by 2002:a05:6a00:1a87:b0:843:46ee:9de6 with SMTP id
 d2e1a72fcca58-8452441df06mr426923b3a.9.1781636523005; 
 Tue, 16 Jun 2026 12:02:03 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434ac9c474sm12671540b3a.2.2026.06.16.12.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 12:02:02 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair.francis@wdc.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 0/5] hw/riscv: Add support for Milk-V Duo board
Date: Tue, 16 Jun 2026 19:01:42 +0000
Message-ID: <20260616190147.1286316-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=visitorckw@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add initial support for the Milk-V Duo board.

The Sophgo CV1800B SoC features T-Head C906 processing, standard PLIC
and CLINT controllers, a dw8250 uart, and basic clock control. The
current implementation can successfully run OpenSBI and boot Linux v7.0
from an SD card to the Linux shell.
---
Changes in v3:
- Rebase on master branch.
- Drop custom T-Head PMU CSR patch to avoid duplication.
- Use REG_BYTE_WIDTH macro in clock controller.

Changes in v2:
- Added link for the custom T-Head PMU CSRs
- Added qtest to validate basic for the dw8250 and clock controller.
- Removed RFC tag.

Kuan-Wei Chiu (5):
  hw/char: Add dw8250 UART
  hw/misc: Add Sophgo CV1800B clock controller
  hw/riscv: Add Sophgo CV1800B SoC support
  hw/riscv: Add Milk-V Duo board support
  tests/qtest: Add qtest for Milk-V Duo board

 MAINTAINERS                                 |  12 ++
 configs/devices/riscv64-softmmu/default.mak |   1 +
 hw/char/Kconfig                             |   4 +
 hw/char/dw8250.c                            | 118 ++++++++++++++
 hw/char/meson.build                         |   1 +
 hw/misc/Kconfig                             |   3 +
 hw/misc/cv1800b_clk.c                       |  90 +++++++++++
 hw/misc/meson.build                         |   1 +
 hw/riscv/Kconfig                            |  14 ++
 hw/riscv/cv1800b.c                          | 168 ++++++++++++++++++++
 hw/riscv/meson.build                        |   3 +
 hw/riscv/milkv_duo.c                        | 124 +++++++++++++++
 include/hw/char/dw8250.h                    |  27 ++++
 include/hw/misc/cv1800b_clk.h               |  24 +++
 include/hw/riscv/cv1800b.h                  |  52 ++++++
 tests/qtest/meson.build                     |   3 +-
 tests/qtest/milkv-duo-test.c                |  70 ++++++++
 17 files changed, 714 insertions(+), 1 deletion(-)
 create mode 100644 hw/char/dw8250.c
 create mode 100644 hw/misc/cv1800b_clk.c
 create mode 100644 hw/riscv/cv1800b.c
 create mode 100644 hw/riscv/milkv_duo.c
 create mode 100644 include/hw/char/dw8250.h
 create mode 100644 include/hw/misc/cv1800b_clk.h
 create mode 100644 include/hw/riscv/cv1800b.h
 create mode 100644 tests/qtest/milkv-duo-test.c

-- 
2.54.0.1136.gdb2ca164c4-goog


