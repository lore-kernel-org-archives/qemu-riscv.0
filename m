Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC599CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:27:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSyAk-000783-Pg; Fri, 29 May 2026 10:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAj-000755-8V
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAh-0003O9-M0
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so82668255e9.2
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064806; x=1780669606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5ag1C+2SG1c3WsflC/6w87NYFOhc1Xx+nqXj9RTveg=;
 b=NStu9ErOgmmuYI5JKfGo+t8xhW6yWsgzQt0znAtRSF3/XjB5aN3TcJMEIC2rG4RFtt
 lf5MoTBXamNUQBvs6B/PU4j5pojEhVuGdYGw+4bapZvTB4gFsCrNqi39osZhUcOAmtx+
 y90ull9GKnqZZfG6OSKkVSPjYN2N7WpfFk74qsjuBVK7GXQSXNUaYXhgZC9Latr7M2/4
 FBlrf9u5xLc/WR5KWEP4+DLZ0tgXyDcdfc19AcwHUxZA1DeUraKw4LQd9sysbad4jXAa
 PuL4aZzg14NOZIEtT6XNjwtf9+ia3PTBjFFo1hqfmdF1HYR6m0/XOhjOrwTVxV20CTT+
 8Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064806; x=1780669606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z5ag1C+2SG1c3WsflC/6w87NYFOhc1Xx+nqXj9RTveg=;
 b=Nz23UK89H3Xib6asQnpmV0nJMHcmEProIh60pxh0xFLx+sljOM78c7OXJjm0/Hxt5Z
 Uf1MWMukdmp8N1/W3qt+j8AkHo44antQQMJ+U3EZQsclPa4E5iAHi5AFx7O2lQwlJqty
 MlI17qYuaAGFIgDo2HgO9t3MbVRV+efSe0KmAZzxPp+yrtxWmlSs/OzLQFwwji+drlA6
 ky3avE3VXw9l8Y9dxelkii/TWAy1UbQSVGJLbxQV4OKP7s6wl85skvAMLUzjoqTBH3kt
 fXO3YjBE9xqbXnVe2jvD2yCrcm8PcV/aezdRRlwRVwLkSKVd4qjI/zHMz9s1TGKcpS39
 5dNA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+gnSiaCcaMvxmYWlsUZyxdIy8n4tjWEQkXbosWaWh922DgXG3KU8DpDJBqD2LMIIiVszVj/s0MomYa@nongnu.org
X-Gm-Message-State: AOJu0Yz8p1jq81viucuWAbkqUrjvOCwABHgsOgpIlin4Y9iArhMjOJRZ
 Fittnw865CtPUt6DmDbpJfuV5mau8naIzsTWvufAQBHPd45wyrzBuyoti3IEFEm6HMs=
X-Gm-Gg: Acq92OHN8LIFc+NWkY7G7oFFSudFqFFWiZiOAPSA8xLgytHc3ANxSVwLILn+fiBr8B0
 tzyjLmqK6VDdq0w7FkZmfuDb8zzoQ28CExFKCVlKbCs91fwxOLXMBY1XCNUL0yw/bFKLurKSZ7R
 41n1BHJNFjQIUnjEOfvRAdCbQ1iwjPBZKgicTX0nJ2MwrfuGGXtKZmLBoqesF/ribzlNmoi4JUt
 yv8AWyJc3fTdFzWJl90zvG6JNKTWPy217DeN4C43w4y1HZAnAdKySLavWBmJWCgtkx1N/NZYouy
 GDY2QCyjJduglpDpD+mSL0hj83Hbkq0UliNTpoJ1wVAu80Owi0nl6VEpzaObSi8Npu8RyPmyyNs
 bwFmyglO+d1aANHsdK5hkQDMa0M+j5oISJTxKFmBBC3ofCkc/S3dfDaFHPmvxttvyspQnHHIE2b
 Qe8BXOLWTpT5AndBNXkQyfm7BRVlB3fFjD1vpfMo1imeiyczVB2F4yVhwGvuPUS7Evbw==
X-Received: by 2002:a05:600c:a105:b0:490:6e12:542c with SMTP id
 5b1f17b1804b1-4909c0e4476mr45336475e9.23.1780064806113; 
 Fri, 29 May 2026 07:26:46 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c103b98sm14989405e9.19.2026.05.29.07.26.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:45 -0700 (PDT)
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
Subject: [PATCH 16/17] accel: Remove AccelCPUClass::cpu_target_realize()
Date: Fri, 29 May 2026 16:24:32 +0200
Message-ID: <20260529142434.87880-17-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

We removed all implementations of AccelCPUClass::cpu_target_realize,
remove the calls in accel_cpu_common_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu.h | 2 --
 accel/accel-common.c      | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index c42221f96cf..d7ea45ada2e 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -14,8 +14,6 @@
 
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
-
-    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 04482b6b57e..d8ee6d62667 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -52,13 +52,6 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     AccelState *accel = current_accel();
     AccelClass *acc = ACCEL_GET_CLASS(accel);
 
-    /* target specific realization */
-    if (cpu->cc->accel_cpu
-        && cpu->cc->accel_cpu->cpu_target_realize
-        && !cpu->cc->accel_cpu->cpu_target_realize(cpu, errp)) {
-        return false;
-    }
-
     /* generic realization */
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
-- 
2.53.0


