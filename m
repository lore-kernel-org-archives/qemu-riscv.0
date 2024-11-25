Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EB9D58D4C
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 14:08:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFZkM-0003Ow-SN; Mon, 25 Nov 2024 09:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkH-0002yk-J3
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:21 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkG-0006nM-0P
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:21 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso4946052e87.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 06:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543638; x=1733148438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBLNIub1rHgG9lgkZtJGEcAkQWIxnGXQvYMrFBUCUkM=;
 b=r49EAaORrweJ0acZ+vN1kcF0cl2h0eCeGluLRmLmKHk82Ymo7UFzC80RqJiSxfdAyW
 WzDON1b26XTh52Ek0EFYgC1XAWQIGnubM+jWL6HU3oPGK3Pd+ZNx4kkMCH+pU4RiJxtp
 pbqHJmOopgb3UX/1mp8Z0cUMymlM8d7K29a0gKlMIhgOf5gQ4tb8mdKyebk/I+vl5lyP
 BsrI9sjCTc6KxS+vRO3+w0397mZd30blEN29VGAQ/1MjSIHKiTd3WKzJA1KHN5bhI6l9
 ERwGskz3NXEnTb9shJMQHN/dKaCxGTl9EjnLCnUpzdH5U/IN8PT+l3NKgS4uOVjGXBRs
 Dl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543638; x=1733148438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBLNIub1rHgG9lgkZtJGEcAkQWIxnGXQvYMrFBUCUkM=;
 b=bU6casmwxd9GUH9Pd552agUOg0XmXExdCHegL8p3wxhA0FBvloZCpfqozIbS0CrrNO
 mgIbk8Kjkm2lkt+YJwDHFNMgG+MFn+DClSM3qkq81rAoFqY07EW6Zbo04k7cuCHGOgBq
 WT/nV0anvNxSrRgKWOEdVOqh9y+HesAdv5dAtfvHkCpus84qGeSc80J2dGclogVBsX6d
 bDq8sUmkkkqN/TIQE7o8dSUwVEw6h+hHqadmXn/LNFX4wApDew9odm3Pb/3/cxNWd3yX
 2YUuWRjgWIWFSm+/VpzrXWIp3o87PX4N/hDPhnXrqDONbCMIXXgMMd3y7fp+y9HFhLib
 W1Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9y7Dp7ullJAtzFwBOqaY5z/1uMC8HKQNl9bRpSFMsrlSWzBn4VHU0mIZI4aKEKw8iW9a+IcR2fBNW@nongnu.org
X-Gm-Message-State: AOJu0YzXxOWuM2RYXoxodMYf+ae+L3GEDs3XGFjfb5JzRv4wg1+/i/OY
 YbTaGj6tWkUgS0e4siEEnSCtAp2Rbz5FC/YYvgclt91qBb120SkgTT+8de/+XCg=
X-Gm-Gg: ASbGncvbMwopqJSjBy7QAXhv3zczt41W8aXe1SSRtEAr3jO9lnRALn+FE3xLe3h7Dmc
 QgiIqZ2TscslvdhtNIa+VCLt8ICu583/7SW8PowZUBQi98Ri2Kyhw4Ja4qK2OhrWAH4+74NRIPZ
 b04EZiZBlcV77ZjtB6aGTQEu7iqQOP6PNXePb6vvuYbYJ+e6p0ZfjdVrMSkfywoT+/J4b6iKJg1
 PqZTS2DDUMc+OJbS4DJUlwONCYa/daFlyj4CXBO3cQn8A2D2W2YqbEV+noJ7+jpGEcRzdcv
X-Google-Smtp-Source: AGHT+IHH/FCkk9WPtIQpVEP5wU4V68G/R4U2hl6XCtnJXDl+e9ubIMh6z10GVU3d7ELLKLqvnMh97Q==
X-Received: by 2002:a05:6512:e87:b0:53d:ddd1:adf5 with SMTP id
 2adb3069b0e04-53dddd1c480mr2858013e87.12.1732543638183; 
 Mon, 25 Nov 2024 06:07:18 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbee043sm10499689f8f.104.2024.11.25.06.07.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:07:17 -0800 (PST)
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
Subject: [PATCH-for-10.0 7/8] hw/riscv/virt: Set PCI_BUS_IO_ADDR0_ALLOWED flag
 on GPEX host bridge
Date: Mon, 25 Nov 2024 15:05:34 +0100
Message-ID: <20241125140535.4526-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
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

See commit acead54c78 ("riscv: virt: Allow PCI address 0")
all RISCV Virt machines set this flag.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2feb851f15..4e1ce3a423 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1156,6 +1156,8 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                             pio_base, NULL);
     object_property_set_int(OBJECT(dev), PCI_HOST_PIO_SIZE,
                             pio_size, NULL);
+    object_property_set_bool(OBJECT(dev), "allow-io-addr0-accesses",
+                             true, &error_fatal);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -1803,7 +1805,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
-    mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
-- 
2.45.2


