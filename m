Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBvT-0002Gl-LU
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuU-0001u7-8c
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:08 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuP-0005fU-Nw
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:56 -0500
Received: by mail-ej1-x62d.google.com with SMTP id u9so86133519ejo.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hYs50GwFMyuZfrImrAOFNvNLwGPKhd/4T6LtSg8+5M=;
 b=Qz7J1AazlyA7TkFmTghpBG/6vJrDSWHKbTwtiuGnzqK7ApC9+o8bNw/7/IJHgXWR3i
 YCLat9y+G6p6U4z1Kpg2pjsXWAofMcNf3VPViZbRDRonu5xtJoH7vehTtKxZ0iysg2TV
 51nDPAhZ369/CvCFhA1wrvQLQfHE9hyi5sctpKzmJYmKPNY96QunXQUKqfNlp57ltjBX
 04W3bCtp83zOPi5x/zPahdwrU1muZojnmnjz7kMhBE1Hlc9YWFGeqdUQcSxcY8J47jdI
 nJRQ55pvpqcBB3BqRDsxXwLv5GE5q6uWw1t37TvG/snnGG2Wc7Z7otNQf7Em3zPKfU+D
 xp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hYs50GwFMyuZfrImrAOFNvNLwGPKhd/4T6LtSg8+5M=;
 b=umRpqe4Lyw2aymogn2jd/uToCGl/eNnzyw2DK8Y9bfehBEYrzZ2/8jBrGXmo1JIWE3
 515SuWtm5QNxmC0L2jm7YRFR6ymTNAh/EfrLdfNf7C5v0Wy3s2ebP3Ca9DJIZ56+qjCG
 wir3xX4ulQA2p3eZqzwpmR73OqHxaQVq12ZpS4TagQP5doinlbc47A4muFC+jYT6yI5S
 ECZVaRHAS2urZwMfRGL3pomQrzh7a/YYePhuNztg46EZAt+DfSv0KA5F5eR6GUd4pPHx
 vH6rL4esKY1UB5nEJvbbNgF55oRwoRCawpwTfbfrpF4A+bK3rGUypODhWa+sXb35NlCg
 r8/Q==
X-Gm-Message-State: AFqh2kpt7NmcSXI1N6YJ84avH8mWFc1wRx74l3wylamVPBZDXKa8eCvP
 Zj96bsgYmXSoC7J+ce4MYhkfdg==
X-Google-Smtp-Source: AMrXdXvEPyGP9Y3MjxA2zCJwlhAlOPOZDd4IP/hCV2z6pgb093o79PN1kYPD/lVfIFU8jTnGwHbepg==
X-Received: by 2002:a17:907:908b:b0:846:cdd9:d28 with SMTP id
 ge11-20020a170907908b00b00846cdd90d28mr32353056ejb.30.1672870011907; 
 Wed, 04 Jan 2023 14:06:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hb1-20020a170906b88100b0078d9b967962sm15694423ejb.65.2023.01.04.14.06.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 14/20] hw/block: Remove unused pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:43 +0100
Message-Id: <20230104220449.41337-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:11 -0000

We converted all caller of pflash_cfi01_register() by open
coding a call to pflash_cfi01_create() followed by an explicit
call to sysbus_mmio_map(); we can now remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 19 -------------------
 include/hw/block/flash.h |  9 ---------
 2 files changed, 28 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 6a8f9e6319..9df79b102b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -981,25 +981,6 @@ DeviceState *pflash_cfi01_create(const char *name,
     return dev;
 }
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int bank_width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be)
-{
-    DeviceState *dev;
-
-    dev = pflash_cfi01_create(name, size, blk, sector_len, bank_width,
-                              id0, id1, id2, id3, be);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    return PFLASH_CFI01(dev);
-}
-
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
 {
     PFlashCFI01 *fl = PFLASH_CFI01(dev);
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 40ba857f69..858c0a1b6e 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -24,15 +24,6 @@ DeviceState *pflash_cfi01_create(const char *name,
                                  uint16_t id0, uint16_t id1,
                                  uint16_t id2, uint16_t id3,
                                  int be);
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
 void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
-- 
2.38.1


