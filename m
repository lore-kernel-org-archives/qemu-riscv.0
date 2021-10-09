Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mZ5Fe-0005gh-3I
	for mharc-qemu-riscv@gnu.org; Sat, 09 Oct 2021 01:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <travisg@gmail.com>)
 id 1mZ5Fc-0005gQ-5P; Sat, 09 Oct 2021 01:50:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <travisg@gmail.com>)
 id 1mZ5Fa-0004Sc-JQ; Sat, 09 Oct 2021 01:50:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ls18so9139034pjb.3;
 Fri, 08 Oct 2021 22:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vORwKxkrYODDxvr7F2h57qLME77fhK2UJHPI/LCULSE=;
 b=Sg2h5n1KoGUdKNKtrrnOL69qTUTabqKVRBfsX2ZFD4EIeCKRkH3BNIdRFfQUq9PVJG
 ANMvyaJdZQZaJWhPhF8DO0EOFA2vTJGDeVcO+gE3L5OnvXhVHDxnO8QUSsBN6Tfap4Us
 BM7Ul4QVZrqd0Unmfko2L65bOiTMwpAKxFopdnLoTMlY8KtPWGRoCx19N6nMCXUfnvUV
 be8iyu5OFuoXcH107bIWqMxDkzO00wCPaq+MHtra+//xlTxHKlEjmNc8Y4aCKYi0Koet
 aRUm7/4/X9VCyq6qrydt3MQJZJw5cXS139GXWU34ev0cVZt8qZiUGIZT8mi8bZOjfEd3
 5mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vORwKxkrYODDxvr7F2h57qLME77fhK2UJHPI/LCULSE=;
 b=ianUcbrX1cS9ZraWIKISmxGmpx9NpJyLbYX3YIWuVaM6ilD7lSjLrjUOPtjCbeK7Px
 qX4Kc8iJ3Bf/I0a5MFKlz0PgB7uVUTIJVmTEljcvAdHDxctQ3n3Sno660bZhvz2dKgzd
 pUTmACQy84Rk7qpmnJgLF7Empu4mjzEmu6suRDvK8nifEjgFQm/+EdWS9xMGOFnYoY9r
 x4MFS0tal6L65UzyPYU0NAuVojl8lZZaDrypzpMxN1cogLIU2JqnNPmUfOLEAvlKDM+g
 azrMwQvyzQLtR6MgeQY2z4VgYqMP8N8Tws48A2A/UiR6RstfiXP2jdLeGvI/5cUjvCBp
 M0Aw==
X-Gm-Message-State: AOAM530QifDMdGFPP0oV2p3jailBnv2Zv02xvyBV9JVm6w7rxnK5SZPP
 v0gYx14LzH77ljR2P2Wf5rSd1I4vf5Hueg==
X-Google-Smtp-Source: ABdhPJzxMT/ZpM2oVSQJ945MY6EHeIOLQyQ3UjGEgI4QKhZ3lieY5YcQtJoODhKEtnPb+YbPOwcFrw==
X-Received: by 2002:a17:902:e78f:b0:13d:f99f:34bb with SMTP id
 cp15-20020a170902e78f00b0013df99f34bbmr12946769plb.48.1633758623007; 
 Fri, 08 Oct 2021 22:50:23 -0700 (PDT)
Received: from geist.localdomain ([2601:600:c701:1370:5363:1a3b:86cf:95])
 by smtp.gmail.com with ESMTPSA id e17sm880042pjh.17.2021.10.08.22.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 22:50:22 -0700 (PDT)
From: Travis Geiselbrecht <travisg@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Travis Geiselbrecht <travisg@gmail.com>
Subject: [PATCH] target/riscv: line up all of the registers in the info
 register dump
Date: Fri,  8 Oct 2021 22:50:19 -0700
Message-Id: <20211009055019.545153-1-travisg@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=travisg@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 09 Oct 2021 05:50:28 -0000

Ensure the columns for all of the register names and values line up.
No functional change, just a minor tweak to the output.

Signed-off-by: Travis Geiselbrecht <travisg@gmail.com>
---
 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e..660f9ce131 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -258,7 +258,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus",
                      (target_ulong)env->vsstatus);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
@@ -289,8 +289,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval   ", env->htval);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2  ", env->mtval2);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
@@ -298,7 +298,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #endif
 
     for (i = 0; i < 32; i++) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
+        qemu_fprintf(f, " %-8s " TARGET_FMT_lx,
                      riscv_int_regnames[i], env->gpr[i]);
         if ((i & 3) == 3) {
             qemu_fprintf(f, "\n");
@@ -306,7 +306,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
-            qemu_fprintf(f, " %s %016" PRIx64,
+            qemu_fprintf(f, " %-8s %016" PRIx64,
                          riscv_fpr_regnames[i], env->fpr[i]);
             if ((i & 3) == 3) {
                 qemu_fprintf(f, "\n");
-- 
2.25.1


