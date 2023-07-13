Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F70BEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 08:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJrvr-0006Kh-Vh; Thu, 13 Jul 2023 04:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qJrvq-0006KZ-OK
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 04:44:14 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qJrvp-0006ww-1W
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 04:44:14 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-666ecf9a081so484564b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689237851; x=1691829851;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5K2i1+A0inp6dLZW4IpBQ9GMwT8L5nzRPcMlItBo+Rk=;
 b=F6xc4NsjpSTDQWysuhVweGjZqvxlJZzQus/8noCSg2+LdZnkBjwTk4fX1S4UXCDfU7
 3fVNb08iXEnIeQvoSjvH44+oZHzVLp1kyZ3afCxK13P3HgxFXdVloY7gUyG3rrwKnP0f
 BdS7Y1M1KdDQXHdk7IX3s8g5HpuEj/OvRBRvEm4anqOFjlz2HzVxY9L7SuX4uAoGyW1b
 YB/P0rWyn1NEd+6Vyul3ShsaQMSX6exR+woQ+g63GnHiiNFt7L03geDq2Ev654HrDyq1
 K2RnS5YUJW4sSHzcXMaPiFnPoMRba5xk2tURgcUDsn0nJ0c2RtOJXmpdwMQHibAC4p9M
 XJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689237851; x=1691829851;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5K2i1+A0inp6dLZW4IpBQ9GMwT8L5nzRPcMlItBo+Rk=;
 b=Q0N0BiAnNfJg9LmAGs/iwPB9UCIVztI9JwYO+/EuudXhYiG1G+Wv+S9D9Kz39FDL0A
 RW+OnDsiAlTh/DDe42l63nkUlWA++Mn6DpsjmdP05sYYrc7VJmDUJnyUjvv3BTNeYtZM
 P9nK0RB3kE47qFsl7cI1SRKrd+4A6idoLinDP+NTMuofrJQ20Ttt7z2UCdLIhtESsjEH
 Bln2JOAVQrTnGknPsZbb+xYsVZDybijaVsx9egdq5j/S/hqlkj7qGtYskDUh1QMkf9vf
 14m+scjhzc2RGfkqC6mVfa25Im56nlKDg3tnN20H82zNW/PpeM/6IvA1JvVvDJdeMQOw
 6UdQ==
X-Gm-Message-State: ABy/qLYcqeSJe6be1vRrtIRFbH04B7GiuqrKySahAkoEAXdukx3kLLU2
 6rair6Hh+a9xk11wyT0OYDSU/g==
X-Google-Smtp-Source: APBJJlEUh3r2gNo1cPaWv4JiM2nrOM4hhVHM5XIYQw98jsOn0ZUGs06XKdA9aoHSHdELjhSCr4wVhg==
X-Received: by 2002:a05:6a21:999c:b0:f3:33fb:a62b with SMTP id
 ve28-20020a056a21999c00b000f333fba62bmr1000277pzb.9.1689237851241; 
 Thu, 13 Jul 2023 01:44:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a63724a000000b0055386b1415dsm4989198pgn.51.2023.07.13.01.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 01:44:10 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 0/5] Add RISC-V KVM AIA Support
Date: Thu, 13 Jul 2023 08:43:52 +0000
Message-Id: <20230713084405.24545-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x434.google.com
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

This series adds support for KVM AIA in RISC-V architecture.

In order to test these patches, we require Linux with KVM AIA support which can
be found in the riscv_kvm_aia_hwaccel_v1 branch at
https://github.com/avpatel/linux.git

---
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
 hw/riscv/virt.c          | 381 ++++++++++++++++++++++-----------------
 include/hw/riscv/virt.h  |   1 +
 target/riscv/kvm.c       | 170 ++++++++++++++++-
 target/riscv/kvm_riscv.h |   6 +
 6 files changed, 452 insertions(+), 187 deletions(-)

-- 
2.17.1


