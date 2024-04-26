Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A43C4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:50:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RUY-0003xS-9p; Fri, 26 Apr 2024 15:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUA-0002XO-8l
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:43:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RU1-0003Eg-T7
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:43:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57225322312so3650747a12.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160623; x=1714765423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ENBQU0RX+7z0jYkAe6EtdYUSGSuY24I2mpEgO+y4o0=;
 b=qFvyHQittAKmODWxgVXsBe4Ov8PYrWSNK6/GUkdqbRgFvRN0Oy8XDFoPDIalHvP+dw
 mJqP2fpz43U8fyf1+VGmvk02UG7w/zlNFWJVN+yYUs9OGQOjg7wm5KGV5nJs2pE9g8PJ
 1MKydN8toAgbovLi1Z3fT28QS1UCYLW4CkshqNsc6vDe8KiqD2/pAFKFPbbn3uTZGOGG
 NrI9yZ0ctKmJ7CUQm28dsw0H4jcWw+cYiWAuDjRLQiZ1elXkSTW+K8Mw6yCWqTsjlszI
 1gq7TAued3ftv5HU97WLfQ1txFOP8uaf1aJUqhT7xGPGwgmYymI6AxqQgCOMhDQbiDHG
 DaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160623; x=1714765423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ENBQU0RX+7z0jYkAe6EtdYUSGSuY24I2mpEgO+y4o0=;
 b=ig+WroYIMmc8CuDEHCcGUi1f2xyGwZsfsAvfCqA/SCZHdZBERam8Ep497beYU/PKCH
 05EratuPsbs1tWuDC8nr5N/JUxXpiPEBJK04vD1SIhWdgjfb32SO4DhqaT32sbErTt2s
 TNtsTc0GsDtsytQVGRIyp3vNFJPNEupYAfKC8gnuF+UCn/diGKFCOkjsWKexLOiEWiS6
 CCVMog2dp1i9011TZ+zljeRLLsmGoi8SvxbBJiiwBo9YRfLMfesq85auOaIvFLtAUI48
 Bgdpti9sMwHp9TvNYi01nOxAKpc/301eh0bR7HsCiURJC2KOioup2LlNIbnV4pzp784k
 9G6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDvV2YVREemMgp61qiJF2efZOll/cTL6BdTvPbmCCBLBfmgMKIXwBeQmOsE1fwx3gA9AnKdvgXcA1S+1axFH0Kx6nTo7o=
X-Gm-Message-State: AOJu0Ywuvx6NNF8q1onLMw97Ti51HJK+3qO+AwJ6scSIwMdfkkmTs821
 7fr2IGc2JIUFU3FyljdvQsWX694ccXvOGgEEZPbeuMcGH0F4CNfjARpMHLVYELlFx4ZTGsPiy+7
 ertY=
X-Google-Smtp-Source: AGHT+IFOXyRU0XboRrP8yvE6c/KL1v/K13UfHP9b7aI2p9uUVx6EI3q/HsZ+tUw+MtdSBACFe0SISg==
X-Received: by 2002:a50:99d6:0:b0:56e:355d:2ece with SMTP id
 n22-20020a5099d6000000b0056e355d2ecemr2481443edb.30.1714160623526; 
 Fri, 26 Apr 2024 12:43:43 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 ek17-20020a056402371100b0057266474cd2sm289245edb.15.2024.04.26.12.43.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 17/38] accel/tcg: Include missing headers in 'tb-jmp-cache.h'
Date: Fri, 26 Apr 2024 21:41:37 +0200
Message-ID: <20240426194200.43723-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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

Due to missing headers, when including "tb-jmp-cache.h" we might get:

  accel/tcg/tb-jmp-cache.h:21:21: error: field ‘rcu’ has incomplete type
     21 |     struct rcu_head rcu;
        |                     ^~~
  accel/tcg/tb-jmp-cache.h:24:9: error: unknown type name ‘vaddr’
     24 |         vaddr pc;
        |         ^~~~~

Add the missing "qemu/rcu.h" and "exec/cpu-common.h" headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240111162442.43755-1-philmd@linaro.org>
---
 accel/tcg/tb-jmp-cache.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index 4ab8553afc..184bb3e3e2 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -9,6 +9,9 @@
 #ifndef ACCEL_TCG_TB_JMP_CACHE_H
 #define ACCEL_TCG_TB_JMP_CACHE_H
 
+#include "qemu/rcu.h"
+#include "exec/cpu-common.h"
+
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
-- 
2.41.0


