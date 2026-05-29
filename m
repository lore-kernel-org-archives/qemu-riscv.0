Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC18CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:25:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy8p-0003Ov-Sv; Fri, 29 May 2026 10:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy8n-0003NM-Uk
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:24:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy8l-0002HE-86
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:24:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so99085715e9.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064685; x=1780669485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VZ/i6ZvNqvmU5zUZzrSJBDpAWD/Cx5iX+bh+R6LBuQ=;
 b=L9SlzBVX8aKnsFIlnFuQZVlCw3z9qTzXlRcJn1v+fWYxZgoqGikHAX02gpnqbgqHaj
 nlkeqL9I55IWTtLQkPvZZ2HjAT4WVEO0u4oRKTdrRMZYA7T75gBbUh2ndPEYiJze9TGR
 fqwF0W04z0hhuOxnmwcZH+zs/t5bgy74A5EAnigaxY23L/1mx0HNnXiSwkx3nHVDdepe
 NCBU60k1xBViVs4i523O3cBtE8QN01hvwq3BKfr7Z8qeb151smOmivvCiZwF9xVqYScN
 NuSZN5SuSzFms/JRfZBxe4Vg3McF+QWB2ZvJi1raK7GGpsbqR3eoQFSJZkTLf0G29LsI
 899g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064685; x=1780669485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6VZ/i6ZvNqvmU5zUZzrSJBDpAWD/Cx5iX+bh+R6LBuQ=;
 b=eDj2yfA/DmUHZN5rA84Hn2NH5J8tLNeMJIme33DzH/OGYCbQgzW/AnoA9BrYMkSqWH
 3RNTxXMs3UB4xZCyZIU2yHLde57wvxnYIKWas8WeoxBmcHiELwA1wRCD9wrreY02f0sC
 iOtlQu4zM3FFNNYJDdN0srj1HrO2jKhwrBMFuy07/HGUnnbgKj0lBN3OifpCvXl/lpJz
 pD4t7JEyg42Lv72sjjRgcQf2WxlBcQeCkXdvxybmPLUNO0LATZbkM7j9s6MBiQToxgUN
 wJnKUVWUQ+5kZOMfOqqY7pO6BofENW5OfGvV6GEE7YrjyBUMHqGQp0HpDc6weTJj8w+o
 wqHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+HK7gvhcvx3nL/eFmLKuDs9/ZgyUU/eRFFEQ4ySRFv4mHrRYuT32v17ZZxX5/VxKLhIWN0MP5YMRLd@nongnu.org
X-Gm-Message-State: AOJu0YzydeKzwCR5zaJ89I62+ubfYIPPboAo5bJvlvf8R9jpyW4sNOrV
 /NrPS+pHWce5ResTEJ2UYeww4Fra+BoiWWUS/AVA7qLrD9j8XzxUatQv+sCOOx/NNK8=
X-Gm-Gg: Acq92OE7gjr64pCaBo5YzZgsbPc6EfxyaRybTc5LTCiZR1TWRIinFYftkMZlfvnLsAn
 FJ56QTdEVTGu+EsAItfwtUDy/hNMsqPsQb7fgSfFSwxPy82qHV7heWBmud0Ny3p1E2neogh5bO+
 woSf0PjunOA85ruW9kZjW9i6n8FDRk85hM1djW8v4FKwzjPfbqUTrbj+F/BFJ7QN7OshFtLC8Mz
 P9POBDPsTyLN2TugmMy+F+c2S6vxnxsJWZ3EW4Q2Cl5cgzLdfWEXhAe4oE1LRIVk0dWqT3SNb1Y
 cuDCtgQA2KTfPsh0XWo3IeRIPusmWY9KogyVs5rgo4b2hZvjJrEJu9oDeWl/cVkPQB0zWctbAsg
 S6g54e7UbBiSjzpaIL6QpYnD1o7PELBX4XPD0CDZqHyiK9wYuaNluEoUzdWA7dzfasGfnDD2U/5
 FumTIhc14kfFAG5M25RIuFV8bq7L3BLQoZseJvNhYgHaKo63R37MJ8zo/jGtujE5yaHQ==
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id
 5b1f17b1804b1-4909c0bb2e7mr47068875e9.27.1780064685579; 
 Fri, 29 May 2026 07:24:45 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909caa7e17sm52805175e9.9.2026.05.29.07.24.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:24:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/17] target/loongarch: Remove unused
 'accel/accel-cpu-target.h' header
Date: Fri, 29 May 2026 16:24:17 +0200
Message-ID: <20260529142434.87880-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

"accel/accel-cpu-target.h" is to register accelerator target
specific hooks via TypeInfo::ACCEL_CPU_NAME(), which LoongArch
TCG frontend does not. Remove as unused header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/tcg/tcg_cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 31d3db6e8e1..2bb1feaa66f 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -9,7 +9,6 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/plugin.h"
-#include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/cpu-ops.h"
 #include "exec/translation-block.h"
-- 
2.53.0


