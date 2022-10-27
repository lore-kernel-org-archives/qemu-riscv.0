Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oo63a-00008t-H8
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 12:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63N-0007IB-Of
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:27 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63F-0002Pu-DS
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:24 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s196so2051090pgs.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Oct 2022 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPNKG9h2hj94wjs8mxSr/AkuBfy4MSWYkNKhqXWd3yQ=;
 b=ZcjxpFP3V3mA0RDpgk8XWDnvbu1Zpb0LBmNRI5D+RRitcrooQ2mhPqUL5i3C0u4a0d
 LtprEnUerKAhavxn8f1GCCC3g3B1oNvPTPSKo/gOVesU5pUDAygZRFwZBiV1TgVaVdwc
 Zz1D6gZBn+RZKFEMy5dPf7+tlzTY2J+ISx7HNIoptp404IpfhzpJSimzRs/hLxO5Rl4B
 LiKWjYJ+p6z/+4VeXWmjgbFQJ+b9xmmUyA5phbWrgrYNTgSFLW/2nTnQgKtrGwBqa/ke
 jPd/Xeogl3bX7DGVOTAVlnq+E1AUvnhXpbKXj2nSK3hcIeXTi0p0npFB5csv8+qeRHym
 X97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPNKG9h2hj94wjs8mxSr/AkuBfy4MSWYkNKhqXWd3yQ=;
 b=wObGcueWdAPIvNPATE10lql0vOqD/jQubz2onmasjxhssIIHal16wShHEjChZRY8tP
 sTmqRocI2aqXlys3Qqvkp5pcfBev7lOn5rVNLSnZXOrxbwGjDNVf/aJoHn5zg7EYE3dQ
 AGi6VWNSR7jBJLvOUnEs0dxyiOFiULnzy0XmpqGcLHHwPAJBQuFQK0+40hJmUle5OK6I
 BFtTv0gYGWGZCPKJcYT0P4wyo0TBrGeySCj5XZcC8dPTG8bJDQzMUhGbbyYeAIO5ZOKi
 2ZwgjQL3/Y8faDCusZSDZVRmzUhCAohL4GJgkBHVmPVdVG58O+u91+Oz9/xf/0GM5beg
 GDeg==
X-Gm-Message-State: ACrzQf3lacCUGdAoJ7kCbuIQwrwBOhLGpvy9/ND0olGf5Gvi6g8vyxMq
 Vk1IunA0U4NSOctVMpPX0mxa6A==
X-Google-Smtp-Source: AMsMyM5DotugxLhi22bo7QnHr5/87zGiaBFYnEwPyaUvFjfkHpAuDWIT3/WSaGHZM8Td4nGpXXLo3w==
X-Received: by 2002:a05:6a00:23d3:b0:56c:9f62:3369 with SMTP id
 g19-20020a056a0023d300b0056c9f623369mr3392957pfc.22.1666889295959; 
 Thu, 27 Oct 2022 09:48:15 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/5] target/riscv: Don't clear mask in riscv_cpu_update_mip()
 for VSTIP
Date: Thu, 27 Oct 2022 22:17:41 +0530
Message-Id: <20221027164743.194265-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 16:48:28 -0000

Instead of clearing mask in riscv_cpu_update_mip() for VSTIP, we
should call riscv_cpu_update_mip() with mask == 0 from timer_helper.c
for VSTIP.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_helper.c  |  2 --
 target/riscv/time_helper.c | 12 ++++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5d66246c2c..a403825e49 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -617,8 +617,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
-    /* No need to update mip for VSTIP */
-    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
     if (!qemu_mutex_iothread_locked()) {
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 8cce667dfd..4fb2a471a9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -27,7 +27,7 @@ static void riscv_vstimer_cb(void *opaque)
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
     env->vstime_irq = 1;
-    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
+    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
 }
 
 static void riscv_stimer_cb(void *opaque)
@@ -57,16 +57,20 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
          */
         if (timer_irq == MIP_VSTIP) {
             env->vstime_irq = 1;
+            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
+        } else {
+            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
         }
-        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
         return;
     }
 
+    /* Clear the [VS|S]TIP bit in mip */
     if (timer_irq == MIP_VSTIP) {
         env->vstime_irq = 0;
+        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
+    } else {
+        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
-    /* Clear the [V]STIP bit in mip */
-    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
 
     /* otherwise, set up the future timer interrupt */
     diff = timecmp - rtc_r;
-- 
2.34.1


