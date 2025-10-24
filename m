Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEAACCD1BF
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:24:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNOz-0004IV-Nx; Fri, 24 Oct 2025 15:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNOp-0004H5-KE
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:24:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNOn-0000PH-NJ
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:24:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso1688863f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333868; x=1761938668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBOD7zGmQL29Jy5BKEW2FN23f31HLnybiZZBlEWgQZg=;
 b=EH2uyZOtmt7YgXLFdQo8cLTw0uLQnhobHBCpz9r1+syW/aMOJ+nAW+mLMf/EXR/Bfw
 3IofXU7b58P/a9wX1r4/H005Lcvl1cOChs6hnFZbbglmTHOoy711kjkqzJR1D47D5xHd
 7224CNMqUZE28hJBo0hykI5Q+GAx4Pcp/cBBUyu54gRY/4bJ5N/8WLBy70VzyJIEBgDQ
 zA2CrVSuC4IdhbO0BalvrVTWsp4iYlevz+KYYxOKCcOJyMn80kkup5PDA+gyB8jRmC1w
 Y5SpdilaSvQaKb5TMVcOiQWBrzZXR4KzlBenlDMEpFr9l7cXwC5j/elIez79kIeThjSg
 CBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333868; x=1761938668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBOD7zGmQL29Jy5BKEW2FN23f31HLnybiZZBlEWgQZg=;
 b=BcDht+W+hkjpLeYtUzX29Wbx8O0e1aAEN5XeaxY5hIm34uHYcdxoQ5ZO2L/AwFvCRj
 Vemo1MQ15BcmARt2LzTpvEKbpl3MBkJPEWNUAKmN9sW9AHBjVfiEy1CIcTuu905gFZOr
 PPGZyVI3sHIVNpwwkGAMJemAIQZr591Bz+sILtOhk/YjsuPeJr1IO5lUAQG+WiV8PNuJ
 o6XRmqHUWz08FvwQxZpLCexCTRHV7utl3KeqrD7r27aZyEu/auGc0BKictxjmtZMK8wH
 N6e+DRCC3GctU6/I1h1fWMrr7esMJCCrPxy51Ii2SwJvBixjM4uiw+Almf322tV8TZZ7
 jnfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvT2hwOmWtzCFR2ObTC6SyFExOQ2vMt0sdht+TsBB/KnvIUnbtrLSNtQy397oS8GYqNMJvQhjVQemX@nongnu.org
X-Gm-Message-State: AOJu0YxNGkbOLAIDRN8plCotcn9USMLB8JbZRs5/nKnHrMRoUrNg6e/c
 BMZBZwkwM9IjayEIX+ivnVzYblyUu5sUxJnZLEFQrxECcL6pXo5M+L8CMspfteby6zQ=
X-Gm-Gg: ASbGncuYxlf9sAGpbrrCcaF7zpSVyq1U7JRmpSqjHonXHkRLM2lEUPpG1qxkOdSiRPu
 //F0nDQdedoVxxcY0FhHmjI0uP6rpMPWyUhPF+7XIwhO1QGBgq96ddr7jUhR8xtJlb3zlSKwQnl
 7NpK5d43pjKJOVHMaUun4gvKjHvkEQxBM2AKjJG4SKqRH8MzCtTYix8+bZTBWUjGRUldNW8s0mK
 fGK3dEywtQCauPkeBQAfVkKTdiRJ0is5t6be4wmvbI89KWm1KKo9AHU3pXMKNtW4mssi3Vxn1Se
 E/pKaaPkWlGNnitHJ5z/4atn1+x5+KqG7WJYZvW/qorxu8ynGsvV8GPfsql+MFAeO2VPZBVxlQZ
 Mw1TtmeFXwxb9EA5O2UhVJ7Ze7KzuPogxHA3XAghqnG1cD6Gp5RYbcGieVOXAT68KvCxOxft36D
 JHjpLKLhT0D3M3KEiG9qMV5C2aEQh+L1t7XwaycNxt7dvgm5zzv/y1+KZqqe2D
X-Google-Smtp-Source: AGHT+IFmUFD3XEAIRtQ58ZOAzfKO3Ya/wsE5mgEQg5gxBdVm52AB3hHpG0XlML3dRK7B4iX1QQVuYA==
X-Received: by 2002:a05:6000:1789:b0:426:d54a:67e with SMTP id
 ffacd0b85a97d-4298a0bd14amr5540308f8f.44.1761333867766; 
 Fri, 24 Oct 2025 12:24:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e76b8sm11104208f8f.1.2025.10.24.12.24.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:24:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 13/27] hw/uefi: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:00 +0200
Message-ID: <20251024190416.8803-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  include/hw/uefi/var-service.h:50:39: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     50 |     MemoryRegion                      mr;
        |                                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/uefi/var-service.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/uefi/var-service.h b/include/hw/uefi/var-service.h
index f7ceac4ce24..91fb4a20918 100644
--- a/include/hw/uefi/var-service.h
+++ b/include/hw/uefi/var-service.h
@@ -9,6 +9,7 @@
 #include "qemu/uuid.h"
 #include "qemu/queue.h"
 
+#include "system/memory.h"
 #include "hw/uefi/var-service-edk2.h"
 
 #define MAX_BUFFER_SIZE (64 * 1024)
-- 
2.51.0


