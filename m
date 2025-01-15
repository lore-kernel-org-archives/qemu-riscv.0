Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DC7C02185
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 13:51:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY3mf-0005tX-EB; Wed, 15 Jan 2025 08:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY3mc-0005so-Vi
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 08:50:11 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY3mb-0007q1-2c
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 08:50:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id
 5614622812f47-3eba559611aso1999360b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 05:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736949007; x=1737553807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4/zMR1ds0rMewx+rvOE2sEE1ZAiNyaqJegyvUM7C3to=;
 b=n5It5pXanZvE+NG085rILl0Dh7cf0cCBpQ7VfQgBmAGFcz7bhTuKxfOgztf/KjUHIM
 4jP8Aia6ZJNS7aeDmAWfl8CKurSaI+uW+5FACcbaB9UiGgn0rvyGDkEFZyVf0+9W/GlM
 x9OvLeiqPU+iQWc6m9dsFnpljNnmNX/D9Bi9aIGO9NahcuG/Gxj3+EnBNLnsOz/qJ5SQ
 6gCwJbyxsH8h0blYiJuHWYpF8MgvkCyumN0JoBpsAnOB917IBAjasxvTUhEHllYTiddE
 CrOf/mixW6/ho6oDaoIcvuzjZ3nOoGIduxqji9+2y6UyCv0y05NXA4geqoWWbY/SGGOt
 Jmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736949007; x=1737553807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/zMR1ds0rMewx+rvOE2sEE1ZAiNyaqJegyvUM7C3to=;
 b=udbuyCK1HedD4LwULtJErYqlGqksjrkznZcvUibbQ62y8bgwzluu87aW1tAbya5siL
 5Ke/vLk3svN/ZYwSIpXHTNQ9OTt7LoCcJ/wf7JwS3aQkcxmz0MUaApPb5etNxLfnsx/E
 iYo2acweRIP0nhmKZvPbIO1502EEUhzmAHD8jigMl2HXFBuXlf0vEOndg/WJwrkOYt/d
 cHrn4FZEd/u3Plx+wBBAtf3NoLHiBbeaid82WsBmPf0J0yQp8CtZPgK2MKzWLN9IBcFH
 IeBbIDj4ifAp5Z2ffPqfB9r7pr+J/9JPrkSmAMOG3pxP9Loct1+tLFSoQ5kMyzEMPnxj
 38Ww==
X-Gm-Message-State: AOJu0YxcGv5lA8QVb0BR8x+LjNAl87mqlztf642L0XLlzyFX+5jNTWuM
 zfV3qA53bhbmAjNiU01cLQ/5vsS3f6LoBAZ7txQh5UdbvXMpYfWHcYDiibpEXWo=
X-Gm-Gg: ASbGncuod3kjIUk1Iw+JLHbaNv33W+1jkJkOKy4pH2IolvZmLhR9xz6CfXDc5FRshEL
 DstrIhv2hTIp9//a/5SZp2Bl/nZ4BNmumvbfFKV5OYLE5IGGNe0CODDJ96rd65Rgl47W76H6F9F
 OVHOSLhc3voypdXO6VRgL+cS65h04VqHAqgG3G6xNY4byEdSdVQEfQLqTQmwUNhEGsR7meggvQh
 Ehpg0fG/agW6gJ2yVWGohJZbBMcoxpCL5tkQlxfJfnHR70EsLyjIBDyQuA=
X-Google-Smtp-Source: AGHT+IGb0vdGFASrX+ZEbujEPC4Om/XnCvnQxX/Vao9ha9jYDCrw1bx8847R9IvBLQfOILXdYsF+sg==
X-Received: by 2002:a05:6808:11c1:b0:3eb:6326:78e3 with SMTP id
 5614622812f47-3ef2ee3b6bamr17483593b6e.38.1736949007666; 
 Wed, 15 Jan 2025 05:50:07 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f0379eff69sm4952177b6e.41.2025.01.15.05.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 05:50:06 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/6] target/riscv: RVA23 profile support
Date: Wed, 15 Jan 2025 10:49:51 -0300
Message-ID: <20250115134957.2179085-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

In this new version we're now implementing u-mode and s-mode profile
dependencies, as suggested by Drew in v2. This makes implementing s-mode
profiles easier since those profiles usually inherits from both their
equivalent u-mode profiles and from a previous s-mode profile.

This is done in patch 3. Patch 4 is a change made to prevent a warning
that will occur after patch 6, where we're adding RVA23S64 by making it
dependent on both RVA23U64 and RVA22S64.

Patches based on alistair/riscv-to-apply.next.

Changes from v2:
- patch 3 (new):
  - add u_parent and s_parent attributes in RISCVCPUProfile
- patch 4 (new):
  - do not issue warnings when a profile runs in a newer priv_ver 
- patch 6 (former 4):
  - add RVA22S64 as the s_parent of RVA23S64. Declare RVA23S64 by listing
    just its own exclusive extensions
- v2 link: https://lore.kernel.org/qemu-riscv/20250114190001.1650942-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (6):
  target/riscv: add ssu64xl
  target/riscv: use RVB in RVA22U64
  target/riscv: add profile u_parent and s_parent
  target/riscv: change priv_ver check in validate_profile()
  target/riscv: add RVA23U64 profile
  target/riscv: add RVA23S64 profile

 target/riscv/cpu-qom.h            |   2 +
 target/riscv/cpu.c                |  81 ++++++++++++++++++++++++++++--
 target/riscv/cpu.h                |   3 +-
 target/riscv/tcg/tcg-cpu.c        |  37 ++++++++++----
 tests/data/acpi/riscv64/virt/RHCT | Bin 390 -> 400 bytes
 5 files changed, 109 insertions(+), 14 deletions(-)

-- 
2.47.1


