Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z2-0007iK-9C
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yv-0007Eh-32
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:37 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yt-0007pI-5I
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:36 -0500
Received: by mail-pl1-x62e.google.com with SMTP id ky4so2000977plb.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832892;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTo+MxKNtXSvYV70HFKf6XyJ/lMPPvtHSjNjRwVe5TA=;
 b=gTuSn5exNJLNsCgd7B9e9tBVZEzWtd5rdBz+7EQkVPq9Alc/yr4G13Eyitk/9pa+bk
 ZeSt3exMUo5iyS+EXHtjmFGfQ4FNKDKCoCuscPgbdKzT9//mQ/tKr0OAVGEAVfV6/sAr
 ZBLQHcJquTi0GI2ybDW58RUDtd/wQciXXKqE/iMFiuARmMhjN3o+Q0p3J5qH2TiaFX5D
 uBpYLGvNGmb5WuEjQwvxnPzfujvQAKto+LD+TuBYn07gif6yfe1a2qPnBMUNPWPA6FLf
 DT8JU8BM+3bjOKzM7BFFXyrg+8m/trJlC0C5vFP9pm3FyGn+SbfjLtxxKxLOgIEcWXLa
 4TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832892;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTo+MxKNtXSvYV70HFKf6XyJ/lMPPvtHSjNjRwVe5TA=;
 b=PB6IhpMkGz5tMOtz8d1iHE18Uw+30sctXfoDZh20zVYDCCheQuNoWwk1TzjOtICoo3
 uY3LQMb9ad/Kjdc5rhOFAEDqBMB8LQR4Jwpij94tqN/LgtEAcwNkwHa+n+vbUJIemSGl
 N8IzLIPPJFNt8I3BTaibrNFBJqVQr+xwbkyEeRXX+1YvgLoMLlEQwbvR3wFVPQ6k1pgX
 x40YHSotks+u6xDBfcrPz+qhi/VcxB6lHQRRNNh4d2IFKIU8efo1jXAG19FHqfpDKkK3
 aVASKcdd5YJDThe6a3Z3UDIQIFkLNiHtXyXvvXtnS+3bYHoXuRT0G4wX8kTiDgrmJLsC
 W+ig==
X-Gm-Message-State: AO0yUKWtWP7zZxy5tMkt2vgjXfDMvSF9yoWySMrGLmjXgNTkYKfF71gq
 tkIUPsa0SP6hVBjZ7E92SnGMroKDz6H2vZrB
X-Google-Smtp-Source: AK7set/jso63hHfWWZFqxhIVWdYsQzWi5xSNQQJiW1pBRy6eaWMo/3QpzsxQyMEa2zSR8KshkbCpDw==
X-Received: by 2002:a17:90b:3907:b0:233:f447:1271 with SMTP id
 ob7-20020a17090b390700b00233f4471271mr758292pjb.43.1677832892481; 
 Fri, 03 Mar 2023 00:41:32 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 j14-20020a17090a2a8e00b0023739b104f8sm979750pjd.50.2023.03.03.00.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:32 -0800 (PST)
Subject: [PULL 09/59] target/riscv: remove RISCV_FEATURE_MMU
Date: Fri,  3 Mar 2023 00:36:50 -0800
Message-Id: <20230303083740.12817-10-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bmeng@tinylab.org>, 
 Andrew Jones <ajones@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:37 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
the flag directly instead.

With this change the enum is also removed. It is worth noticing that
this enum, and all the RISCV_FEATURES_* that were contained in it,
predates the existence of the cpu->cfg object. Today, using cpu->cfg is
an easier way to retrieve all the features and extensions enabled in the
hart.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-10-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 7 -------
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 4 ++--
 target/riscv/monitor.c    | 2 +-
 target/riscv/pmp.c        | 2 +-
 6 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d321ad28d2..11da920915 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -919,10 +919,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.mmu) {
-        riscv_set_feature(env, RISCV_FEATURE_MMU);
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d3f9f29f4c..ac33362525 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,13 +81,6 @@
 #define RVH RV('H')
 #define RVJ RV('J')
 
-/* S extension denotes that Supervisor mode exists, however it is possible
-   to have a core that support S mode but does not have an MMU and there
-   is currently no bit in misa to indicate whether an MMU exists or not
-   so a cpu features bitfield is required, likewise for optional PMP support */
-enum {
-    RISCV_FEATURE_MMU,
-};
 
 /* Privileged specification version */
 enum {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 57d20c605b..2b731a8c7f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -796,7 +796,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         mode = PRV_U;
     }
 
-    if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cf33494945..75a540bfcb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2621,7 +2621,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env)->mmu) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
@@ -2640,7 +2640,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
 {
     target_ulong vm, mask;
 
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env)->mmu) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 236f93b9f5..f36ddfa967 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -218,7 +218,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env)->mmu) {
         monitor_printf(mon, "S-mode MMU unavailable\n");
         return;
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 205bfbe090..a08cd95658 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -315,7 +315,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     }
 
     if (size == 0) {
-        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
+        if (riscv_cpu_cfg(env)->mmu) {
             /*
              * If size is unknown (0), assume that all bytes
              * from addr to the end of the page will be accessed.
-- 
2.39.2


