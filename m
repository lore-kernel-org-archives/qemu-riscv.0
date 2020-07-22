Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAsI-0004mt-Eg
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsG-0004kV-Vu
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:16 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsF-0005BG-B1
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x9so656710plr.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lIAWnZ0kGmaPMXxXhAaDX7KeOlS4ElOBc/y5+NIu9jI=;
 b=fAl+4JmGLef92i5d7ZnmTLeloBTWFijxEAC/C05KRKBEJAQ5wZfZ7vBwsnp6x6gRLI
 aRpZMFtfc5X62ppaaJxwsQONDTX8mWEuYrrnaFGG4lmCuNHsuBZekdlOsblPcGlB4yIu
 1jredABBfPh2Ba94IG1pfugvTmmd1QQ8PhlS/WuE4prA5GTggEBPnX2+TlektnqSM/Hn
 52AR/CQe8oKJv2EdVnmRSHBu6xTiB64rndRUxhye3VVAensIfsQ+Fp8qyF3UMgoogs4I
 q7GLBHgw4th1jDOuGRFRqnD+RSaRKTG81BJmo1q1qRIqsUTpJUnxHouDByxtHWp7gtY3
 pWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lIAWnZ0kGmaPMXxXhAaDX7KeOlS4ElOBc/y5+NIu9jI=;
 b=lTLdf5Shndy0Q75WMX8YM1DXp6VfxVpkEebffpOB54WSZwtLkbk0l+h3BaGPGK88r4
 805Vep37UssMfzUBk1IOIUkJIs8F11AqHxuuv1ctofuMf9bDqFl+YzKRHr2FovqJXhEr
 SILURofekm5JkHuvXWlSvpFQcPGaTBlcXxfEZD3ovVn72Q3NCTV+t/hFfCwA1UiPl8Hy
 F2Ypiwp1jhi6ZfaN+cv9Cgtzaqw7ni9NMbSI8HufjLfOCPAV/UTHH6EvoIF9qa6z85l+
 eEFokNsD8gmEL3UbBYBoUmo4nfw4iXEZr0YkvRQu8a2MR/ogO+N94jQS07JDrRJIjoor
 c4Aw==
X-Gm-Message-State: AOAM5314UkrwbKAGPhKtypG7tVHqOCv5118O8XuNeXWHTz942wtrllBi
 djVU4e7bHkTAbVzM5uCoRi6XpQ==
X-Google-Smtp-Source: ABdhPJyElK+jTC6uT3yuXXlo0UodDCf+khJgxVo2b1iKT1siY25JKg5zkJHj6zkC5d0TOXe3NES1Vg==
X-Received: by 2002:a17:902:b185:: with SMTP id
 s5mr26253436plr.211.1595409434101; 
 Wed, 22 Jul 2020 02:17:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 01/76] target/riscv: drop vector 0.7.1 support
Date: Wed, 22 Jul 2020 17:15:24 +0800
Message-Id: <20200722091641.8834-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:17:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 24 ++++++------------------
 target/riscv/cpu.h |  2 --
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bdb5d..2800953e6c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -106,11 +106,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 static void set_feature(CPURISCVState *env, int feature)
 {
     env->features |= (1ULL << feature);
@@ -339,7 +334,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -363,7 +357,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
-    set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
@@ -455,19 +448,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
-                } else {
-                    error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                    return;
-                }
+                error_setg(errp,
+                       "Unsupported vector spec version '%s'",
+                       cpu->cfg.vext_spec);
+                return;
             } else {
-                qemu_log("vector verison is not specified, "
-                        "use the default value v0.7.1\n");
+                qemu_log("vector version is not specified\n");
+                return;
             }
-            set_vext_version(env, vext_version);
         }
 
         set_misa(env, RVXLEN | target_misa);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eef20ca6e5..6766dcd914 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,8 +79,6 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
-
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
-- 
2.17.1


