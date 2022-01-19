Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACrQ-0006KV-Nr
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:26:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrF-0006Ep-Gu
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:45 -0500
Received: from [2607:f8b0:4864:20::62c] (port=43925
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrD-0000NK-Rk
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:45 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d1so2505176plh.10
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHS8W2uT+lKuAo1T4KoUHZFcgN/EiO/loZqzYCyCBB0=;
 b=rXuxu8WYSdvWYbdHdm6nnCZe8ElnsIKdxe3b3wCHzkcKh6TPGtK60Hs7vYkidij+2j
 xDONoJdnFqCRtD0NuJIKPyxERlT8tVOvDqe6BLcRxGEmWIJDxt2srMLL9dirNMdCwz+d
 HjEdI3GkAiK+gJC5pguCq4vifQyCswzDFra5qGS5ESTdnTvQoqs+jFyJ5C3Yv5PChF0i
 ThbZajZi1Er5yc4bsi1G/e+BtQPrwOYYUE3JYoKYEj2jIS3e9ASsi+I0Iiyfu5pnJvc0
 M3mYKzgsBWN1Jt4hZDpM1Ft+I9PMick5wvihxldd5RPHNzj8/NlYp+7rUfJUnRR65LbZ
 Iv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHS8W2uT+lKuAo1T4KoUHZFcgN/EiO/loZqzYCyCBB0=;
 b=Z4xp3VIDusrtqawhGzYe4HT/gGAfHEvcn5+lOBjCuxkB9rmRj+3XMB8WRPIAADk+Lz
 EC5xkVdk4vdTj243lEMtvHL+bhdZYgqj0nyynLxTk3UtrhXm1CsGPfsKv0GP+oXXo92i
 Mi6ffhgVo4pHf9NC/Z36EotecdOnfyuDeSQVyV4ZJpGkwfiiLCgIBMw/suTSYMaX+oL6
 jqWEHUIlKoDdRg7WmbikyyH14XM9xH5gUjDjLHWq/HNrzkw91BwfsNeBqHwkSfkVyBmB
 AhZd8gqil59AaDlAn/KGwNKuTB4hX4+sC4qP5j0Xe481uC2TLFuV+TYIe8bwc4MwI0uV
 ZPTQ==
X-Gm-Message-State: AOAM533BjyT/gEeliBUG83A2Jx7CMAPZVjsVZH/2HqsXaXSo54Bt8KZ8
 w621vGGQYvLe12h5c0M1Y3PXwA==
X-Google-Smtp-Source: ABdhPJzLIhNivnioau3hwgSUHxEtrvFKdZ79th+yrfY5kRiC2eqsOH+NjTigxhkdEsaPmAj0T9bPqg==
X-Received: by 2002:a17:90a:8b82:: with SMTP id
 z2mr4870175pjn.146.1642606002492; 
 Wed, 19 Jan 2022 07:26:42 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:41 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 04/23] target/riscv: Improve delivery of guest external
 interrupts
Date: Wed, 19 Jan 2022 20:55:55 +0530
Message-Id: <20220119152614.27548-5-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 15:26:46 -0000

From: Anup Patel <anup.patel@wdc.com>

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d3ff1e1c78..7e60e092c8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -328,6 +328,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+       /*
+        * The guest external interrupts from an interrupt controller are
+        * delivered only when the Guest/VM is running (i.e. V=1). This means
+        * any guest external interrupt which is triggered while the Guest/VM
+        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
+        * with sluggish response to serial console input and other I/O events.
+        *
+        * To solve this, we check and inject interrupt after setting V=1.
+        */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
-- 
2.25.1


