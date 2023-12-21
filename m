Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DEAC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:41:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGUJ-0001JJ-PA; Thu, 21 Dec 2023 05:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUC-0000Vi-S7; Thu, 21 Dec 2023 05:41:06 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGU4-0004xD-Q3; Thu, 21 Dec 2023 05:41:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c6736d10fso7867995e9.1; 
 Thu, 21 Dec 2023 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703155253; x=1703760053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qkluXZJ+yNwvQGBILr/lSv4ei/NhWG9eq5SAHsm+Ngg=;
 b=EHP4WNvOTH21XI5+OdxWFiNiBIez73NFKMiQBUgZj3mE16qNUuBnt0Mu3qULvXPCo+
 FtLmeVL8e3kvPabq9HU6UFQb8eLam6iOTBB72XW0y8w+SZupeimaepupf8BvZD0d8ueI
 X9KJnmy2lTwT5ajDuxjx459pUJ3zV+ZQGYzPIm64Nku6IfDsFgpH7AHCcVeBZV+r70WD
 13meix4f3DNzJG39YQNCaHxhJbOi1M3v8AAAnb8XliiekhjgT+FaSjwk77oZnRGojAb8
 D1tmRFGK+07Ol5Z9vCn7cETv372cQE9pqYJoDgeTfChbtzPqS/giFQJgG8mcL8wnMqRR
 f08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155253; x=1703760053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkluXZJ+yNwvQGBILr/lSv4ei/NhWG9eq5SAHsm+Ngg=;
 b=baSfIFe4b2bgy3SOQZXt66+biusSQp1DQuNFDjc4hqYqIe9IsHnkULXJXoIN6bYMoE
 g99kco4vMx7aTGsn5Udxg5HiPiN40Y9WDeXbrzsNkKbyi3+CY8OZZV86O+LBjkoE9pWE
 H3kuKzDdFex5/Nc4lOuQpXCQDqab2fl4Nc7bpmgQMeWngW8U3upfF7SXueRVrfeyxg5w
 +U9czBycrj3mTJa/ckDtAYKJudw8vpEDup5DRyyIEne1VH8+IB0/xs2Q3jzPjrpsrekZ
 KvUAelJ4/Uy8gCZbYsiwXECZI4B+yuk3OajN0PjjEGMm35AqFjmx54OyL4nLXt30lo8y
 hNJA==
X-Gm-Message-State: AOJu0YwckEf2ZmS+m6eiLFs429FQOkkkMkLEUpIX8vggIYj/+R8p701+
 CuX7K7MPNc80goZEmhaGqt0=
X-Google-Smtp-Source: AGHT+IFJvNhWRWQm76tXaBEg3GzcfYWh0+RecI+P1lC2RvXt+E1qF2QOzrbCU2yo+b61ANd6Lzir9g==
X-Received: by 2002:a05:600c:251:b0:40c:261b:3a86 with SMTP id
 17-20020a05600c025100b0040c261b3a86mr653205wmj.53.1703155253184; 
 Thu, 21 Dec 2023 02:40:53 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm10633674wmb.23.2023.12.21.02.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:40:52 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH 0/6] Pointer Masking update for Zjpm v0.8
Date: Thu, 21 Dec 2023 10:40:29 +0000
Message-Id: <20231221104035.1287244-1-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Hi all,

It looks like Zjpm v0.8 is almost frozen and we don't expect it change drastically anymore.
Compared to the original implementation with explicit base and mask CSRs, we now only have
several fixed options for number of masked bits which are set using existing CSRs.
The changes have been tested with handwritten assembly tests and LLVM HWASAN
test suite.

Thanks

Alexey Baturo (6):
  target/riscv: Remove obsolete pointer masking extension code.
  target/riscv: Add new CSR fields for S{sn,mn,m}pm extensions as part
    of Zjpm v0.8
  target/riscv: Add pointer masking tb flags
  target/riscv: Add functions to calculate current number of masked bits
    for pointer masking
  target/riscv: Update address modify functions to take into account
    pointer masking
  target/riscv: Enable updates for pointer masking variables and thus
    enable pointer masking extension

 target/riscv/cpu.c           |  17 +-
 target/riscv/cpu.h           |  35 ++--
 target/riscv/cpu_bits.h      |  85 +--------
 target/riscv/cpu_cfg.h       |   3 +
 target/riscv/cpu_helper.c    |  88 ++++-----
 target/riscv/csr.c           | 339 ++---------------------------------
 target/riscv/machine.c       |  14 +-
 target/riscv/pmp.c           |  14 +-
 target/riscv/pmp.h           |  11 +-
 target/riscv/translate.c     |  50 +++---
 target/riscv/vector_helper.c |   9 +-
 11 files changed, 146 insertions(+), 519 deletions(-)

-- 
2.34.1


