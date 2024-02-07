Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C09C4828F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 11:59:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rXgaY-0000CP-07; Wed, 07 Feb 2024 06:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rXgaW-0000Bz-Ts
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 06:59:36 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rXgaV-0008O6-H7
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 06:59:36 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56001d49cc5so577055a12.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Feb 2024 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1707307173; x=1707911973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ND7tRJ3vC0F00mzDZV5ci1goZsxFLnGyDR0NN5uEXrQ=;
 b=dwJ4+WNZEt+rSynVGx75XyENzFCZtX9N2hVZuh+JOhxgWTG6LeAtgmEkmaiD4WZxIC
 j3b8Y8jaF5/NEgqwpJnB2feRgK5dvucAi28kIVszmLdsCTOxth0AhTjJ9+d6lO/DA206
 0qbIHLhPgkMkjx3sy2l8PZpl+ehuvVn6t0BKTI6N7bDZ5eQUn2yWDJNaqvV3oIACs0P9
 eyZqQ4JPDiZRuGXsrmTVcTv6allJcQfrfxq0MVEyjcS2X+s8z5Y7OSbefNgNBh8NEfP2
 Oe9Cs7vKQqCnUNRc3C0DEL6g2T1zMbEwYJCD6J+8aw30JjRbUOXmF5smauN4w+mWYJV0
 vhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707307173; x=1707911973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ND7tRJ3vC0F00mzDZV5ci1goZsxFLnGyDR0NN5uEXrQ=;
 b=LL1JYhl57j48SPADHgKZthxMnUKui0SFTwc4MlHItK7eeJ+L5aKtMqlqeHS+LrPWma
 2UR+uVmuCg01HXL35UlWP2VI369Dx4VToe43tqOH7uldOrkgN1bYCfnsNC4MtQKmtDxo
 yGNusHwJacqSj/bkTJpT5jhUvOE4p5H+CsTolF/1yrDtI/PkUReey658WHHNXTsd/2Fz
 00e0jo6hYX4hVaF0YDmDfYLM/Gb9i8Kj8+f6fjrMF2MmNf8W39V8FRn9TQOC31jteQId
 +5E6byywG/2lc9Iai+Mvjv0HcO27pJ4HurrZiwntnPWax4O8aUqQvOJriYdVaCq6p+U/
 VLmA==
X-Gm-Message-State: AOJu0YzIR/vIUdJoitOV745bnEXcQn2cmwLrIHX3kgI+8sl1shNJNtwk
 JMPY36CjiHxhGcQtz6JHMbu2oNFq86PQw64EFQGby7Zy7PN7lLQ2m7tVs4mvtaxVlwBmepnlWJ8
 hjgM=
X-Google-Smtp-Source: AGHT+IFTKrTBlbWGzJKTI+yafA7TAtPPtii6lMWxQ/nSgrc3AWBj4kknK08uLMJI/i3TFoiRZwGCJQ==
X-Received: by 2002:aa7:da98:0:b0:55f:4ce3:597a with SMTP id
 q24-20020aa7da98000000b0055f4ce3597amr4074936eds.2.1707307173300; 
 Wed, 07 Feb 2024 03:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCm1XnMxG1WDCqh3YpjLU7ZWKUl9E62iJCDbw9+WYfXai2wkgwEN/QMXO0+r5NvS+Mp03uIZ90fRG9I8nxRkHQFd7VhWxMFXyH9q5MY2VvtZ4olAqQgXiXuFqiZaws1PcDaYtregZmiPxuK6XTWaQnWOOTTRkBXcBlyO3Q1J0+iUcTVTGe0z4MW+C5SFHX4kKoE/EChB+B0Fi3sLZEVLEt+sIHFKuBl1TrCtCni/GP/MGoQdzusAUsZr/1rTgA9LYnO+uuOufnpjtzsFYfabgnyeHHd6DQsbjd2uXcPsHWpILExsYeWcDsNvzPKG19/oYIfecGtCnA
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020aa7d802000000b0055efaddeafdsm588455edq.86.2024.02.07.03.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 03:59:32 -0800 (PST)
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
Subject: [PATCH 0/2] linux-user/riscv: Sync hwprobe keys with kernel
Date: Wed,  7 Feb 2024 12:59:24 +0100
Message-ID: <20240207115926.887816-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x535.google.com
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

This series syncs the hwprobe keys with those available in the upstream
kernel repository with the exception of Ztso, which is not supported in
QEMU as of now.

The first patch is a resend (sent on Nov 27), as it should have been
picked up on Dec 6, but seems to got lost.

Christoph Müllner (2):
  linux-user/riscv: Add Zicboz extensions to hwprobe
  linux-user/riscv: Sync hwprobe keys with Linux

 linux-user/syscall.c | 99 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 6 deletions(-)

-- 
2.43.0


