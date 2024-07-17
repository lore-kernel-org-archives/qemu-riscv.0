Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B2C3DA42
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 10:59:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU2MK-0004Zy-J3; Wed, 17 Jul 2024 06:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2MI-0004T5-Si
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:58:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2MH-0005h0-A5
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:58:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-36798779d75so5974170f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721213884; x=1721818684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQhy8hrl81u7GNgqWNgI0Q8CnNR/8+x5QLQF6iXo760=;
 b=EAxCSOQs309zoqCvVDuCu9kcojJ7PnBRxPOQudSgZp2NM1XmfpXsliIaHVZuG83eML
 JgSg914huZIFitrBQF2gxV7lqERr+DQhGndRhi4mt+sExdZhKLbd5KhRLj5pnPbueTgF
 KtkIfawDA9m39BA6g0blAQhV3PZGl68LU3oLXuVlPnS2fMYM1h2r7b35uqUo2YkCMeJN
 UDyR3Eb/aMQvO8W23IrZRu3zFAAzmNsezzTqtM4hFqxVt7JcJ1x9t4uJ8m5qKtqPCxCG
 di/ncXobQSO964Bl1knDDmr/tWOxRnu7tDv6CIdSBdG9zR0XMazue7V86sj1KpMLur2Z
 92ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721213884; x=1721818684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQhy8hrl81u7GNgqWNgI0Q8CnNR/8+x5QLQF6iXo760=;
 b=PCXx1+ncnzEb/FiR1ZlRo6cCD2Zb3WG8yV1GWUWflNKk9IKlBL6FJrDyTk/DEp0ZOz
 bJLQA4bPuiazWbSxh+1XyutaNgKBZ4mqu5zzrpN9K1IrClGtn3Y7ILoJdey9PxXhRf3j
 FlIFttsW8X7CmZPWb4Epgynl6KuE3AlGFx3a9HFzSl/B8WL5cQJtaJJdrRvQLVrm1/rj
 K9y2AbAONNUFme1B+5WAW2wkc/FX56yQysBhPmBvMWoQaJ9A5zd+kYzWRLGdr/VZqM9N
 otq2TQTLpsjF8fJmijnIHF2BchY5VJxUqFtR9uurtNwk2sDVHT9drRL7EwUuaj/Sjvhz
 Nn7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHi9YOV/4KsAsHqQ/BlgjZYGTs9hA3ALDzKFiW/eW1ZfKBgJmtJVkHxVUioNtVjqK6ecvbOjN8mKT5f/KRgy5AoQeBEQI=
X-Gm-Message-State: AOJu0YzOSlkCFGIxGfhE37tQQgYQrA9I8HvPwS9cyOTFXD39K9zLLdRV
 VJN/WL1/TpjBz1KcRZxcUD64Fw1N4z2NUHPonsZtyshmWg7sXtGHRW/AaPIjlgQ=
X-Google-Smtp-Source: AGHT+IHj1D6egyRizVLhAmUWoLS0647TnuQwqHYn5D1nM1mUW6PDpKnneJ0AC07v/mqX/DqaHrpo1w==
X-Received: by 2002:a05:6000:244:b0:367:8607:daa9 with SMTP id
 ffacd0b85a97d-368315fe1d3mr1166903f8f.15.1721213883801; 
 Wed, 17 Jul 2024 03:58:03 -0700 (PDT)
Received: from localhost.localdomain ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabefa6sm11331239f8f.44.2024.07.17.03.58.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jul 2024 03:58:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 7/8] target/xtensa: Restrict semihosting to TCG
Date: Wed, 17 Jul 2024 12:57:22 +0200
Message-ID: <20240717105723.58965-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240717105723.58965-1-philmd@linaro.org>
References: <20240717105723.58965-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

The semihosting feature depends on TCG (due to the probe_access
API access). Although TCG is the single accelerator currently
available for the xtensa target, use the Kconfig "imply" directive
which is more correct (if we were to support a different accel).

Reported-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
index 5e46049262..e8c2598c4d 100644
--- a/target/xtensa/Kconfig
+++ b/target/xtensa/Kconfig
@@ -1,3 +1,3 @@
 config XTENSA
     bool
-    select SEMIHOSTING
+    imply SEMIHOSTING if TCG
-- 
2.41.0


