Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBts-00016C-KB
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtn-00012v-EB
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:19 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtk-0005an-PG
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:15 -0500
Received: by mail-ej1-x635.google.com with SMTP id jo4so85999914ejb.7
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2g0/bIHuF6JENINR0ukwrslIoZo+6BphJxXJPFuUoA=;
 b=cHbFn/dI7fHDxK0+Cvs0oyq556Oz3wGu7uHHU6r+Qd8AasfMWlllthzE00jKPqqy72
 QzkTgUBdFqEc0koPdE1mgQiwTcn+ST40jN9eYR9Zm4xFJgb8MkYG1xBl9jO/0muUJC4e
 irHCUS7u+zebYjNmSmTpn8mIAurnMUGzcxkbiQS3nlpl+F/Rtb5ct+Lb3B2ZMc6+v7q7
 o3pDMCmHyKs7JT/iO4WgvhBbZDYpLLGA+NpuFxfCA+kjHjlQimNpSkKDyXyTqy9fRywy
 ym4apnExO41EBzYdtNdVyxrw3vN1CpXjdaYXJgumfU2D0EkpjSHTLL1p/nOAmOoPll1/
 Cmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2g0/bIHuF6JENINR0ukwrslIoZo+6BphJxXJPFuUoA=;
 b=R8MNrauilBvb1SbgYGIucQdOrscb2HPmi+ypfSG5j4GmWzSn8wruIA9v1rTmKqqF0V
 0muiMd5+RAWPPy+jSEP2834QPUcSC8sazZgL6fmRllTNSn1twwb7AF5bOwiy3jqCVNJx
 pHJINgNQltT/35oxTlmG+t0/hgT4PgVhXCb33xUtDm3kvrmBLXlNrKiwXA3TiVnaX9Ft
 JJx4WhFFrWy6YpTmoGS5KZUvO8V09JqWI7udZ78uAyVyy0MKQ2QucL2F0VzNu8u1Po/m
 WSRcQSwupiMyZAF/sWrCxkqNcRoL4eYqGpY9Xt2q1pionb+vvGeYUQc/JsWbDOT7Bp0Q
 2f3w==
X-Gm-Message-State: AFqh2krGXiarsrJLvJkU5Lxlv7RkFmuzrvYY6BMd5YR57+EVdHa/8KNd
 h7gPbwY4vvn4drHo/MELprVy1w==
X-Google-Smtp-Source: AMrXdXvdTRePASLl9eMl7xbRwkPnlSIeH+UE+hYG04A/Tqgx5GyFrtVautv8eelLM+nXkVv8zhlPZQ==
X-Received: by 2002:a17:906:ecf7:b0:7c4:f6e4:3e92 with SMTP id
 qt23-20020a170906ecf700b007c4f6e43e92mr49876646ejb.31.1672869971229; 
 Wed, 04 Jan 2023 14:06:11 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b007c4f8bc322asm15644296ejc.196.2023.01.04.14.06.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:10 -0800 (PST)
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
Subject: [PATCH 09/20] hw/block: Factor pflash_cfi01_create() out of
 pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:38 +0100
Message-Id: <20230104220449.41337-10-philmd@linaro.org>
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
X-List-Received-Date: Wed, 04 Jan 2023 22:06:19 -0000

Currently pflash_cfi01_register():

 1/ creates a TYPE_PFLASH_CFI01 qdev instance
 2/ maps the first MMIO region to the system bus

The first minor issue is the implicit sysbus mapping is not
obvious (the function name could mention it), and the function
is not documented.

Another issue is we are forced to map on sysbus, thus code
wanting to simply instantiate this device are forced to open
code the qdev creation.

This is a problem in a heterogeneous system where not all cores
has access to the sysbus, or if we want to map the pflash on
different address spaces.

To clarify this API, extract the qdev creation in a new helper
named pflash_cfi01_create().

We don't document pflash_cfi01_register() because we are going
to remove it in a few commits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 34 +++++++++++++++++++++++++---------
 include/hw/block/flash.h | 14 +++++++++++++-
 2 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 866ea596ea..6a8f9e6319 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -953,15 +953,13 @@ static void pflash_cfi01_register_types(void)
 
 type_init(pflash_cfi01_register_types)
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int bank_width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be)
+DeviceState *pflash_cfi01_create(const char *name,
+                                 hwaddr size,
+                                 BlockBackend *blk, uint32_t sector_len,
+                                 int bank_width,
+                                 uint16_t id0, uint16_t id1,
+                                 uint16_t id2, uint16_t id3,
+                                 int be)
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
 
@@ -980,7 +978,25 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
     qdev_prop_set_string(dev, "name", name);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
+    return dev;
+}
+
+PFlashCFI01 *pflash_cfi01_register(hwaddr base,
+                                   const char *name,
+                                   hwaddr size,
+                                   BlockBackend *blk,
+                                   uint32_t sector_len,
+                                   int bank_width,
+                                   uint16_t id0, uint16_t id1,
+                                   uint16_t id2, uint16_t id3,
+                                   int be)
+{
+    DeviceState *dev;
+
+    dev = pflash_cfi01_create(name, size, blk, sector_len, bank_width,
+                              id0, id1, id2, id3, be);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+
     return PFLASH_CFI01(dev);
 }
 
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 25affdf7a5..40ba857f69 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -11,7 +11,19 @@
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
-
+/**
+ * Create and realize a parallel NOR flash (CFI type 1) on the heap.
+ *
+ * Create the device state structure, initialize it, and drop the
+ * reference to it (the device is realized).
+ */
+DeviceState *pflash_cfi01_create(const char *name,
+                                 hwaddr size,
+                                 BlockBackend *blk, uint32_t sector_len,
+                                 int bank_width,
+                                 uint16_t id0, uint16_t id1,
+                                 uint16_t id2, uint16_t id3,
+                                 int be);
 PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    const char *name,
                                    hwaddr size,
-- 
2.38.1


