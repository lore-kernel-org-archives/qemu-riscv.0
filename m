Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmc-0006B4-Vp
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl0-0002oZ-Ft
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vky-0004ZS-Vc
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:58 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vky-0004XU-Nd
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:56 -0500
Received: by mail-pg1-x530.google.com with SMTP id a14so652028pgb.11
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=RrHJx1N1kyjQHiPtYBUYw+QZriur1pqPCfrIwJOEUL4=;
 b=MEhIlvVbsnuvpLSLEcF7tUZh6DA8hpgHOrcDQgcuo5zWrLIifMe51fCtVSMn7/zUq5
 veAyBRi8/0tVDkUEL/0h8U/hGqPj/7mXsEfqRL+HnVbkiqQdPHhjy3ORLQS1PtPgQxYC
 2DLiG/18aU6nR2XlQPpBPKe3x8LcS4/kRtjBUppAtGQIONUYXIicArckvIfMQqBEHDyr
 CfiyTcaPIJKuub/evGgkc+EmxM+KWiVf/uTk1j7hpa8VDUYu/X1pQd+Zu+cU3g2MxAWG
 GpGC3ngV2pv3nnMpEwMjyX8CG+7UvBvBobkhATUjzual8eWW/oGhWK4xWQ7jzN0Le9tc
 kPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=RrHJx1N1kyjQHiPtYBUYw+QZriur1pqPCfrIwJOEUL4=;
 b=gB2hSgSRpEINpAnbDG7J2iwr9C2zJ9AYPWqVqiqeZXGQ5lFAGlH/ySeT0/L0qJr2L2
 bZfOIJQ7+xleCPRaNUAyfvC4PRByXBTUzKah+appDnkXR41U+UcIXTR+uyYcSxjsIHX7
 xlhN8FBM0DOcMevzcP+6otlMp3LgRtPlu1wqLXcbKcEO/OrRlPU8AVbLyzvCsWRiYTa2
 UbjHWJgOgOI3sK8TSy05tL1tAaPZmCoV/Z17zNNv+7R5ZsZxFbk2LWgbcB0fNJ3fWqpU
 8wV3YXXwq8bE/e1zAGC+qFkH/KVeP7ByZyzWaEDlKuSmyeSnG7iqcEQCzwRTzJ8CSwDU
 WrDw==
X-Gm-Message-State: ANhLgQ236S5JwOLHpyXqlnQJwRvX4aQUW/C41cftjPH1o2oPEuZX6PyE
 4qodwGp6CHdoeQGAVuwTxP/E5W6glynBgw==
X-Google-Smtp-Source: ADFU+vvVlew0D2d9EPOfBBD01bjOh9y3yS3nvgrpIp0+scpM2mV0u084bZIhh9X0Z1vbJ6fShgb2zw==
X-Received: by 2002:aa7:8695:: with SMTP id d21mr1594333pfo.199.1583196594192; 
 Mon, 02 Mar 2020 16:49:54 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id s13sm193947pjp.1.2020.03.02.16.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:53 -0800 (PST)
Subject: [PULL 32/38] target/riscv: Set htval and mtval2 on execptions
Date: Mon,  2 Mar 2020 16:48:42 -0800
Message-Id: <20200303004848.136788-33-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::530
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
X-List-Received-Date: Tue, 03 Mar 2020 00:50:01 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9e28b19c29..d3b764e694 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -840,6 +840,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg = async ? env->mideleg : env->medeleg;
     target_ulong tval = 0;
+    target_ulong htval = 0;
+    target_ulong mtval2 = 0;
 
     if (!async) {
         /* set tval to badaddr for traps with address information */
@@ -901,6 +903,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
 
+                htval = env->guest_phys_fault_addr;
+
                 riscv_cpu_set_virt_enabled(env, 0);
                 riscv_cpu_set_force_hs_excep(env, 0);
             } else {
@@ -911,6 +915,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                                          get_field(env->mstatus, SSTATUS_SPP));
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
+
+                htval = env->guest_phys_fault_addr;
             }
         }
 
@@ -923,6 +929,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
         env->sepc = env->pc;
         env->sbadaddr = tval;
+        env->htval = htval;
         env->pc = (env->stvec >> 2 << 2) +
             ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_S);
@@ -937,6 +944,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             env->mstatus = set_field(env->mstatus, MSTATUS_MTL,
                                       riscv_cpu_force_hs_excep_enabled(env));
 
+            mtval2 = env->guest_phys_fault_addr;
+
             /* Trapping to M mode, virt is disabled */
             riscv_cpu_set_virt_enabled(env, 0);
             riscv_cpu_set_force_hs_excep(env, 0);
@@ -951,6 +960,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mcause = cause | ~(((target_ulong)-1) >> async);
         env->mepc = env->pc;
         env->mbadaddr = tval;
+        env->mtval2 = mtval2;
         env->pc = (env->mtvec >> 2 << 2) +
             ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
-- 
2.25.0.265.gbab2e86ba0-goog


