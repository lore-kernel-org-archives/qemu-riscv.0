Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTeu-00056j-CL
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTes-00054g-2S
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:14 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTep-0000KG-Lg
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:13 -0500
Received: by mail-pj1-x1035.google.com with SMTP id t9so5175915pjl.5
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zlFNbq4DwQdIZec/gpCc+TQqpq61iL3CEGhohVS/DuE=;
 b=ZMBYkoRKt7Uu6DB2lroHGv1zoeFQtULD2tMTPRpqOKUx/1MmPZWNsIqF4kVmBlg/Dc
 Wh1ND45HbDThLqbgBksgRHOp0v9Ll4hfD055pkCejCC03QkfqEak1s8vttamHeaO93wT
 jQ8K0zWfaCgupoxdOg5KRO9n6jqJTfqAryq0N6pHAw0ru0psuJFzO/qUpQ1Me6Vu1yzt
 qywRBDY6D/n0m+UM6YxeiK8R8W1HTpNZZ2bVhY0F5xEvLm7lk9UFFKrm/XJ5+d0Zcf5s
 odyb8KkQELuTh5sapzCY2Kan3WxVbt7+7+GH0/iZDO8UAbaC7ohEfHIaFH767xMuoCI9
 uvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zlFNbq4DwQdIZec/gpCc+TQqpq61iL3CEGhohVS/DuE=;
 b=fOfeH0cQX2qAm+xfoi4bK/l9/wiTBIgYG8mab77qIVg13uh1N89c3BgO4hxpZ74nnw
 6EY9Bh1VvZkiNZsS9bVWoHLrxUFNcGv6H71+9FSSrADOXcc9xTZzQs5ncNCA/usrfcV1
 bdmy+4cg4Ax2rfeSpAaNyQIRknPUYfkV8zKIemPtX7QDby0NBGAqJfeWpOxc69DVbT0z
 aU2zsTKWfQX0KoN7rZas6WlJ91eIgShwCl++2Mx9HtCglqxAl6H4NlzkRKsIj6hO1914
 iugZRaGcLeb+fomXsQP261/FkI9f0iNgmXcPRGha1Kw97Kc3wlf4cTLdcUzSjbEOY8hi
 YB7w==
X-Gm-Message-State: AOAM533GNWP8eZu/lZEu1ld1ajJAMKqFNoqyKkzfBtGruO6SlzUDr4wx
 WYCiswJLw0TJ2tUeH7P0t/OMdA==
X-Google-Smtp-Source: ABdhPJxDfhg8if8vMnhpdsc6e5rnusp0dxX/SZdWap4M+GTBlAPE4nJxGSjxv0jzC6Wq6+KRKlXy2A==
X-Received: by 2002:a17:902:7404:b029:e4:503b:f83d with SMTP id
 g4-20020a1709027404b02900e4503bf83dmr1180561pll.35.1614309549951; 
 Thu, 25 Feb 2021 19:19:09 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 01/75] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Fri, 26 Feb 2021 11:17:45 +0800
Message-Id: <20210226031902.23656-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 26 Feb 2021 03:19:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a342388..d95165b3acb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -379,7 +379,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int vext_version = VEXT_VERSION_0_07_1;
+    int vext_version = VEXT_VERSION_1_00_0;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
@@ -497,8 +497,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                    vext_version = VEXT_VERSION_1_00_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -506,8 +506,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                     return;
                 }
             } else {
-                qemu_log("vector verison is not specified, "
-                        "use the default value v0.7.1\n");
+                qemu_log("vector version is not specified, "
+                        "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 116b16b9362..9d911f81093 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,7 +86,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 enum {
     TRANSLATE_SUCCESS,
-- 
2.17.1


