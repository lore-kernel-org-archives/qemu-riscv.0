Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F5C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 10:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN9Mn-00060n-DF; Tue, 09 Jan 2024 05:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mm-00060Z-0h; Tue, 09 Jan 2024 05:29:52 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mk-0005uR-9F; Tue, 09 Jan 2024 05:29:51 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso217764766b.3; 
 Tue, 09 Jan 2024 02:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704796188; x=1705400988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dAYTIfDCE5g+bcnygdv+D7K3dVVQAb4JjeyknTKTilo=;
 b=UgYgaUZQCPcfZHiQAErudC3/HGrI/pnGKdvDQpdpcsTJTF/MVxs+QUoMR6qw335sZn
 Dt7unyuuyLKtYn6Rvk6e8e7NxCKRb7QdDLXdvVyEq8elidEe/z2HfHXvTVZqyUsnciR1
 wekSGNWW+weFPAPd3rBAaEvGrpFnCyRCtpZJXbDk+Wkqc2hTBnex86oKTfbuOITL3oLS
 3fuBiPlCpbHSIKsQzONeU7vAv2eNBsL78v245My/V1Iua2Jk5EYnoyHcDcfrLIOW9wyj
 aJbpnOpq9BMnQalaFyD4CE0FlF8XmMzQH0aM9tw2hzkKLga5hkAupJ7E3PJkbh3VgUhn
 GQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704796188; x=1705400988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dAYTIfDCE5g+bcnygdv+D7K3dVVQAb4JjeyknTKTilo=;
 b=oAvP1TYibKr84lBCR7regfu7t7BXg7o2uWQ4bc7p1A1cnD5tsuvyZE6fZ2rPlG8KXk
 NDkrI3FbgS/lqeT630XS6AnvnlTGDQy4O0yrXrtOr8AJph92YbFmb3m7qflZHAiYj9FH
 sqNHaCtOCFx5G8i9XtofS0MjUiSE4kmW40T/f/kFms9zvGwZauJugquqyUlSLQh2UVRs
 CbJ1hK/8riOsVGmQ0iuk1Xy3lhOV0loEzoi8/TK/lKxcrvccjcYGAZFvWNaFwP3cyVCb
 g7I6IcELd3o9FIOllgT5PY9DgYb+3vOnj3W29fZZ7Vr7Y537etRa2Cvyl+G7jz59lGZ8
 UB9A==
X-Gm-Message-State: AOJu0YyYy3PCtmZ3iVKWR4sVnqQ6DCe45ncw2KWunMvTV1fAFcAxaSf9
 j7gwM4fxkGXZ8tVYQ4Df04M=
X-Google-Smtp-Source: AGHT+IGgacSf3fDp8r5wpCHzbTsnw8OTmAM9pFDNlXBWyy+vkTTRtasdkwWO9mIg8p6ux0reWjdS1Q==
X-Received: by 2002:a17:907:764f:b0:a27:773b:fcf1 with SMTP id
 kj15-20020a170907764f00b00a27773bfcf1mr475888ejc.9.1704796187755; 
 Tue, 09 Jan 2024 02:29:47 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 d24-20020a170906175800b00a26ac037ff3sm869643eje.132.2024.01.09.02.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:29:46 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v4 0/6] Pointer Masking update for Zjpm v0.8
Date: Tue,  9 Jan 2024 10:29:24 +0000
Message-Id: <20240109102930.405323-1-me@deliversmonkey.space>
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

Hi,

Patch series updated after the suggested comments:
- removed J-letter extension as it's unused
- renamed and fixed function to detect if address should be sign-extended
- zeroed unused context variables and moved computation logic to another patch
- bumped pointer masking version_id and minimum_version_id by 1

Thanks

[v3]:
There patches are updated after Richard's comments:
- moved new tb flags to the end
- used tcg_gen_(s)extract to get the final address
- properly handle CONFIG_USER_ONLY

Thanks

[v2]:
As per Richard's suggestion I made pmm field part of tb_flags.
It allowed to get rid of global variable to store pmlen.
Also it allowed to simplify all the machinery around it.

Thanks

[v1]:
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
  target/riscv: Add helper functions to calculate current number of
    masked bits for pointer masking
  target/riscv: Add pointer masking tb flags
  target/riscv: Update address modify functions to take into account
    pointer masking
  target/riscv: Enable updates for pointer masking variables and thus
    enable pointer masking extension

 target/riscv/cpu.c           |  21 +--
 target/riscv/cpu.h           |  46 +++--
 target/riscv/cpu_bits.h      |  90 +---------
 target/riscv/cpu_cfg.h       |   3 +
 target/riscv/cpu_helper.c    |  96 +++++-----
 target/riscv/csr.c           | 337 ++---------------------------------
 target/riscv/machine.c       |  16 +-
 target/riscv/pmp.c           |  13 +-
 target/riscv/pmp.h           |  11 +-
 target/riscv/tcg/tcg-cpu.c   |   5 +-
 target/riscv/translate.c     |  46 ++---
 target/riscv/vector_helper.c |  14 +-
 12 files changed, 153 insertions(+), 545 deletions(-)

-- 
2.34.1


