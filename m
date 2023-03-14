Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7qw-0005fp-EO
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qv-0005f0-5h
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:21 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qt-0002r7-Lf
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 l16-20020a9d4c10000000b006944b17058cso8751447otf.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=fpWKw43tCsx4KsHBe1RMU0JERuP45w8ETz1ISz01xdUyFhgSDTvfQDChuX8X4wK+ks
 GJQ9qdOtWNYk+aBaUgAbwPKJEnCL70zshRZIEQvADsVwhtskqdhC4KkRnpDsALcWBGoV
 jEcEa9Fecgv+7XR5wq6RGBUA7kvNY2cDo9lXjlXy4bfSkkBcsLhZ1AIzwkQKLFElMBQ1
 u8ppMttpS8/ZynfJkEpI+PZGEkDXo5ENYPwOVzOiIqYac0Ecf3qaulGilyYW7BLHeW3I
 WVOZP7IFFJDqKgDGbVIMmUx29zjgxIxNK+ky5Tjz2AWqfM+5MovbX10a+JnOTSLD7zB3
 KhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=fp4i9KFNhTcBf8u1REvdSHqRrq5gqdg5kaL/MJH8zz5rw7cdCz5F0fCqVqYeq+PW9P
 6ERyeM4u+dg5qyNYoPuiE2COFjHV7pR3WFbQsOy/aTx2NIi34EotrhPxnWB1tPelneVN
 tZDiwTGnnjkUYjlsG9PklYkD3GwBYicXXfepWy5U00Lz4Bzamte7uQAGsi7XtwNm/b0Y
 XAhgu6BlCf95GI/moZxy0n2r8GZpMKjEF/+sFyb/+ABJgaBgSTzWUngbsa/+C4LClh52
 m35sSFzrqBRQ4JAUaG75pikWzEy2N7FD9MwR3HCSvRBfGz/8uzv0z81f3f8s60v8+1NR
 JD+w==
X-Gm-Message-State: AO0yUKXxwFt1U7afajNvGbQR5QPTCk3KIJd3MPpScvv+gFwL1quo7MLC
 tE+dYcLHpbFT0Igpxnl27IN/hBlae//r1+HNm5w=
X-Google-Smtp-Source: AK7set8/Dv5qXrwIAP4VzTz52mUuIO3F0g5vjQMfVbsVlvpmBlSM0xL1AdLXiSrGtMAB9TUdyNwwlQ==
X-Received: by 2002:a9d:6106:0:b0:693:cb03:e7e8 with SMTP id
 i6-20020a9d6106000000b00693cb03e7e8mr17098118otj.6.1678812618454; 
 Tue, 14 Mar 2023 09:50:18 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 08/26] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Date: Tue, 14 Mar 2023 13:49:30 -0300
Message-Id: <20230314164948.539135-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:21 -0000

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7458845fec..fef55d7d79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1237,12 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1250,6 +1244,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.39.2


