Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B29C87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 15:03:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiwf4-0006jz-RR; Mon, 04 Aug 2025 10:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKP-0008Fk-TC
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKN-0008RI-4e
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so13235305e9.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314449; x=1754919249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=71w1yPowl9RTO7KXVQBpxY+KjMD4LfNAuPnGUS2NDmc=;
 b=iKNCgMriSgqGuMjQiDDJHOcRBMd1vJlwqVsI4oSHJy+yMfkX9uBqQuykHm3ZmiWCZ8
 Be2O1ZgJULNONaZwWk/jfFdyIQ0tLUOmYM/332lUqZAOQnUFNImqb9sUbqv6oL6kjIsO
 +ZYXbY497r1rgavxrZkHTQRoT0fMJuQcPhuIzB2SRfyYh5wejLg2gdUcONLCiJSB5pCj
 YiZ0kWlyHnUF4toULxnAn6eSwZxktrhl4EU3n26F0ctlsh/bwsedbWw4YD9KReqwLaFv
 Cwt966+chUuIVCijftGcRd+ka78mEAEFDK7euh8/63rcgtmcLqiaf+MO6jWMiZ0fyHLr
 xB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314449; x=1754919249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=71w1yPowl9RTO7KXVQBpxY+KjMD4LfNAuPnGUS2NDmc=;
 b=eMzeHdZW0ovuXBWT4n4xRs4nqdwnmfKqIRgWMOP22cuVstpD64gyTS4t1gfyE0D7/o
 k5hYDuAK4FBjzymMw0mcAFvu6thzxPjSsgHQmaK1DUgskj9veXvFVgX0QJs2eX+UDSaw
 +lZUMGKc1ed8sx0oVHyJJZOuEPc1thUoWEcitg8qqDMnt3gmELofc7lmdcykZd5zgzex
 jj+ElxKj0ngQH/PfVNF8ISpn9EFRJSVk9KH++aYnXfN4Wr2KIbIZplasPoZoI0IN0w99
 NKqNPUdm1hyks+KxTgBTaoM58PnlUTYXiST+snL00RqJwAfcfpAScFGC/lOerP0hTAmt
 DQKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXownOH4Hv5tOmH6AzT7pYLASTaskXnRxoz8gBf6e8vslx/i8fM9DYQqBCU9Ekf7REnpQDzqR0GgQvW@nongnu.org
X-Gm-Message-State: AOJu0Yyy1+o2YaoByRTB+2ot4pQHojv9PGazK4phqMzMW4F7xru0aqxW
 56+woc8YjYx/PvjFFJ84uujy5VibFPnH+OEA5gCPqRDY327ECXsdDXuLZxNJ+JMv+Bk=
X-Gm-Gg: ASbGncsDXDpcsxmH5IPMDvPPGm+pWkkTE9n9qetdWiR0lnJbo+YKukWUT4mCvafNeq6
 J0mWWxmDf2LeWJZ08/gGskQ3VmdJaw49s3oS3HIokojnkOso6Oz2fU3MrYCV1kJNX1o5TtrSAvj
 FHV7dEOhAqbHsx529Wi//4OPAw0ajokv0KO9buaBtqZh3ntPOqy5ggiun0V7Hi4UxEXjEAXyaEb
 S503E9PUYm+AZtRAN/pE5muvDOmvwNYrzmwAqOwoJhbE1ENwkpV/3WyC+tNwEG+i88ftpX+qF/9
 fIBE8lnooGc2AvIX/P5aKCu+M2Q8ZbRzNnl5MiAJ/yYDR8CdBGG/UU0SZ0eNV7bu+O1Clj9Juw9
 rot77DMpgKPXcyK9igVKXfzE+LUB4Pp9cqVEQYfvQLxzDeIGJ90V7OVNnc6a5WBSi0g0bO0kN
X-Google-Smtp-Source: AGHT+IGbVe31gT//v4a6/azroTh7Glf6nat9vb1d57UA4WFAUaQNKmwJd3Tn0DGKUg0tri+n8dAMsg==
X-Received: by 2002:a05:600c:1e8c:b0:456:11cc:360d with SMTP id
 5b1f17b1804b1-458b69de114mr73176085e9.9.1754314448442; 
 Mon, 04 Aug 2025 06:34:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dfa64da0sm12464425e9.3.2025.08.04.06.34.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 00/11] hw/sd: Fix SD cards in SPI mode
Date: Mon,  4 Aug 2025 15:33:54 +0200
Message-ID: <20250804133406.17456-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Since v1:
- new patch factoring sd_response_size() out (Richard)

This series fix a pair of issues with SD cards used wired
via a SPI link / controller.

Such mode implementation was minimal. I was testing it with
the ARM Gumstix machines, but we remove them in the v9.2.0
release (commit a2ccff4d2bc ), so they bit-rotted.

Although the series looks big, I shrinked it a lot to have
the minimum amount of meaningful changes. Other changes
added during debugging will be shared later, as I believe
they will still be useful to debug other future issues.

The last patch add testing coverage, to avoid further bitrot.

Regards,

Phil.

Philippe Mathieu-Daudé (11):
  hw/sd/sdcard: Do not ignore errors in sd_cmd_to_sendingdata()
  hw/sd/sdcard: Factor sd_response_size() out
  hw/sd/sdbus: Provide buffer size to sdbus_do_command()
  hw/sd/sdcard: Fill SPI response bits in card code
  hw/sd/sdcard: Implement SPI R2 return value
  hw/sd/sdcard: Use complete SEND_OP_COND implementation in SPI mode
  hw/sd/sdcard: Allow using SWITCH_FUNCTION in more SPI states
  hw/sd/sdcard: Factor spi_cmd_SEND_CxD() out
  hw/sd/sdcard: Disable checking STBY mode in SPI SEND_CSD/CID
  hw/sd/sdcard: Remove SDState::mode field
  tests/functional: Test SD cards in SPI mode (using sifive_u machine)

 MAINTAINERS                               |   1 +
 include/hw/sd/sd.h                        |  23 ++-
 hw/sd/allwinner-sdhost.c                  |   7 +-
 hw/sd/bcm2835_sdhost.c                    |   7 +-
 hw/sd/core.c                              |   5 +-
 hw/sd/omap_mmc.c                          |   5 +-
 hw/sd/pl181.c                             |   6 +-
 hw/sd/sd.c                                | 198 ++++++++++++++++------
 hw/sd/sdhci.c                             |   6 +-
 hw/sd/ssi-sd.c                            | 100 ++---------
 hw/sd/trace-events                        |   4 +-
 tests/functional/meson.build              |   1 +
 tests/functional/test_riscv64_sifive_u.py |  51 ++++++
 13 files changed, 249 insertions(+), 165 deletions(-)
 create mode 100755 tests/functional/test_riscv64_sifive_u.py

-- 
2.49.0


