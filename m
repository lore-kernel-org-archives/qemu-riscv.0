Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jE3Uk-0008Ld-5u
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 00:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3Uh-0008HV-Vi
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3Ud-0003HK-Lx
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:19 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52277)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1jE3Ud-0003Be-E3
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:15 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ng8so2447477pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=tHG/U0lEWI15yHCwzFAku+uasHUSPsU9VIZR3vpSWIk=;
 b=SoVQ7qqdv1zBbiWBBeah8Su3lgoLTpGSTwj5tY+nwnkgn7UM7VPWby7CvGjqS0/At7
 0U3vMgrzgKEiQ56dNmrELxz8CHjlBQyrIJxXBwYGy2+n55KaCcXFV4ylojmsxXx4n4jh
 NJiThiioGVGddnljbIKkDBqZ4b8/blF3F2m71jmzB+/oC5/d6OSYxocid1m086QGNNHC
 erHQ9B3SSW5xnTEXdsZzRZN/201UKLju16HkEdTVUfTq3RkxFw7xwvp8szpqTq4Yd++L
 tsicO8kxV+tZ4sMpI6shVN5lC/POWnsd9Fi2ys9lCzokuEGY0M8PchO3XmB+X5L0TI1L
 QavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tHG/U0lEWI15yHCwzFAku+uasHUSPsU9VIZR3vpSWIk=;
 b=tQOwTbL4nMXtiqLcOFEToyNXKDgDZo/OkIzrKOZnPUVsZBOdDvZxCsMk9HkfLWhpWC
 sWsTjsnD2s4s08njShOmHwhtkf6Wn69iNUlNNeubOhFehEK3Pr9bQX8g6FCIUJjJTd9a
 4nxYRvj7Tdf/WgyLJEGrYTT9ancr0iH2o887CosAfKIhMjuKhEqYZpy2AI2hLU0ij1Sh
 HSU75wx1DhOgqcF+XMXsCkXBM+zfb9g4sG92x94gAOrxpKtCtWIUMRKDnlbr2dTNUH0L
 Fy9wb9r6jOcpZXHOC7O5iHkf6/KZIWMLMbtixvYrAAF57Dz/9R7qXzncEn8gSZfwL7DW
 lgYA==
X-Gm-Message-State: ANhLgQ1mPQbuUSBrFnTlcbkcv/DCXgdnaHpHFXgRnnF1aeWpLdPtASca
 14OePMSEUsxKY/K8Jv8/CImpzv2bZWjS9w==
X-Google-Smtp-Source: ADFU+vtHOYcE5y1fvjPP9DZ+f+We0PpZM9mXyEvz2mSnwmBI2fUoUY5yYOiAU7dSpvYHIbRmocd5nw==
X-Received: by 2002:a17:902:449:: with SMTP id
 67mr2350346ple.339.1584417973363; 
 Mon, 16 Mar 2020 21:06:13 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id o128sm1328213pfg.5.2020.03.16.21.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 21:06:12 -0700 (PDT)
Subject: [PULL 6/6] target/riscv: Fix VS mode interrupts forwarding.
Date: Mon, 16 Mar 2020 21:05:47 -0700
Message-Id: <20200317040547.222501-7-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200317040547.222501-1-palmerdabbelt@google.com>
References: <20200317040547.222501-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Tue, 17 Mar 2020 04:06:21 -0000

From: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>

Currently riscv_cpu_local_irq_pending is used to find out pending
interrupt and VS mode interrupts are being shifted to represent
S mode interrupts in this function. So when the cause returned by
this function is passed to riscv_cpu_do_interrupt to actually
forward the interrupt, the VS mode forwarding check does not work
as intended and interrupt is actually forwarded to hypervisor. This
patch fixes this issue.

Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5ea5d133aa..d3ba9efb02 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -46,7 +46,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     target_ulong pending = env->mip & env->mie &
                                ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
     target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
+                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
 
     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
@@ -907,6 +907,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
             if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
                 !force_hs_execp) {
+                /*
+                 * See if we need to adjust cause. Yes if its VS mode interrupt
+                 * no if hypervisor has delegated one of hs mode's interrupt
+                 */
+                if (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
+                    cause == IRQ_VS_EXT)
+                    cause = cause - 1;
                 /* Trap to VS mode */
             } else if (riscv_cpu_virt_enabled(env)) {
                 /* Trap into HS mode, from virt */
-- 
2.25.1.481.gfbce0eb801-goog


