Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzG9v-0002di-12
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9t-0002al-8N
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:13 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9i-0006rq-Va
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id j13so1305499pjz.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yye3Z0qR/c1js4JmmpocTyw61D0G4DW3AiWVdjc/OhI=;
 b=DpLnpRsjHJxs5eLGjKEsN6072EQPi4hMdoafE8z1BPIrqiVnd/QAN34M+xyEuBAy4U
 CIU4gqMU4scLuLAgre92l+FKn0xJuLayUgQVVngdYuA0l5OX16pqP1MA03lvqpX0EvYh
 rJeNj3Xn6aEmABD641icKFlJ5CdnLWJ/r+FadkbRwQUD+wwCmR//adjR1peBDcUe5T9a
 03ioPvhGnd3c9X+LCbCnCSBlAMS6eTVNB/XbsRjA1Os+K3WZxee6rscB/Ubn/XdiKbWH
 2sgl+NV8uJO2fbusm/oPks48tG+Q77Qh92uCOfnMPyk78EWSGv4xcOV6836UOkQ/7yJ5
 dkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yye3Z0qR/c1js4JmmpocTyw61D0G4DW3AiWVdjc/OhI=;
 b=Ks+muu2rmKNMvgf3A8FRVAhglE6L7K4xGTMPuWBHoA789AgJ2qb131LKk/VIAbz8Mp
 m/Dg7Y0C/+q0jbX+j8ROgr6UvXkjzsyIllCCDiZwZ/+zZ5ulTvv3PBJlJmi02CgHrWFz
 B9kndA/5SUo1lZFY4vIblpA9cv8jk7qyXint97Xge1BsUCpj+/7n5ZzeISt2K9m8kGma
 Ut9lSm63WuKqN1A4zoACp2crlvySnMVsapLPHld3ce+5yBF73onEMsuFkTIv7CyPff3Q
 mhC4YnDAt5oaHHgaYf4D2JnIL5moQNXYlKfGHM6gxkJn1B0LvSDeIzq65o9qrLqe+oqZ
 G/Jw==
X-Gm-Message-State: AOAM533Bb8WESarhd/FKLVYOcCKZAiSj/k7IdsGP+3A6yn+F5tH6X+ER
 WWfykB8nnZ2pfak6Z53uTUX3Xw==
X-Google-Smtp-Source: ABdhPJwLQbLaTJJZ+/OCpIQwrsyCCocs03/w3siSpzydnpRONoc9kUa6tIO7hJsEjJsyVHtxh8aI3g==
X-Received: by 2002:a17:90a:7a8e:: with SMTP id
 q14mr3727909pjf.200.1610444401342; 
 Tue, 12 Jan 2021 01:40:01 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 01/72] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Tue, 12 Jan 2021 17:38:35 +0800
Message-Id: <20210112093950.17530-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9d..49e78456422 100644
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
index 6339e848192..b0281133e09 100644
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


