Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ufB-0001t8-Gq
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uf9-0001pU-Um
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:07 -0500
Received: from [2607:f8b0:4864:20::102b] (port=39726
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uf8-0003G3-En
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:07 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso27857325pjc.4
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1sKP19GxQSLqAfGy/1NeVArDCUFUYjdYUqW4H4z3IXU=;
 b=WKAPtxbpAzNcNaIZkV2BCzf0dC0Twh44XkhLuP+VzxnHFHuDGYygYlOjRZNLivTRmG
 MRcV1kjxP5octo4zlNPYBO1SaJa8+JNQfB/4Vmsg6GXSWoW86WJjaFR4XAmfsdWkr4Sw
 nCI6QkxxHxl2vzta4hIeN0NYGNTGS6nroeEeBzCtFR+ZBa2Qjw/XuGFjIdnUCmcY3wty
 T5eU5KTXboV3iXaafDXv+5pJcQTyMZcb0RrQp+8TNGiW3aSMmr8N8xKfYkWeRxmkSc9w
 ELaGToXsI2+2d5sbZsXnbBzKJm7CS94nULQ4LA7pilZKGI/1heXXsyhaURfLoKj2CRNv
 jA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sKP19GxQSLqAfGy/1NeVArDCUFUYjdYUqW4H4z3IXU=;
 b=yQHC1svkRhQBnKMLp9l0+5OgWrY3qjSwP6SJQPgiTQ6WeJHmOeAg7Nyx564mTyyoRy
 ignQ0MHn8xLZBztDDsjdxdvUs4PZrILnb89Q4o7jj/B+QJLMjFZYKZOU7E1axSBIec6i
 g6ZuJP5iI8jXZ2xxHC0/ib+gjtFXf/YFWIzy4tlXgL0/i4jWnxu5Z3u1UUQp8CT0Un1P
 rNDZWb9nERR6EkQWKx7KbdU47Br9b5O/UCOcmjvFNcf7pXvYdeVELrJOY/4t2ILI3gSV
 e1OsU3rApVYRHTW+AHt9p0oouMJjJxdmWVxrr6N4KZ7aKAzaEUZHqst8LkaCwmOwyIRz
 mCFA==
X-Gm-Message-State: AOAM533cFUhCccaqlPEZZBiI8KpJujm941zH9Ilv+STh/tjXaW+3QTbF
 QWXDfoDoals4vMF8sVzjscUMqA==
X-Google-Smtp-Source: ABdhPJy9gnkg5wm5CjmWpj6jSvcKp0LHiJ6Rs4E4OZYj6hTLobNv4O5h4hPByKYXamSNJJS0lM6wQw==
X-Received: by 2002:a17:90b:1e41:: with SMTP id
 pi1mr38351698pjb.151.1640867765154; 
 Thu, 30 Dec 2021 04:36:05 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:04 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Thu, 30 Dec 2021 18:05:21 +0530
Message-Id: <20211230123539.52786-6-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:36:08 -0000

From: Anup Patel <anup.patel@wdc.com>

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f4dbc766c2..9f1a4d1088 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -124,11 +124,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -434,18 +429,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6895ac138c..1bdd03731f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -344,6 +344,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
     return env->features & (1ULL << feature);
 }
 
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
-- 
2.25.1


