Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B0C4707B
	for <qemu-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 04:50:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rHGPi-0002bh-KK; Sat, 23 Dec 2023 23:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPg-0002b9-RW; Sat, 23 Dec 2023 23:48:32 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPf-0000gy-9h; Sat, 23 Dec 2023 23:48:32 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33679c49fe5so2624236f8f.3; 
 Sat, 23 Dec 2023 20:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703393309; x=1703998109; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WuKdFOzY9RidB2NsXpJrryqUOdVdJ3HTr+IAZTLLavE=;
 b=WTgjB++O4IhAY/VlLyYTiGzANHQbWNmazgokvvsJu0cMwlgt5rsCVGhHvMhFaSDZXO
 +HW87aNJZ8Goqq5mGeOQ162brPfVgo+RWfZvbfj5a3tESvf5Qz7JDG3hTT3mcCfcf0Sv
 x3sITZJ4h9f/PIsMcoJlOShWngia07KEt00fninqjBr3E3zy1+ISxbcPmFvFdxgKcoGG
 ro6eJofAWiXa6ab1bwBycis3lHsLNwojEyKuFr/TaM7hETbMgz/GUiCn55RVPh1GeDdB
 n8VoBvM965coF1VTTw46dHlCL2hpT/zNkY+hZ7YWqmGgchpOzfJO2VsGbpHnqSmpcmml
 l4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703393309; x=1703998109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WuKdFOzY9RidB2NsXpJrryqUOdVdJ3HTr+IAZTLLavE=;
 b=sJ5z0eXMw4zeAZil30YdZalxFJWCs3nDzFrHjJrLw9wpL37l5htthZEJAOjoms/4S7
 0Ay7z+G7DX0NDbK31IkUSPt1Tc9WDqt0DI8Jus30U3iit/AFlFovlRsj48c1MW/DQYbb
 hmzPmVODTTnC2/jh3WUlmYVBLaT2jearMvk+acVMxIBxRKsJ9dyRS45XZnGqujoRYtCX
 f9kl2gjDM05T7I7MuoS/9TtIvx1PIgrFz514gIIEEA289zpgg0RGShZ13FNBQovfsUp6
 7c8NoNQMKrIfsCNoV/f+YUOKpBrw/wmZEyAfKk6V1WAZRusEj9dNE+oH3+mzXnLEqda7
 6nFg==
X-Gm-Message-State: AOJu0Yw9o5ZPQJnTAXIMSFB5JmvuSwR/8fmwE/xgVMzpBgRHBLiQ38CN
 2Ac3/OLcE1c4fVY8M8CaCNY=
X-Google-Smtp-Source: AGHT+IEX622UtQkV/8LFK0sblFMYrElOse1zs9m9ZmV1SwBJ1pxaF2xQ134xXxdsKrLm1Ko15o6iXA==
X-Received: by 2002:a05:6000:1b07:b0:336:66fe:8bbc with SMTP id
 f7-20020a0560001b0700b0033666fe8bbcmr2390408wrz.81.1703393308594; 
 Sat, 23 Dec 2023 20:48:28 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0033668ac65ddsm7639513wrv.25.2023.12.23.20.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 20:48:27 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alexey Baturo <me@deliversmonkey.space>
Subject: [PATCH v2 0/6] Pointer Masking update for Zjpm v0.8
Date: Sun, 24 Dec 2023 04:48:06 +0000
Message-Id: <20231224044812.2072140-1-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wr1-x435.google.com
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

Hi,

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

 target/riscv/cpu.c           |  18 +-
 target/riscv/cpu.h           |  45 +++--
 target/riscv/cpu_bits.h      |  90 +---------
 target/riscv/cpu_cfg.h       |   3 +
 target/riscv/cpu_helper.c    |  92 +++++-----
 target/riscv/csr.c           | 337 ++---------------------------------
 target/riscv/machine.c       |  15 +-
 target/riscv/pmp.c           |  13 +-
 target/riscv/pmp.h           |  11 +-
 target/riscv/translate.c     |  47 ++---
 target/riscv/vector_helper.c |  12 +-
 11 files changed, 148 insertions(+), 535 deletions(-)

-- 
2.34.1


