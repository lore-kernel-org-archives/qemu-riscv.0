Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7130DEB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:44:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKEPo-0006Nc-5H; Fri, 14 Jul 2023 04:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qKEPn-0006NH-LW
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 04:44:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qKEPk-0004IL-Ng
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 04:44:39 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666e5f0d60bso1120516b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689324274; x=1691916274;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q88xQMEarFA50i9y115IcEsr+rPQt2zyEt4rhzUFosg=;
 b=YdKMjlh7f63IBkwhHdyZaV8JeaUxLmRZu+CVgwNd3Qhc0/OtcNyc88B5GoBy4Jli6F
 8J8oQhCWCs0rSdAVsN+97qZn8Qh88m365fw8r8lOEd+8vtZTM2Ga5ubGk2i+iZ2moDAs
 ZsG2WV+3niasxlUuaeospeilZa3dugwJnUwG8ueDWYA0DLU54Lc5nVqmnfHuSZChol25
 U6L7H+7Z+Eua6l/AGIKB7gwDUotKLYt1T+PSMbVOYpG0IYymSmSsWg+JK5ERVhyGI0m3
 /8yCRNBg+TJc99nJZcHerNhifpNRGwTc383mefRi9zVlbyAdDZJCzXAAnRmKaI3n8nXD
 wEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689324274; x=1691916274;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q88xQMEarFA50i9y115IcEsr+rPQt2zyEt4rhzUFosg=;
 b=VDz1S6UjI47cEYAnMQ8X4k1Plgvp0oattiMr8OrMTCi1UyWuC63n8iWh4DLvh1ye32
 2FXLS5ssVBlGR/LOShs5n+s8mxOPLnMkC8PQjz729CMdO+WrQnHKB6iKEbE5xmYKQJI6
 PDHLiJqrwm9mETDrvxZTt0TURFRdh8dx+kUetnJzD1ULZ9GOrzjVjhHxVIVmJ90sWnM8
 qgz1dHaiCnwel/jqg5F5/tcPptMIT5a1KnFvqnlLzV9o9zLUisRtrN47VpyCIKOuASgy
 D3XAfmqDxgx5Ea3bVR/JaO1IHYCt/eMCP7Hs/l97zxcQgtYKcpnYdouIZi1mUhJrvKJO
 9eag==
X-Gm-Message-State: ABy/qLY6k1K6P3BQ2tJ5ya44OIXRHIQ8hKubhKqJatGJNtSE3Elmiboc
 to2rzDTDp5ZTAsy9zgAS3fn6UA==
X-Google-Smtp-Source: APBJJlFrmLQAb9wmumC0iAi4EdVU2/gKY4Cs2ViAimjBia4SOVrUMmaBQxWnFIIC1hYGO4khxPd2NQ==
X-Received: by 2002:a05:6a20:100c:b0:12d:208c:acaa with SMTP id
 gs12-20020a056a20100c00b0012d208cacaamr2826888pzc.26.1689324274409; 
 Fri, 14 Jul 2023 01:44:34 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 c19-20020aa781d3000000b006829b28b393sm6616305pfn.199.2023.07.14.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 01:44:34 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v6 0/5] Add RISC-V KVM AIA Support
Date: Fri, 14 Jul 2023 08:44:22 +0000
Message-Id: <20230714084429.22349-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x430.google.com
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
 hw/riscv/virt.c          | 410 ++++++++++++++++++++++-----------------
 include/hw/riscv/virt.h  |   1 +
 target/riscv/kvm.c       | 170 +++++++++++++++-
 target/riscv/kvm_riscv.h |   6 +
 6 files changed, 469 insertions(+), 199 deletions(-)

-- 
2.17.1


