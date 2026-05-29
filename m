Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586AFCD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:26:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy9O-0003p8-P2; Fri, 29 May 2026 10:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy94-0003SU-6a
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy91-0002L2-Ct
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4905529b933so56446525e9.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064701; x=1780669501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jW2zG1X8bHmlXnWN82TlCGxlIo9/KiyZAvhHEyZQIgo=;
 b=QUDskZt5d+2OuKFbLcILoHSaTuymCcwXf+j15qlvwh1TpM4dfolyFYlJCT6b9bXlBO
 30nLmCs4qDKaHc72BzlpnjeLbyU21Cz8SPwJWAg53WKK2GhZUL9s87jMSrfrY/wDquEe
 kUehVUNQ3kvNnO4SLwsSxYT8PBSqXcydDPmWpDSzrFHd+bh5vx//aBJwZ13QOkx2vq1b
 E8ThxZci1cLnpB1+1QJjZLnaNIBNlOrEu6lE9kr6G3Nh1+6iDc4IgCzZArjO6NIV1+8i
 oqU3R+/2YLga6V8Dq74ZevPfTFZWPfmk9zd9fCS0bILbuW53SPLZnmSMbMDtyMoxkGiv
 nfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064701; x=1780669501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jW2zG1X8bHmlXnWN82TlCGxlIo9/KiyZAvhHEyZQIgo=;
 b=PQNwK7tPHTtADVOc4Q5vdoLt7fklEBVdV+PYsYcwYSytC7kiLeBe9M2QH9wI4LGqtq
 HyBsGPGxv0AnlVWXRGifVMe4ztwDnIHBAKgpFycJWjMG8d+/L3n+OisMGbwYo2yui9kj
 /lc4UvObwC71HPozVOYO2Kqj2ArMQYRQ8IwWjdBuMUNNDs/g3AOroB041WUmcCyeHL4g
 Fzr8YwdoqmgwelUiNy1/5cAJVfvFo8b86RDhsfjQyWkOuKrHr+TgKyOym6dWz+Dupnh0
 NBRsuyuoBM6FYk8NVqtAzSKXzWBrzcnGURR3JXX2kkjtPpwbe/r5vTcEsCu6KrRhrp8J
 3WTQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FIZroFfBw54rf9httzzXiAWZCjQ3JCr2/S3RKBOWTlusV8bg6NZyXv0ygMdKwisXJx1VWSaFhp8Ua@nongnu.org
X-Gm-Message-State: AOJu0YyQyy+XVElCL8xtav2vGrLDnEE+cDxZwzp8u9ZJEtVDOgSWUNe7
 XdAz6ZZOiQJJVe6Utpa2byJMUGnHnaQ16dP9wnXOFTb8Z1I9cvStclnE+se/eVTjT2s=
X-Gm-Gg: Acq92OFC+5gXBTdvmUXFsO8xHzs/SKC1O9p1QX4RkkVCTxvhkIs+rYZYcLqQD+cUOa9
 CRD8G6B0wWeX6lPpC+raDZ2pTY11gYDkLRbhoAfLSwqXCUfe41k0NfhFQlaFC03V3HQ0tXUvaPg
 WDcx6c/M7lW4g1As+kqmVFds72PHibk9Si2y6k7zPUYoUBOAcs4frqGD3IwousHlfd+dsAV/PRe
 slCt2t342Mr1JsLiP8w61agU9Sxwy6PDonMcyMATqJokQrH6PyaqRQe2TI7HkWIyB6aoi+EUurf
 PwEpR8aS8XmBpa+Zrty/TViqSShFzJeKgr5j/s+biPUUpogdeORpCaMAfkBsQFpVyMvL9Jfs2Yw
 ChBZZDmGg3QuTgAkIFF92CiRve4TJKso+gdXxYGsF3w4ZXTHztTBfaracDi2oYuZgzq4xd9+2WN
 B97UESenO0JhoeGD/U0EDUzEcu7cGZ/rH9CbaFPh2VZZpGuuFC8wPZ2Nh7Hc2pK/7YLg==
X-Received: by 2002:a05:600c:1453:b0:490:9536:c513 with SMTP id
 5b1f17b1804b1-4909c0b0012mr40361385e9.19.1780064701417; 
 Fri, 29 May 2026 07:25:01 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d696f25sm60774685e9.5.2026.05.29.07.24.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:00 -0700 (PDT)
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
Subject: [PATCH 03/17] accel: Rename AccelOpsClass::cpu_target_realize() ->
 cpu_realize()
Date: Fri, 29 May 2026 16:24:19 +0200
Message-ID: <20260529142434.87880-4-philmd@linaro.org>
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

cpu_target_realize() is misleading, we simply want the host
accelerator to realize its things on a vCPU. Rename more
generically.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu-ops.h | 2 +-
 accel/accel-common.c          | 5 +++--
 accel/hvf/hvf-accel-ops.c     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 9c07a903ea0..fd1307dad6d 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,7 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
-    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
+    bool (*cpu_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index ebc103053dc..176b03e0e90 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -60,9 +60,10 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+
+    /* specialize with target specific realization */
     if (acc->ops
-        && acc->ops->cpu_target_realize
-        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        && acc->ops->cpu_realize && !acc->ops->cpu_realize(cpu, errp)) {
         return false;
     }
 
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b74a5779c3d..6edc2242ed9 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -356,7 +356,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->cpu_target_realize = hvf_arch_cpu_realize;
+    ops->cpu_realize = hvf_arch_cpu_realize;
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
-- 
2.53.0


