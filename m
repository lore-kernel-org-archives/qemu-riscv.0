Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90FAC7EE23
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 May 2023 14:23:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4MjQ-00051Z-5q; Wed, 31 May 2023 10:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4MjN-00050G-Sd
 for qemu-riscv@nongnu.org; Wed, 31 May 2023 10:23:17 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4MjK-0002iX-Q1
 for qemu-riscv@nongnu.org; Wed, 31 May 2023 10:23:17 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6af549a7fb4so664801a34.1
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685542993; x=1688134993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j+WTzPUo3IPx8Gh/TpyhYdpdEhhPELtCbvJuDqoHhzQ=;
 b=kbLjTs3Gd1CLaDVpWU/LvNq6dCxmCKVP5DVWW9PvdHaoPiJP5Lp/5bOfqPLWKQW6BO
 YA4Q7FsHnoHLll0ITlnv4VIGIUHWJvQ5KD0XZfhIATxduBK9V1pS/6RvfGcRdJnzXE/d
 BPeNNu9D7CssrD3h4ONEslB1J6hO3uYlVkASRaQ4sWlczMZ/tYjDGK+HgoacOCiyIx4j
 w5xUIi+geSPfZUnooNvGyBUd04RkU286gLxy/xkbs9XpGsr5qxwh3uFkj0uRVNtiqQ1u
 tvZIjKAbPTxTrnzqMyJdoBbhvWTcBkDaEOSXoi0Y2g5WL5QlNtSybQqmHr3XVHlUcDor
 dB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685542993; x=1688134993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+WTzPUo3IPx8Gh/TpyhYdpdEhhPELtCbvJuDqoHhzQ=;
 b=Neu/FyoAjGhctbR8mr+uMN8PHbGHo+q2hTvUpMpjmzNt42iGGXE8iHTJxWIMgUBGcI
 fRWLZ3Q1bTJBU9s9nFVumWlowsB+86OxZci/Fkk/SE4X0GBvNQo2wFlid80UZ3ep3ppy
 R1ys2hUo0NPk6V+G3dBaiAKnYkQEXZ/DO7xMSdtJB/EvqhliI31/8XagGMufrHSg/F0d
 cUFgCfNM+nEjeRFLeOS10dbaLKfwNMdqgIlc99qqYThfxq7j3KDJht5NZi4BwE/OAvf4
 Qn4fpr2caAzQgpledKk9Rp10fwBxMeNE0Lo2xddKZf+MguzzNysfEFcCy3OqSGyUGNMA
 mEXQ==
X-Gm-Message-State: AC+VfDztzFS4kM7IJrv1/Qjt6qRQa9zGZdZE1vw9MDEuXYoZkbD3xXNd
 4qXfwFgbzmArJu52Vk9h1sQRMSwNZPwIRQ//Emw=
X-Google-Smtp-Source: ACHHUZ4YdTKTufCPMGQ6+zdvtqZ9NePnTrPMHtKgiorr2YQjeS4SRXXif041sb9RpPR5b/AMEqRXHA==
X-Received: by 2002:a05:6808:1301:b0:398:2323:c707 with SMTP id
 y1-20020a056808130100b003982323c707mr3104477oiv.28.1685542993283; 
 Wed, 31 May 2023 07:23:13 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.186.3])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a05680802d300b00397c07e8061sm574548oid.6.2023.05.31.07.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 07:23:12 -0700 (PDT)
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
Subject: [PATCH v6 0/3] hw/riscv/virt: pflash improvements
Date: Wed, 31 May 2023 19:52:57 +0530
Message-Id: <20230531142300.9114-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

 docs/system/riscv/virt.rst | 43 +++++++++++++++++++++++++++
 hw/riscv/virt.c            | 59 ++++++++++++++++----------------------
 2 files changed, 68 insertions(+), 34 deletions(-)

-- 
2.34.1


