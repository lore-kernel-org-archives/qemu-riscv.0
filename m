Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69BC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 12:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2WHJ-0004ps-0R; Fri, 26 May 2023 08:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2WH1-0004mn-Pp
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 08:10:27 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2WGx-0005Bh-7M
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 08:10:22 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6af6ec6d73bso270674a34.3
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685103016; x=1687695016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bu163vDW15BYcXwzSN2VynBqJZFpYCeNs3cnaMyQ/3s=;
 b=VHH/n1h9iNcw/SEvxGqZOvzyqbFRNjXXPjEUrNDcvRcg09FNckmm8ijP+q45GNaN/d
 rUJVV4lFZiy+OWMaivzAEV8k1JNvTZyN7nBvvrbEgPFeDS/gwN6m3sVODXofuzgOLZw+
 XQek04Tk1Idw/1Ki0AwVH/5WhQvCw6YoUhioNDniHOi0evleYFBtaC6mBWsW++NNtToX
 TKJPnWmITzTAIrNqOJDg2/q8ziMXliZrn7LVXWUZdXYTaOLEPVmrR+3uFAJf75eEzWNy
 tX2/qmTrSlrVidj46/3llz4340y3pc9fjQtWAIjS1jllsfXRaN8DxEpC9UXH2RT6kf3M
 4OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685103016; x=1687695016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bu163vDW15BYcXwzSN2VynBqJZFpYCeNs3cnaMyQ/3s=;
 b=Oyr0DF4RiKk8y53iVJbrUhH+xQRaPE0pP6GnMcOctiaZf/UTvyV9rJsbFczQAshNH2
 VTYicEZ+BNaiclTMmOpNfRyU46GQIlwIV3yo6rb0odhZF320fy4gKVSp4fNmN0QanZHs
 RnVaRTbsvsQ9NnDDRhdlEWuCjoQF+vOtHFs4g+UfgfAhjOYS5wVkOGh9qzLMxjwE+hzZ
 Bmq5b0MCNeWbyYbp8Uf4kbtgWX8o3ZbdhDRsB5e66M2zb+EnNl1lvDL9+fPoxpfdxjmG
 g8Xaz3FK7UfozRqNdOb3Td7UObrIWd5fi6KsKKRvagtHiyolRRvRkb57kq77WZmx9mKf
 gFjQ==
X-Gm-Message-State: AC+VfDy5J3M6G5TWSJEIWdMMZx5O2FdV3LZ23/3JJ8u3GYNlw1cwaNUX
 cRVOgKtzAKCNCmbyV5kdg83umS3nyiScXPpVauM=
X-Google-Smtp-Source: ACHHUZ4SFyeNiGS9pFG28lAWgg/X2SP1QyB86FQU5hfbB2gl3LJx2X/VAIEX6QslaS4h+ply7J9TJQ==
X-Received: by 2002:a9d:6191:0:b0:6aa:fdcc:47b with SMTP id
 g17-20020a9d6191000000b006aafdcc047bmr636738otk.33.1685103016611; 
 Fri, 26 May 2023 05:10:16 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.186.3])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a9d618a000000b006abb3b660a9sm1611602otk.54.2023.05.26.05.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 05:10:16 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v5 0/3] hw/riscv/virt: pflash improvements
Date: Fri, 26 May 2023 17:40:03 +0530
Message-Id: <20230526121006.76388-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x336.google.com
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

 docs/system/riscv/virt.rst | 29 ++++++++++++++++++++
 hw/riscv/virt.c            | 56 +++++++++++++++-----------------------
 2 files changed, 51 insertions(+), 34 deletions(-)

-- 
2.34.1


