Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BA7C7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:26:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2QtT-0005Iv-7q; Fri, 26 May 2023 02:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtK-0005ET-Ax
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2Qt4-0000m9-44
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:34 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1ae3fe67980so3805945ad.3
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 23:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1685082315; x=1687674315;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/euwtsU1114D46mfjWFRhfdJT8oyHRkrG/dXjugt8XY=;
 b=lfu8ayQKcIo6+SXMQjlFTtovsk37ftwpdIMKlBl/M1EK/DgvUu0S+1VKCOXuAGSbCj
 aPxFDsp9qCX9kCwoWK+kDcWLCifdsYJ86F04L9f3uZeGKfiPxsQKd5KiG87ZYQN2ntIg
 5/WdRklwJxWfezPeWOgj7tGwOWz85KmE5nK96W0EVZZQgI5RyMJTeDOFQ8z0xV5tEmIC
 n2EHMW0Zn5+y0fz7F3ZU7FkPNDsQHB42d9VIT6cSTQz3EMYMioXFPUiVp9Xb4nXgyIrC
 9ghVWkdLyWiNRG1SImZ9/eEZ2vojAZqKCJP8dbU3EWpAH6k97XObxnRHIrpjZYI5EOQM
 GAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685082315; x=1687674315;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/euwtsU1114D46mfjWFRhfdJT8oyHRkrG/dXjugt8XY=;
 b=XOQQ93pPEfkTQxirBhQ+DtrPlg7gWHkfeYWOhvypFbIUY1Mg851xNpNE/xv/pj6iEv
 kW89kOLkACrQ+wAbH0f/POWjTXhtmaLZEi4duvp3ubCIGLjxi8R2cO2yE31cmeNQFf1F
 3mgE6hbBvYa4aZBASVAmyv7TzpNgt8dfjjTvc/3aCLRn+a6YJs6aFIBvtPv3+RZNZjyW
 eflGqFQqxaUVv+JqdDJMlgEMlukZRCN8Vw1hXA9PnC9cCFGWlIWHiZ9Q1u8T+78soBsJ
 serEUwWhCV29B9xmaCa3qD+8LQSL/ME7BH/VlmgX+6JI1VT5tODJBArHi40xEFi/QLic
 x63Q==
X-Gm-Message-State: AC+VfDxegrxOQW2tdHJWSeNfvU4Kn88PBEHG+W4GWbNuZ4JMv2bdZMTe
 cUBNi8oqRXNy+OO8Lv1Isk8xTQ==
X-Google-Smtp-Source: ACHHUZ5V/M3sxTIrWDvx1mvfA0XMCpTLsPPzJfBHUBeg91w+VtLoNiUALHjqLp25kfx9PtfOGKUq3A==
X-Received: by 2002:a17:902:d501:b0:1af:d750:10cb with SMTP id
 b1-20020a170902d50100b001afd75010cbmr1572525plg.63.1685082314631; 
 Thu, 25 May 2023 23:25:14 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b001a94a497b50sm2429150pls.20.2023.05.25.23.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 23:25:14 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v3 0/6] Add RISC-V KVM AIA Support
Date: Fri, 26 May 2023 06:25:00 +0000
Message-Id: <20230526062509.31682-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
be found in the qemu_kvm_aia branch at https://github.com/yong-xuan/linux.git
This kernel branch is based on the riscv_aia_v1 branch available at
https://github.com/avpatel/linux.git, and it also includes two additional
patches that fix a KVM AIA bug and reply to the query of KVM_CAP_IRQCHIP.

---
v3:
- fix typo
- tag the linux-header patch as placeholder

v2:
- rebase to riscv-to-apply.next
- update the linux header by the scripts/update-linux-headers.sh

Yong-Xuan Wang (6):
  update-linux-headers: sync-up header with Linux for KVM AIA support
    placeholder
  target/riscv: support the AIA device emulation with KVM enabled
  target/riscv: check the in-kernel irqchip support
  target/riscv: Create an KVM AIA irqchip
  target/riscv: update APLIC and IMSIC to support KVM AIA
  target/riscv: select KVM AIA in riscv virt machine

 hw/intc/riscv_aplic.c     |  19 +++-
 hw/intc/riscv_imsic.c     |  16 ++-
 hw/riscv/virt.c           | 209 +++++++++++++++++++++-----------------
 linux-headers/linux/kvm.h |   2 +
 target/riscv/kvm.c        |  96 ++++++++++++++++-
 target/riscv/kvm_riscv.h  |  36 +++++++
 6 files changed, 274 insertions(+), 104 deletions(-)

-- 
2.17.1


