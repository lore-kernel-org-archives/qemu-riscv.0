Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nouNR-0004Vu-Nw
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 18:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNQ-0004UW-FJ
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNO-0006ew-T0
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id o69so3442447pjo.3
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 15:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AhCdNNL1uDdWvnH8n7UysRuRPz3w0BpqFn1GxNQ6wo=;
 b=fytPneEmsny+Pj54XsjvH+yJyKiyIQXqjgxcMFBdfycFD7t0ELgrStCgfZhKF0iO55
 LDrK5qUaSCFmzgdMPxAa0kf6Xthyw3EG5+R2Q+B1ERzA2JAIboEeJfDoKw4qGlv5eVgU
 LabepkR8cYWhInEcTPRbtB4d9xGeGcZrMSL5c5Zm9m3rjxc+QaylulqtTXmLxzKpBqgU
 fMoaOcCaAkAf1fxHTDT+QLLuIPhMkUQvRBxj8H6mjbE+IvU6rVbiOvhqesoHL+oEjYzp
 sXmZiV/X29rj4H46Ix4rZN2wctlsJMqhU1IFVVhv6Rxw4ks63A9c1ZTI8SgKKfHrlPjp
 fQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AhCdNNL1uDdWvnH8n7UysRuRPz3w0BpqFn1GxNQ6wo=;
 b=PPsqzo7EKmtS9zYn3Pq19bDAzklU315ZkoY2pmxQDSWI5+6EycT25u+3d9xOp3Ze4I
 RGtuMNKNLNnxoN6JwQiYx5X/ZzLBq8yfO70HpoWYCk5IGvnXEpjEQ+RDt7jBQj/qhuM0
 /cJna8ds3eA2Z6vD0D0cIIWqjSqtYn+HXSoYOYal081dS28gPvIoLiwGrZoDB9IXTw5g
 Ckiw/KWQTr/vnhrLWc9lO3VPqH3ZnQ9vFuq70wnqwxiAJnmZ9bxXeSdG/WiDopI75i78
 L6pqM7t2/gw5jIWpak0vmSNIvDUi65Sl7BKN/jTmZ1nMp3UXcKJnA4vHgVf0uFoQiyxC
 LzrA==
X-Gm-Message-State: AOAM5336USsMGBcZRGE95ZFFxIAK64aLhyAtAMe9ua5cBHWmPDZQU2KR
 uFK5XEXxa4ZX8HKpZLhJBBrR/w==
X-Google-Smtp-Source: ABdhPJxLn0qdk0oErX8E5kMy4li3iexoYy5DTUJmr2ywY2v38wlmMML/4DfUsVIZFyD9QNqCwlySeA==
X-Received: by 2002:a17:90b:3e8b:b0:1dc:e471:1a69 with SMTP id
 rj11-20020a17090b3e8b00b001dce4711a69mr7517540pjb.60.1652306409472; 
 Wed, 11 May 2022 15:00:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Wed, 11 May 2022 14:59:46 -0700
Message-Id: <20220511215956.2351243-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 11 May 2022 22:00:12 -0000

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ee3a35afa256..d175fe3f1af3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -79,6 +79,57 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.25.1


