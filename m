Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACrS-0006PJ-Az
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrL-0006IA-8m
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:54 -0500
Received: from [2607:f8b0:4864:20::1029] (port=53827
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrJ-0000OF-EL
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:50 -0500
Received: by mail-pj1-x1029.google.com with SMTP id h12so2763543pjq.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMYapyz35LyrwsEVB6cZ0wkMdm9XfLBWIUa3hy2aNGM=;
 b=135BrCfj3F7GV4Q5jEPMoizE3JMzNex+umZ47LK1X6+ArrRgs0/f3+L8ti3nkxUBRt
 R1ht5YzujaElX8qaLfcJmQkncF1gfm1n8V4HiMKCo89xtrIsXb5ieS8sqO1n3xuYu1P9
 jOzO2ivf/qSeibVbpkYCwJtMTkkM/k+ulFaev2KzbCbsyb2q4aUU9zETKWcGo7mehAok
 O+yrgGMlcz0nYvvm2ETjZUFn4Z6yfZPl1lZgr00z7n/mO5y8z9hforE9WXnPXONft0DR
 IcY3aSBzMWIk7Js2SzAgT+wdYa2uk6ZhuL5kFe2iQvrPtwwmmpFCo4/9F3LJVNcPApqt
 hgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMYapyz35LyrwsEVB6cZ0wkMdm9XfLBWIUa3hy2aNGM=;
 b=UhRf990hKG5yaYsdaniQbS5QuV50JYm7rT9TxiVXaI4Vjqepb/NMSVkodgc/ExAIpn
 3VwPc+K6536ad6XrHboYF9Ln81TshgCzgX0ZsVfzs1QVK9V57F+9tf09NGAlR6fT8qPP
 JpvsYaH7QoxIPhKhRz0J6juci3eCIDI0GHpquCB94OXjImyya6FpljzdLH808Jto38I1
 JFN/jqDOx54st/MlEg6TA22lxUQ74MEn1Y7UaUUqyku8cI0XZ62ndsXIE/bsmDjoupzA
 PCAz/3RCrI0SkvwLOQOVrfmWX4LS+/Xlsqn0aiCqJ3RKtaBsT8EFmbkP4f1L4GiSN9IO
 j3NA==
X-Gm-Message-State: AOAM533ldoxvlmw36J4aGsFgYmw8DgpyaENwO6xfV8edrenAjSVVGzqq
 hA+q+UzknykidfTSR1ssAoXhqA==
X-Google-Smtp-Source: ABdhPJzxpevEsANoX7edOhMa4phYXjZZm46NFz1yX+pBqB1okNrpoWzXJyvSHDkm8WaRWyzjjYOpkA==
X-Received: by 2002:a17:902:b688:b0:149:a1d6:c731 with SMTP id
 c8-20020a170902b68800b00149a1d6c731mr33369783pls.145.1642606007347; 
 Wed, 19 Jan 2022 07:26:47 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:46 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Wed, 19 Jan 2022 20:55:56 +0530
Message-Id: <20220119152614.27548-6-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 15:26:55 -0000

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
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0ce6cc7043..14cf9925a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -135,11 +135,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
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
@@ -479,18 +474,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index 65bc2a1468..f24b6963b0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -369,6 +369,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
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


