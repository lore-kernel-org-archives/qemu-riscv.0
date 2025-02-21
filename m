Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF3C021B3
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:39:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlV6R-0006A5-2b; Fri, 21 Feb 2025 10:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlV6O-00069G-PS
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 10:38:08 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlV6M-0001UU-So
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 10:38:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2fa8ada6662so4559441a91.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 07:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740152285; x=1740757085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yMAi4wNnnxwC+8z3Dgpqeq0wKNVZkgl25zc7VptcZp0=;
 b=Tqd9pI1B2BkcV1iUSH81P1DY4nwjoE7zYXeZssIhLpeX8b7qx9CsYG1ThFG6AgzaId
 2eQsHQSpUs540AChDV8VNZ4+WHH1MAQJCiCKXISqH4OgK4kymSHyiWdTzvBYx9+kUzt0
 3CP5sLWyIgKIW3EIb4pwW1dIhXataBKK3HE/jjzhd2hQuna50B5rsrOz05TaJPoAorFL
 2O2F4r5MzjsfED3uobIYiLsDQdY56fpo6Asq95ELZHEbx948003BvJBUS3RTWy7W6xa8
 BjqpFseDSbyW7C7p1tOj0rxeVFaQtPLdxceXXE3KD6qJaFSd5Tnf7RA0rhP+pdeotFaY
 z7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740152285; x=1740757085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMAi4wNnnxwC+8z3Dgpqeq0wKNVZkgl25zc7VptcZp0=;
 b=X8wDfxMrMFrHcxi62YIiZE1ZhomGuY0AyynuAw+dJLdyYWveKAJp1Ibln8OpZABEBl
 WETbZ2Cx/cccZuWVNaK+D9kcAZk8k99A1WulMBTRr3vFj8UyomUu17rUVJReHvh9D47r
 o2ohqcsoUpDRVP22YbVysG+Ng28dB5t/ehtY8pZtLJX9b4Irj47E/ORMfd2GeVPciT8w
 2aAttrFH0CP/76RMJagQt6sTGwRmbg9cETZUAdLczflWp34XH+09o+qEavsPKAFIVwIv
 uT0chRMSfdHuI3HWi68XTt2z2V/4l6ILTaTC3HBGVzuujciQO28HQVM+tjgeuOGxAXa5
 zqpQ==
X-Gm-Message-State: AOJu0Yxdf018tMZyXzvkZ2jOYEWgUAkTxro4Y7VBKI8VB+I0DA0h0wjp
 Iou/JEzg7KwEBsvwb2mMitEighM+O9D7fK3vutfzaTx1wRYVw6rrfUxMZaHaOOo=
X-Gm-Gg: ASbGnctD2kd+gTK9/ebuqD1Xe3hcL5R3Q/3eIwAfsLfc4I5st0snbiHN+DdLhlg51fj
 zWMsBsw3Ssbycj4WNoac4sWT2gSN4RSLEMKmOqfGS579mXn8TBCTge+xfp/++22K+x9U3wdQVFY
 BJrcOwOI1bHv2HFMeUVo0bI0jJ7mZJhWwhNfpHL/29n++iU0mC3H0jYv/DEVn+hgbgId8g39qxb
 RUjvCj+vyhHaOByMMfOy9Zj74XtVzahC6qelB3CTDZ+TMaS/sQDKrrSQpQ6KIS7hKjuzxVkmz7E
 E+uXJPi3Vqsuv3AJ9KinyjNnfq2xRXi9wzUINYE2KvXmFm6kl1Rbxw==
X-Google-Smtp-Source: AGHT+IFPzk0mV1m51BdJ1Pgojtak96Uz7LBVtg462kp+zixPvK7CNzf821UOEv39OM2VKz1AflO7GQ==
X-Received: by 2002:a17:90b:3b83:b0:2f6:d266:f45c with SMTP id
 98e67ed59e1d1-2fce868c637mr5649127a91.2.1740152285269; 
 Fri, 21 Feb 2025 07:38:05 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.11.154.120])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb04bedbsm1538081a91.18.2025.02.21.07.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:38:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/3] target/riscv/kvm: update to Linux 6.14-rc3
Date: Fri, 21 Feb 2025 12:37:55 -0300
Message-ID: <20250221153758.652078-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
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

Hi,

In this series we made changes in the commit msg in patch 2 to make it
less ambiguious what the KVM driver will do with ziccrse. 

No other changes made. Patches based on alistair/riscv_to_apply.next.

Changes from v2:
- patch 2:
  - reworded commit message
- v2 link: https://lore.kernel.org/qemu-riscv/20250221141834.626722-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (3):
  linux-headers: Update to Linux v6.14-rc3
  target/riscv/cpu.c: create flag for ziccrse
  target/riscv/kvm: add extensions after 6.14-rc3 update

 include/standard-headers/linux/ethtool.h      |  4 +
 include/standard-headers/linux/fuse.h         | 76 ++++++++++++++++++-
 .../linux/input-event-codes.h                 |  1 +
 include/standard-headers/linux/pci_regs.h     | 16 ++--
 include/standard-headers/linux/virtio_pci.h   | 14 ++++
 linux-headers/asm-arm64/kvm.h                 |  3 -
 linux-headers/asm-loongarch/kvm_para.h        |  1 +
 linux-headers/asm-riscv/kvm.h                 |  7 +-
 linux-headers/asm-x86/kvm.h                   |  1 +
 linux-headers/linux/iommufd.h                 | 35 ++++++---
 linux-headers/linux/kvm.h                     |  8 +-
 linux-headers/linux/stddef.h                  | 13 +++-
 linux-headers/linux/vduse.h                   |  2 +-
 target/riscv/cpu.c                            |  3 +-
 target/riscv/cpu_cfg.h                        |  3 +
 target/riscv/kvm/kvm-cpu.c                    |  3 +
 target/riscv/tcg/tcg-cpu.c                    |  2 +
 17 files changed, 156 insertions(+), 36 deletions(-)

-- 
2.48.1


