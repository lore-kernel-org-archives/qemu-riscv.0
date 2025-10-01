Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C11DCCA472
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQS-0001Lf-D7; Wed, 01 Oct 2025 11:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPh-000119-M8
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:06:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yP6-0000er-TO
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:06:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so50908465e9.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331152; x=1759935952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzVIXRWuWGr9aTJxzc0zYs0L20Pybb+agvUMr6jmaGc=;
 b=IFqIhhKLs0C16+ZcGsqHoYJLIZ/wEo4/wPj7HyJ15ZkzrlLm3vxflCBX02QVL8edSa
 eEaAeAtYWc2Cy/oclB1osQv5j75XIATVcLhXhsY3N7fcQhUDdFGfez0J49MBJLdN4t6u
 8iu+HxXL+row7GHXZ9L0QuL4aim9gKHZVA4nTkINMO3L6qmGFr03rjJ7HwIJ94/rLGw3
 vzzr8ZLe3gxLNuDDUyEkUVHvMgAHa5Q/Le1ficB7mF2PMxrTNvrM7DCZ6Ji5K+KLMcPw
 t14Rf1ysM1xk9TybdZZaO2zTpMzEzTGUYz89x5qXMMVcHXCUu7n2yL0Rkj/JWilf3HvU
 SzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331152; x=1759935952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzVIXRWuWGr9aTJxzc0zYs0L20Pybb+agvUMr6jmaGc=;
 b=Mu/cCk5c41liMbvSC3ggx6e0duC7G7ll7F7Ma0isQdnIuNZiQt6uqnOe47V/sFZiDC
 NN9dQg+L3UqBF8BJMkIl6DTQFag9y254VvrQdN2I+gSWY2TMZ7y9o4M15F+wQ1nrfpkN
 RmbC0ieP0yIeEEYaFjKOsPN86veZ95x2YAH79u8lrp2oj0O5aiOHozZEUHqMlmLSgFv6
 U7aLFCp5yBvGEs3g74boxkByVRytkwneWIhIKydTCdrhAug5CiZCTpnInOO8TkKM58J1
 rR/yiYyvPGlkZer/9mmuCAUkcBuuGk5kr3lsnvMFYRZ+I43K9Eu7mSuTfxhr4gAkuJ/e
 uuNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu1kUWremebjSUie+W1dna/pUEYNX7fOje96OBcylF35L1+nKYVdo3VY9UHAgwjam30JX0fbfSlXs7@nongnu.org
X-Gm-Message-State: AOJu0YwDiw1AwXzn/IUTafxq2frED17/OlH9LeVd+djpagjROHbwW6/g
 uQG0GLosWd8Uxdkha/h6xlpVv0rv+yfikq3WyYSMjDEvM4CQY7nXF4srXLBZ1XoL/cQ=
X-Gm-Gg: ASbGncubmft5p3uwq7BFIn18+z7vRICpAFfufUAbcvOuEWFrzfncinVPpUzJmgpOR20
 LHhBATw3lhhoK0oTprTXU5Y2Ph6DRpZ4OEe8iAMHcqaut6RPldnGjpwCqvCqOcttHzgSycCptDx
 nAq614DEk4x8yp48uvzdSPdTAwa8VwLmusg9HNZYcp1e9JjWaHx5CAbeYzQstG7uXE7uuk781Lw
 lE9u3QpcwuALYrU/WEehnuFozyNGlfKr182TP7LH02IpYNC5H/TJcgsrSjD6K83jrqAjRcZYHVx
 LDqT8cFQxHnaq+2dRIqCgXVFlIuHGc2FX5XVoiftu2jxkr931x6wGKb/Nl9fc6Qwo7LZkMLrWkV
 Di4ga/NVWwt+sPOdduGMJC5vc02/FY8Nu3XmL12zdOI2+xQc24ktW4S0sky4Z5ansvtSmfPLCZU
 lnRsB06+sePO0B+BGR5hPe
X-Google-Smtp-Source: AGHT+IFLHawgvzRRR9giVgia0mvWSnvz0hRd72bjATPATk4foHjp7wT3xHqdxQtb6jCh5XRxIdg0vA==
X-Received: by 2002:a05:600c:3b08:b0:468:4350:c84d with SMTP id
 5b1f17b1804b1-46e6125ce14mr30601145e9.7.1759331152089; 
 Wed, 01 Oct 2025 08:05:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c4c0321sm36203765e9.8.2025.10.01.08.05.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:05:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 04/22] hw/core/loader: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:09 +0200
Message-ID: <20251001150529.14122-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/generic-loader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index e72bbde2a23..cc8eacdf067 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -52,8 +52,9 @@ static void generic_loader_reset(void *opaque)
     }
 
     if (s->data_len) {
+        AddressSpace *as = cpu_get_address_space(s->cpu, 0);
         assert(s->data_len <= sizeof(s->data));
-        dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len,
+        dma_memory_write(as, s->addr, &s->data, s->data_len,
                          MEMTXATTRS_UNSPECIFIED);
     }
 }
@@ -130,7 +131,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
     }
 
     if (s->file) {
-        AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
+        AddressSpace *as = cpu_get_address_space(s->cpu, 0);
 
         if (!s->force_raw) {
             size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,
-- 
2.51.0


