Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2E3C3064D
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:10:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM7n3-0001DR-1R; Tue, 25 Jun 2024 11:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7n1-0001Ce-7t
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 11:08:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7my-0006PY-JA
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 11:08:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-70679845d69so1899170b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328135; x=1719932935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlnNdGhu04ossposrlJzR1bD3NKaX/zo3I7lspvtgbQ=;
 b=k+euOehwtAsnCIXdp+q1irZu49z1Z5GVos5dpwHH+ORDa34pNDHnfe0C5lnspYeRV3
 PluWG2uAaytIyrI4WMx0u+z/LkM4eMA4bncPrRR22yUy67EoVb7HwA+I1eXWRjL6kl/i
 5WGVycZcQQ5HIz498vJHX0MEcBiWilpp8HlfhkcRA45Y0xs5KQkv9K8vzaK8Dnu+uZG/
 S574oY9K2oYVDN5dh7qcq8FwpfKIBhr/2niCkpjs2MEWffZ2EmYjRzvybbIV+IxSjDR1
 aW3Yt5fLHezBTq2Y7qvuRnrJgRewqKZVGxewh7xiuK6g0p+664Ysfp1Lu7JT5WsS3qyc
 rJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328135; x=1719932935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlnNdGhu04ossposrlJzR1bD3NKaX/zo3I7lspvtgbQ=;
 b=Biya/JdJExKZHj2RrEn7ue/lngt+9pSvu+gzSOR2us5/fi5slQEAL4wnQzSVdD1OoN
 /5A4FKIS7p/yItmIrETT5lgoux3DsBK3hFM/jNwY+6/b5qhAc0URMTDJiJPP745eCOgr
 An7jtNOC0fwDmWNxc6oWb81CZDJDC/oovg//eRz+3+D/94o8iAkH0e4p6Y3HuNHkeMUX
 dPY8xWd2CNa3tuwHhyhj8RA/Q82TtDaXiUh9jd4s6ire6MDwiFrYkBWCljIHfu2yNY2y
 KlVp6JlqT8elNOEmsafG/Uvv6wDkibbkAu8wdhVzwtYkwH8ZuuVjVBPLct4ekWWZCFvw
 OcXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHIlApzczJ8rxJcsl7Y1FmQvlE+lQRYAte1SkujJwftJw3vfUs+eZP7LOJqaDyQyoOuIiXCUusYovtPhLzQ2ndBpdakFo=
X-Gm-Message-State: AOJu0YwNwTIR/neI28lg7oQkNPZ5XRoP7YuaOGoCy3II3x4P1G9Nxxfe
 qHd/kzb+6R67n1KqXQYOxv/uOIh+vLMrC+E3ekFoyZ2IFYuo2oz7Pe5HG+W5Rdw=
X-Google-Smtp-Source: AGHT+IEWhCGGVsdSdXYdszp20qjdFCwLDSPgYVmzdVbzlp2oBsp4/hgyj4aqS8zkzvji0pDrTZnCWA==
X-Received: by 2002:a05:6a00:4fcd:b0:706:8066:5cd8 with SMTP id
 d2e1a72fcca58-70680665dc3mr7938064b3a.11.1719328134781; 
 Tue, 25 Jun 2024 08:08:54 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:08:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 01/16] hw/riscv/virt.c: Make block devices default to virtio
Date: Tue, 25 Jun 2024 20:38:24 +0530
Message-Id: <20240625150839.1358279-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
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

RISC-V virt is currently missing default type for block devices. Without
this being set, proper backend is not created when option like -cdrom
is used. So, make the virt board's default block device type be
IF_VIRTIO similar to other architectures.

We also need to set no_cdrom to avoid getting a default cdrom device.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5676d66d12..e578c6dba7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1746,6 +1746,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
+    mc->block_default_type = IF_VIRTIO;
+    mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.40.1


