Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C49CC4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnBy-0007dr-6J; Fri, 19 Jan 2024 06:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBw-0007c9-N7
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBv-00039N-42
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337b8da1f49so565010f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664262; x=1706269062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/Q3pfm39hWlzYJ6LfMyGawyaAzdsP1AW7mdF4S9bfM=;
 b=tgU6DI2R7DAufztizGNRFOpv2bR9xY1LfcIVKjlQwgkykRVT7kz3H13UIoi0IUev6o
 jqiFwliRmxSOu6OOQNuckiwda+IJGaGYy8tNcHHXLuCVqRM499NjZW4hz8a/ms4OUea0
 Qo5CwBN26PGbff4MtchTwFcqogmOHl1pDp7OVTV+Xg4Vf1K9kk95AfYbBgeYezsTiWR2
 +D6e79dfdJmzT7e0F2LShd2xMystgWAHM3rYsc4+zvjNJQ5QZ6zZdonSuHWr1CstML9j
 g8WNsx/UoYr4JY3YjJDflYKLmoMSHskHQCOOstbYdqLBHv2Y50whhdFgRanXcBeM6Lgn
 BcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664262; x=1706269062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/Q3pfm39hWlzYJ6LfMyGawyaAzdsP1AW7mdF4S9bfM=;
 b=DJWXEb8Oop2p2O3PkfS5a866o8klaMsj+TcoVpUTkKsU9giIprpZGKHFyYfKdhiab6
 oJUiqFS+b3bOXRarXUjGZ2MJiw9JWTcsMnkafMrjvut0OK8LgbAQ1qxa0E4knML9N7AZ
 FrsjFxT+LNoIOSH0HGewm1D0gLZ2+3BuPSh6kgln8f1C/2BFyIWjiXyfywz0pT/JRo5i
 i4MWF4bIhs99yuT+uChW8DajuVxVOSRriIR1VEOV1I56HGTUQCMFUR7uiV03pm0dZvvL
 6E4P0l0oYxW/sCP/NwTJQwtf6y7OATvL4we47RueefupHJvD9auZy5uwYCUtjWB9L+Sw
 wg9Q==
X-Gm-Message-State: AOJu0YxmP2q3VyBAYNj3fWfiSHX+8HzzoF1rlvNvErs/gMP6QkGGa40W
 VfaEAXKnizJOmyxPYEhvNhzu/2O/yNRuvRpRR0K+6Rhmmg1Ba5Cu4DfDh28rcPc=
X-Google-Smtp-Source: AGHT+IEEDqWvYX1nqTzLbVpL34nk3+pfkofKdechFHai8eCCDyydj5pmMYWLBGlQpbML93VJ0YF90Q==
X-Received: by 2002:adf:b319:0:b0:337:61eb:2880 with SMTP id
 j25-20020adfb319000000b0033761eb2880mr884157wrd.88.1705664261827; 
 Fri, 19 Jan 2024 03:37:41 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 n7-20020adff087000000b00337bb0f370dsm6313156wro.40.2024.01.19.03.37.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 34/36] MAINTAINERS: Update Raphael Norwitz email
Date: Fri, 19 Jan 2024 12:35:03 +0100
Message-ID: <20240119113507.31951-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

I will be leaving Nutanix so updating my email in MAINTAINERS to my
personal email for now.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240111192846.111699-1-raphael.norwitz@nutanix.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e8ca270c4..760acdea66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,7 +2555,7 @@ F: include/hw/virtio/virtio-gpu.h
 F: docs/system/devices/virtio-gpu.rst
 
 vhost-user-blk
-M: Raphael Norwitz <raphael.norwitz@nutanix.com>
+M: Raphael Norwitz <raphael.s.norwitz@gmail.com>
 S: Maintained
 F: contrib/vhost-user-blk/
 F: contrib/vhost-user-scsi/
-- 
2.41.0


