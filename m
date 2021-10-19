Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZm-0005ME-J0
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZS-00051y-My
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:35 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZF-0001ll-IP
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t7so3263686pgl.9
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6ifnB9fQVtM5sdP3JDCZC+MLNkcLrpq6cl5OiAtX44=;
 b=R/RMLEBfZY7ivGnrhUt5U55HvG/Zvrqwz0Qr/B9wTuKeWczvvllYcSdOhBg6qd06KE
 Qkg1kuECc0MH3lAvpFYhVAu2tYRIa+NrZTj+KslKqmwwQrrXrnihqMib3ADFqKJm1Vnu
 0nK2dq70TkwObe8jnSYd8rV/2zF6i5CnqS8Vev4gbzeDkjBaUgsaeQ9l+1Avxs6yf4qL
 yc8Cg95t438ylIBLRoPPr/bN+aoVw5icWqkuLTO3h9YAVGbbOtbySz7tYN3idasrsGjk
 fVS7Q73eW2KkCIbN7AAwoBAheecp0Wd8xTHQ7UzMlblvqpwk2eGd+jEODpxDYCnKetTy
 lLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6ifnB9fQVtM5sdP3JDCZC+MLNkcLrpq6cl5OiAtX44=;
 b=pjrHXWWw2kK0I5D8RUb3uvmrDf5IDKzln++Pw4U3AIv+wSMHZXC9X37dgyUzd4NUUd
 XXDKmIDjsbOAZ3h1YvoTSSUaPUzzb116ybPiFomJKoKJNbnKMdGyZfuPvL2bYiFrOxk+
 k25zidaKdqTBxaDTo41CzYc66SjkGAt5tDSppU/EAsg13dShAigx6Ypr7Jqnu8ge4GPy
 vu8vrThknnUfOvT12ihdRz5wCh6B7r9D8P+oC2yCfn/GTU0rlCSlZ4kwuXTinY8etENO
 6p8BHgZfFFdF1vtm6I99AY+m+7rjj+sxxOxspt+wi42CxOS8eh2dy+KcfKVoNL14WzAi
 syGA==
X-Gm-Message-State: AOAM533GgwFIAYBkKRTPAFdORGkKXok77DBZ0n93ZfZZSid7giCdb1C1
 0D2Goswa1knhnuudpopOyLcK6g==
X-Google-Smtp-Source: ABdhPJz3S8Y0Tvl3k2JMQGn+XA3NhkUagk92LKImr6yY77KnloJcXA4RTWnF/mnwz/kFxx3TJ0d12A==
X-Received: by 2002:a63:e115:: with SMTP id z21mr26245263pgh.306.1634601680030; 
 Mon, 18 Oct 2021 17:01:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 14/16] target/riscv: Align gprs and fprs in cpu_dump
Date: Mon, 18 Oct 2021 17:01:06 -0700
Message-Id: <20211019000108.3678724-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 00:01:41 -0000

Allocate 8 columns per register name.

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


