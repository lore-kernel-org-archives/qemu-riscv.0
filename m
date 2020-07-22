Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAsP-0004xE-SL
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsO-0004vI-Py
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsM-0005Bo-4a
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id a24so854553pfc.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i1IMhLtmEwzI0ohJ8p+ck1zih2vJVUWCI0+/ZO7vBRg=;
 b=kthvty+IT3I8aBtIycV2UTd7sKP+Fvu8CTyfOuI6aeZQFD0rQGOTcXvQtXpB4ldTMp
 iffn7PbC/3i1yvS/Oz0iSv8bbT207fJdPU3YeTGHT+6E2GpcbTnnbmwkacnY+7XsOUbZ
 W5F/NHNQx+QH2bTfcNeuO68Gr1V0j4TQAI9HJjn4v9yIUycq51qn8fKpooj4hDPQWVAX
 x1Hxg86CRvGQ6gXvTOskvfTu13QZ+XUt51sd1SyFK8PON5jRLS20jCyk1Gz0C4JyJrrA
 cefvcqUqWIKpLYIYx0xr8Vev6HVqlSfYhZRtRBulTfiY003PA8ag02ppZ1O8tfcEsQEo
 09HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i1IMhLtmEwzI0ohJ8p+ck1zih2vJVUWCI0+/ZO7vBRg=;
 b=Kfk3c1Up60nXHSzFRRoIbf7U5H9bfxnb/nDsHJjMyiQVUwV8mbb+oyqtNXCtasxdgw
 +B5h+fLikdWmmf8WcdhXwOxFJTb3nHOk7J6oAxm46A8hkUeSUAtwKt7JL3WNrKLpzIQh
 amSiTfJ9fNOzL5ZOA8aEnl+kZ+i2mY7cGcb/1odsUnef0X+NIzAsTs7szHCWNYpRHmhI
 W1zA03ctgpX6BqQGEslvNE4mYJ2kjb0JeWEesk0DZ33YnVJ2KXGTyjQtvvv+Za8WeuB+
 jk4eL2VYrKK1ODgEF+ivy+wYDzX/7n76L3F1zWac7zXMomVQUNJKnwaCk9KCdjGhVFc1
 TT8Q==
X-Gm-Message-State: AOAM532hvbzMwTnR0P+gxmfSfHsUnJxe+90LCXNFL5kBYe4MWBnT/Ni8
 Ox9q4sCX4VpFVw76C6EX5pnluw==
X-Google-Smtp-Source: ABdhPJz+ATs1kOgx3vP3ILX5J5OmxDZoYsCPtzJ5Z+AcOfwJReIP/NsgctxNN1RgpE89hTFpSqdT7Q==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr29458885pfb.9.1595409440822; 
 Wed, 22 Jul 2020 02:17:20 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 02/76] target/riscv: rvv-0.9: support vector 0.9
Date: Wed, 22 Jul 2020 17:15:25 +0800
Message-Id: <20200722091641.8834-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:17:25 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 24 ++++++++++++++++++------
 target/riscv/cpu.h |  2 ++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2800953e6c..641c803089 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -106,6 +106,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
+static void set_vext_version(CPURISCVState *env, int vext_ver)
+{
+    env->vext_ver = vext_ver;
+}
+
 static void set_feature(CPURISCVState *env, int feature)
 {
     env->features |= (1ULL << feature);
@@ -334,6 +339,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
+    int vext_version = VEXT_VERSION_0_09_0;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -357,6 +363,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
+    set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
@@ -448,14 +455,19 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                error_setg(errp,
-                       "Unsupported vector spec version '%s'",
-                       cpu->cfg.vext_spec);
-                return;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.9")) {
+                    vext_version = VEXT_VERSION_0_09_0;
+                } else {
+                    error_setg(errp,
+                           "Unsupported vector spec version '%s'",
+                           cpu->cfg.vext_spec);
+                    return;
+                }
             } else {
-                qemu_log("vector version is not specified\n");
-                return;
+                qemu_log("vector version is not specified, "
+                        "use the default value v0.9\n");
             }
+            set_vext_version(env, vext_version);
         }
 
         set_misa(env, RVXLEN | target_misa);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6766dcd914..378f6e82bf 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,6 +79,8 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
+#define VEXT_VERSION_0_09_0 0x00000900
+
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
-- 
2.17.1


