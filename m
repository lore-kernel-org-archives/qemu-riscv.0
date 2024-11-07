Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED52D5AE6B
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 06:32:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t8w3U-0005Ks-GT; Thu, 07 Nov 2024 01:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t8w3T-0005Kc-DV
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2024 01:31:43 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t8w3R-0007ph-Tx
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2024 01:31:43 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-20ca1b6a80aso7005975ad.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Nov 2024 22:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1730961100; x=1731565900; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTsAYnFy6pdUdwnERiX/Gcs6mqcGLATmNajTR2VB5Pw=;
 b=XSPL+YXUuXrFjnqTfaDAnJfTNRR+tn++s07APKD0tyKppOAyI3skCortT1GPtz7rJS
 cOyCAo/DRQnbIBLMA4oweavRx0Ini42LiwPWQdOKd7sanEZIXb+BKkwmFL3uS1OKJh2U
 BTg3XciuRJsMb2O7LtwgRSFwSneKDhJt7zfe5Yxy6VJzc17rsBsfS8pO2Ht0wJa/xMAo
 zFZvABAAdFyuL0FItc/dYlTHQz4MAeQyT/hQ/Bcl+M4vks/lXdjw9zJn8Yj7LkmKMgJ+
 gp4Xxw4fsppSPMNa+TbsY3Y0uwM8w4UzvrijJrvvsn3cKJdyVXAwVWw6KgBtNYTNvjyX
 an1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730961100; x=1731565900;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTsAYnFy6pdUdwnERiX/Gcs6mqcGLATmNajTR2VB5Pw=;
 b=Ci36Ue0Diaaf0S9/YQ4m/CF0PCfl6X2uqcI6+V2sMh3mxLBeHPcRxFnvt9K84htdTf
 s3s7OPgjR1Q7snr2PYkCOAkC1PcKvcviA8uPwWQnrvaNSTT+rjXInYKiJ9+IBrnH0uCb
 8XNN3kf4TAv23DB+svFno+m/+LvAFD0nOY9HD5AS6LgJtkm48YeFb3nTTczlB0KePBYo
 3xEG9L7gxRgqjF0TG1CP/r6Fi3teV+exKBgerOH3PPp34WD+2Q7SjM7fp0zy70pOyzn0
 Mtib+uZWPrcTsjFMiTwP+cZvYQlzODJ5lm33KJiQu72sYYOAZRzGerenovY+FuxsI1dk
 8lLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbSpJJdE5xQr6aEFpAcM+OlCeFuEkTQMuP/SPt6FUH51AB++CegnohwvoAa7ABsHaHVM0V8b8YvtqV@nongnu.org
X-Gm-Message-State: AOJu0Yw/kZdmyJg0gzGkrlhsZi1cVJLX1VzPjfZID5a+JKb6oDszKvTi
 pe0Wt2r33sumIMzyAWOaVO7NMPrhpkZfon9FwT8cS7HHYwobOLeDtCzVwM0BaW0=
X-Google-Smtp-Source: AGHT+IHO7IqndfpqC08LSGz9HoCJTN1FKKBDE5N6SUUl/RBPQFjlBhNZilHCSlPEE++zwt8XGfdwMw==
X-Received: by 2002:a17:902:d50f:b0:20c:f9ec:cd7f with SMTP id
 d9443c01a7336-2111af17e0emr309324865ad.4.1730961099756; 
 Wed, 06 Nov 2024 22:31:39 -0800 (PST)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dc7cf8sm4995665ad.34.2024.11.06.22.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 22:31:39 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 0/3] Support 64-bit address of initrd
Date: Thu,  7 Nov 2024 14:31:30 +0800
Message-Id: <20241107063133.28339-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x632.google.com
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

Support to load DTB after 3GB on RV64 system, so that larger initrd
doesn't be overlapped to DTB. DTB loading now will check if overlapping
to kernel/initrd and report this error.

Verify the patch via running 4GB initramfs on the virt machine.

Changes for v2:

  - Add DTB overlapping checking and struct RISCVBootInfo
  - Remove the commit to change #address-cell of 'initrd-[start|end]'

Jim Shu (3):
  hw/riscv: Support to load DTB after 3GB memory on 64-bit system.
  hw/riscv: Add a new struct RISCVBootInfo
  hw/riscv: Add the checking if DTB overlaps to kernel or initrd

 hw/riscv/boot.c                    | 94 +++++++++++++++++++++---------
 hw/riscv/microchip_pfsoc.c         | 13 +++--
 hw/riscv/opentitan.c               |  4 +-
 hw/riscv/sifive_e.c                |  4 +-
 hw/riscv/sifive_u.c                | 14 ++---
 hw/riscv/spike.c                   | 14 ++---
 hw/riscv/virt.c                    | 13 +++--
 include/hw/riscv/boot.h            | 28 ++++++---
 include/hw/riscv/microchip_pfsoc.h |  2 +
 include/hw/riscv/opentitan.h       |  2 +
 include/hw/riscv/sifive_e.h        |  2 +
 include/hw/riscv/sifive_u.h        |  2 +
 include/hw/riscv/spike.h           |  2 +
 include/hw/riscv/virt.h            |  2 +
 14 files changed, 130 insertions(+), 66 deletions(-)

-- 
2.17.1


