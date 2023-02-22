Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuEK-0007DO-R1
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEG-0007Bj-1R
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:36 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEE-0004Lq-Dx
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:35 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 e18-20020a0568301e5200b00690e6abbf3fso1920302otj.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VeZ860Xds9GWZiENsK46KSStGBncZvpBh5nY+1jAXZw=;
 b=PLRVN1wmDmPWZe+9lIe7su5o7R+hZyhGKLvGk8/54lkOLAbDwqW8ikg15sKg6PkJI/
 h13jRRAgdymp2Tye6HLLYNawj7RMd830K0aMGWaI6LyJm15xEyE/fG3ROUVcvOW8MpaQ
 bLqTan8lPxOA7fFiPW9bWhk5egOgm51i0hPHjybPIgtHPVoXXN2FCG9xcGmQ6K1yP3sl
 dyGOOCGMfShn4vovw1P8+0wVYhSR42Gr8N1C1K5lBvfD0RdxN3lt9wCB65XH8djATMH3
 UUotqXZ1H+G82hggO+17flkMaWe/r95hKaxbTmFpQHmNFe1xdeFcJUg7nnHE9OPJyeGk
 M4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VeZ860Xds9GWZiENsK46KSStGBncZvpBh5nY+1jAXZw=;
 b=o+lRgunvPjEHjYNohdFxWdwy5RGvKEToCYyYKK4WP15P7YEc1dO4swI2rMjpIaD0kY
 RQvXamw1xu0qxNR/atf/4+UP99NZmaKvSUYNZPPg46+l2c7SoKOx8NOmiF6e3Tra87c3
 gWWF5BLGea+D7OuBUeuZdBuoI2HV+KZvMqIGJ7luHSU6jCkSvLvvhYiFBhpWgody6MbQ
 T/hL3n3j2/9fy7GQ5r/OjoB0UUsuvI4YG/kfgPer5HPX+X8ZI8DB40LlJydn487KyTZP
 MOtrguDR+vLFJBea/D/PYa5Q5aN6G7iw1VTo10HwcS1ctXHbWG9QOzbHjaZdFKS8y6Hx
 iL2A==
X-Gm-Message-State: AO0yUKW83ubV0YGa9aicckgzo34UUMAPToAlm2ZnGb00bxOMuSnV8vEq
 6ceflgeio3o75H65388QpsTwQg==
X-Google-Smtp-Source: AK7set847VD/JmGIoDwfCzWl+DanA+sLZPafspgjaTChtjaNj1l/oAjTzZ1w8Nv1XsOSnnEWMfSv/w==
X-Received: by 2002:a05:6830:4387:b0:68d:5a31:af3b with SMTP id
 s7-20020a056830438700b0068d5a31af3bmr5109342otv.14.1677091953838; 
 Wed, 22 Feb 2023 10:52:33 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 05/10] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Wed, 22 Feb 2023 15:52:00 -0300
Message-Id: <20230222185205.355361-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:36 -0000

Instead of silently ignoring the EPMP setting if there is no PMP
available, error out informing the user that EPMP depends on PMP
support:

$ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
qemu-system-riscv64: Invalid configuration: EPMP requires PMP support

This will force users to pick saner options in the QEMU command line.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13e55ec5bd..aec7830c44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,13 +925,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         riscv_set_feature(env, RISCV_FEATURE_PMP);
+    }
+
+    if (cpu->cfg.epmp) {
+        riscv_set_feature(env, RISCV_FEATURE_EPMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (cpu->cfg.epmp) {
-            riscv_set_feature(env, RISCV_FEATURE_EPMP);
+        if (!cpu->cfg.pmp) {
+            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+            return;
         }
     }
 
-- 
2.39.2


