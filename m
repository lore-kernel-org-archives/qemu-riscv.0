Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212AC46CA2
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:52:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEV5B-00016Q-Sn; Sat, 16 Dec 2023 08:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV59-000168-QF; Sat, 16 Dec 2023 08:51:55 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV55-0001DU-Nk; Sat, 16 Dec 2023 08:51:55 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9ea37ac87so19675501fa.3; 
 Sat, 16 Dec 2023 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702734709; x=1703339509; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=skT7EdOWc7HO6093az69XiD4e9+ylN8KbQ9F9zlPoWg=;
 b=doINBbNw5Ul3VaLOoMswzM4jeVszPoIANppAw91IAQD8cb1lhU7yX1eP/Gl0KDyX8o
 Wj7R1TIaKdQuUL+3pqXpAOj5/ZRgUJnim7qIEj6SpEhpDMKFUQPnaPYnGZvw9jUgxL2J
 vBeZLZUyc1gYcNXpBeshwfhCgocsI1aqD/JqQWjwa0WuqAQm2/Lh4XmGqZvcskoDoL7f
 kHZtQv7YOQuThctoOYXQUF1qVYJjckjejPgBz9ZliemvVa2s2F9E9aJhP7qxh51xgGey
 ZBanH13JbWo+ritCtwSgYsDYNAb2ma1wOgymkwQCnyFiiOkQpznlXAw8tnhoos8QWnlU
 6dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734709; x=1703339509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=skT7EdOWc7HO6093az69XiD4e9+ylN8KbQ9F9zlPoWg=;
 b=CKPFjbtrQcZhVvyXauJgmdRxILvqHVHma8q5SYnfbJl5R/r2Y0brU7jjbTY2m8WiaY
 tTQroVqFZU8XPuv+fdLfJCqoSMimQTuJPEvTc36qB8LIxcU30cLv2+g7MP1MdW6LkmXT
 CgaT99FO2w2NDwdAQ1bGaaNp66whGvs/4Neb4iwwZF2VriWPnWoD/pqs8i6SDS+ajcet
 NUDmosc1PmeIXTq7o8K52GZeaM8emeUeTv8r8/i4YOC6iFI09L2UIAyu8D+tFakuTHmP
 JIQ/uj7Inz4Z/CEb5hGO6iKDv7dvVKrkS0mpjlroen6YoGlDDs8SUcN4o09zrpyIIfLZ
 mNuA==
X-Gm-Message-State: AOJu0YxpBZjVkaq5XXfbsAL7L2xUpdAr6X9O8Wk9EQbo1lgcVHdUM0Za
 UjKDj0N0gWd72eiwcL1L8Yo=
X-Google-Smtp-Source: AGHT+IFzazitGF67Xnd+n2vOdVG5tV8hywqHIW9u7Q+/DI8NOGhvMGfF34ZaOuxIg4lxQHsOhrtv7Q==
X-Received: by 2002:a05:6512:b14:b0:50e:c7e:4bf2 with SMTP id
 w20-20020a0565120b1400b0050e0c7e4bf2mr4935957lfu.133.1702734708631; 
 Sat, 16 Dec 2023 05:51:48 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 vw12-20020a170907a70c00b00a1c904675cfsm11819595ejc.29.2023.12.16.05.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 05:51:47 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: zhiwei_liu@linux.alibaba.com, baturo.alexey@gmail.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 0/6] Pointer Masking update to Zjpm v0.6.1
Date: Sat, 16 Dec 2023 13:51:30 +0000
Message-Id: <20231216135136.1597456-1-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x22c.google.com
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

Thanks

[previous:]

This series of patches intends to update RISC-V Pointer Masking implementation
to the latest Zjpm v0.6.1 version.
The Pointer Masking functionality is simplified compared to previous version
of spec.
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
 target/riscv/cpu_helper.c    |  85 +++++----
 target/riscv/csr.c           | 339 ++---------------------------------
 target/riscv/machine.c       |  14 +-
 target/riscv/pmp.c           |  14 +-
 target/riscv/pmp.h           |  11 +-
 target/riscv/translate.c     |  50 +++---
 target/riscv/vector_helper.c |   9 +-
 11 files changed, 143 insertions(+), 519 deletions(-)

-- 
2.34.1


