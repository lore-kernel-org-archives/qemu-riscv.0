Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0CDC55165
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 13:37:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpQxE-0006Gp-Aq; Thu, 30 Jul 2026 09:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wpQx0-0006D2-V9
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 09:37:31 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wpQwz-0005wr-9M
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 09:37:30 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2d004f135b1so28851045ad.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785418646; x=1786023446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WRMY2E9FxrNj1re4bnuTp0tUVJ08lXuNTXOMzGgnK3g=;
 b=p+GghPFevxIiYpe4cnbZoV2iKy+BLPXL3zcTwLsQY2v1dkjxdeCSJo+7C25DQUI/v4
 fpLOM/GI6F2gWoxpd/2bN68A7gbhEGjlA0F3j2Tn1nBwMFA3kwm1YJdUaSWqu21NVs51
 roBFi4WoyaPxBZup2eWs2GXR5XZlNKYMKWK2ucsGBiePGwEnCHeGs6YZPNNGulr04Jql
 eSb+qYh7VIf9aeE4KlUmMOtueOF0UIwcIYQPxDgLffV15L17VqqcXO5knn8x/5DJjSLx
 jWNa9BvwOdv2HxO6Y2Cv86LHmszNaKfVI9kN5qBsJqFMqA14ymagEUrkYobD3agBe8jm
 BQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785418646; x=1786023446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WRMY2E9FxrNj1re4bnuTp0tUVJ08lXuNTXOMzGgnK3g=;
 b=lQSmr4YThji5C8W3fVmLm1LSw2IK823CYh56uqlZDRYUWgi/0SaK2HvZS/x/X8X6Pe
 /EOLaiFc+jUMXfo39QTp4wcb6muy7BrTiitwpeqIV2+6Yp/oHeCztiDm6Sra6UlUV8QI
 FeEzQ2N68Tpkm44qk1BUV/x/Epv+oY61GmbqXGxMHxKZ8RZx83+Zp7dkwn5WHQzmiVTO
 vA3Y+aT1gsOTnJwsOzY2lRBLQd4CigLlZhQF+UaPLjv5bBGgBJtRiDj8SD2MajsJp2W9
 k6Tj16xYE/syaLk/3iGLAhh8MZavH0LSc4T8W8x0lhEr+SH0jSaH112udoFDMZPjP2rd
 NAvQ==
X-Gm-Message-State: AOJu0YxqCQegx4Hi2ibziQrRToU0ntAvog5pzVUI/DGmvIrrOZ6ic/0X
 dM8oV9cBtjrhfJzs2TORFTm5NtTyqzpZbmgBxff6htERVFTumtT9jiU7
X-Gm-Gg: AR+sD12vKBtTUoouSW7QvpatTq2jNp/gWRPyZVaitL1Mn7AiNiBADJlyGuvWwCkAHpD
 9Rq5NutR9PYQGg/5SkosyRoLsFcmpfAyED5fGQ3Y/xGqU8lTsAyY5peKGGUowBaBxNX9Pwhhf5M
 bOZ4evbupP+7+4CHjHhE3kobFBxFbxQBHD7FcFjhsuS6C0Cz1bF88ZFgzB5c6UEeZpYwJNeIZpa
 49LMB2SMr29/aaIi+jGPv6h6j6Y35ImSSsItZg4973eraFBVn+OlSSkI0ZE6raE4b2L0b0zi5qL
 gKTw/ZGnOr7miw2f9FbmN+/QT2o5VsNb3b4TsLC5xvnmsRySodM3OvxTem0hqRQY9vLHp7/3QPc
 Ghide2MmRaHENyYPotZ3o6Ofnd9UIS/1R3AzP1s7S+IQoObnqdYiOb/MC4hw9jyVe5Kt+AmA094
 iUIUHcwQL68TwdcWBVIKXzG+YnlyjE5v0uLGn2aCeAQC42CELLGXEe/nptf1iScnPyv9xyWAc=
X-Received: by 2002:a17:903:384d:b0:2cf:4339:aaa with SMTP id
 d9443c01a7336-2d03dcc6f61mr4232185ad.12.1785418646233; 
 Thu, 30 Jul 2026 06:37:26 -0700 (PDT)
Received: from DESKTOP-DFGP8OG.lan ([120.230.138.58])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d022bf845asm26757745ad.60.2026.07.30.06.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 06:37:25 -0700 (PDT)
From: raoyi <rao232328@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com,
 caojunze424@gmail.com, raoyi <rao232328@gmail.com>
Subject: [PATCH v2 0/3] hw/timer: add k230 dwapb timer
Date: Thu, 30 Jul 2026 21:37:08 +0800
Message-ID: <20260730133713.3253-1-rao232328@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=rao232328@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Add DesignWare APB timer peripheral for K230 machine.
The timer uses the Clock framework for frequency input,
preparing for future CMU integration.

Changes since v1:
- Split into 3 patches: model, board integration, tests
- Remove goto pattern from read/write handlers
- Fix include order, add explicit bitops.h include
- Add QOM <private>/<public> markers in struct
- Fix copyright headers

raoyi (3):
  hw/timer: add k230 dwapb timer model
  hw/riscv: integrate k230 dwapb timer into k230 board
  tests/qtest: add k230 dwapb timer test

 MAINTAINERS                         |   3 +
 hw/riscv/Kconfig                    |   1 +
 hw/riscv/k230.c                     |  23 +-
 hw/timer/Kconfig                    |   4 +
 hw/timer/k230_dwapb_timer.c         | 317 ++++++++++++++++++++++++++++
 hw/timer/meson.build                |   1 +
 hw/timer/trace-events               |   9 +
 include/hw/riscv/k230.h             |   8 +
 include/hw/timer/k230_dwapb_timer.h |  72 +++++++
 tests/qtest/k230-dwapb-timer-test.c | 227 ++++++++++++++++++++
 tests/qtest/meson.build             |   2 +-
 11 files changed, 663 insertions(+), 4 deletions(-)
 create mode 100644 hw/timer/k230_dwapb_timer.c
 create mode 100644 include/hw/timer/k230_dwapb_timer.h
 create mode 100644 tests/qtest/k230-dwapb-timer-test.c

-- 
2.53.0


