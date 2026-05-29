Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E2BCD6E50
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:29:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy9U-00043m-1O; Fri, 29 May 2026 10:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9S-0003ze-Jj
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9P-0002fK-Vj
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490426d72f7so71388455e9.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064726; x=1780669526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bh2neLmp2yCN+no5zdf9s1S1CTB1NaAAPjqIYQpJDXU=;
 b=jv05KxeGCGgxY/643LjsMcSgKTuJqq9BooyT09yfEKcyXQtJkriDseh4jOuqiEoilb
 KKgyXW/pUQ7lga3/+eBYVTV/uSqvmlYsO+YkxCiHuH0TJwK0njCg1j000Kg9YhUWDnIW
 UFs4s2InFPp6b+blXW2R+uXRJg71JPe133b1EFC0fUqCPUdjI1JO+ga7TndF06X07Ug4
 KKvEdiWu/7ZRpfWyhoVLU1jXhBkSAl5tsU2g/zkaZ9i3/xfhQ7aq4KWCTbiIp2U8iKU4
 gQSwrDTSk2Lik1mkh2qa8IYbciNqUdlyo29oBvqTF4rN6x5chqoVCowIn7TOApZdbKnu
 RrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064726; x=1780669526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bh2neLmp2yCN+no5zdf9s1S1CTB1NaAAPjqIYQpJDXU=;
 b=hb1QEB/xIAGxH8Od7J1zeIsrwtfqaszMo6p0ayAsGrspTL0zyWg+OvEU1alcFuvez6
 hq3LNB9fWJa8GSJVVxBWaXNWekkN2ZUdbxxX1UpIjEBZAgfJUcNpu2P6c3CyrY8+5K0H
 JuMjZHvijuis1NyKeoH3UiyXKoO+Pk3vJj5nWiY83zSOMafPC2B3+Vf9ZQ/YhVKeet+4
 3h+C5WB3tyDQag7l5eX2yM2L5Bqm7hCQT8mTH14vQSICD2hxni/G61hYx3u04aikfS4M
 GOupuztVepz0GLKVCFmJvqkl390YPIt1W1nM+qq/ehQLBBMCpVbx22SK/Qlh3fBT2isZ
 E/SA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nBlD4auXJ6AuBno7anbrkYMgnIIOxanUzpekz/eOIqZ/qH1cee0EfRmD13VpYc2eK5lp9MGuMTbu5@nongnu.org
X-Gm-Message-State: AOJu0YxOfC60yMzLIIHrx6EfEOdpWQIqxu8gVuEVJwE3wBGMe5a+JtEr
 t6tT7R6Bu1OB9iI8UJXsT1fpsVEjIqo8OWRMl21L+VsZxTIWlnmTfE/hT/ns4OSi9JY=
X-Gm-Gg: Acq92OErh9x80PBp3u9xKjFmbmRR8TGPt2W+NabhokIU6C+I7Cbmii6fDVo/x9Tag5o
 Wq2YA1LJuw2p+N4MvaSJ/ZyNRxmFb4r0sJgIi4msWWfBYy01ej/3V9dPZ9yytzGX+olIf9c93zh
 yCb+EhyURKU2PZ/izSVju16pDCJ1Q6Zib1kAKcLpcV16fEoKXC7PLpWThwDzN8DF41sIe3cv5Ab
 diXlGpBzNlHdSmhV8UAoHHHtCJFOzn794FwPAgoY65AMSkE+FKHWvOtBOkxV3jHSyzZvReg5taf
 wEOG3ifPRzAceqM2kpRFl6JahjWyJjNjUbvJTeWWnzqsKM+i4ybnN2yPC3azl3biFV4Ou2vJfCe
 jNwtWc9lUfovwBh0721CgtMrmNqsx8SnvPcULwmIeoulZs7T2Zjqonk12YcBJFqXg+nGjLZLvbN
 lXIT58hUmRRG3lwi0OeUc5XR079ZaLzJ1c93E/wMfKaySSl9CCiuY/kxgQ0TrLbKUtUSJg/92Ek
 7Gj
X-Received: by 2002:a05:600c:c04b:20b0:490:3cb4:f1b3 with SMTP id
 5b1f17b1804b1-4909c0ba682mr43032785e9.16.1780064726422; 
 Fri, 29 May 2026 07:25:26 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d7002e8sm55832855e9.15.2026.05.29.07.25.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:25 -0700 (PDT)
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
Subject: [PATCH 06/17] accel: Introduce AccelOpsClass::cpu_instance_init
 handler
Date: Fri, 29 May 2026 16:24:22 +0200
Message-ID: <20260529142434.87880-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

accel_cpu_instance_init() currently dispatch via target specific
AccelCPUClass which we want to remove. Introduce a similar hook
in the generic AccelOpsClass structure.
We will convert implementations from one struct to the other, so
add an assertion to be sure only one implementation at a time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu-ops.h |  1 +
 accel/accel-common.c          | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index fd1307dad6d..9810cc27cd2 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 176b03e0e90..b3bcd53a4c6 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -39,7 +39,15 @@ void accel_init_interfaces(AccelClass *ac)
 
 void accel_cpu_instance_init(CPUState *cpu)
 {
-    if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
+    AccelState *accel = current_accel();
+    AccelClass *acc = ACCEL_GET_CLASS(accel);
+
+    if (acc->ops && acc->ops->cpu_instance_init) {
+        if (cpu->cc->accel_cpu) {
+            assert(!cpu->cc->accel_cpu->cpu_instance_init);
+        }
+        acc->ops->cpu_instance_init(cpu);
+    } else if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
         cpu->cc->accel_cpu->cpu_instance_init(cpu);
     }
 }
-- 
2.53.0


