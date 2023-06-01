Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5E2C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:00:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4aPE-0004fW-H3; Thu, 01 Jun 2023 00:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPC-0004fG-Vq
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:23 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPB-0006ED-12
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:22 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-557ca32515eso346228eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 21:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685595559; x=1688187559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O+ePs6tRTgxlUV39sCp1sCbodtLi88s4Kcg24qZRVS4=;
 b=EdE5s8mqQFen0TLN6UTdbt76h73gXNE49apjZyrRbsAm9PpU9kbFKmuvdqKYpZ062y
 LoWU3yGFwED5prAJlMXBgK3pItmb3T+GWULNE6L10pYK8GMDDfG2SWYx2AMA6jSsxhN2
 EgBASPPmmiU9+XxAvkbZ+fZEFmvS447dWT8HjDuz6ac/8L1++HpjZPAt91NPgz1TN48U
 1pJgDIm2CKPTlYw1HgaJmQdumWWfJ/wOL+dSCU6t5Uo4UrmZj4itikk27JjB/TKFeQoR
 UDmsPqN1U7j/97j90QTJL11XfqE2bzPk82GVQ97OqK6lwrogsO2NouG5W8Nmhfmrr/BV
 mElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685595559; x=1688187559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+ePs6tRTgxlUV39sCp1sCbodtLi88s4Kcg24qZRVS4=;
 b=iB2BaI8rsX5OfPt5zo7bYmMY38UQRwi4dEoiY+hFoIaEqw1l3iR/xte6KS9X/Vbm2K
 vrkR+SBUPvq/VpfZG1mwPHhHQvGLEVy4ZfhszqqXNhxSSdcnhdMtwUeDCL5W+uq1F0Ih
 6Hj+Es3r/7LKgKMZ+A2U1l4In/JlLJOUMpxasc8YdZiXYg7K74qi51trXNH9ZLey9SLf
 cifD07ER8PVvuAyR7ka41RCICugH0nxyZSkR9CLmAGA2l7n1WbHwo0l+Ip2YnQZOeNwA
 fq0v/GrD70vLZdhNe0nbKxBfdgCBx4ZMbviHasR9b00E6xsZ+Nu5rFTfq3UUQynzlfWZ
 RVnA==
X-Gm-Message-State: AC+VfDwRz9X045SHOzsQgUxD3EZoZtTtSi5BcMbh2JVyV0GGsGGOjr0F
 mgWPLJEeK5KubB5+otTMK0ftdOvM/hcj5sVthVGyIQ==
X-Google-Smtp-Source: ACHHUZ4pFJdTMLi/qu5MLwYEDfA3KSAUgWt1MGTNPRsK7MtBEgmQ75A/sbtRcXHDHAwzgQt+2bRPZw==
X-Received: by 2002:a4a:4f06:0:b0:555:3ac3:94f4 with SMTP id
 c6-20020a4a4f06000000b005553ac394f4mr4694740oob.8.1685595559343; 
 Wed, 31 May 2023 21:59:19 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a4ab648000000b0055530a42ce3sm3985608ooo.34.2023.05.31.21.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 21:59:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v7 0/3] hw/riscv/virt: pflash improvements
Date: Thu,  1 Jun 2023 10:29:07 +0530
Message-Id: <20230601045910.18646-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series improves the pflash usage in RISC-V virt machine with solutions to
below issues.

1) Currently the first pflash is reserved for ROM/M-mode firmware code. But S-mode
payload firmware like EDK2 need both pflash devices to have separate code and variable
store so that OS distros can keep the FW code as read-only. 

The issue is reported at
https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1e53c619ce60587f6

2) The latest way of using pflash devices in other architectures and libvirt
is by using -blockdev and machine options. However, currently this method is
not working in RISC-V.

With above issues fixed, added documentation on how to use pflash devices
in RISC-V virt machine.

This patch series is based on Alistair's riscv-to-apply.next branch.

Changes since v6:
	1) Updated the documentation patch as per text provided by Andrea.

Changes since v5:
	1) Added KVM use case as per feedback from Anup. Updated the documentation
	   patch that only S-mode payload is supported for KVM guests. Tested with
	   KVM enabled.
	2) Updated tags.

Changes since v4:
	1) Updated patch 2 to avoid accessing private field as per feedback from Philippe.
	2) Updated documentation patch to add read-only for ROM usage.
	3) Rebased to latest riscv-to-apply.next branch and updated tags.

Changes since v3:
	1) Converted single patch to a series with a cover letter since there are
	   multiple patches now.
	2) Added a new patch to enable pflash usage via -blockdev option.
	3) Separated the documentation change into new patch and updated the
	   documentation to mention only -blockdev option which seems to be the
	   recommended way of using pflash.

Changes since v2:
	1) Reverted v2 changes and used v1 approach so that pflash0 can be used
	   for code and pflash1 for variable store.
	2) Rebased to latest riscv-to-apply.next branch.
	3) Added documentation for pflash usage.

Changes since v1:
	1) Simplified the fix such that it doesn't break current EDK2.

Sunil V L (3):
  hw/riscv: virt: Assume M-mode FW in pflash0 only when "-bios none"
  riscv/virt: Support using pflash via -blockdev option
  docs/system: riscv: Add pflash usage details

 docs/system/riscv/virt.rst | 31 ++++++++++++++++++++
 hw/riscv/virt.c            | 59 ++++++++++++++++----------------------
 2 files changed, 56 insertions(+), 34 deletions(-)

-- 
2.34.1


