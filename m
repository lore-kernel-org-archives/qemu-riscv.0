Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D1EC001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 11:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOyAt-0003Nz-1q; Thu, 27 Jul 2023 06:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyAr-0003Nk-PC
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:24:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyAp-0003qS-Rn
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:24:49 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so4710345ad.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690453484; x=1691058284;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZnT1Q8WErd12kgxdkGD9D8FdLhpNbLDy3kENMGSaoY=;
 b=OsGUwNQz4VgyNaIPIUljVifVgxx7n/tlnfIJWosw9ErSHnfw5dZLXYE/qhb0Lo3UGw
 qJZ250yAOKtH/m2ig/aF/L9U55EitjR5Z3Lkhl+SVVEb1fx9bgN5/Eyf066rl6HhOnXS
 pGsUM4HhyXczvWYQ2c/upHIIDJVwkCegmPDm7nNknKJHZuAwHosX59e6dAYDeNKdWuGa
 mkhju5FJePARKw2X2JGf48xt+GRwrkxxp8JdzWg1x8S4b1x5WzVUuJ/jWQH0cmMFA4KW
 e8x5rfl2K//AW0wfq6cU31ifgMuu5RKC7fVl85h66ZM6UcUI2PRhh0njEOiK0M3mBP08
 rbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453484; x=1691058284;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZnT1Q8WErd12kgxdkGD9D8FdLhpNbLDy3kENMGSaoY=;
 b=i3BEWCcIIfUJv/hsgsOEeUl/Gyj8jGBftCDAArhU7O93HefJLoYuU7u2AfeoY/Cjrd
 WeSZdoz4Dm/qvJ0qXM3dJRqJzcP6Tlfm9OoDQhTdrM827+EB2bNifHgfFzMAjN+7vL5q
 e1ZfzotHjjXab8JsixwI0iNzpZfxr9hXEOvVWGj0sZXJ1G9Sz/Gxo6dSET346tGoMPp0
 wIyTa+SPnAmkNy8JSuk0GBOcKswP2MBOFe6O/5rGpO26KLAPw8p0z3B3DfhbcDNXiQtX
 RvV23em5EcxZDKDvDI1+BnWEfVfi/03Z8ZrqUHgw8cuhEljEGM8v182Gwifu+XYiytly
 3ypQ==
X-Gm-Message-State: ABy/qLbpMHCgN1iYRbJbf+vXg8YbjnMrje7FHH+m+FQe3jh5/TI1RYLQ
 0QJHyTqzoTCStptsahTCe3GhAg==
X-Google-Smtp-Source: APBJJlFFh+/w/fy3dhjLDXDiihv4y5gcaCJouW7BLtYrG4Mle3BeOdRL3aFgulrvhOWXvIWAbUw1WA==
X-Received: by 2002:a17:902:d484:b0:1b8:936f:c34d with SMTP id
 c4-20020a170902d48400b001b8936fc34dmr4967829plg.27.1690453483666; 
 Thu, 27 Jul 2023 03:24:43 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b001b882880550sm1230139ple.282.2023.07.27.03.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:24:43 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v7 0/5] Add RISC-V KVM AIA Support
Date: Thu, 27 Jul 2023 10:24:32 +0000
Message-Id: <20230727102439.22554-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series adds support for KVM AIA in RISC-V architecture.

In order to test these patches, we require Linux with KVM AIA support which can
be found in the riscv_kvm_aia_hwaccel_v1 branch at
https://github.com/avpatel/linux.git

---
v7:
- fix compiler warning in PATCH3
- rename the "kvm-aia" property to "riscv-aia" and add it as a RISC-V KVM
accelerator property. also move this setting from PATCH5 to PATCH3 in the code.

v6:
- fix alignment
- add hart index to the error message of ISMIC address setting in PATCH3

v5:
- remove the linux-header update patch since the riscv-to-apply.next QEMU has
synced up to Linux 6.5-rc1 headers.
- create the APLIC and IMSIC FDT helper functions in PATCH1
- add the irqfd support in PATCH3
- fix the comments and refine the code

v4:
- update the linux header by the scripts/update-linux-headers.sh in PATCH1
- remove the checking for "aplic_m" before creating S-mode APLIC device in PATCH2
- add more setting when we initialize the KVM AIA chip in PATCH4
- fix msi message delivery and the APLIC devices emulation in PATCH5
- fix the AIA devices mapping with NUMA enabled in PATCH6
- add "kvm-aia" parameter to sepecify the KVM AIA mode in PATCH6

v3:
- fix typo
- tag the linux-header patch as placeholder

v2:
- rebase to riscv-to-apply.next
- update the linux header by the scripts/update-linux-headers.sh

Yong-Xuan Wang (5):
  target/riscv: support the AIA device emulation with KVM enabled
  target/riscv: check the in-kernel irqchip support
  target/riscv: Create an KVM AIA irqchip
  target/riscv: update APLIC and IMSIC to support KVM AIA
  target/riscv: select KVM AIA in riscv virt machine

 hw/intc/riscv_aplic.c    |  56 ++++--
 hw/intc/riscv_imsic.c    |  25 ++-
 hw/riscv/virt.c          | 372 ++++++++++++++++++++-------------------
 target/riscv/kvm.c       | 196 ++++++++++++++++++++-
 target/riscv/kvm_riscv.h |   4 +
 5 files changed, 454 insertions(+), 199 deletions(-)

-- 
2.17.1


