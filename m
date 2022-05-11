Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nonbp-00023Y-09
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 10:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbl-0001zg-1V
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:33 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbi-0001Ao-HL
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:32 -0400
Received: by mail-pf1-x431.google.com with SMTP id 204so2197398pfx.3
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Odlh7Y8iwGv1s0I3j3Ny/+JD8qBeRZdaKDHUoz/NXA8=;
 b=mSFbb0P22pT24Giufkp0x3HGTWI2I0M5Oxrz0uF5lxlHAW9gz/RU7EIvDjL49Ngz3g
 uBL7nHQhs/aA5q8+bpjW5v3fCITULZYL17RkmRHH0E0BjpHvWx3Z//SMwl/VjqrgrNeC
 4y8Ru0Ytjb47EjylI92J0Ecde69sjkY3tSxDdPFUMbgYgDyA4/jc1wyv5c/ifSpoU3AJ
 +ZC7U07GJrccFiskDWLwrl0PncP1QMETZ2eBpQ5v5UwE2SigX72mQAOJc3R+loa53gjs
 x0XQs6u4oVhP4k0iZrm/XSXFxX/pG92LRjWvhXUvc4FP4JaaJ1ZA9nHwl6CkjR/LFbk9
 jprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Odlh7Y8iwGv1s0I3j3Ny/+JD8qBeRZdaKDHUoz/NXA8=;
 b=fpBb2CkcqIXmN05rRPzH6dFNVrwaDUkHHV5Cr1HCJqxScaF6zBZCuYqUBR3KaklQK/
 ooESqGwQTQ6OO6QrQkqWfXgy3G9R6M7dTGDqO03bDJf81/rLTuMwTZYGhl4L8QyC6OZK
 FQQJfPHYKgn//uCPv0PV+vJBC34KmNReKV+I1dnCNf26ewmiYhw52+omwqddSdcInDBb
 UZVNiYfgAKTca9z5jrOz1d80MPfmkQ/uKesCXBbLEGLGUumo8nIj8ADLfJ2vSK6p57Tx
 wlWXHVpdjICB987np8+z3xFVe6FncbZ+u+c/JCqzF7bOvijPyxYeTLS+I+P80L0eqauL
 ceFw==
X-Gm-Message-State: AOAM5304KdgtsvXBDhhQnOQwWOhLAIFWQdVSa+vxHtx3J43GKtiJ7ccX
 vUGANznVVvi3pHXeGcpR4kRJGg==
X-Google-Smtp-Source: ABdhPJxXlBAlmRpS8Ogji5d5DP2JzCpdMEf3dhR/VkSISKk1gPFzo0B9LnDf4sBLtZfQDQZTuXy/Ig==
X-Received: by 2002:a05:6a00:1acd:b0:50e:1872:c680 with SMTP id
 f13-20020a056a001acd00b0050e1872c680mr25877801pfv.16.1652280388454; 
 Wed, 11 May 2022 07:46:28 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 1/8] target/riscv: Fix csr number based privilege checking
Date: Wed, 11 May 2022 20:15:21 +0530
Message-Id: <20220511144528.393530-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 11 May 2022 14:46:33 -0000

When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
the riscv_csrrw_check() function should generate virtual instruction
trap instead illegal instruction trap.

Fixes: 0a42f4c44088 (" target/riscv: Fix CSR perm checking for HS mode")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3500e07f92..2bf0a97196 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-    int effective_priv = env->priv;
+    int csr_priv, effective_priv = env->priv;
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         effective_priv++;
     }
 
-    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
+    csr_priv = get_field(csrno, 0x300);
+    if (!env->debugger && (effective_priv < csr_priv)) {
+        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-- 
2.34.1


