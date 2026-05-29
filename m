Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE932CD6E54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:52:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3F1-0000gK-LG; Fri, 29 May 2026 15:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Ew-0000UI-BU
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:51:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Et-00052x-4D
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:51:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso906490f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084285; x=1780689085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayZcEqBv6LCuc8yFGoECVuWb6aDn4koW4Fzg+F8BkqA=;
 b=lf1i1W98ePwM6i5JgwgMRoQaAlT9yaYcOtpQp5Gaw2RHREd1Tn6DaYN8HYS+JfwPKZ
 M0MW6lEeminzCUOXy+Q9NykGcrINOxkBe//2tEfBkTAawnOCViLZUM2vp6bioAsKXG0B
 Kmw2y2Zybn4v+uyENKHt+LMmh+cB3MAfWcIiS1xNbzBn3zCbVIR33o1cHZ1/hZGk+dpR
 r+wsazpoA+RaAP2TCE0VX8uxUwXFxXQ/Ddm4R40tKyHgcY3CTutHKr1yuxFWBBzHzJPA
 60u30I45CJ2IDX+gJD6CHbsSBLvc/zDmzIDWNH4bVXTPsTnqIw1m/7b/McCYpUVyl9+7
 wjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084285; x=1780689085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ayZcEqBv6LCuc8yFGoECVuWb6aDn4koW4Fzg+F8BkqA=;
 b=q615mpZAmabW/ukQmZ8AJh6A5H8GCnWZsjRYL8blDKL71huV60yIoDFjBtzmwXRKBu
 Sgmfp22+eJCUjcbHg6azNvF25wk0euvcLItNfjuQg/S178dDHVE0aaY2Qb7PBoppIVJu
 620zmJtAZ0/WtmHh5fbwGsPyb+59xXrG0HO61C78c7hi9ClNninvo5rLEGPhdS6CZUXW
 GP75HCbmMl76LppWSjhoZT3L12ULnKwlD0ZA831eNyAPEzVwmr+kxnrFZ0bMmsyr1egm
 pfT2ltTh9ht8R/0OlnaYufKet8VyU5qfLNO+yRVSkDmMJTUuii7Rom+rCGkhGg34kJbX
 xU/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ97zXaFjrVGp5J7kZY5q4BjXUqEMc0quKFzk5R1KkZdUTfcxfMvYpXAC9/h2jCxltDjzLz1s8gwpmqW@nongnu.org
X-Gm-Message-State: AOJu0YyKOBC5LztgM5k/rZV1tDpgjKnsi+qua6GgbX+IdfYWbK2X7kM2
 wKmHuXxn349sq8JAGD9BVlMxpFoID9+x83IQzHE2J9V8oKjYBBTGqh5Y2Wmw0ivCqhE=
X-Gm-Gg: Acq92OEzkPob/eevxA5ICwar65I7k4Aa20/RoazHLeTDrtBkVUSV+ukh8rdAGYktq/v
 H+VDyrEanlI8D75ZTbJuM51K+NBWg0z6ARhLzdHW7iXYC+FOcTgJWgy6XUEzxVZ1dh/aIQtwSh7
 Hbjx8o4+wcyM7Sy4QvR/6D/6D275gJxsJJwIuWNdchMZe9U61M51qHIADPGqpB70mo9T0fqXsOm
 q/uu80F1/XyK9zclxdL3CogJ2o9mk+7P+3iXD2tzR6TRE5GHpbKxmiFEiOCVAbm/JaIGp3hFAFg
 8GdZ6s66+jrG6TXLIgtawXtE7cTzIioxl0+0domcdkxiAWNyFh1c3NnfqrdpsgEqu5mjdjuI8EZ
 AjAPubzB+C9/iCfI7aoTaD1pf7CmWXqKcyPFsfc8bxNBw0QaostMj9DRvCrd3Tolfw4I4hDQvEq
 SmAkV0mtnf4EqgwrMdJgLuhSPY0Rt4F5K+V+hUTVx/koV8N1qdLXtuDswU2+BTVDJxAA==
X-Received: by 2002:adf:ed43:0:b0:43d:7dcf:ae26 with SMTP id
 ffacd0b85a97d-45ef6b78552mr1841372f8f.34.1780084285470; 
 Fri, 29 May 2026 12:51:25 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356b129sm7392104f8f.32.2026.05.29.12.51.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:51:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 12/17] accel: Remove AccelCPUClass::cpu_instance_init()
Date: Fri, 29 May 2026 21:49:34 +0200
Message-ID: <20260529194940.97143-13-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
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

We removed all implementations: remove as dead code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/accel/accel-cpu.h | 1 -
 accel/accel-common.c      | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index 88c0815e2d8..c42221f96cf 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -15,7 +15,6 @@
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
 
-    void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index b3bcd53a4c6..04482b6b57e 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -43,12 +43,7 @@ void accel_cpu_instance_init(CPUState *cpu)
     AccelClass *acc = ACCEL_GET_CLASS(accel);
 
     if (acc->ops && acc->ops->cpu_instance_init) {
-        if (cpu->cc->accel_cpu) {
-            assert(!cpu->cc->accel_cpu->cpu_instance_init);
-        }
         acc->ops->cpu_instance_init(cpu);
-    } else if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
-        cpu->cc->accel_cpu->cpu_instance_init(cpu);
     }
 }
 
-- 
2.53.0


