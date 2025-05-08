Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42898C3ABBE
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:38:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uD1RA-0006w0-Hg; Thu, 08 May 2025 09:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1R8-0006uW-Kv
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:37:18 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1R6-0003mR-P2
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:37:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22e6344326dso11219245ad.1
 for <qemu-riscv@nongnu.org>; Thu, 08 May 2025 06:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711435; x=1747316235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TBd8qqudhdD0Z8zjZ7s78pINlfboYf1Urx2r0CkJAA=;
 b=S429XQ0tOrkMZD1st2icj26/ufTBgFP10Lh5LA5ngiFSDnES4gFd+cEjJXFfZ9oPJ6
 405pKS8DM7MQGE8v/MZ6j+/89M8IBAUU/FolhHIiFIKQ7WGaIMJgnmb+Z10x4ZWpRy9a
 ueP+qMiJZh8VYl47hoWqA8dkJ8hVc4K9B8M+ZkE5A0maZzsSBmViVk6Sg2CR3cYyZqkP
 /pyLGZGmJmjIct8G4mcCX7/1zy3fgVhDmkphDuWlX0n1wPp4OdtIW6NtRJOtdn6zDFpi
 2plN2zX3Sk/UvGr/847XyLj/iAbX22f/mb39kpcL4iqAq0mgmgiGD9KaHJz4bdtAC13Z
 g4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711435; x=1747316235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5TBd8qqudhdD0Z8zjZ7s78pINlfboYf1Urx2r0CkJAA=;
 b=o/crQqiwDhk4wACJ6PYDXgtM4cnZDcBNP19o62N99XAuNfYNiDFY76x5z4uL98B4R5
 fyfe7aYec783l4aDesW5L5v6S9fJZmbS4o0rOHcf5JjAPykFF2GUdUCcooStKxfUGGuo
 ErwnIrNHIjQWWXk+79RNNfWISkXeCC+9H3tmf4HtFPCytMuDtI1W6YoEL0QkxcEAux8A
 14Y7lR+YGmDXBZNWm2BCs2jUJyBxhg4zE0Fie1AbHFd9+8fV8pyGtHPgrCi+tisIuz+P
 jc6FVFtmzrzIL7YFD6/8kq0oDdKB0VuJYgoiIsNONEzQ/16vMB+rLc+tZFuyiZtqijEL
 HI7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYLRBN6/Wo8sa9eJ7OMB89tH/c8PQ0WTnK2YnDHThtnfb1If290EpidGaW/+Pq2WeA6LqA3Zbn3afy@nongnu.org
X-Gm-Message-State: AOJu0YwHOUzGf8Fhgj5a4PjhdajlW68+dBS3IOx9T8Et4yU2e3+Kt2XG
 cZeWPfDmu80fjZapdslLhMNe23hTxbgHpcSRZWC+b/Jp0NuPNvTR3pSL2Bp0R9I=
X-Gm-Gg: ASbGncuBrr/boRwHnpn+8QiSVCijbkhM6sDkYsHT6ndytiWL3mfPbujqtXGuL/0rKl0
 arSMZAfpWj9SK1YQE9gLJhKulfxYeVl+/xQeDAT+AhsDeATNXXfPzVXKrQyhq7lt4K2S9k3lR7n
 ShmL/Kt6orS2Dse716fJti2+uz9q6bfrHAFgV8jhDDSYwAFWYIPZI4MnzE0odn3Zy10l/f+X9vg
 QFxVqvBKUsYWRrbjeLtAAKkfdxiGjq6gvtS8z8OuwtS0KllNL548jeVQ0rMVNxlrqilJEZ44FOH
 n9YHtDLJv/En4admREK6r09hB78AZmnUU++Gl7omTvd/Swq/TOQxih0nuIKckdn0ycuJXrjhtyM
 noidRDUIRyA6erArO0SxmRlyhTg==
X-Google-Smtp-Source: AGHT+IEJizHNdtE8oY6MH3Ekj+OOYKeRXfM+oPJqKHaH4R/E3Hoh31CNR9MnGx/SSOApYorqKsZYCA==
X-Received: by 2002:a17:903:440c:b0:226:5dbf:373f with SMTP id
 d9443c01a7336-22e8560ce56mr54655525ad.10.1746711435370; 
 Thu, 08 May 2025 06:37:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1521fb4asm111932715ad.113.2025.05.08.06.37.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:37:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 03/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem() with
 '_nodma' suffix
Date: Thu,  8 May 2025 15:35:26 +0200
Message-ID: <20250508133550.81391-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x634.google.com
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

Rename fw_cfg_init_mem() as fw_cfg_init_mem_nodma()
to distinct with the DMA version (currently named
fw_cfg_init_mem_wide).

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/nvram/fw_cfg.h | 3 ++-
 hw/hppa/machine.c         | 2 +-
 hw/nvram/fw_cfg.c         | 7 +++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index d41b9328fd1..d5161a79436 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -307,7 +307,8 @@ bool fw_cfg_add_file_from_generator(FWCfgState *s,
 
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
                                 AddressSpace *dma_as);
-FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr);
+FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
+                                  unsigned data_width);
 FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
                                  hwaddr data_addr, uint32_t data_width,
                                  hwaddr dma_addr, AddressSpace *dma_as);
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index dacedc5409c..0d768cb90b0 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -201,7 +201,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms, PCIBus *pci_bus,
     int btlb_entries = HPPA_BTLB_ENTRIES(&cpu[0]->env);
     int len;
 
-    fw_cfg = fw_cfg_init_mem(addr, addr + 4);
+    fw_cfg = fw_cfg_init_mem_nodma(addr, addr + 4, 1);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 54cfa07d3f5..10f8f8db86f 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1087,11 +1087,10 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
     return s;
 }
 
-FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr)
+FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
+                                  unsigned data_width)
 {
-    return fw_cfg_init_mem_wide(ctl_addr, data_addr,
-                                fw_cfg_data_mem_ops.valid.max_access_size,
-                                0, NULL);
+    return fw_cfg_init_mem_wide(ctl_addr, data_addr, data_width, 0, NULL);
 }
 
 
-- 
2.47.1


