Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2E3C5DF81
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 04:05:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyiPO-00065S-PA; Tue, 25 Aug 2026 00:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPO-00063V-2t
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 00:05:10 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wyiPK-0007bB-Tt
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 00:05:09 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c96c92c0980so2552983a12.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 21:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787630705; x=1788235505; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AUTHHBqmyJCPOXohtw2QY9zPZWECZBFWzrfwTsE4DA0=;
 b=iEad8K1jk4+LZSKJ6M5Nxsip/lCXZ1j/+MQ8uD9ksukj4EeXy2DTjvnhao+79l4ZVS
 xD4/JaT69o70iXGIWvtmXwmkJ1gxHjxWNmW7Nl+ooyGY5Gn/ZdLU22owNIDCpxgZSMMH
 ZU+tXG2JUqAcZ9clTnLfw+hT+kHXAeanF1Wn3M/by10sVtgH3v3lpshlOSXHD/oLwdsI
 b0bPIVumx3f8laZj6xn/Mk/5A2g5EFpufNWe1DjMeu25uOwG39G24hBY7trMS+nTclVY
 BzfejBgOLuPgOjYR7YS7nTCxJrUDtIGTa+UVLsohAb3+9z0HPFY73VHeImyQe0si8Mw/
 hGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787630705; x=1788235505;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AUTHHBqmyJCPOXohtw2QY9zPZWECZBFWzrfwTsE4DA0=;
 b=ED/qUweN1jEjvvgS0Yy/vAmuk+U6ldQmhgwlyqNJk+Kxouc5jiij/12Rbhhas51pq/
 CE/TUGCjrL0HO1GS3vMqEpUYghP6fy51MaqDsFB7z4b+Ei2Xdj/P/z3omXTLLJneoiyt
 Grh75UM4jyWnodGqXLUGomY9fpNmA/UBnxa1BjsMqHbmRNMrKLHp56k+1AJx0deYdNtM
 t+uJLY9cCDTpjS0p4QzD9BZ2Ph3C58+a93dcE40D9UEBVn4H6EUtNi8a+bYMXMEFhLPL
 kg34xNP8WV3eNhnMOzuCWDDuumPc7wPqYs6Whf2ou4CKHDD1Vl5GIpuyt/M4F8ZVn2QW
 7CNg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoET5nvcrSnvhm1puIQ5aTzUEqbVVPTncN7SiTcX4GXIM7Kl1XGZfiapMpvoC7KN29tMVl3qufHIZWc@nongnu.org
X-Gm-Message-State: AFuF++n/t+t1G7bioqsgGMbviDRzV1ll9ahHoLOJGgBZTvZUmGB3bJpF
 4NbFzsbt4FNjHxjg+faPIa6T41uI1/g9nwt4jlpGXC3yIv3R4qYDcbcT
X-Gm-Gg: AR+sD11W082Ssp9cHHIYX3sZX6bGqDnErROcef94OAb2bMRuCJaLw7cDk/duw+XWHe4
 qwjfIg2CrqtzWH1sPdB04siKbAGZeHEARx4bxAW3nAZYUR+Au6/CaspoN9H4gAXmhKaSPFtM9eR
 4FHuPsI0Z0+I66eqEMVwzeOHLpx8HiCU48yAIWlV7b5fHcCiF3YN+9HrcHkmk8TG2s+vfGEHm/C
 P/y4XEg9fGERqhlE/r2fID1UjvRCWtDhWIKrzv9DbwcUV5HRC/BApXjinMAwXHUYyXoDHMksz9N
 2y75rAOX2539nzGFdCS4C7bRTzA/DNKS4zQTIwihbbBnaTTRG6dLcWAfg6urM0UfIAFCmQ88YEX
 dUzra6iaPDuj66aZscPTD4YbwafixZwjHgfrCuPxaE7nkz0HZwQdYhHNwZG9cQKfjx5xd0QOxnf
 XxkQG8MuRtKHVKvsEjCj1l7Dk1OW6wziHPJInitDEMEphhRkuwV1fFsbz0ZzeV7tAEr6kHKpf1l
 PS3gl4xZIhqL/ctzPQthKhKQglxMFjmVg==
X-Received: by 2002:a05:6a21:70c8:b0:3c4:3767:adb2 with SMTP id
 adf61e73a8af0-3cd90f41247mr7722021637.1.1787630704648; 
 Mon, 24 Aug 2026 21:05:04 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f909adc8sm34104212eec.2.2026.08.24.21.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 21:05:04 -0700 (PDT)
From: stephensportia@gmail.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Troy Lee <leetroy@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Alistair Francis <alistair@alistair23.me>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
Date: Tue, 25 Aug 2026 14:04:48 +1000
Message-ID: <20260825040452.1322251-1-stephensportia@gmail.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=stephensportia@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Portia Stephens <portias@oss.tenstorrent.com>

The ssi_transfer function comments say that it takes a word varying
between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to transfer
but there is no means to indicate the number of bits that should
actually be transferred. All child classes of SSI_PERIPHERAL class have
transfer functions that, despite accepting a 32-bit tx, only transfer a
single byte; m25p80_transfer8(), ssi_sd_transfer(), ssd0323_transfer().

The current implementation depends on the SSI model to know
what peripheral model will be attached and what transfer size it
expects which is error prone. If a SSI_PERIPHERAL model was written that
accepted 32-bit transfers, it could not attach to any existing SSI
models.

This change updates the the naming of ssi_transfer to ssi_transfer8, as
well as changes the return value and transmit argument to be 8-bit.

Most ssi models handle this correctly already, sending a single byte at
a time. There are a few models that are written to support non 8-bit
transfers but there are no in-tree use cases that connect a peripheral
to the SSI device. These have been updated to use 8-bit transfers.

Portia Stephens (4):
  hw/ssi: Rename ssi_transfer to ssi_transfer8
  hw/ssi/pl022: Fix dropped upper bytes of ssi transfer
  hw/arm/strongarm: Fix dropped upper byte of ssi transfer
  hw/ssi/pnv_spi: Fix dropped upper bytes of ssi transfer

 hw/arm/strongarm.c         |  7 +++++--
 hw/ssi/allwinner-a10-spi.c |  2 +-
 hw/ssi/aspeed_smc.c        | 14 ++++++-------
 hw/ssi/bcm2835_spi.c       |  2 +-
 hw/ssi/ibex_spi_host.c     |  5 +++--
 hw/ssi/imx_spi.c           |  2 +-
 hw/ssi/mss-spi.c           |  2 +-
 hw/ssi/npcm7xx_fiu.c       | 42 +++++++++++++++++++-------------------
 hw/ssi/npcm_pspi.c         |  4 ++--
 hw/ssi/pl022.c             | 12 +++++++----
 hw/ssi/pnv_spi.c           | 28 ++++++++++---------------
 hw/ssi/sifive_spi.c        |  2 +-
 hw/ssi/ssi.c               |  4 ++--
 hw/ssi/stm32f2xx_spi.c     |  2 +-
 hw/ssi/xilinx_spi.c        | 10 ++++-----
 hw/ssi/xilinx_spips.c      |  4 ++--
 hw/ssi/xlnx-versal-ospi.c  |  4 ++--
 include/hw/ssi/ssi.h       | 17 ++++++++-------
 18 files changed, 82 insertions(+), 81 deletions(-)

-- 
2.43.0


