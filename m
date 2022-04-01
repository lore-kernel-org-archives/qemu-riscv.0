Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1naGse-0007Ry-Ql
	for mharc-qemu-riscv@gnu.org; Fri, 01 Apr 2022 08:59:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsd-0007Qf-56
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:59:55 -0400
Received: from [2607:f8b0:4864:20::c2a] (port=38887
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsb-00036z-Fj
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:59:54 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 v19-20020a056820101300b0032488bb70f5so508732oor.5
 for <qemu-riscv@nongnu.org>; Fri, 01 Apr 2022 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yF7C9gaOsw5q5PId/RPk9weVI8GZSE/i/UYTi79cArg=;
 b=Fv9EPnrAA2w7zGLj+VSTHip02aJ3WndToaz3PLpV8oCsH46TIH8cn5g6q7lLNb9R/Y
 1wUh4QyIbv4fWeHrepGScG9nbBzw1zGeliONU3lVoU60wsxmt/QSoK5UCvh0CwPerYGi
 ccQLPNTXkg4G2hrV+XhpuZOaBEmh8d2S2faufns3maDyZPkfPyvIM4IsBL7hHYPBpCvQ
 EOtoGUVWrp4Y40Utqdmlw7TFNabUDba2PIcks01UeCVeWU2mQzyUxvFqCWwYllVQzGq3
 br8B40lDZC6z6CYgjXRMbbEDWo7CfcFVWMFHbsqzoPrx9u1v+8vGKu1L61qT6kEUEMp0
 Wuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yF7C9gaOsw5q5PId/RPk9weVI8GZSE/i/UYTi79cArg=;
 b=CmR9MGicSN2Rv41+rPb0NmB3b6JILTQ8X+k5wTgXrw2f2UhUMaUm105M+srMTe1OPc
 U9weOMC8Wqn1qtgpL64j8tmn8lyrp5QrJagDqlFIUj8gje869vuaEKwynF5bQWL6vJyM
 pcG6SIsxGMR37Rhs26h6qynAuPspkr1GeBomhDT48mn2i7rOWqx5MTyHSriV6lVqabEQ
 5dt8PxhRl4ssXyXX5Hbvo/c0ib07hN/zmrU+ORYDqvCjXS3enLJHWElc7swZKzpVEHk1
 Kbe2GZ3ccugB/kVJcSxbsWYL8bNv3RsSQjqSd+iVSlSBQT/NJPqYEyAD+OrayGzPYODL
 Q+fA==
X-Gm-Message-State: AOAM532OCsX+ru7zxQVUKqCJSkah2ps7b2yu7Jn+N9ljYUuPx5oLR2+f
 rMHXvgV97L3LY9tMUr18l19dWQ==
X-Google-Smtp-Source: ABdhPJwa/Q6VsR8hj8hy8guj5P+ot4ujgW1DYefmfwYdd0LLOBXN16YcbXRVZiICt8fZsaugisOIRw==
X-Received: by 2002:a4a:5510:0:b0:328:faf7:9ed9 with SMTP id
 e16-20020a4a5510000000b00328faf79ed9mr1806789oob.65.1648817992380; 
 Fri, 01 Apr 2022 05:59:52 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 h6-20020a9d7986000000b005ce0d5433cdsm1066665otm.15.2022.04.01.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 05:59:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 bin.meng@windriver.com
Subject: [PATCH 1/2] target/riscv: Use cpu_loop_exit_restore directly from mmu
 faults
Date: Fri,  1 Apr 2022 06:59:47 -0600
Message-Id: <20220401125948.79292-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401125948.79292-1-richard.henderson@linaro.org>
References: <20220401125948.79292-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 01 Apr 2022 12:59:55 -0000

The riscv_raise_exception function stores its argument into
exception_index and then exits to the main loop.  When we
have already set exception_index, we can just exit directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e80..126251d5da 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1150,7 +1150,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
@@ -1175,7 +1175,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    riscv_raise_exception(env, cs->exception_index, retaddr);
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -1311,7 +1311,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
                                 riscv_cpu_two_stage_lookup(mmu_idx));
-        riscv_raise_exception(env, cs->exception_index, retaddr);
+        cpu_loop_exit_restore(cs, retaddr);
     }
 
     return true;
-- 
2.25.1


