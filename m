Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F8BC5AC82
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 02:34:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsWsd-0000Ad-Jl; Fri, 07 Aug 2026 22:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wsWsa-0000AM-8o
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 22:33:44 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wsWsY-0006yx-KU
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 22:33:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so150442a91.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 19:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786156421; x=1786761221; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=0oppz2+GULCMS/pK/2SJ5hbrMu9bESOBoj8UNjWJ6Dw=;
 b=kzrA2R/ECePs8KXA8pXloi1tdehomUiI2RbpHL3PwLoi3yr92rWc3WmVoyWNnVoiMu
 Np3ksSDAaPCBF1xTGem5YxZzXAJq4NFymjQ2FW1VAJrPi+/+m5tm/Ge3dWVvCVZxIENN
 LmuC5zvLCCdfpi1bmKQbTrj/eAFXNtoIn8UABdhep50giX6oMovALjNPVDjHPLP0q0cb
 u803zKDFLYBMS2sFJRWJLN+Ins5BANsBqOwXSMGlA3Hm3NbMUKRuFkioWn0p8siCwhQP
 Oh+Wndg3071t2da+9wjCzdxwAxxWampzEc3X6ipwnWushIlcR0ReXhky5mEzHuiYqCQP
 pdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786156421; x=1786761221;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0oppz2+GULCMS/pK/2SJ5hbrMu9bESOBoj8UNjWJ6Dw=;
 b=i7yQQvN6EXu/+ep27c1E4o0eLLLp4oc62K7s1h6+UF3m4WiaYczquV51ZIPNB/Hbmg
 ewPR1SvcIX5pXZpCWXWPgSl3STLtMQ3z7P2otyTxJYcn9c61/IZO6Zv1M4BThSRP8Bup
 IDIFXGFYEIfKQIwWl9lZiN2u2g2Z/CWZku0XHmcZ8L0wHgyajwtbqEF6J2Tpf3pvZqBf
 dfecgruihOnWZQ2nD753jG7m2gzjtcsvwkQVdcU1OixCLL9hX+T0evKa002vwAxnsHkV
 W+7YYPVqkSnztT/JnCfH8GBHMrZ8oj50JIT/FSyTqE9pjQHqlQ8ou44EnKiqVQH/KXtB
 37fA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZ8s58ORMYEr0iljB0RFAiNn2dvACUtEiCBHakDfNK9R5GKKbDTVn16+xYV3dfM4D/kH3+IkGMX3Ug@nongnu.org
X-Gm-Message-State: AOJu0Yx13Kg7Wd0II/85m/rNc/BL0ABor0uCvJ9zDQu/QkZkIkmvV8U0
 zupUKdoNQe6+wGOam+xuSry14Xf8wHmlzTyOPeBv+F8fQ2MBki0FhVjTuJ6PdMcr9hU=
X-Gm-Gg: AR+sD11oYK228kQnkykiyhyajZ5Qnu9JoGkKoCLpIupEfa1+2k+fQ44AvsaTjXr9eeN
 50z/Zx7nWegdwRUYH4K+eEKkEJJDYvZq7Wz93elcfIMQZoJYsr1kDPDFJykHSKwVgT3kofri1EW
 oLucBb0+gQBfvLeaJg1suXflk4Dy+qfngBlF4y/lD+WFzc+rnSIfn217q8AHFpvcUtVYHvClJHq
 bjEnOCoCPMtUNg8K7bdXTRATHYEPdDF93adSH/h9Twv38TPxhpVq75l1117MBfkAKsCiADsuw14
 7R36e/2uFBhiD02GokWddvi5SDfTevPa0p5xA50F3xo2xG1ukRCjc30yqUFEuWUdrqq/ZdIyJcB
 81Ah2fCixNw6+xY8LrQBdmFXMGkCZurBf5XfT/wU1C6Q9lnuwRixUcVa8sbVs7KJU8P2HZpiw0V
 vFf3HBd8A9C+4w6Vv47pGglLKph09wPXveg+ewWI8SgwhHeOzl75DmrGQEjaTTF2Zid2GY
X-Received: by 2002:a17:90b:1d8d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-3903c56c2eamr24923345a91.9.1786156420715; 
 Fri, 07 Aug 2026 19:33:40 -0700 (PDT)
Received: from [127.0.1.1] ([14.19.40.154]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3925ff69eabsm4475835a91.15.2026.08.07.19.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 19:33:39 -0700 (PDT)
From: WX Chen <wxchen0913@gmail.com>
Subject: [PATCH v3 0/3] riscv: Add K230 DW 8250-compatible UART
Date: Sat, 08 Aug 2026 10:32:41 +0800
Message-Id: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmVdmoC/2WNwQ6CMBBEf4Xs2TV1K9B48j8Mh6bdwkYB0yLRE
 P7dgkeTubxJ5s0CiaNwgkuxQORZkoxDBn0owHV2aBnFZwZSVCmjDAa2E95JK3zZOOGsUYWgq/L
 ka8UB8u4ZOch7d96azJ2kaYyf/WKmrf3Zair/bLRFoS8DG3Ln2pG5tr2Vx9GNPTTrun4BIf5JV
 7IAAAA=
X-Change-ID: 20260808-feat-k230-uart-v3-0ff3651d70ef
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786156416; l=1494;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=WcwPIRLdO0CH5Krq/TzrO0HCWrzJJ+KPdw+EBOOjbyM=;
 b=PxbVmxixOvSf/mJ0Rbm6Rh62auamFVMuX+tA2pM74reQKcDKgm7d24pHKoFK+4Tt8rddQav7X
 F1I1PvwhjXBA8LlNp9VdwaW81xkf+hlvy20B26PXp/o2DsSyQ1F2UzY
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=wxchen0913@gmail.com; helo=mail-pj1-x1029.google.com
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

This series adds a QEMU model for the K230 SoC DesignWare 8250-compatible
UART controller, wires it into the K230 SoC, and adds qtest coverage.

The implementation supports the registers and features required by the
Linux 8250_dw driver, providing an interactive shell over the serial port.

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
Changes in v3:
- Removed all hardwired preprocessor #if conditionals from the logic
- Added a helper for the receiver line status interrupt check
- Encapsulated CPR and UCV register values in header macros
- Replaced g_usleep() with qtest_clock_step() in the qtest
- Link to v2: https://lore.kernel.org/qemu-devel/20260725-feat-k230-uart-v2-v2-0-d5fe82c47c28@gmail.com

---
WX Chen (3):
      hw/char: add K230 DW 8250-compatible UART
      hw/riscv: k230: connect DW 8250 UART
      tests/qtest: add K230 UART test

 hw/char/Kconfig              |   3 +
 hw/char/k230_uart.c          | 816 +++++++++++++++++++++++++++++++++++++++++++
 hw/char/meson.build          |   1 +
 hw/riscv/k230.c              |  33 +-
 include/hw/char/k230_uart.h  | 198 +++++++++++
 include/hw/riscv/k230.h      |   6 +-
 tests/qtest/k230-uart-test.c | 514 +++++++++++++++++++++++++++
 tests/qtest/meson.build      |   2 +-
 8 files changed, 1559 insertions(+), 14 deletions(-)
---
base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0
change-id: 20260808-feat-k230-uart-v3-0ff3651d70ef

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


