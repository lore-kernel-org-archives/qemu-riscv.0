Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E049C54E49
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 13:38:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfgcZ-0002p1-8J; Thu, 29 Feb 2024 08:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rfgcW-0002od-Tw
 for qemu-riscv@nongnu.org; Thu, 29 Feb 2024 08:38:45 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rfgcV-0000DE-7F
 for qemu-riscv@nongnu.org; Thu, 29 Feb 2024 08:38:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d3ae9d1109so526345ad.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Feb 2024 05:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709213921; x=1709818721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WsGoSdEkaUDhp8Tvx9F41Q//SHdKUbQKZ6C//jZPrGs=;
 b=GxoPw9RPe5zyh0dD6G1SSdOu2mSOkHQ8I4Q5o6bSaBf1PUHTk1jDjksnw14x3775A8
 jdKlwGP+GBkrY3YX8hx2yAhArPvW5U9rk6SBwPZmCHvsZ0hm68vUyBZSzNMjXlaOT/7H
 wHIsaInSU/fwGaZQB/5U81alsoTvRJ86Zb/WpadDMTLWe6J/aPS22+JQtd6+yz0dxH2j
 fGXmS/EM7jXRjWquEDWf2WmDy7mFlh/ZY6X5DHadj5FQ/Lh/Jjiw98KnyrL7liVnGlO+
 KYj7f1ALj32k1HWbW2UAdLIUht7XOK0+Ht1IEhmvAzOU4ZwE+lmaCzhwAdORx44BZ3Bm
 MuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709213921; x=1709818721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WsGoSdEkaUDhp8Tvx9F41Q//SHdKUbQKZ6C//jZPrGs=;
 b=fKgh2Cq79681P3smPSg6Cxk3jR5yo6L80JQPBkQSg9uOwLz6nfAeCjVA2pXrXFYPzi
 oOOmsvPKJlUxLDnjb/fmVIMLdQZy2OsYVm29hB/RVPMkz8NE4lZbU9+l9cQh4Z781yeh
 MIJofFG2Cv0ODcxNKSWaBCnntcItRjaDS+ISB5pYGdNN3j86d6xKRtSrw8msTTmfcd3I
 VycOz5lOIZaj2hIYstshsNXpL2cgYgo2ARPVSQ8HdN7QOJjgb/SVzobeKr3uXppEEdz4
 YXchNQpEyAe/NRgrbEDTACu7oQ1DThkpOnTfl4ghMveBaJrJEkpm1lzIvLC+FKWlxyKq
 qnfA==
X-Gm-Message-State: AOJu0Yw3WAP/c7W/3c0nGdtU4b9Uq9jTs8FbJokZVLXJ18jrlpvnY/ag
 a8JPqqimnOy0bxWcUy0ZhQoHMqhkgaUYqippcDLTsaJnKRCE1WS6buzVDB8xfGgHCHtjTnjF1Dq
 b
X-Google-Smtp-Source: AGHT+IHsp39wTaXzqSwW7kN+5//ri90olKBS6bpKUeBqJ3UJkZOhl/sWsnX85p85zNIBduWzrWCbLw==
X-Received: by 2002:a17:902:ee0c:b0:1dc:96c9:a122 with SMTP id
 z12-20020a170902ee0c00b001dc96c9a122mr1967866plb.5.1709213921055; 
 Thu, 29 Feb 2024 05:38:41 -0800 (PST)
Received: from localhost.localdomain ([49.37.249.67])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a170902fe0100b001dc941f145dsm1454918plj.253.2024.02.29.05.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 05:38:40 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v3 0/2] Export debug triggers as an extension
Date: Thu, 29 Feb 2024 19:07:43 +0530
Message-Id: <20240229133745.771154-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

All the CPUs may or may not implement the debug triggers (sdtrig)
extension. The presence of it should be dynamically detectable.
This patch exports the debug triggers as an extension which
can be turned on or off by sdtrig=<true/false> option. It is
turned on by default.

"sdtrig" is concatenated to ISA string when it is enabled.
Like so:
    rv64imafdch_zicbom_*_sdtrig_*_sstc_svadu

Changes from v1:
   - Replaced the debug property with ext_sdtrig
   - Marked it experimenatal by naming it x-sdtrig
   - x-sdtrig is added to ISA string
   - Reversed the patch order

Changes from v2:
   - Mark debug property as deprecated and replace internally with sdtrig extension
   - setting/unsetting debug property shows warning and sets/unsets ext_sdtrig
   - sdtrig is added to ISA string as RISC-V debug specification is frozen

Himanshu Chauhan (2):
  target/riscv: Mark debug property as deprecated
  target/riscv: Export sdtrig in ISA string

 target/riscv/cpu.c        | 38 +++++++++++++++++++++++++++++++++++---
 target/riscv/cpu_cfg.h    |  2 +-
 target/riscv/cpu_helper.c |  2 +-
 target/riscv/csr.c        |  2 +-
 target/riscv/machine.c    |  2 +-
 5 files changed, 39 insertions(+), 7 deletions(-)

-- 
2.34.1


