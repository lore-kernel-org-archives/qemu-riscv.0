Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7EECD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:30:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSyAG-00062I-0F; Fri, 29 May 2026 10:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAE-0005xb-2y
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAC-00036W-2K
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45eea3448f2so1057953f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064774; x=1780669574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/Ui1jevrZtyJRpeW9wEoANBK4xBgFParODxQakXLb0=;
 b=oPzxL5a42MWWZwVd9vwCcF7aEyHzU94MWovlWTR/pXjk2WznPeaimiaLWld+Ew3C/Y
 pWFH1Z8bxMs+3i2HQEGBfg2xVkAFXePthzEkLPhLyDHJmsWiZo8s/Des71pWACOjWkYn
 IYnNhoara58dWl7/+V5p6uRkQmcinM/rcHV+JwIxKcCc45Lz7FPZiyeuU8eEpv44sGyX
 Aim8uRVtqzAQ6j8l1LWfFffo0kqiEGwPOr1/QWzBCLQA9av0lr9gYwSQaia5HD4d2ZuN
 LwgPhLMvEroEjY7oypwx1CWYWeJ+q3Ou6vPuDfjyQXFI9Niy46SE2I4T3PSxWZOa18l0
 brBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064774; x=1780669574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U/Ui1jevrZtyJRpeW9wEoANBK4xBgFParODxQakXLb0=;
 b=hucl3VRmqGttAkJzmUPAGbIEE4nuSxgcnXXegg3MYAxBlSfvpp1b2LvnGcgZN8GwAZ
 tJzIC+mSGVCF62njs/deN9Izcr8jPxHy9QezwuK/VMWCeHHoMFXrpEmqzLwR0C21DHpL
 8X+4JirOEJ+ssmriCvyXhUhHrns2Mrv8V00ZxatvA5WKLveL2LYka+rAwzOFnjEsFLyh
 pKXbY9dZ6L5ncnO4BNksI40PyLsaA+mdchLumYJc7+ExnVY1QHDgp7ijC5YlGB9Qvpff
 kBkAf8cvGy0k+KO4QaG4OBJzJcA/o7IVNOjeWHC92+flqWxv8DEfTvK/pY1Is4aVlnDs
 FKCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LEpbYjUbJql+R3tv7W4YzL7ghs/cFNsQe3NaW2tYTENQAC0waAkaXEtHfe1Q5RQjKJmAKDkqkhIHN@nongnu.org
X-Gm-Message-State: AOJu0YwJttkzhauBcr8mK11DdflOaYC+I3m7EAZ7NPt2V56OTToE4aY+
 d2jhi06ihVfSHn1yzkfudsDpp1qbCaFYMRC5nO410bVV+phSFuMQCCjyMMu20Lm0Yzo=
X-Gm-Gg: Acq92OFO2Pb8YAq7rQbG05SvFdmqXET1QOuQ+hSnnAmToULrrxJx5WI7KV0bT4qtUHR
 Ez/MgPe6Ybp6+byiPDLTKEw2Frv+zl54I2AC8hg1CUTjCcb/mTNsP8cG0hF0cSuuBSHzIl3b6Re
 wKWwCskkUAEvvOYD3Sq0TuXIOXklh/lxtWBNZH8RITJsXZm+b4Mhhd9ofidpXYrsjXdQgGQQJAD
 sKb0lfZCLBIvoDpK10yeDRkbmTNwxxDHRijXa2aTwnJatIC6oICymgCRoFfeW6YjsMAo1dA/5GO
 OyNyVkT5vyIOBPCU0Ovn+8GKzP3RNRfj8M3hezZOWewI3/W1POTXDyoTQom5Tbs7u2Z4/IX17WH
 z6ksK7KIKvZQQuZxNL2mksR1rROIuFOJIs6BO2d1IDN6GAsw3YlYvT4/8hSSilVByBiDQX/C8RB
 2X3gTadijviNt1g7gQU1FjC7dMeOsPXr38YdFzJHzI6TSHeFCrYbJjxBgFFnYgNaao3Q==
X-Received: by 2002:a05:6000:1a8d:b0:45e:ed7e:f8f7 with SMTP id
 ffacd0b85a97d-45ef6ae96e5mr159213f8f.2.1780064774383; 
 Fri, 29 May 2026 07:26:14 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm4494831f8f.16.2026.05.29.07.26.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:13 -0700 (PDT)
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
Subject: [PATCH 12/17] accel: Remove AccelCPUClass::cpu_instance_init()
Date: Fri, 29 May 2026 16:24:28 +0200
Message-ID: <20260529142434.87880-13-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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


