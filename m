Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB9FC47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:58:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL6Qo-00055n-JU; Wed, 03 Jan 2024 13:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qn-00054q-0e; Wed, 03 Jan 2024 13:57:33 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Ql-00040l-EQ; Wed, 03 Jan 2024 13:57:32 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2821884a09so187103366b.2; 
 Wed, 03 Jan 2024 10:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704308248; x=1704913048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tzo2ZaazSqSr8wtZy+BN1LyojsFg7RmSXQ8T3PpV764=;
 b=mobhfwJmkSKQHDfz0Nc25+dul9rbPi7n3uJB5Y0H8wKGmGfQDkQpDTy6X4S5mbFU+1
 L5K2zwv2SmcNMw+zD4apB8BMbwpn5B9gRZ15n9GSfJ0EIiqwwS2PBtvCSReclKKnJlCX
 +pretzPvv63qAJlBcIVYW6v9QeV3wk4XVyIj2HnF1HzOmaeUR47wfm5JZqw79yhoTXES
 ipCtC3MYhCZs5fae4bn4GS/tA4wNN7S0rk9iK8+y1X7I/Ua9Ss3pekBqpRfaplnMjyNc
 691VkI1GMJvdNp8UCaR77H3BV41f3CNI50DvQjD31wTs/5qoN7Aydjk+PqoQVjERTluD
 oIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704308248; x=1704913048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzo2ZaazSqSr8wtZy+BN1LyojsFg7RmSXQ8T3PpV764=;
 b=KY0bzizRCGyOGa+HOzFjOAQCYrIO1gXuEmGiUxNv2DRgGhraK6b/cGLwwJYzSHhbjg
 CM5L7Zq6CtZUwTRG8/wxgj6uqnfrrRYYAwd90xc6YpR0qF7VNtiRa8QFkATeSsnowCnT
 PMnoW8wdXH1BzCrhVTXaRaZtsfMmnugDrSW2Csc5+ZOeJNWsoCfZAF+DnmyJ01dw2Xnv
 bOz8YIkL1QEaeevIgUaeuLGAJEU3+aV0pZ2hHBmAdVoQGBLJ8B39QkC3OmGz5ln4rjaY
 ZHCgaDzwqq7WktLNIMnuihEnYZlVaxhNlDEfFTMdTwbBcIejRRK8P2IbgSWUTtkL27D6
 6DZQ==
X-Gm-Message-State: AOJu0Yw/Vh5nlfNNCzfxGynXmQpNUBccatPFtd5pBQgUDKicn6M1OvvC
 IZ6iUdi2KuGnn56wYevBADQ=
X-Google-Smtp-Source: AGHT+IHIK7Z8mUUntxdrjAuIPZnZ4xPMxLynZWcJdhCyQKyqDknB91HfwaVCU7568WWhy5dAduPNvA==
X-Received: by 2002:a17:906:a0ca:b0:a27:773b:fcf1 with SMTP id
 bh10-20020a170906a0ca00b00a27773bfcf1mr4678705ejb.9.1704308248342; 
 Wed, 03 Jan 2024 10:57:28 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm3897915ejc.105.2024.01.03.10.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:57:27 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 0/6] Pointer Masking update for Zjpm v0.8
Date: Wed,  3 Jan 2024 18:57:10 +0000
Message-Id: <20240103185716.1790546-1-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x632.google.com
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

 target/riscv/cpu.c           |  18 +-
 target/riscv/cpu.h           |  45 +++--
 target/riscv/cpu_bits.h      |  90 +---------
 target/riscv/cpu_cfg.h       |   3 +
 target/riscv/cpu_helper.c    |  93 +++++-----
 target/riscv/csr.c           | 337 ++---------------------------------
 target/riscv/machine.c       |  15 +-
 target/riscv/pmp.c           |  13 +-
 target/riscv/pmp.h           |  11 +-
 target/riscv/translate.c     |  46 ++---
 target/riscv/vector_helper.c |  14 +-
 11 files changed, 147 insertions(+), 538 deletions(-)

-- 
2.34.1


