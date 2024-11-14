Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BDFD637D5
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBOR6-0007iK-6Z; Wed, 13 Nov 2024 20:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOR2-0007gT-A0
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:14:12 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQw-00021L-Jq
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:14:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38207c86695so90422f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731546844; x=1732151644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hctc3S/tg6amAjvlXZaTioZ5Yr338cGDDSPzRbh8Ywo=;
 b=vdmf4X3RwQzuywq2vM1eg7M7uUvpjcBujgcE0tO8OY4/uqEjWIICIc2+7OtRn9PL09
 E4sXWIMeQAdOH9ClLSukEYTj8pjP0FfEA947E/fw9hMcB7scBa88ldt3Pd/RxjcdCRtl
 u13YutO51RF3tVTG2fUdgCrOX4GPijgcPU4bf9G1vZoRPtlRWNRdtXcCrW0T4q+7vlWG
 uv+J459WW4mi4r02ej+vi/ob4uLX9pj+0hHcdMAsRZhwCIoOLGDOIhpIjXO7hkpod61G
 UQFKDT5OIa9rveybUQ/L5Pg8GF0OBS41cWiP8U+OAkZdI7kp0mQSfM9TVeZo6z3CHUdl
 900A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731546844; x=1732151644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hctc3S/tg6amAjvlXZaTioZ5Yr338cGDDSPzRbh8Ywo=;
 b=rugo4UJ+xICHdik8RKweYZdZZ5wgF0maZl5X57gZlSO7K34Twwrr6+Fi702Cfv83y9
 thtGquY195Ori4kHtRYIPBHra3yKAmGchB1QyoKHEO7LbSJfR01hHUMo3ePKmoOWyM+U
 glq4rp/4V5buXTab28qAVuh7EaMrvQEaWgztpvaWUCHP//JQ6MkHDWOVdkmcboL7+6s1
 73anV3/mrPp4JgtK4gjrbdsEQc/25nSXlMG8Agrsl7tg0CklbWVmwxvDFyOHB3fRIc0J
 4h/38UoEw3sCDzDqK9IVphiixxtFrWuvSmOufKq3IZSKkkFJz1yZFMLhtJRoKXBI8UuN
 m9dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX006fPN2HQUAi0Cj139LkvRM4X+Vm6MfWQn/3JP2RQ38QvOI40moykAWbhmauCqoSm85E3QPjetGsD@nongnu.org
X-Gm-Message-State: AOJu0YziGq543p3+ipPxpzYdeVH8ST9gmOzW1oKahUe2UEA7ZPKIYtGB
 KhhAfuZuyyUWOjef7+B4pfuz3Go5/VnMOmtLVa1iOigVxDeR5jJmJgwg/Lb1fF8=
X-Google-Smtp-Source: AGHT+IEn2so/ixH18AvrpdZMy3nJh7glbi+y5QwToKvNKI1CwZqSHbNiU7EXqtTNTTpXjuGdZdx7cQ==
X-Received: by 2002:a5d:648b:0:b0:37d:47ee:10d9 with SMTP id
 ffacd0b85a97d-381f1873485mr19654057f8f.34.1731546844586; 
 Wed, 13 Nov 2024 17:14:04 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97e46bsm19427592f8f.30.2024.11.13.17.14.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 17:14:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/24] target/i386/helper: Include missing
 'exec/translation-block.h' header
Date: Thu, 14 Nov 2024 02:12:50 +0100
Message-ID: <20241114011310.3615-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

TB compile flags are defined in "exec/translation-block.h".
Include it in order to avoid when refactoring:

  target/i386/helper.c:536:28: error: use of undeclared identifier 'CF_PCREL'
    536 |     if (tcg_cflags_has(cs, CF_PCREL)) {
        |                            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index 01a268a30b..75c52e2143 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -21,6 +21,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translation-block.h"
 #include "sysemu/runstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/hw_accel.h"
-- 
2.45.2


