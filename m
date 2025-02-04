Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CF9C02197
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:08:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNLB-0004Lg-WE; Tue, 04 Feb 2025 13:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNL0-0004Fy-48
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:07:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNKw-00077P-WC
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:07:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso44335225e9.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692468; x=1739297268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AiRrQHAbky113j1+PiE1EMSskAkNYDTMAifBRCLYEYs=;
 b=L371BlFok2LPS+08QWBnMZ1/Z2wClrtQG/4GRCRnUHimRghAXWFWOgfiQmOp7BpSFY
 wZf5q0NBedGmUWOezAdGWdd5WGMc4D/WeClHjRv4u9MvQsL7NK/YSmQ6ASEr7AUT78cm
 2CK6DcUGMfx/qtYlsYYF4t5RWeCo6c6R6yy5MvNNSa73FLtbfHfnbw0NN90oioWPANA2
 OnveezDntITZMmQHcVLXf2ME8DmRl8Dpen4njYVqNaZOFrxCMnMLIjpOhQbq1WadZjEe
 2YmIDZUY49VrOpZuv2SMhOQtq0JNEM9SWtYqT4avYRRKhv4J50tIGuradXH510CN1Pns
 mdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692468; x=1739297268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AiRrQHAbky113j1+PiE1EMSskAkNYDTMAifBRCLYEYs=;
 b=VBUnC+KtzDrOAb67cKI3r4bsv4vyWfUsJgFGV7t80TxksqzgaDPaFhMQgg/+6yzMiu
 beTlJkqLxH/JFvDzkq7jk9VLwB/9mwlTZ4tmbW8UCsVgonyA8GDP85eQPl7EP3O5qqL/
 wv6TenIltIY62r3PK59rE/yt2JV8IXyvInKbNGxyCNxEhSmR98xtyka6iKfn64dDqoMA
 J92v89tgu9BgE4UK0WVg4i3drTSFUxaiAc3J0PS9pfATROpbjicsN/xeVbpTYmGtLG96
 76p+tOD4UB7RVOEN4wJAqSEfNm5yAVjDChh0mKQxxpNRyV9mxXd83moUVflf2r/wmNhP
 lIFA==
X-Gm-Message-State: AOJu0Yxi33DVaGGds6zqta8TI+7Sd3vEiu6cEehqABYNI5kaWQsZQ76/
 euooj2McE/XXEj/QooNSVw1zWjB9qyZpEGtRStT+OqCNgstYDyhtkYWDY188Pv0=
X-Gm-Gg: ASbGnct1tHLQw2CL5hIA7YwUboaeSlHYmLKKU1VLF46JZmjvDIpKPYfYmxnWTWSl/w9
 GgzCnfiT860821jKpRURzq0eV9TwSwPZ/y2nLSiApa0mhG4OxTbYR5kL2cHclEo31O1lYq9T5nu
 gIcgxmxJgvmHOnt/Ak+mF+/vkVTjUKRFoIcJ+znJYQv5+SCspmRL2A9SScU+sHQLZoEjsfyBWRl
 BU8cNozKtJ1nubmGoU6WDfqxqo66ojFguL5FOszz5f3N1XyV5DqcVtTQv7JQzj8JkncARjxUP2E
 oRFMl50dT0R2YjZuJUGZeThAMoqDRfoykX8tgD6G7L+3xJnMvdgyH96zfUD31LVViA==
X-Google-Smtp-Source: AGHT+IFdma8wTs9/3KN+dfTx6cuJQaTA3+DLkbunazFtBHeUiM44wqOrs28oinOGA9sA21qKdWYrxA==
X-Received: by 2002:a05:600c:3488:b0:434:a711:ace4 with SMTP id
 5b1f17b1804b1-438dc3cb049mr238796015e9.17.1738692468556; 
 Tue, 04 Feb 2025 10:07:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13146sm230941905e9.4.2025.02.04.10.07.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:07:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/8] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
Date: Tue,  4 Feb 2025 19:07:38 +0100
Message-ID: <20250204180746.58357-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Invert MachineClass 'no_sdcard' flag logic and rename it
to 'create_default_sdcard_drive' to make sense of this
default value applied to all machines.
We use the OnOffAuto tri-state to catch implicit default
values. Then we toggle the logic and remove invalid uses.
No logical change intended (except the assertion added).

Philippe Mathieu-Daudé (8):
  hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
  hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
  hw/boards: Rename no_sdcard -> auto_create_sdcard
  hw/boards: Remove all invalid uses of auto_create_sdcard=true
  hw/ppc/e500: Remove empty ppce500_machine_class_init()
  hw/arm: Remove all invalid uses of auto_create_sdcard=true
  hw/riscv: Remove all invalid uses of auto_create_sdcard=true
  hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus

 include/hw/boards.h        |  2 +-
 hw/arm/cubieboard.c        |  1 +
 hw/arm/integratorcp.c      |  1 +
 hw/arm/mcimx7d-sabre.c     |  2 ++
 hw/arm/npcm7xx_boards.c    |  5 +++++
 hw/arm/omap_sx1.c          |  2 ++
 hw/arm/orangepi.c          |  1 +
 hw/arm/realview.c          |  4 ++++
 hw/arm/stellaris.c         |  1 +
 hw/arm/vexpress.c          |  2 ++
 hw/arm/xilinx_zynq.c       |  1 -
 hw/core/null-machine.c     |  1 -
 hw/riscv/microchip_pfsoc.c |  1 +
 hw/riscv/sifive_u.c        |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 -
 system/vl.c                | 16 ++++++++++++----
 16 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.47.1


