Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9jo6-0000qG-2o
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jul 2022 04:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jo3-0000nv-2H
 for qemu-riscv@nongnu.org; Fri, 08 Jul 2022 04:57:47 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jo1-0004Z1-Ft
 for qemu-riscv@nongnu.org; Fri, 08 Jul 2022 04:57:46 -0400
Received: by mail-pf1-x434.google.com with SMTP id n12so23076063pfq.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Jul 2022 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PrL/oC87hd+GhzRVKVTQDW5oEqqs+15Xg9mnkDlFt0=;
 b=dMDeioEbYfMryko3uj6ttYPIFSVLSmxqCxiMviDF8JjyLiEhqLhq6cTCtMN2O4SSeX
 sOVFWKSQOXtOob8CbNcvyFdgBz6fvFpWT3GPR38ET/fGMYIoyTYz2+SEIjP4dOSXwkww
 Vy7CaTy+g8fGJ+fdL04OMV8FBvF0pBBQGFsI09zcu64JRtfED7unBnC6FggMoCM4YVpm
 pwghcfpJIrLdopu7gMi1AooPHLtXPSHeMXVO1kyrWeYiLqGLKzEYgeh3agTITEJ17qfp
 sdKmuY3A1ZrcpVbhVPxX/Tb8xammeTQ82BUpq0XywD1C/Shga4EWt34WxI0oE5iayKnv
 Cbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PrL/oC87hd+GhzRVKVTQDW5oEqqs+15Xg9mnkDlFt0=;
 b=HYEqpmN6mlnWKXG8axHjT+SQe0L8wPj8Wf9b571y1jaT2afMfg+Zg+OUqt5KNyerfg
 p3Fu8JSHZpY3daq1KH5estsXbCSwi7NTMnx4QSd/q1oMoJM6gH4/QE9EDh0Q2y6cT2TY
 Mxob6fi8tRUdAzxpWeX4RhyMCRak33SJJco5ID/ur/lUEpNxgLeAWoTSKU2mZA6KIax6
 2VEmFs9YrHR+4VIX3794BaQDDa1BFvesmZ7GlE9G3s7A57LZYvzaIlKCE2ASKvvWqZuC
 Fi1xOd8unlgrqWFwgcF7zehfG1xswjUPavRDHuPgdLrlIOIt94C7y9OUTJrNniTt9X6E
 cOBw==
X-Gm-Message-State: AJIora+1HqUoI8KyTjInyE9pjqxvDKMMUJBNzGjFevqBHhKMZg5qptn0
 u26FStJZKlVCa7IuYk3jJ4ezGg==
X-Google-Smtp-Source: AGRyM1vcv9uPnnbnlzJgmQkxKU8XSCoDmWt92ikDhCHhk6lERZiadav+KiIgSLJgda9nOL1kzPaM7w==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr2905983pfu.59.1657270663661; 
 Fri, 08 Jul 2022 01:57:43 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k27-20020aa7999b000000b0052ab5740130sm71854pfh.37.2022.07.08.01.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 01:57:43 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn,
 richard.henderson@linaro.org
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH 2/2] target/riscv: Implement dump content of vector register
Date: Fri,  8 Jul 2022 16:57:36 +0800
Message-Id: <20220708085736.94546-2-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220708085736.94546-1-kito.cheng@sifive.com>
References: <20220708085736.94546-1-kito.cheng@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=kito.cheng@sifive.com; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Fri, 08 Jul 2022 08:57:47 -0000

Implement -d cpu,vu to dump content of vector register.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/cpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1b96da7da..97b289d277 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -72,6 +72,15 @@ const char * const riscv_fpr_regnames[] = {
   "f30/ft10", "f31/ft11"
 };
 
+const char * const riscv_vr_regnames[] = {
+  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",
+  "v6",  "v7",  "v8",  "v9",  "v10", "v11",
+  "v12", "v13", "v14", "v15", "v16", "v17",
+  "v18", "v19", "v20", "v21", "v22", "v23",
+  "v24", "v25", "v26", "v27", "v28", "v29",
+  "v30", "v31"
+};
+
 static const char * const riscv_excp_names[] = {
     "misaligned_fetch",
     "fault_fetch",
@@ -375,6 +384,28 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
     }
+    if (flags & CPU_DUMP_VU) {
+        int vlen = cpu->cfg.vlen;
+        int n_chunk = vlen / 64;
+        if (vlen == 32) {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, "0x%08" PRIx64 "\n", env->vreg[i]);
+            }
+        } else {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, " %-8s ",
+                             riscv_vr_regnames[i]);
+
+                int vec_reg_offset = i * vlen / 64;
+                qemu_fprintf(f, "0x");
+                for (int j = n_chunk - 1; j >= 0; --j) {
+                    qemu_fprintf(f, "%016" PRIx64,
+                                 env->vreg[vec_reg_offset + j]);
+                }
+                qemu_fprintf(f, "\n");
+            }
+        }
+    }
 }
 
 static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.34.0


