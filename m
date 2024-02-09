Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41244C4828F
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:42:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rYKZs-0005tx-HX; Fri, 09 Feb 2024 01:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rYKZq-0005oM-T5
 for qemu-riscv@nongnu.org; Fri, 09 Feb 2024 01:41:34 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rYKZj-0002Nr-6q
 for qemu-riscv@nongnu.org; Fri, 09 Feb 2024 01:41:34 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3916c1f9b0so73541266b.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Feb 2024 22:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1707460885; x=1708065685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wCp09nmol1A0rQ+1AAJRGnnUH/HLplW+t7xnlcRb0ac=;
 b=V9h4aoTzg24X6PiebIHVGjkVzEnLJGLFx74GoFUhzrNnnFzCerHRuxnMphlaijeovj
 QnuqxqmQsp8SST+soZfJjndBfYlTWvOHFZLWafq611KjwTZJYCKmnDBQDX9AIVMy8dpC
 5cFiRI70tUOFqurhAFKjDoGG1V2bThp3WmCU3vMY0XU2J3b9CZKkzQShuBKFpg2hHr1o
 o8AKnMSSAarkcBUlbE+7lWljQ94OPJZvI/DkaBAm0ZZyH8o8zfpD096KmlTG/9PPC1Rj
 rlundkDtJ2BEIA4jxFCk9Y6x95/u+ytCLbwlsJlsEW7cw6hS5G8zYLSfO7HdNRAv66sC
 e+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707460885; x=1708065685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wCp09nmol1A0rQ+1AAJRGnnUH/HLplW+t7xnlcRb0ac=;
 b=s3UlUKDZwkUYH9L9AFdeRPLEiJXUK45BD4ZbtBue4NAF0O4Mgzkhxwmw6/JCvEP73n
 Dy9FtLjPvHuqrhSWhkxqnwBoXLcbRAEJHCOGtCqRQ5b4rhx8wVuKrae2Z2BZxzLARpBk
 eqCr3ZY4KiWOnuXU6u/VeZ1UPVIUaMqSJN8kyIItn65g38aW5NLgvkCRXt86YqN3IhXA
 7Kf322Il6nI9IzAMvvP+YzOL1G30aT8WBnpsc+hcMs6ZACUVnJ/Sy3Pi0q1j0FsJ62RW
 AsWSNcA/H7N6ZN2NN/3ihKU1y4jix2i0uqfnbDDz4W2o8+Po7hWosRDyVDKv2uz+jMAr
 KOSg==
X-Gm-Message-State: AOJu0Yzbt19is8SJJB9QYDXMAnSKQg2p1Xz9ASXUwxT7mIRqRjE44kDe
 EUAJs9EHFPtSU0eUmZbC1SObUOr046nyy2WzZU7FGNFniYfH7ZNYPEWHcuO3DkFR//j74gdblav
 Zwf8=
X-Google-Smtp-Source: AGHT+IEKBg84nr86SYmfxNqoXAD34hyHtxhB8cxJKFZpaTsrrfakCv5vqznlBtQggwkFRbs/7fVgVw==
X-Received: by 2002:a17:906:57d7:b0:a38:3db5:a846 with SMTP id
 u23-20020a17090657d700b00a383db5a846mr361765ejr.67.1707460885121; 
 Thu, 08 Feb 2024 22:41:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4isIeG8UQExqmyp1L07xw4L4UZM31Nnk//Z2gXTK6zEakr2NfMBcqENw58acmy58Yt2CPQXFvvxLTkw+oDV8VdltqOXwhebR2Uch1ScJ8Hlr5CsRy3o1rspcMQhPLuqXit0sjFf3uT8WhKNTSohbxDjWdbgk0zmS2lhsIRA1Lcf4F2I5Wiywnh9SmgKpJO76GDRaxu+vtVo6JcWf/5ZM7q564Stfto31OOAf/HKBrQ9hpIynglS/9302GX4mpUHZiDQbuN14SZXjeZ3PD9okJCXZ2q8RfK//2KuCGoAMMMR9ja0x00TWOOE5e5JMpSPGyzKYQXgYH
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 vk9-20020a170907cbc900b00a36c499c935sm450575ejc.43.2024.02.08.22.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 22:41:24 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2 0/4] RISC-V: Add dynamic TSO support
Date: Fri,  9 Feb 2024 07:41:13 +0100
Message-ID: <20240209064117.2746701-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The upcoming RISC-V Ssdtso specification introduces a bit in the senvcfg
CSR to switch the memory consistency model of user mode at run-time from
RVWMO to TSO. The active consistency model can therefore be switched on a
per-hart base and managed by the kernel on a per-process base.

This patch treats Ssdtso similar to TSO, i.e., the guest is always being
executed in TSO mode, which simplifies the implementation a lot while
still being correct. The downside is, that we have a performance penalty
on hosts that don't run with TSO.

This patch implements basic Ssdtso support and adds a prctl API on top
so that user-space processes can switch to a stronger memory consistency
model (than the kernel was written for) at run-time.

This series is based on the third draft of the Ssdtso specification
which can be found here:
  https://github.com/riscv/riscv-ssdtso/releases/tag/v1.0-draft3
Note, that the Ssdtso specification is in development state
(i.e., not frozen or even ratified) which is also the reason
why this series is marked as RFC.

This series saw the following changes since v1:
* Adding compatibility with Ztso (spec change in draft 3)
* Use PR_MEMORY_CONSISTENCY_MODEL* instead of numeric constants

This series is based on riscv-to-apply.next with two series on top:
* Sync hwprobe keys with kernel
  https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html
* Add Ztso extension
  https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01296.html

This patchset can also be found in this GitHub branch:
  https://github.com/cmuellner/qemu/tree/ssdtso-v2

A Linux implementation of DTSO can be found in this GitHub branch:
  https://github.com/cmuellner/linux/tree/ssdtso-v2

Christoph Müllner (4):
  RISC-V: Add support for Ssdtso
  linux-user/riscv: Add Ssdtso extension to hwprobe
  linux-user/prctl: Add dynamic memory consistency model prctl API
  linux-user/riscv: Implement dynamic memory consistency model support

 linux-user/riscv/target_prctl.h | 76 ++++++++++++++++++++++++++++++++-
 linux-user/syscall.c            | 20 +++++++++
 target/riscv/cpu.c              | 13 +++++-
 target/riscv/cpu.h              |  1 +
 target/riscv/cpu_bits.h         |  3 ++
 target/riscv/cpu_cfg.h          |  1 +
 target/riscv/csr.c              | 14 ++++--
 target/riscv/translate.c        |  2 +-
 8 files changed, 123 insertions(+), 7 deletions(-)

-- 
2.43.0


