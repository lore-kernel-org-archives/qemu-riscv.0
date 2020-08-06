Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dQh-0000V0-IN
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQf-0000Qo-Kl
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:21 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQd-0007eU-OF
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:21 -0400
Received: by mail-pg1-x536.google.com with SMTP id p3so26488364pgh.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5wUgVwUxSUpO2CbZpUkYP5iB/oW0JGxOf5Pb87o0hjA=;
 b=aetSE85wRR6kmWtWt6P7o/ZnCfBkc5sIRh6yW2u6btcszt+YB8sCJUYqTjK2HYynGP
 3LGh52x3EICOVFFkC3sJxdbkFV2EtzTOVJeON1T1Mir60/OViP5JIzfAuDXh4Sd58dTC
 4iHPykjtfI+3vksAwZYbRLOdAdd4wGSoFRhLcE66mvet6l+xL7xMrPMupRKBQ67CluFw
 BMG5cOo2a0Lz0rA7DqeweDcvcH8D6I/mkTGoeuY8GWKdu7CVomiOhCEwUrNNHnN6LnJL
 OcGfdnnxZ9Uh+Z3lJh8RhlFXhebKzf/sH9YtiWyuzRSR9YCR/4FWgsnUJ7jwcNr0sm7a
 2t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5wUgVwUxSUpO2CbZpUkYP5iB/oW0JGxOf5Pb87o0hjA=;
 b=ZcJWlzPuSYlt5Ky2T4G8u6jw8NIASB89ygmsCOMNZgQvmNS2n4TfyZiLm0Y4hKS144
 +tHN/u+Iw+c26R8/AZ+t8sRq0v0vho9cwH4TPtjVWnJBpVpyMXmkV67EqC/iRDLjzQXc
 6J8OTnu8B7qypQ2q2TimTVpcsbfeU9Nn7jIeS/QJmEWfcJyuelwH0I23rtj6a2OXrC3/
 qqSKQlcJC/8V24kHPLP/folQbgEdvmygD6rrcnLf/IGFjOpKTcXNot0OOXqiR1Ytove2
 euVdwZJZB94msaGDDltqmloCoj1OwJsjoO8tGYGEunjPn5e6OQUq3goZCpeAga1T9OHp
 ummw==
X-Gm-Message-State: AOAM532P8g4ulGp3fJcNwbZZJDpnqmpJab8Q7f7WM2hmNQic2RRrSpV/
 vnSPOMub2sSSkWlMXMDHBDbSoQ==
X-Google-Smtp-Source: ABdhPJywlgAJaAqedcKKOyvip7TpvZxkZcaG0pmuAqiBbKjGXEpDzc7FzmnIZdwBwvv6sSZ1CQOEwA==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr6829653pga.142.1596710838483; 
 Thu, 06 Aug 2020 03:47:18 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:18 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 01/71] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Thu,  6 Aug 2020 18:45:58 +0800
Message-Id: <20200806104709.13235-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bdb5d6..085381fee00 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -339,7 +339,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int vext_version = VEXT_VERSION_0_07_1;
+    int vext_version = VEXT_VERSION_1_00_0;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -455,8 +455,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -464,8 +464,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index a804a5d0bab..f9ef20fe89a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,7 +79,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
-- 
2.17.1


