Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md26e-0007Tr-K7
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26c-0007MK-LR
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26T-00017A-Tw
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:30 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n11so15136158plf.4
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10CR3MhgrLCIc6IFDsvW3803qnjtbrRpER/oY1lVkqY=;
 b=TA9yB09bkL7KEJGWAxzU5OLLXGuP8xurYgX37CB7jJ4NvVsLTt0S6+HH0pBANz6aU8
 WhFEIyXeJn8jvwsR1PHApDYZcHFn8/whOkwCxhWc6QokCBzqoQjjzxk6f5uCamWIsh3J
 CtkfbfVN/LIH6hOxel1yfavd1khVToZ1QfBWVH8FrJ4LpwYe8zBVfOeF2D8c0w4/d5qd
 IrO633MC6De2TqKjVId076RTamIRYVXCXYHiGctWzPEKeOuvlNpUEQ2SmndfoJyKk16V
 rbSwAWr5rdamrciYVXqbn0FkdVd2YTNWRJNUu4CkdprbmnCLeHUWoRC7hdAFpd1BpfVO
 kz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10CR3MhgrLCIc6IFDsvW3803qnjtbrRpER/oY1lVkqY=;
 b=cB8l5AXuVUTeb/BaDAcm+Rp0dJcYTCC/fAdxcLoJ5WjH3OJFXtN1aB8Pqcr/sWuXAY
 pzN68HhO9hKuZVSxZjdjy/vvDhxmrGiSjkVMe4CVV6lLNIVDTHJOCP/bQ7vLgsQrMc9g
 UtwWOlEaas9AtkZrIPjqjR32d0T5bXszm2xNbCY0aNE9smazjBEJzl1SyFFJKTJL0fwF
 mTrz+X2fqINat6foaX8mpKtbDSLL07FroiROMsKyC46PlERGBZvyhh1YxaHBOv5lWSy/
 P/eQyyZcQdjb1ao8LqJhD9fII8PlbX8n/eV9n8DaQMJMD4sZIY8QjwkxC+M+8otl8X0Z
 oG/A==
X-Gm-Message-State: AOAM533B1S11qwVKB9sv0Lr9rPOick26x36toZ+hOBkb6EzfBbyll2Of
 1gn6VqEw8CJ9tIkrNnotBCJiSQ==
X-Google-Smtp-Source: ABdhPJwLbQYpxvrUm1Mt+7DvOaTLRb4pqUf0fOdjKz7VGI7H7Gdib2r3qbjewNZP041jBicwRY85lA==
X-Received: by 2002:a17:90b:17d0:: with SMTP id
 me16mr4436738pjb.152.1634699840575; 
 Tue, 19 Oct 2021 20:17:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v6 14/15] target/riscv: Use riscv_csrrw_debug for cpu_dump
Date: Tue, 19 Oct 2021 20:17:08 -0700
Message-Id: <20211020031709.359469-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 03:17:31 -0000

Use the official debug read interface to the csrs,
rather than referencing the env slots directly.
Put the list of csrs to dump into a table.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 89 +++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index babe271e53..79071bde4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -242,51 +242,52 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #endif
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
 #ifndef CONFIG_USER_ONLY
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
-                     (target_ulong)(env->mstatus >> 32));
+    {
+        static const int dump_csrs[] = {
+            CSR_MHARTID,
+            CSR_MSTATUS,
+            CSR_MSTATUSH,
+            CSR_HSTATUS,
+            CSR_VSSTATUS,
+            CSR_MIP,
+            CSR_MIE,
+            CSR_MIDELEG,
+            CSR_HIDELEG,
+            CSR_MEDELEG,
+            CSR_HEDELEG,
+            CSR_MTVEC,
+            CSR_STVEC,
+            CSR_VSTVEC,
+            CSR_MEPC,
+            CSR_SEPC,
+            CSR_VSEPC,
+            CSR_MCAUSE,
+            CSR_SCAUSE,
+            CSR_VSCAUSE,
+            CSR_MTVAL,
+            CSR_STVAL,
+            CSR_HTVAL,
+            CSR_MTVAL2,
+            CSR_MSCRATCH,
+            CSR_SSCRATCH,
+            CSR_SATP,
+        };
+
+        for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
+            int csrno = dump_csrs[i];
+            target_ulong val = 0;
+            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
+            /*
+             * Rely on the smode, hmode, etc, predicates within csr.c
+             * to do the filtering of the registers that are present.
+             */
+            if (res == RISCV_EXCP_NONE) {
+                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
+                             csr_ops[csrno].name, val);
+            }
+        }
     }
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus",
-                     (target_ulong)env->vsstatus);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstvec);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsepc);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval   ", env->htval);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2  ", env->mtval2);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.25.1


