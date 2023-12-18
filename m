Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4646CC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 05:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF5z6-0007Co-4W; Mon, 18 Dec 2023 00:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rF5z4-00079D-CX
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 00:16:06 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rF5z0-0003Mg-3l
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 00:16:06 -0500
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3ba14203a34so2830155b6e.1
 for <qemu-riscv@nongnu.org>; Sun, 17 Dec 2023 21:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702876560; x=1703481360;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MQkvW1tOkRiSsEaCXa+9cOAdN1s3DAxZ9i2ytKg37Fk=;
 b=y5fpeYhAxH4Q5v77gMirg5OIDvHznMHpyITeYjQk3slB17aAfHpgyJzVkIVX1BRrGD
 FztDcqGSQZaaaEEtpRTubFyoHObXhGd30ZnlnHGh9U50CRoRabzhMq8tgoMHRXVP9vbR
 Q3nHL1skDpDgJHrhAsdiYQ3SIpVeFq9aQslGtflwWAQ/UQhwIePZVaOdXG0HAmTowrv+
 fB5avf7HDNV4rvXJbQY9IKpZpkE+7ZW50lmYB8Eyg/CeW0MP5518cCdKfSpKQLsVSCze
 ORmmrinLYFriGg6O7xkuz5/uDU9/sYs+Tt8cxsgnzqmOTci0Qwn2DmZj8FYk+uV5Vty/
 Ziiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702876560; x=1703481360;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQkvW1tOkRiSsEaCXa+9cOAdN1s3DAxZ9i2ytKg37Fk=;
 b=LhRK9baCrxEKX1hts9euC9bu1NR6A/+SqCJwnzPVo2MFelVLye1wqTjZfOQXsEs8ay
 Usl04RLAVa3lpbB9z1y09pXx8XMk/qweZ33f041X+LgpXizuR8nkzREW/Y7cIDFT7G9n
 s+5JM4ciL3tDXNXlgJd3DO5IBrBS5mEPvu6vuiQ/mgxgJCUhtpeGhfLkB++b2DhM9JgH
 LE+bD8cbdzREg6lj/379MFcCTJYXS6AaMxoPhopHW26MmgI8IqCCrJKw7i1NpclfTQY9
 6BaA/YzAyfXHoK94Q1hR5i1eSwJl344VelcCH0F8bgShO+FzsS1mV5BJGAsSlI2FjaF5
 wMMQ==
X-Gm-Message-State: AOJu0YyXtyOd5Ys5g3vRjCTDWKwL29SW7JBEIoxV0MDwTrfRoMJJssGe
 Dc5kHDNYp1lPpX1Od9WPPVe2bQ==
X-Google-Smtp-Source: AGHT+IH8TIipWnM2uwo+RFKvJcOws+ASY+Jtgk9ng5YvdTI/PSy8+U2PAsDpTb4vbdV/zDh3bxr2+A==
X-Received: by 2002:a05:6808:228b:b0:3ba:175:f195 with SMTP id
 bo11-20020a056808228b00b003ba0175f195mr17253567oib.94.1702876560272; 
 Sun, 17 Dec 2023 21:16:00 -0800 (PST)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 a5-20020aa78645000000b006d6bd97ba73sm1390888pfo.159.2023.12.17.21.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Dec 2023 21:15:59 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 0/4] gdbstub and TCG plugin improvements
Date: Mon, 18 Dec 2023 14:15:46 +0900
Message-Id: <20231218-riscv-v8-0-c9bf2b1582d7@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILVf2UC/13MSw6DIBSF4a2YOy4Njxa0o+6jcUCuUO+g0EBDN
 Ia9iw47/E9Ovg2yS+QyPLoNkiuUKYYW/aUDnG14O0ZTa5BcKiGFYokyFuYRB33jQ6/RQ/t+k/O
 0nM5rbD1T/sW0nmwxx/ovFMM4s0ZzcddWKeOfk10DLVeMHxhrrTvLfc7umwAAAA==
To: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
Received-SPF: none client-ip=2607:f8b0:4864:20::232;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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

This series extracts fixes and refactorings that can be applied
independently from "[PATCH v9 00/23] plugins: Allow to read registers".

The patch "target/riscv: Move MISA limits to class" was replaced with
patch "target/riscv: Move misa_mxl_max to class" since I found instances
may have different misa_ext_mask.

V6 -> V7:
  Rebased.

V5 -> V6:
  Added patch "default-configs: Add TARGET_XML_FILES definition".
  Rebased.

V4 -> V5:
  Added patch "hw/riscv: Use misa_mxl instead of misa_mxl_max".

V3 -> V4:
  Added patch "gdbstub: Check if gdb_regs is NULL".

V2 -> V3:
  Restored patch sets from the previous version.
  Rebased to commit 800485762e6564e04e2ab315132d477069562d91.

V1 -> V2:
  Added patch "target/riscv: Do not allow MXL_RV32 for TARGET_RISCV64".
  Added patch "target/riscv: Initialize gdb_core_xml_file only once".
  Dropped patch "target/riscv: Remove misa_mxl validation".
  Dropped patch "target/riscv: Move misa_mxl_max to class".
  Dropped patch "target/riscv: Validate misa_mxl_max only once".

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v8:
- Added a more detailed explanation for patch "hw/riscv: Use misa_mxl
  instead of misa_mxl_max". (Alistair Francis)
- Link to v7: https://lore.kernel.org/r/20231213-riscv-v7-0-a760156a337f@daynix.com

---
Akihiko Odaki (4):
      hw/riscv: Use misa_mxl instead of misa_mxl_max
      target/riscv: Remove misa_mxl validation
      target/riscv: Move misa_mxl_max to class
      target/riscv: Validate misa_mxl_max only once

 target/riscv/cpu.h         |   4 +-
 hw/riscv/boot.c            |   2 +-
 target/riscv/cpu.c         | 139 ++++++++++++++++++++++++++-------------------
 target/riscv/gdbstub.c     |  12 ++--
 target/riscv/kvm/kvm-cpu.c |  10 ++--
 target/riscv/machine.c     |   7 +--
 target/riscv/tcg/tcg-cpu.c |  44 ++------------
 target/riscv/translate.c   |   3 +-
 8 files changed, 109 insertions(+), 112 deletions(-)
---
base-commit: 9c74490bff6c8886a922008d0c9ce6cae70dd17e
change-id: 20231213-riscv-fcc9640986cf

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


