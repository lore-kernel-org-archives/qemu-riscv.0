Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBvd-0002QK-Qj
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBvC-0002B0-Nf
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:42 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBv9-0000Le-Kd
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:42 -0500
Received: by mail-ej1-x635.google.com with SMTP id qk9so85788917ejc.3
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aa33f3a7n9BSTQqA7U/LbCvTvRWLOt7Nts6p8HXsEU=;
 b=HF8qRByTAVk8VS2Xa8Bogk8aJuJWs1R6Jucp9qhx2tprzLDSWbbvnoJYLiy9Oz3x7E
 qdkFnt5GpbXnBAAQvXgn/Ydp0wxSxRK8V0vfeGZtXQoWyrDqlEHRQpfKv3uGm69LEhMF
 uEIh95xePAgB91KA5Jc3djKwW4tGt068OiKwrxJIBG2PfdtYsLrbhUdJCVIDlztQz9/m
 8u7ZC9EBr5AQYvvYsAhmhORW87fYg9g+HPLbkHIhlO2adM3HgvU1gqhyEwMqLM0jG+Xr
 XYR+ijDKJVJMDF5sC0HZHQzTVGetnjIvIoZBSXWgP3aUBZ5LgoYLmzGt4C9Y3lL7bQXO
 YUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1aa33f3a7n9BSTQqA7U/LbCvTvRWLOt7Nts6p8HXsEU=;
 b=OIrgEGNJosWqpm+7r66/QgvIiIK7ks1VEnYmh2dY2NbRJS077EzOIRBJ9V761tkeBp
 CnsSUdCc5mJKF2ussSdXbg07GY8gjMWNgkiWDsDL0aAZ4gqN3gsrp4Oajmpz1l6wUvMq
 0UwV/Y1iDYSohJDS/Ra9srEb558mzaTk/0DENtaZRZ4ZZnS3In68Ccql2Goc9miOsWHv
 o9Bh6rErRscK1R/0WZR/Ay/D9if+Xg73xh0ZUz9FEG5F0pgE7Gl1aUL1ueoUC/Q/5k0H
 D7dV5KN7gPaVTpyjo8GqAikhV/4cwTte4065FTv23KsM9o1nokdSN7auwH0jIFrjfqgB
 M+rQ==
X-Gm-Message-State: AFqh2koru1awtj6v+qGbcWPLUdQL/2Z/CWMd7A1TxJKo7iQyHdpiIZhM
 /ea6BZ937O0+rS2XiiNMg8+qoA==
X-Google-Smtp-Source: AMrXdXuggiq8Uz7L/duNqOAgZ/VTLKuh0RN8DCz6J5ifs76v3BLgG/8TypnZIqcASxUNSc1bdjge/Q==
X-Received: by 2002:a17:907:8b98:b0:840:a6a3:41c7 with SMTP id
 tb24-20020a1709078b9800b00840a6a341c7mr44366000ejc.50.1672870057438; 
 Wed, 04 Jan 2023 14:07:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm12959809ejf.74.2023.01.04.14.07.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:37 -0800 (PST)
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
Subject: [PATCH 19/20] hw/block: Remove unused pflash_cfi02_register()
Date: Wed,  4 Jan 2023 23:04:48 +0100
Message-Id: <20230104220449.41337-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:43 -0000

We converted all caller of pflash_cfi02_register() by open
coding a call to pflash_cfi02_create() followed by an explicit
call to sysbus_mmio_map(); we can now remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c  | 22 ----------------------
 include/hw/block/flash.h | 12 ------------
 2 files changed, 34 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 176f93b512..a9dcabdeb2 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -1024,25 +1024,3 @@ DeviceState *pflash_cfi02_create(const char *name, hwaddr size,
 
     return dev;
 }
-
-PFlashCFI02 *pflash_cfi02_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int nb_mappings, int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   uint16_t unlock_addr0,
-                                   uint16_t unlock_addr1,
-                                   int be)
-{
-    DeviceState *dev;
-
-    dev = pflash_cfi02_create(name, size, blk, sector_len,
-                              nb_mappings, width, id0, id1, id2, id3,
-                              unlock_addr0, unlock_addr1, be);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    return PFLASH_CFI02(dev);
-}
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 78b078955e..64ee40c561 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -45,18 +45,6 @@ DeviceState *pflash_cfi02_create(const char *name, hwaddr size,
                                  uint16_t id2, uint16_t id3,
                                  uint16_t unlock_addr0, uint16_t unlock_addr1,
                                  int be);
-PFlashCFI02 *pflash_cfi02_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int nb_mappings,
-                                   int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   uint16_t unlock_addr0,
-                                   uint16_t unlock_addr1,
-                                   int be);
 
 /* nand.c */
 DeviceState *nand_init(BlockBackend *blk, int manf_id, int chip_id);
-- 
2.38.1


