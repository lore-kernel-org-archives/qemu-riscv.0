Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF4AC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 16:48:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2E8T-0007V8-WE; Thu, 25 May 2023 12:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2E8R-0007T4-Cj
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 12:48:19 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2E8N-00053S-II
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 12:48:18 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6af7593ed5fso719923a34.0
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685033291; x=1687625291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=36pBS8epg/rKH3TCUTxMtZBD1xjYWXG1/mN3kGuuONY=;
 b=jshDDFNUhG10Ks3gAz7nGwcVRS3g3VUnJsIu5r9Y4UQjMQptCfbDQxj+AFOTh3pkmI
 Ys0vzgyVAYcKNLRyFDJW22bScmY4N3gQ5RAlkdkPuo5/Eek7/kJ2o1NnM3doA1RaPFMT
 pJ5cILnojSaXvj8Na+dDw2l75u/AOGT/26JiYb4gqjAfXSxzZ0wrLe4rWIV2bmzygPhP
 7dx/egcGFdVWDbMwWv12JgzOCwOShDAKNPbTovHBYUkbSnsQcaWBK9kXyuVNtlnA2MTA
 pLxwkTorRYj5Lav5t39xDIXeK7l7pG/KUOq0pJ5tQl0C5vvCywEw6DncgRDHDGAGK9FP
 ZykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685033291; x=1687625291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=36pBS8epg/rKH3TCUTxMtZBD1xjYWXG1/mN3kGuuONY=;
 b=UtfmRp8FtGObeRp1uXB74C1EMkzzdEZ5Nu57WTuAJXeo0mTSPaE8amRrWzOpMe1hia
 +Ylz//DpGN0Sq1lM8BlQrdtsjHNLVaxGGlfB5sM9+Zl9Q1kEefqZ4i5ZQSE0GkM/DwQ1
 OzzOLbyDmIDDaRpuInGI0jXXGuDtOBY13XDjNVAbfxH/eJx27XUeKmkMVzV+h1PBuPv4
 FHDeh+81BOVpgL0kVTadthuZ+hlhJ4DbqZy4LidnVTrwjKTiVGQtII3etnHWJGmMFQyq
 lgmZWXeDINgiBD31Si9zZEK+Q8M9IP1B55CeAs9ufjqeT6J+7Yv758THsBUvr5Ske7cX
 jDzA==
X-Gm-Message-State: AC+VfDxNvn7J/13x5eGvJz5KnuGhdp6s0qASln4VFmkV+NG22jjhlfdx
 QcIOgSYl2lhzKmNMHUlHgmEAHfeyP9BAop/wDYk=
X-Google-Smtp-Source: ACHHUZ458UTPtgX/EleiDKMB/8mRMA2QipB53C0iwWNLs/SujsAmVs/LsPKPyCr0xHCa9vnnSJtUWQ==
X-Received: by 2002:a9d:5c15:0:b0:6ab:280b:252a with SMTP id
 o21-20020a9d5c15000000b006ab280b252amr87944otk.17.1685033291031; 
 Thu, 25 May 2023 09:48:11 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.186.3])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a9d7a92000000b006af886703f2sm803905otn.37.2023.05.25.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 09:48:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
Date: Thu, 25 May 2023 22:18:00 +0530
Message-Id: <20230525164803.17992-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x333.google.com
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

 docs/system/riscv/virt.rst | 29 +++++++++++++++++++
 hw/riscv/virt.c            | 58 ++++++++++++++++----------------------
 2 files changed, 53 insertions(+), 34 deletions(-)

-- 
2.34.1


