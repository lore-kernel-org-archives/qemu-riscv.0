Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9036DC83F16
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadew-0003LN-RD; Mon, 28 Aug 2023 10:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadev-0003Je-Hm
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qader-0000dk-VI
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso2976431f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234560; x=1693839360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=uCSFkD5XYs+JG7QevWUjwPqUs+YDJlAC0VDk50eqnjdwrUIj1qOTjR/1oKNiZq2zEF
 NgHOFpOtrkh4rxtgVZ6n2rNBFJhzXxwEyzLYL+YcGN2gv4SR9kQQaZ+/QvIOn/ZsK+yH
 W9LAcAOH1mGBWQPB5gh6j+RuKSOcANjzttCYDJiPPa0Dvwl2topmI2jnCS0h4iAbYyO0
 SOi9bfIbqJ+yxCE6lQKtU5/o2VVYisy0SFGgRAd3HRSaJyEElou1GYE2Wqs1TvL8vh3L
 ZYMfZxTSsyKhp3k5OZutWI0X64LpSxM10MfA69i8znvKG76sOyyT4BJ4WtZv4isg2yyh
 utsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234560; x=1693839360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=SWmmsXTWDRnspIsX/IDAWQUwFEXg6llDa/lrgbJcdp1SkXysaey4x740QEauVgx5r8
 rjRhvgqVZvwEyllNIn8nQ0c4enYTmFNxd16DdotSIDjMx9/DZZqRz4CwMYqDFk/Y52g0
 rczxgJId3xIG5J59COLGEXkDlTj+RGR5LCIGAu/J+N7ElA03f62F9pN8TlZkpLpGEfw5
 kZHlrLfqHfKLmYk1f7oIjasLc4YAxCGJu6oQIuHvud3POVIrg4YlajWPH5oiv9zV7wzA
 Gi1qfJ4TLBaTtBPAUm6ny8Qq0k5/3kD/PycynCicPopIjtTwKIWhzQVlTI4dqGcB8aSH
 +5FQ==
X-Gm-Message-State: AOJu0YygPEx2zotTgIflZAAZaiI0End3TfHCd8wWeFDZpaP47+7yOwBc
 4rtkkESjHNV1O8eszM35Z62HUA==
X-Google-Smtp-Source: AGHT+IGn+pJtL61az0XWYHIrJeNdyXq86yp1EZWGscS0YpkXOz8l9yZDlH64X/7eX7dvljmUMh61Fg==
X-Received: by 2002:a5d:4988:0:b0:31a:e6c2:770d with SMTP id
 r8-20020a5d4988000000b0031ae6c2770dmr17008877wrq.36.1693234560409; 
 Mon, 28 Aug 2023 07:56:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a5d5090000000b0031432f1528csm10721106wrt.45.2023.08.28.07.55.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] target/riscv/pmu: Restrict 'qemu/log.h' include to source
Date: Mon, 28 Aug 2023 16:55:39 +0200
Message-ID: <20230828145545.81165-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
reduce it's inclusion to the source.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/pmu.h | 1 -
 target/riscv/pmu.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 0c819ca983..d2be06a133 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index db06b3882f..36f6307d28 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
-- 
2.41.0


