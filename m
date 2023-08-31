Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A1AC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:02:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhI6-0000IQ-3G; Thu, 31 Aug 2023 09:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFB-0002xo-PV
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhF2-0005L6-4K
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c5c06e8bbso634513f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486661; x=1694091461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEBOMsh/2YnVXzixxLDyYqxUdUQOvziVNTmEZMBX0zo=;
 b=q7gXQi51bkl/faqbG5DeWykzANSO+dP0F+d7XfJxrzOdVly4o1roQGyTdru02vHDEP
 2Epwcn2T6N95iwOKH96OVRpXswy4bkE+G7x9dKR1LkymX6UTaPqp0sEAJhh2s3AmlBZ+
 L4L6ubkQ1UwsC50F0h/nQzi6i61GbkJxr+crpx6Uji96IGlWb921sXTeMFnjyj9lyH/h
 aXzcbg8QH4MFhQpy2zirkHME6QpW6AMAoEVcYcHnYeBCYJsPblVJaFD6Ji7gqj6c7od7
 m7f9yGIVdrNA3Ue4FN6n/cY6xyiZWj8872G/Q5BQqc1QWq1URvgylGURo1BwwNKW5V3F
 A71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486661; x=1694091461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEBOMsh/2YnVXzixxLDyYqxUdUQOvziVNTmEZMBX0zo=;
 b=lmSyqeAFwesY088JOan2P0+XhQpiGeSRP29uyVUhgldrV9eXIt7d5j7AlfUoQ7eal0
 AEqayIcDXMm4OqEZ/P2oxNScAixm3r9K0caaDqZeBlNX6Ila7wY28PF+J679E1LuLxOQ
 mTW2I9Vvz9VJQQfcUDnSpDIfJ7uCmsAineq8dyMfCBDJG8LJwDa5ZTMCIEvilAKHk9LF
 FjocZKTuaaMccneS0bVDhm3mq+xhulvNMpsMEPClxSorxGwnqvyyO4P70gyllqk/iW3a
 SAPdHIUdM0VeBV+Rv4KX3/I5eQo2CWgLSOfnebL2hqJNKNYdxvpWTNDEcq0JV10Wm5bz
 Gjfg==
X-Gm-Message-State: AOJu0Yz1wCRbjRkDtzQ192ODgl6cFCB8FQXdaPLjhG3a6MO3+BF+ZE8j
 c6gthsX2A+78X+LM+1raldaVhQ==
X-Google-Smtp-Source: AGHT+IGLd09qYyb4/3kaqCrC5REt7mc9FS2sDslJG6mJAYhCIMYt2pVEe6AZW+Rku8HX3jErKIKnWg==
X-Received: by 2002:adf:e6ce:0:b0:319:74d5:a2d7 with SMTP id
 y14-20020adfe6ce000000b0031974d5a2d7mr4511339wrm.32.1693486661117; 
 Thu, 31 Aug 2023 05:57:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 h18-20020adff4d2000000b003141e629cb6sm2158792wrp.101.2023.08.31.05.57.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 09/41] target/riscv/pmu: Restrict 'qemu/log.h' include to source
Date: Thu, 31 Aug 2023 14:56:11 +0200
Message-ID: <20230831125646.67855-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
reduce it's inclusion to the source.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-3-philmd@linaro.org>
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


