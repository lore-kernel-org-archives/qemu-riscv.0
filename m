Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osOB9-0006TN-Kx
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 07:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOB7-0006Sy-CG
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:09 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOB5-0005pO-Oh
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:09 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso15349025fac.11
 for <qemu-riscv@nongnu.org>; Tue, 08 Nov 2022 04:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7R8KmvJQzLthd8ndwN21jYsULXSllZr6f02cqF8O5YI=;
 b=JD13XmS9A8mVis2fTVUYrzeVnupO7cYUs9DIJMUrZTWAttQZoz19ycr6987aR+j81d
 Tf8ksJdpAdwGtnecfwXTpHYWbHOJMs2gFHRbxmOfBzAhvPWsk3ZWhS7NbpS/bmeD8gsg
 c6yDbREwuXvZ+hEP4NFEiEXNqUchFR1fC//Y1RSl8quVDih/Z6z7dLmYjIKDLw5NCf79
 qg1pcQBBGiCLGrEuq3eYilIGWrlsKNJWa4ZBOICBhL//OKq/lYVi6b7Vs2OU0GWlC8XO
 lOZY6ce0WR72U35SmrYoiswvTA0IAil3jpseeXMk8LoqfYW6DemAakMN1Y2VE9/3aPc3
 B/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R8KmvJQzLthd8ndwN21jYsULXSllZr6f02cqF8O5YI=;
 b=N3HDDlK7LVpKigEv/VjvVs2OGAsnw1JM7T0HJ5AB8WOvFP7+1QqJbfnyaY/KU6Pwte
 3zGu7HeKsyCOEYVwyGUaROysfvAtUZGVJZ2bst4j4G8Jreh44RIGvpYt9pgYFik6I5mw
 mGB0KnOQq7eZxlzTCdF8ryx+XTo70FEeVJYvyOcM0sViiB9Fg5xojVoVCzTVyJ7AZ1Bq
 E9W4aQYx1OfUKoqAJ3TwUJ0W77zu2MeidLcWDkaFZTa9hyxsErBPTmXFQOYyyC+Hiep/
 yBEBpp3xcMmivv/X1gYTf9TQQ8ATGtGylxIeXtVyl3H6zxIjpToivUPtJV8jbr8Bk+9Q
 zMXw==
X-Gm-Message-State: ACrzQf01PfEXcdv86ppxZ9ArHpNDTLYSxSh8/OPoV824CceUWUdLfrEG
 3PKNLtlxldxqIIsTHD8MR33+Hw==
X-Google-Smtp-Source: AMsMyM7BDaqmX4Gwda4zHPGCnGB+BwTb+Flrm2TD9nQNClUP9ZiDvcd0I6ihX2DcCh+tS5dHG88l9A==
X-Received: by 2002:a05:6870:5b84:b0:131:e064:747c with SMTP id
 em4-20020a0568705b8400b00131e064747cmr43913730oab.273.1667912284953; 
 Tue, 08 Nov 2022 04:58:04 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:58:04 -0800 (PST)
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
Subject: [PATCH v2 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
Date: Tue,  8 Nov 2022 18:27:00 +0530
Message-Id: <20221108125703.1463577-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Tue, 08 Nov 2022 12:58:09 -0000

The htimedelta[h] CSR has impact on the VS timer comparison so we
should call riscv_timer_write_timecmp() whenever htimedelta changes.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 716f9d960e..4b1a608260 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2722,6 +2722,8 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -2731,6 +2733,12 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
     } else {
         env->htimedelta = val;
     }
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -2748,11 +2756,19 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
-- 
2.34.1


