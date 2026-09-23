Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA20C9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mwf-0006Cr-27; Wed, 23 Sep 2026 09:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Ms3-0000YA-1R
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:18:49 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mrz-0006ym-VL
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:18:45 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33c24422d4dso1025632eec.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169522; x=1790774322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gvdLUze2sQ9rH6tf9YWuWP18ipAcGMhXKG5e40lFeJk=;
 b=Wkekr3xBTMb/tlyRiVFgD6YewEU+fcWEHeoOJ5mTTwWDdGd5JeEXIJAhTP7AmzCs7b
 +gVUeziw2Dtw2cp5WdYKuDj2BFVSRlZuQhPvM86tSNYfdlvLvSxTMV7XUNRUHdV1K5mJ
 GWKI2fAHx3c2aLzeTrOfaiXTp5nJgXM6R38S5aXESu5FopYgTefUlVVtEsxQlrfEj6FI
 wWJv2MH5tYkj+uEvPWKAAauukc09fjQovqNnCaUTC0taJnONHC9AXoSCCadkKjQ5M2xX
 Caj/mI0yIlZmze0a4h0iOQnpLzWzlgbP3nWbCcooqyAYzwGK8IQglTtgMG6YVjlFtY7/
 3f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169522; x=1790774322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gvdLUze2sQ9rH6tf9YWuWP18ipAcGMhXKG5e40lFeJk=;
 b=c6lfi3UksUv2oHPTrWLJGFixSKaGXabtL3dINlcySGAcudDZlHO317JrQtBLPyGdvR
 u6smbnui2FdXjzg3c073qYBQeZX7/HdEpj/E0h9vV2n0ihkpF7hxKtmd/Aic2lH/1zz9
 FBfnw3EziNeseikjMi7NCjbiM9Uw391aj0EW44nQkuwm7pd9eyDsRMR7ISRR5+tpt7Fd
 nVBvtwgBnpfCiNmTqUcWKYoNMYZf1GTvVGJpSKaTTZQaoGCfpUat7J4Tahe6g7ZMnPfo
 +ZEAZ/aZBtVgk6+1ssdgRmuMADy238cE+pBYUEtRenrVKp1n26mqVQd4Wk0V6dtvIyH3
 7z2w==
X-Forwarded-Encrypted: i=1;
 AKwUvByfsumDTFEpxuAdaxJm87/Dpcd558NsY7TdK0YUdtvkMRxvo5XbBp+RbWx88HyC1THcUX8dsGUXY/ES@nongnu.org
X-Gm-Message-State: AFuF++l1cs0KG/1GW4pHAkGpnuaIy/R09IdbqZYu8zl62WgkqjalLRpn
 Ec0wvGSHhXx6YXNkIvqJUvesJ9NYvz/Dyy7L9HJjpPFh/hUhYj+r8tXN
X-Gm-Gg: AYBFou33FXCLipCkfIOaBqDfMsfwtf5thGXPhrqx77R4g79cwIUnjIMHk4VHMTCiLQl
 rcpRHKbi+1/a5IlKhPirxuWZgzuTjQ/ubdBfioPTZD9fGEwbZGOKmse8+eMfOUnYT1QGQ2wxkbH
 NabOTQwuwaPapaxHegCbCg8bTLo4c1Y9zaEdTeETwOWR8xCaCIxUF4Auymqo2npDjW8vv2WmVq3
 R9f79kZ4MwiM3LWzmWHKZ5GX4XSC/u2RhIuelhNbw/6yPI+aUnw1f9Z1msfNCRzbQ4bbu8+nWcO
 gxSjqdBb8qoi9gUwFX3qqTBqBH9JgB3ilJGuLnPNNGY3308Ua9aIMu3aWMaMc+pSwtihNNgIuoL
 nOdoPoZwE3hnB6maum/gens6XbfY73LvEgQt7Ajce76AxWwV28PbHlf3FYl4A29vuOaYBVLw2mK
 FbAO/NML64D/8vKTCCVMhZjPTOzTzyUZCbScs0Vts4/9vBQfKhImUewL5xk7HJRG8gBb1uzH4eJ
 x+jBtrSd0ng1LRycF0fco+lsLv1qoM=
X-Received: by 2002:a05:7301:3a99:b0:30f:1e28:fb5d with SMTP id
 5a478bee46e88-33e8d6d03a4mr2458825eec.20.1790169522434; 
 Wed, 23 Sep 2026 06:18:42 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:18:38 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 011/114] kconfig: rename REGISTER to HW_REGISTER
Date: Wed, 23 Sep 2026 21:14:45 +0800
Message-ID: <20260923131635.1894-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rename config REGISTER to HW_REGISTER. register is a C keyword, and a
later TargetKconfig commit will use it as a struct member.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/Kconfig          | 2 +-
 hw/core/Kconfig     | 2 +-
 hw/core/meson.build | 2 +-
 hw/dma/Kconfig      | 4 ++--
 hw/i2c/Kconfig      | 2 +-
 hw/usb/Kconfig      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index c92ca2b13a3..94f963f2944 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -85,7 +85,7 @@ config XILINX_AXI
 
 config XLNX_ZYNQMP
     bool
-    select REGISTER
+    select HW_REGISTER
     select CAN_BUS
     select PTIMER
     select XLNX_BBRAM
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index d1bdf765ee8..839e249b9d0 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -29,7 +29,7 @@ config PLATFORM_BUS
     bool
     depends on DEVICE_TREE
 
-config REGISTER
+config HW_REGISTER
     bool
 
 config SPLIT_IRQ
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 8fe776d2c86..1c645d7041d 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -21,7 +21,7 @@ system_ss.add(when: 'CONFIG_GUEST_LOADER', if_true: files('guest-loader.c'))
 system_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
 system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
 system_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
-system_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+system_ss.add(when: 'CONFIG_HW_REGISTER', if_true: files('register.c'))
 system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 0a23e7d7b87..8f221b20634 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -16,7 +16,7 @@ config I8257
 
 config ZYNQ_DEVCFG
     bool
-    select REGISTER
+    select HW_REGISTER
 
 config XLNX_ZDMA
     bool
@@ -29,7 +29,7 @@ config SIFIVE_PDMA
 
 config XLNX_CSU_DMA
     bool
-    select REGISTER
+    select HW_REGISTER
 
 config K230_GSDMA
     bool
\ No newline at end of file
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 0766130b596..3482f475cf9 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -20,7 +20,7 @@ config ARM_SBCON_I2C
 
 config DESIGNWARE_I2C
     bool
-    select REGISTER
+    select HW_REGISTER
     select I2C
 
 config ACPI_SMBUS
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index e8c00f813a6..43771291a06 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -137,7 +137,7 @@ config IMX_USBPHY
 config USB_DWC3
     bool
     select USB_XHCI_SYSBUS
-    select REGISTER
+    select HW_REGISTER
 
 config XLNX_USB_SUBSYS
     bool
-- 
2.52.0.windows.1


