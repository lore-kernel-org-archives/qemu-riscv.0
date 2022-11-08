Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osOBV-0006aC-O3
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 07:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBP-0006XT-Iy
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:29 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBD-0005pO-SJ
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:26 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso15349539fac.11
 for <qemu-riscv@nongnu.org>; Tue, 08 Nov 2022 04:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=I0fQvR35NsBac/lA5tB9dg7ivIGVXG/70tNbsPHc459HqX4D6Uz1+gjUX7JM5wvbuz
 SorCh1LHylLoRNjgHtCVYasAEaZkGBfv/rEaBqZU2IWXR/tHCoGbxD9Z70pMXEa5rrna
 /NLEOLbXrgQRaq5BciETJf59KE6PwbYDvJHDOSg0EMRLXS20IVNHHVai0So/CbObWqxu
 FFTCWNPgMgf2yehyUZbm8zECIRR1lVlLxpmdhLVPcASIQJwINAoh3K3S/ArWSMiuBqXs
 o0usyWyVfrZm23TfvYhFPSPndtGm5Jhjpb+na4XLp0HIRvDL16C2ug/0X+zgpOaD84xT
 Fg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=mY96h8zXAsR2bGZEKearINsu3ZXZHwYRDOSgSlhdQsRSHAFxiqgtLkPBEsu5QAPrkS
 4ZR3FbJAd4TKivtoLLwEOMa20OYPRr8/yYmUPcEA3+qVMQqczjaonRyUW3TZWhTiVGiO
 qLk9R1yJYVKin4ehxNcSLR/kJ6saPHPrqs1f+yfdVxFzDSFefKWrgaWhJtzTJZ/EBSci
 8WvH7huPRhP82wLpxwneokygZv6RgOSAIL+oN3jrIApmTtSeZojFXGvpPEj+W+Vte3OG
 5XBqiWbbaurhhnIk/5P4mpp7KhBYzE5rSdi9yP6ysiwQx3xIaJPIhSN4N7AtOII3+cI+
 n7cA==
X-Gm-Message-State: ACrzQf0+BEjs3WJhblmXbSeaKKmkwm/Jn+gxdO+IBbQsvkRrX6v0TylP
 GznS3xqFs2dj+GS5iVbjzcdhBw==
X-Google-Smtp-Source: AMsMyM41Rg1WOvW6s84W2IAblnX816c2VOs+Ps4mc0GoFwlkddZeOH0A8M26q/eqH1iH/4LCNoJcfg==
X-Received: by 2002:a05:6870:b526:b0:13a:e945:dad4 with SMTP id
 v38-20020a056870b52600b0013ae945dad4mr33517421oap.12.1667912295000; 
 Tue, 08 Nov 2022 04:58:15 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:58:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 4/5] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
Date: Tue,  8 Nov 2022 18:27:02 +0530
Message-Id: <20221108125703.1463577-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 08 Nov 2022 12:58:29 -0000

The time CSR will wrap-around immediately after reaching UINT64_MAX
so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
in riscv_timer_write_timecmp().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/time_helper.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 4fb2a471a9..b654f91af9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -72,6 +72,30 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
+    /*
+     * Sstc specification says the following about timer interrupt:
+     * "A supervisor timer interrupt becomes pending - as reflected in
+     * the STIP bit in the mip and sip registers - whenever time contains
+     * a value greater than or equal to stimecmp, treating the values
+     * as unsigned integers. Writes to stimecmp are guaranteed to be
+     * reflected in STIP eventually, but not necessarily immediately.
+     * The interrupt remains posted until stimecmp becomes greater
+     * than time - typically as a result of writing stimecmp."
+     *
+     * When timecmp = UINT64_MAX, the time CSR will eventually reach
+     * timecmp value but on next timer tick the time CSR will wrap-around
+     * and become zero which is less than UINT64_MAX. Now, the timer
+     * interrupt behaves like a level triggered interrupt so it will
+     * become 1 when time = timecmp = UINT64_MAX and next timer tick
+     * it will become 0 again because time = 0 < timecmp = UINT64_MAX.
+     *
+     * Based on above, we don't re-start the QEMU timer when timecmp
+     * equals UINT64_MAX.
+     */
+    if (timecmp == UINT64_MAX) {
+        return;
+    }
+
     /* otherwise, set up the future timer interrupt */
     diff = timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
-- 
2.34.1


