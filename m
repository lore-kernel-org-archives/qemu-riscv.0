Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708B6EEB560
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:27:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegBw-0003En-55; Fri, 08 Sep 2023 14:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBu-0003Dq-MZ; Fri, 08 Sep 2023 14:26:50 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBs-0006m4-Hu; Fri, 08 Sep 2023 14:26:50 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c93638322so494422066b.1; 
 Fri, 08 Sep 2023 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197606; x=1694802406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=onrSP3+fxlbnObtjV1cI6NTPHPoXBEcqwp8YXzXraAw=;
 b=AmEanghQcacyl725n7QSKBZzHPSSNcsD9hZST2Qz+wxq6rFMme0vbE2wrMlVm4LX6i
 ljNG8Swe35+nJoDL/gsTtu9SwRDA81elj6GB5J8IRrltIIxbEjkZaBPyiyCR8g+7x2SA
 GRSqlGkx+BbDYkHX++bliBQs83UOPggNzncylNEl5zbzoPzB4rmgPV5Ayw9O/V9m8zxv
 jBS0iCoq7UWxwk2erKyZ/MzONKRJ/c4mqqWPb/c8JG3q3fTy+GiX/VEAks2JXOuxgc9A
 5l0LYh1kRBWDwwUgO+VTZniin/3k5NtcqCDEPiXJdLudFC3M4u/QPVCQZNMCcH2m/qd4
 em6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197606; x=1694802406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=onrSP3+fxlbnObtjV1cI6NTPHPoXBEcqwp8YXzXraAw=;
 b=oF4UC/q5p/CKTVEnoonX7b9fqM4Xkt2STf3h7TWBdvNZ79/PZDVEP9Oj6hs4kgt481
 rGbHhrvw2bmsEW1ru6qeaRX/lfFpY5fynbMuswxxfDr9o1xgCQ3uUI8IAuF+hLMS7K2q
 tqynL24YfnqTLloos28IvP6vLBsODnYmTL9RvGdw03DZ4Ry/djJVALzRp73LYNjPHzxH
 IookaGEdOn2bSXbKc0MLYnrl3KXDey/askILZzNq9jX8BgMS7vKRBDWpaGtP7n5cC5iJ
 ald8KEFD4LOwC1ENd/jN7FJJJsU6WdJE3bT1LXQ5QogGnLglHdg936XPd0hu917Ko+Ky
 5Axg==
X-Gm-Message-State: AOJu0YwH79Di9/KaQup/s9MCmRkIDZebqDqEn0iCmLHfn6uqOt594i0v
 W/YX4xAbLgbTeID2yUGoF1L252FKuyCXbg==
X-Google-Smtp-Source: AGHT+IFKl86j9Lb8jAPJyhm7E8p7O+E6jVagex2go08BLrSwNKqYNaB5xV8aRLQx+Bskk89gtSE2zw==
X-Received: by 2002:a17:906:2098:b0:9a2:1e14:86b9 with SMTP id
 24-20020a170906209800b009a21e1486b9mr4208778ejq.0.1694197606111; 
 Fri, 08 Sep 2023 11:26:46 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:45 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 0/8] RISC-V Pointer Masking update to Zjpm v0.6.1
Date: Fri,  8 Sep 2023 18:26:32 +0000
Message-Id: <20230908182640.1102270-1-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi all,

This series of patches intends to update RISC-V Pointer Masking implementation
to the latest Zjpm v0.6.1 version.
The Pointer Masking functionality is simplified compared to previous version
of spec.
The changes have been tested with handwritten assembly tests and LLVM HWASAN
test suite.

Thanks

Alexey Baturo (8):
  target/riscv: Remove obsolete pointer masking extension code
  target/riscv: Add new S{sn,mn,m}jpm extensions as part of Zjpm v0.6.1
  target/riscv: Add new bits in CSRs for Zjpm 0.6.1
  Add enum with maximum ignored bits depending on privilege level for
    Zjpm v0.6.1
  target/riscv: Add pointer masking tb flags
  target/riscv: Add functions to calculate current N masked bits for
    pointer masking
  target/riscv: Update address modify functions to take into account
    pointer masking
  target/riscv: enable updates for  pointer masking variables and thus
    enable pointer masking extension

 target/riscv/cpu.c           |  18 +-
 target/riscv/cpu.h           |  35 ++--
 target/riscv/cpu_bits.h      |  88 +--------
 target/riscv/cpu_cfg.h       |   3 +
 target/riscv/cpu_helper.c    |  99 ++++++-----
 target/riscv/csr.c           | 336 ++---------------------------------
 target/riscv/machine.c       |  14 +-
 target/riscv/pmp.c           |   6 +
 target/riscv/pmp.h           |  12 +-
 target/riscv/translate.c     |  50 +++---
 target/riscv/vector_helper.c |   9 +-
 11 files changed, 152 insertions(+), 518 deletions(-)

-- 
2.34.1


