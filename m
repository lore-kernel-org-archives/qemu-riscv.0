Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIr0J-0007NX-Tm
	for mharc-qemu-riscv@gnu.org; Fri, 20 Jan 2023 08:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr0G-0007ML-UU
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 08:00:22 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr0D-0006HD-ND
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 08:00:20 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso4798564pjd.5
 for <qemu-riscv@nongnu.org>; Fri, 20 Jan 2023 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ebxx67c2QVmctcxn5YFSMEPnvQ8qAF16FaANSYYEiw=;
 b=YDWzP6QscbbwPjaLfDUMMrQpwpeiZiMSG4VFVeGo5CdNtC2oQPW1DDAFVaZwh282CG
 FTMXVKgJYskHpxuOQXHl8uFpc/fYUkqxsZoW0jGZL60cg9fe19/d7SPdMJ6k+kTLSUUA
 dF9XA+mn5PMGpHnH0rWFwg2B7jGIQcECfFC/oqhKzCZ45Jo2uHDIaqmEkCKY5D6Z52tp
 vRC4vplz04aurTRWdeTlQ3D/8a/+VPk3nCh40xkbepnVRpfS6qp7rNn37etcaQFwznvA
 5tGnARB+KOYqgMqEeXZqf5R381WKnpYWqk07WTjMB+0WyTSTOpoBMYFABr7fv9YSqW3a
 /a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ebxx67c2QVmctcxn5YFSMEPnvQ8qAF16FaANSYYEiw=;
 b=V+FZrSeIBKDX5LfDcx1IHTXhi45Mgy+wz67EUUYv3oTlVzdr2MC0iZGAgOnHy6VebH
 6vpGvRvQNM07T3o+cBFe2pE9TRwMXvDWeFnxQMiqNClaYjNcqP6qrZtN80Sbily1v7hA
 +rkbnSBLiAFncvVbLwDhWeTklVcvqjvRMJmhw77RDSxXxQ1WhCvjfSg+64O89wjfMctb
 fXT6RriumHwnIz3m/1bXUrZzuQgaUjFRssoU+oKf57lnquqvo0S+RAK+8zjSmJJUQLbT
 cKLsygp/ejaC602SXyebXmtRE/FPEEqfT5w5nE4OHN4UaHhNa28UPNwUSpqtP3nfOBRb
 /gpA==
X-Gm-Message-State: AFqh2krHGo3YJ0nzrMk6ju04zEiOgDZatFEE0dEtZU/nVH1c4UY3ihfp
 uhrmm8uXq9CGTAoGVKp/5no0ig==
X-Google-Smtp-Source: AMrXdXsvR+dyGy81viuym6fHS7edAPrwnsEnU7ioxb+cFbmZgJskHfFPw5M6JE+1q8lMc3jDZX51bA==
X-Received: by 2002:a17:902:d50f:b0:195:f3d5:beb0 with SMTP id
 b15-20020a170902d50f00b00195f3d5beb0mr16657plg.64.1674219614206; 
 Fri, 20 Jan 2023 05:00:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b0017f72a430adsm7279610plf.71.2023.01.20.05.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:00:13 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/4] target/riscv: Don't clear mask in
 riscv_cpu_update_mip() for VSTIP
Date: Fri, 20 Jan 2023 18:29:48 +0530
Message-Id: <20230120125950.2246378-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120125950.2246378-1-apatel@ventanamicro.com>
References: <20230120125950.2246378-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Fri, 20 Jan 2023 13:00:22 -0000

Instead of clearing mask in riscv_cpu_update_mip() for VSTIP, we
should call riscv_cpu_update_mip() with mask == 0 from timer_helper.c
for VSTIP.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c  |  2 --
 target/riscv/time_helper.c | 12 ++++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8ea3442b4a..84f84b2bae 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -621,8 +621,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
-    /* No need to update mip for VSTIP */
-    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
     QEMU_IOTHREAD_LOCK_GUARD();
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


