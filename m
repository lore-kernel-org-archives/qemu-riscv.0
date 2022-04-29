Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkHP5-0002Qe-8q
	for mharc-qemu-riscv@gnu.org; Thu, 28 Apr 2022 23:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkHP1-0002LU-85
 for qemu-riscv@nongnu.org; Thu, 28 Apr 2022 23:34:44 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkHOz-0002Qn-OI
 for qemu-riscv@nongnu.org; Thu, 28 Apr 2022 23:34:42 -0400
Received: by mail-pl1-x630.google.com with SMTP id c23so6085343plo.0
 for <qemu-riscv@nongnu.org>; Thu, 28 Apr 2022 20:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pwjbDN4AJMz1jW5DOU3a5WlAG2G7NEnP2vQW8ryYn4=;
 b=BzURZO75IkqhAiPc6i7MjsvX5LPlI5wjZ4L88rTy/K7zz8IpuMJU8ETEsEh3FYhDlM
 AuoM33C/ERmYEuSkxbcDdobyPFkbbKL2ynmETUWNj9aJ8erGAxQFRJPi2DYgOx9KG0ea
 8KMmQqOrlkvBVsJpmZEDllGRhBR3PTLNxJAbobmKUXGyWIyQEznlVjvqUEcfiunGMR+T
 v9JO00kp/PrCmS0HfH+Jui87EVzES6EGT5er/vYkY8dHuHxtx8vnyvA75HG0vZX2ZYV0
 e9iUZeOpnYnwdisnF/cBWbWRACsHFjJabps+RxcZiKaMdwvU8SxLuu+kfMo4JqLm8sBH
 222Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pwjbDN4AJMz1jW5DOU3a5WlAG2G7NEnP2vQW8ryYn4=;
 b=1imLRHSxivWK3VpZY1odKGLsD5x0B4H+E9yxOk4wZV0C7eHUSEs1ZNKrpcjqgzGyYW
 0VWeaR673+Q7DVA9PBd6w0mtJDjKeXXu6dc1nN0zGe6SN6pyeUDeyZDm/Dd2vWAlXkNa
 9bvQQ7VgX0r8g6khP3AL0oo4+v6zkDNwaC0/67Sg6jNof9Wx3t+29cg3ccudfzByfZ6Z
 HGp2IEovNLIuUJy+pKxSAhXMgChpa1vGfhQAtZLEEmnjXa/gdur/yN7VpZKk+f+IgoP9
 O0AUsUSnP6yqT9obMOcEZMnlPqhFeFatIhJd6Hy9sB678ygEWkZ/RjUo36r2j65YEQRM
 CADw==
X-Gm-Message-State: AOAM531yEdcSnijAwJKAl8eHyCbswPRz7Nt91fdQHnUaYysWm9Xl6VyH
 WjHpUynC7TYa5y/pGZMg/ZJJiXvekBLMUw==
X-Google-Smtp-Source: ABdhPJy/tFI8OFHOQYoOBFtyDqisystRs844dW1HV0vUMko348OhZrWttk9aau2w54rITZyAvepQWQ==
X-Received: by 2002:a17:902:d484:b0:15e:7aa9:babc with SMTP id
 c4-20020a170902d48400b0015e7aa9babcmr881111plg.38.1651203280371; 
 Thu, 28 Apr 2022 20:34:40 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a071600b001d9781de67fsm8195568pjl.31.2022.04.28.20.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 20:34:39 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/4] target/riscv: Fix csr number based privilege checking
Date: Fri, 29 Apr 2022 09:04:06 +0530
Message-Id: <20220429033409.258707-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429033409.258707-1-apatel@ventanamicro.com>
References: <20220429033409.258707-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Apr 2022 03:34:45 -0000

When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
the riscv_csrrw_check() function should generate virtual instruction
trap instead illegal instruction trap.

Fixes: 533c91e8f22c ("target/riscv: Use RISCVException enum for
CSR access")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3500e07f92..2bf0a97196 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-    int effective_priv = env->priv;
+    int csr_priv, effective_priv = env->priv;
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         effective_priv++;
     }
 
-    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
+    csr_priv = get_field(csrno, 0x300);
+    if (!env->debugger && (effective_priv < csr_priv)) {
+        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-- 
2.34.1


