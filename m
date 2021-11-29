Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX1K-00015S-He
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1J-00010N-2A
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:57 -0500
Received: from [2607:f8b0:4864:20::42a] (port=42503
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1H-0000hv-OC
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:56 -0500
Received: by mail-pf1-x42a.google.com with SMTP id u80so15302669pfc.9
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=HUDYGbFEOp0k3QCzvL8CFdoLPlDG/qgTM66gkrpKuBGJTPzHnPAzkPikmJt6TOtaAA
 60/i+uYMiST9Atv/vwI2M96D3BPatuO7AwT3IpB2fsQagq9MRkpwp0HStsGIltW9UPDz
 82Pbpm+q/X87v/0T/jE0JYPjziaptSd8rzN4aZfjhqzevELLlPinkCCzf/9fMeGEWSH/
 8qFo1gm2c1653OuLZDvWcGtMIBcF50VeefsRf5/gq/mg9UAHzQumpjhB6Y8joRA2dNWZ
 WQ5HeRgKZnGkohTdoQ6I+3bb1qzmoZg6jig5JW7q7v8rDccNAQMvvUBpaPpejbizI+FV
 hLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=0tFUUuik5T3hSyiwP7qqkStJNJFJkxE++PWgg7DjxIbaLQLElbrz1dMO7IRHdKPbFV
 72PZF4h3l9YLwUoflol5xZPtVPzLbIUg8bSCvvByHdx4IbYDqZ7GS2L1DrdBOQGyK5GH
 9r4h9dh2wtD5Ns1SHCTo0l8u+XJ5EanFOXw8edePqEjzA5wES/Vl3yeb+sZpr9+GQGYw
 f7wDn6/WniatlzEg8pNStIng8LBw2KiIZnxbegL87jAHzgcUsrHVohTo6wjv/XbeQKP0
 mcZEtR9XKqQ76fWeorcfY9gvhuoreAi70ZHEZv+UcyIw0zAH/V2TOjIkUFtwzW9++/fi
 M7nA==
X-Gm-Message-State: AOAM530swIF5Zf5kB3UZ5CHutZEdffNRJYCqbkeUKKieqoybHJoM2Uyd
 PgQpYK7ZotMvRXl1s573mt9nHA==
X-Google-Smtp-Source: ABdhPJyLCUN63QRetH9QAEQmqDWFUAoAe0pnta8wHydY6MSWaeucICUT+9rhE2N0QVlkE8SBxk60BA==
X-Received: by 2002:a63:33cc:: with SMTP id
 z195mr33468712pgz.339.1638155274613; 
 Sun, 28 Nov 2021 19:07:54 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 50/77] target/riscv: rvv-1.0: slide instructions
Date: Mon, 29 Nov 2021 11:03:10 +0800
Message-Id: <20211129030340.429689-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:07:57 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f883fdf4749..d79f59e443e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4430,17 +4430,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.25.1


