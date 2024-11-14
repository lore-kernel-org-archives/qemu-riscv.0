Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED2D637D5
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:14:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBOQa-0007Te-VC; Wed, 13 Nov 2024 20:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQY-0007Rt-ID
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:13:42 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQV-0001uk-Nz
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:13:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so76694f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731546817; x=1732151617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNM7lQQia63slkmiUAhjBzskGFuKTSllmSkbwj/sT+I=;
 b=R78ImOcxcigsPnj6v0IY4brbqmrynaGc4Vf3YMpmTC+8u6I+XVwkaC5V5HU9wq1j6N
 goBCzBJg4oN1dAQo/d+KSIpURFerbcT3eAwPWhWqCQfGVCelG8gAbkunvyrVFI2mjc0E
 M1KIfitx4Av34iSv4n9Xs3hYpeikWTeqJb6Y+mekef2UiBp/fgAVTkQn7V9zEsbG/GoD
 ZFGib+twNQF2dstgc1yaWTnBg6MrHROzymF0/j0OyuvrDnYuBK1OEseML1S57NDyNII2
 7yMy0cfKGoE7m16FlklNkPW5gjLPkQbbTHA0nh5sxBtF0dAPBakbLifOxRqFhaFsT7y4
 pVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731546817; x=1732151617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNM7lQQia63slkmiUAhjBzskGFuKTSllmSkbwj/sT+I=;
 b=QOzL1s2mIJ/AB7KCAhqzrDqVvQjgYtc4PqO92l3ys4+IXK8pbGj3Ih37yTTIx2BT77
 GEMb0bx7FoLKWEDfHG2D+eeDcFxvnXCHEVqJ2e37EfFLT0AE8r3QEYVl9JaX5KYOhxDE
 ea5nY0BwpFp9k2EI/NKsRNMRIsuwFvRu+z0M9i9sdfUuCo+yu0HQUgbbvn4f4zmuV3+Y
 9mSWDFrBC+bJ6tfZapmSCzMMeuXf9t/4q4+133cMSByXrz31zVXyz02V+yBYpjjFlv8x
 DFaGZb8Iz4rz8h604QZ0jLMETXslCnJv3H+U3eEAq9qU2NVT9/JffMDpve8bTuoOfuys
 NT0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdCA8PCbNUUvuHd1NH/i8PBdxouu7+LLPMlM3O4UWQX+hvaUKAuhXE20qo9H69Mv12PdhUkGPoZuX4@nongnu.org
X-Gm-Message-State: AOJu0YyCyzcq0OOiB9Uxz8beM/YRItEZGKaf7Xu7Eut3zavBvIofUG6I
 j0k/L4X51RGGYgBvAf1/kyrh/M3BdJYte6hx7BPUG+4+QlhMHmhdv5s9gawDZvw=
X-Google-Smtp-Source: AGHT+IGHZCPTq1Ky+i+zPEHV6OGPnrLZhJwIFC/QHlQ6UaCQcD+MtO44ZWUI0dTARLdzbNxkS3YCfA==
X-Received: by 2002:a05:6000:1f8c:b0:37d:4a80:c395 with SMTP id
 ffacd0b85a97d-381f186b313mr17332647f8f.21.1731546817266; 
 Wed, 13 Nov 2024 17:13:37 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda05f89sm19611165f8f.98.2024.11.13.17.13.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 17:13:35 -0800 (PST)
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
Subject: [PATCH 01/24] exec/cpu-all: Include missing 'exec/cpu-defs.h' header
Date: Thu, 14 Nov 2024 02:12:46 +0100
Message-ID: <20241114011310.3615-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
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

TARGET_PAGE_BITS is defined in "exec/cpu-defs.h".
Include it in order to avoid when refactoring:

  In file included from ../../system/watchpoint.c:23:
  include/exec/cpu-all.h:356:19: error: use of undeclared identifier 'TARGET_PAGE_BITS'
    356 | QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
        |                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 45e6676938..1c40e27672 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -136,7 +136,7 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 #endif
 
 /* page related stuff */
-
+#include "exec/cpu-defs.h"
 #ifdef TARGET_PAGE_BITS_VARY
 # include "exec/page-vary.h"
 extern const TargetPageBits target_page;
-- 
2.45.2


