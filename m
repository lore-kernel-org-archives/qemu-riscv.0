Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F40D58D4C
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 14:09:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFZkE-0002rg-Dt; Mon, 25 Nov 2024 09:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZjy-0002dF-92
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZjv-0006h4-KB
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3823eb7ba72so3038695f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543618; x=1733148418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IiajgqU0R6qJd99dKLrlrhZ7TYSpLeZ4tGBPN+dLT/4=;
 b=Hymtg7DN3CtEUJQ2HXWjZEJLEiEFN2iDj5hmiX2HxdddJdBGjpLg6OQDzddh2+MhxW
 JGsc3WK/fZYrLHkVS7j6zMJbzUwsubaLuBI04qkmXm9fkcPXX/RxPfFJQFwTSzvDuFGK
 cKsKF/h+krsFTC62fCLwn6sG7wEcsKhi+jt8jTsOWwEYxP8GkIl8TqlFaxx+Cf0VFNze
 L6I2h1yYe8USCRUsF+CE35oMrlvW6wHAJAv209AWu7PuikaNdCDOmMTSu0nW2Fb7qa1P
 z0Nq1X4DrdWNcooNjlaSouPT34kk4FBUShyppw6ymCxR3a1a36EE2+w9IOh29OeHcoGE
 einA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543618; x=1733148418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IiajgqU0R6qJd99dKLrlrhZ7TYSpLeZ4tGBPN+dLT/4=;
 b=oDmgtPTNgV+lU+Yxtu9x3V1h3UykE/kjOXFoDK6Vf+hTbIOT/y/GCYptslkfG3+AfM
 ipvZ44Tpb8BducGswjgcu6vACwTkFTP3xfTbxjnj5VmNTEYJCwMfvKzNaXgUtIFsIq7x
 e7jMKZi2Qa6o1QhRPc4CATOt7QiNKQh30CGfJUnY2/EKcREV9fMbDBOgf+NWhJPtQy1A
 0Mqh4plz4QSUOFByvzM1RNT8TBCgwZxUzt/ygjqg8qpcPy9UzzRL9x+H0hUtYEkLpGNQ
 21DiI7rpT8E2xL/J1u1k4tKPuw1lmafitytMWoviuJhRHQWXTC1bY+07OuM+C5CCRpyR
 SC4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD//0bT7ZFJA7hjdYoVp/wTgKyRA1guDNZTcpKJWRxK/u8TYNloFo7oVZAEz/rER0fAj4ScZJkEGMw@nongnu.org
X-Gm-Message-State: AOJu0YyLE6VScJ6yY9JQDW+z4h8cKxE6r71JlbTeF3vU4bGysyW3wQPk
 GFLKrKMjFZBes2IRnkwSyBLvEgaEb6dlQi74FPdYt//63WojWIqkvfM9tM9HSNo=
X-Gm-Gg: ASbGncsBJbpxOysuDhUw6XP3F6Eu+DQcojQY05Uo4+w3KVSXXCChNJ3q4/3Oe7hXrFu
 5OCBO0Syt6z2in6UxAI6Eh5druZi6ucoMrpS6KzPOdC4MzhdoOfxoFZ2LugKSSQigsUDHF7Upa+
 YRcv46kFUZ9woLB+/TU2xt4/2HHsnirX9ZogaVY57VRce5WTTD72XwqlTMuxt64tZimIX+lVE/L
 eQWCPaWDAC2WAp+QxSeLx+rcTbZF/BBJvhtQrxKy8JBX7IRbbjMQ7AXL2qMdXRXlkQtu45b
X-Google-Smtp-Source: AGHT+IEbMTslBWjVJ/ZQJGNZcc20lIvjNZnOwDeTLhcqdp2adAIriNC1WFJGSKWJvSJwEpRqnmddYA==
X-Received: by 2002:a05:6000:1541:b0:382:4145:d3a9 with SMTP id
 ffacd0b85a97d-38260b69577mr8877857f8f.25.1732543615913; 
 Mon, 25 Nov 2024 06:06:55 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad62fasm10436999f8f.15.2024.11.25.06.06.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:06:55 -0800 (PST)
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
Subject: [PATCH-for-10.0 4/8] hw/arm/virt: Set PCI_BUS_IO_ADDR0_ALLOWED flag
 on GPEX host bridge
Date: Mon, 25 Nov 2024 15:05:31 +0100
Message-ID: <20241125140535.4526-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

See commit 74de8c3568 ("hw/arm/virt: Allow zero address for PCI
IO space"), all ARM Virt machines set this flag.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a381e9a2b..773df5f04b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1510,6 +1510,8 @@ static void create_pcie(VirtMachineState *vms)
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "allow-io-addr0-accesses",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
@@ -3124,7 +3126,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #endif
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
-    mc->pci_allow_0_address = true;
     /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
-- 
2.45.2


