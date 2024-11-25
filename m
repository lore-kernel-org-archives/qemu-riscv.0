Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A0D58D4C
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 14:09:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFZkP-0003Wg-Eo; Mon, 25 Nov 2024 09:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkD-0002so-Mf
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:18 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZk9-0006ke-VZ
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:16 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539e59dadebso4856564e87.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 06:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543631; x=1733148431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CidC1DzNGex4xdl38okZ6dg7MoluQ+zRZMKK1keD2+U=;
 b=LSk6hKmeFAbz8lC7fHUMSEV0llmA1Cp8ZY4J6nZmBlLMWvk3xCgCWJPEHyJqf8U9+3
 l5mU0SMCmTjZPfTTrP7jkkmLGQcxLgv4VJl60KNldTy1Nwfov4U3fkEtZ0P5y+VDPVMT
 WcS+z4Wmb//yCtynd0PqqFNPAMmSc0QS3xRJCClxeACqgIBoOEySOXnzaFaq6Uz1MyOT
 IC9Id3mw8rJyy67zgqQOcfVvxb+e/dQP83k8z+UJ3s2GG9BKkWW4nUIWIbQpEVN5Gcwx
 YPhKmHR8U3S0VBRPNDtvt69pfwHL8+UO68dzSz245AXpqJPVI63Th+IywmkMO+ld/6t+
 6JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543631; x=1733148431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CidC1DzNGex4xdl38okZ6dg7MoluQ+zRZMKK1keD2+U=;
 b=I7XqWzlH+zaSVFctMJrMzWhfWKCZyT3kH2KecG3rod0tYluYqdoioK1XaiHz1xBwGS
 x0Ne7A0fLxgjvvhLG1nyPSFUWAcVWhnv/m0Cw7fqqGf+kJv2Dj+BIBdFPz1niPOh/8Lj
 J5t0MmhKXFdiCjPFaI0GtAivyXSR25F3YvvdjH3hZo34UItyHdw24RNK2CSFTva7Ycjl
 uGGgKqbIh5UMIHmNeMjajwqhAyXpDhPPZhPPgMev8TfI2aWnBCw0D1IgP5bpxXheK1LD
 /0nGTCP5MBM/T03b1I30H6LAhDbevY0gZDgi0q4lhRWMohh5Kq68Pp0EcMSXitTTO+8S
 Xhxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjERCpBRr/enqtd3IT5dr7LS4Zrn/RBYobmBsdbAvwFysVPBHyzg4xaEDsKJU+JCJQRGKHpb485057@nongnu.org
X-Gm-Message-State: AOJu0YyNVqD26Baq+JWU6kn+kKTWXBRPCa1ufSPtFv/NgGE+W1EI6N7N
 gLMa6KvCgm7LBV4cnz3AsYTm5kphxUCpAc5WNrkr1Nge1KhInfQlFuh5txih1AE=
X-Gm-Gg: ASbGncsr7//ZvYBKY/vl1rry93lxkpgLKTJpxrXT5pSU/YxjG2YQOOnmVAw2QN2UHj9
 Mm9DMmGXRyIA2vfSTvd5G3yw0tDikYzV02UnlUI86UZx5NY9ivarNTZrH0sidMnj94pEDp7ehes
 wHuC9lGHBTvZDTIxnsC05etweHhofbs3OFYF+8IRPw9zKkuLfdi5HkOk1G9ddKzdSMqqu9Dqqfz
 B3CuKSIC3wppP0oKucTxU4wJH7/WU2K0TtbzUhIsfCNOSqRNKHpqsMgit1kgxVbDPEkUDYs
X-Google-Smtp-Source: AGHT+IHTjZk1o1vCUns5HUX/W+2Z1zlVuyiGOcQiiDOXLsF9OPmO54VKYQyfoTkRsHRl+oycxqVYHQ==
X-Received: by 2002:a05:6512:b12:b0:53d:cfdb:c65c with SMTP id
 2adb3069b0e04-53dd39b62d8mr5978210e87.52.1732543631212; 
 Mon, 25 Nov 2024 06:07:11 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349ca82957sm63707025e9.33.2024.11.25.06.07.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:07:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 6/8] hw/riscv/virt: Remove pointless GPEX_HOST() cast
Date: Mon, 25 Nov 2024 15:05:33 +0100
Message-ID: <20241125140535.4526-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
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

No need to QOM-cast twice, since the intermediate value
is not used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 45a8c4f819..2feb851f15 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1140,23 +1140,21 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     dev = qdev_new(TYPE_GPEX_HOST);
 
     /* Set GPEX object properties for the virt machine */
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_ECAM_BASE,
                             ecam_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_ECAM_SIZE,
                             ecam_size, NULL);
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
-                             PCI_HOST_BELOW_4G_MMIO_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_BASE,
                              mmio_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_SIZE,
                             mmio_size, NULL);
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
-                             PCI_HOST_ABOVE_4G_MMIO_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_BASE,
                              high_mmio_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_SIZE,
                             high_mmio_size, NULL);
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_PIO_BASE,
                             pio_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_PIO_SIZE,
                             pio_size, NULL);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -1189,7 +1187,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
     }
 
-    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
+    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(dev)->bus;
     return dev;
 }
 
-- 
2.45.2


