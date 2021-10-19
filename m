Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqz8-0005Wf-TR
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz6-0005SM-U4
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:25:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyx-0007cR-Sd
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:25:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id f11so199484pfc.12
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1UFzoD53x5hfw3vlmPi31+uulj2FBxfz/+6B4SU6B8=;
 b=NIj+Wse00Hd23DEia3PGKBzDpEJqAMuf3pzKXEOQWejr9wpi+0qJEepNsx9d48/Zbl
 qaLkTjtAW/D+lO1PiT/Z4ASYhcxPx1y3eS9TeqNOpCwvP1vXrpgs1lAbpx8Z65AIOjoo
 WH3nui/3fcR6HLAjYzeGxdWDIlcdnt7sebC6rXMPQGn6WavM+qYGT15H6VkvKDtdPml8
 D5CiwhiSh6jxFtc5BVQkIbO7vElDpljN17iWC+mI2u3YxPuXSydlgW9ZCmhJZukY3dPy
 EfX4UcxoclH5BfgdwcRMsGxGLKmatZvde6CTsPz2TzrymuSn0sSY7MpRYxbWdpadXcsQ
 8eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1UFzoD53x5hfw3vlmPi31+uulj2FBxfz/+6B4SU6B8=;
 b=HAwl212wRruC5t7L6vZwexL1dvKDGwE89TDEndTr3YtJ11sRzTq20E9zTjsIYBtTI+
 jY2Qmaj339SDbXejq23PDKjP32f1mvcF1JGLMwK0S9JXyEI2vThNSEb+ov+MKoDRvdtK
 ZgIMJJS2FLLHgLISSrOlO5RjTvYnri+tUd7HA30JtIElIMwATN5wiM+MiPyI/gHqzS6q
 lEsLbFts0Mzj/kocrw8vTbEMfB5l+cIj5ZUxpd1SYJlhdnFmUEGVh2AQ4ITI0SUzZiQJ
 J71SXljIbOtK2zWThs5ohs0XvLpY9hFwoDukYwYNpI9qkxWv3l1u3TA2w5xK702WhOgX
 Xsuw==
X-Gm-Message-State: AOAM531SRvPGWj1GGkZEy3Ptby/pbHWkHCmLfZgZnNW3RhEjc0w9/oD3
 WRcAAJLqKntK8bYZm5WRqq4KcA==
X-Google-Smtp-Source: ABdhPJwCldF/J4VanfevOksShgHh4HC9CFpe3Slw5EQe7nTmRw6WAHXQHQ6PJ12td1LXZ4VQC8JwYQ==
X-Received: by 2002:a62:e90d:0:b0:44d:35a1:e5a0 with SMTP id
 j13-20020a62e90d000000b0044d35a1e5a0mr518558pfh.54.1634657089311; 
 Tue, 19 Oct 2021 08:24:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 14/16] target/riscv: Align gprs and fprs in cpu_dump
Date: Tue, 19 Oct 2021 08:24:36 -0700
Message-Id: <20211019152438.269077-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 15:25:01 -0000

Allocate 8 columns per register name.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e1920d5f0..f352c2b74c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -240,7 +240,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
     }
 #endif
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
+    qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n", "pc", env->pc);
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
@@ -290,15 +290,16 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #endif
 
     for (i = 0; i < 32; i++) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
+        qemu_fprintf(f, " %-8s " TARGET_FMT_lx,
                      riscv_int_regnames[i], env->gpr[i]);
         if ((i & 3) == 3) {
             qemu_fprintf(f, "\n");
         }
     }
+
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
-            qemu_fprintf(f, " %s %016" PRIx64,
+            qemu_fprintf(f, " %-8s %016" PRIx64,
                          riscv_fpr_regnames[i], env->fpr[i]);
             if ((i & 3) == 3) {
                 qemu_fprintf(f, "\n");
-- 
2.25.1


