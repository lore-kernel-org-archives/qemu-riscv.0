Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62633C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxVI-00049w-Mt; Mon, 06 Nov 2023 06:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUp-0002mA-VS
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUk-0005xt-KC
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:19 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so2598450f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699269012; x=1699873812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyEPFd8qKgVauKHH+mzQW+99WSkPGmQyoZYgi3VA9Vc=;
 b=IyR6jb3K6mdeddZTNYaXFflbf55TmXSJ5Yf9iGwHR+1vSDv2ChfTX7IITAdBOQkCfe
 wJvDm83oquqMkyeWaV0bXKU+44X+8YdcLk65fVK4qG4+7urbTLF8JxcJJw8DE8S1JbgL
 4Hf1dvvFUidty3H/jaslKQXCq/wErslU7c70YQkIqGCRh55zHXbq/Sz2A/5cgBkcAbVX
 l6Cl+L1ez9Yw46iBGF2HSeqXQ+do7XomwITU8y+dUeSx8BRbObTyJRBIEprgivtyXZ0h
 Bj2TjH6yitecC1jnaNCIwS+4j0kd5PlCMI357M0n1fl5wgyaMTJ5GnI7QyKeBrchTnXq
 QHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699269012; x=1699873812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyEPFd8qKgVauKHH+mzQW+99WSkPGmQyoZYgi3VA9Vc=;
 b=TppfI4xuXTps/PcCJtyYN33uC/9h7P0/Zj+hpRf2F87C1G5KFi4QauMx2STi0PeUn6
 dVfmgfdvsJH1CikKtZkdlD2DAypG0dTziJlz71G3JskXmNktTJdtHyBIS5UDd8ZAlJWq
 YGxGFR4Ud6lDplYRZIveiUQNTCtOw4lz1/+EzrJX9zjDJ1tuxXpP3oBx2umun1SwiaB3
 4+6Hb4ZiYU25mYoXQm136iE51g83gdfJ5L3vCA6/SDjz+XN1HUpotmmprfOpFEkLoc0G
 TuRM9hmO+mYxLv6lW3qi/JZ+DSdIVwrOy4Y8v4Y1FIu75bsiPxAVlSV78I3rFf6WZdcs
 4uxA==
X-Gm-Message-State: AOJu0YyVzoWB6TphjvmtCkzjbrA/PxAh9i84vAWw9ffzjMwad/2taU9E
 AB+XSnwcFdWSEwmNbOy38ICdvA==
X-Google-Smtp-Source: AGHT+IEMIDW7hBBkWZ0URkD2CfnnnPG/ExOR7Okjzu2uwpb1mtEO/NwWscUpM9JIRDLHPNQlRwIx/g==
X-Received: by 2002:a05:6000:1842:b0:32f:7b2e:2dd with SMTP id
 c2-20020a056000184200b0032f7b2e02ddmr23663996wri.45.1699269012416; 
 Mon, 06 Nov 2023 03:10:12 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfe505000000b0031fd849e797sm8761303wrm.105.2023.11.06.03.10.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:10:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Subject: [PULL 58/60] MAINTAINERS: Add the CAN documentation file to the CAN
 section
Date: Mon,  6 Nov 2023 12:03:30 +0100
Message-ID: <20231106110336.358-59-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Thomas Huth <thuth@redhat.com>

Add can.rst to the corresponding section in MAINTAINERS, so that
the maintainers get CC:-ed on corresponding patches.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Message-ID: <20231027060931.242491-1-thuth@redhat.com>
[PMD: Fixed typo in subject]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3014e768f7..c57868c94c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2588,6 +2588,7 @@ W: https://canbus.pages.fel.cvut.cz/
 F: net/can/*
 F: hw/net/can/*
 F: include/net/can_*.h
+F: docs/system/devices/can.rst
 
 OpenPIC interrupt controller
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-- 
2.41.0


