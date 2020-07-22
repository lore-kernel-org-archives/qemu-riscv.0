Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAtO-0007Iy-ML
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtN-0007F4-7B
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:25 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtK-0005Lx-E3
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:24 -0400
Received: by mail-pf1-x42e.google.com with SMTP id t11so851728pfq.11
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0BTSvnm6ouC9jlpI1w689nf30Q81rAaMwIj+C2UZaE0=;
 b=nUzdYpN9SOZXZcpwHxirXodG3i6bh8MxKAgnqQuNGSyypaTAnIISxy2ViZgH6RsS4Q
 PQnYxWiiEDUhG2caVctABuy5bex6bgBoemZpq7kH8BZr74T5/cxA10/JJXrsGaJIxeJQ
 UKwtqPt9qDA2LkOMviojJaXpO/N1aqY0+/1Hy0wfd9GieVsYzCeBf9sTPTfrYVLhiWlm
 M9xrOL1Luxw6jQbAQZ+Il74vGu7G7VbMw+2utZYI9XM0eDUXuyFgZtw5lzAHdf5tGP3o
 Ji6S1qgDHMmgWUHwciKtFe2OZtC/YIcHZbugAWdKUKzeMGhIKUEOnbtVuwQFrtDqdcad
 nJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0BTSvnm6ouC9jlpI1w689nf30Q81rAaMwIj+C2UZaE0=;
 b=GtlYHbpBaautqA7ahS/6fLqpzTnzBYM9kb9GqXYDsfuIR+Iut9ADeKfsYmbTFmiFev
 3dWkdmoocjGTmSXD3liuVpSrYh6j+1zksm31X/7qOXkjfo+mcr74Ry2urp9K7+Wy0ESb
 8eN0vywf0g/9TOaqaDPuX0jAXNR1rvAYvA3g/1JH15UFpES9Gb/Wj437gG0eVVmyMKBf
 78/weB8bGq/wyIwEBIPRaQXWF5YRy5hUjRomOeVxU9ctze+CkN/FPwMmeIfXstLl9DA+
 VWGmIvJWsmBy0eH4/htWfA99vHbUlg43VhZibg3m1s0xMtlWLfCFBZkV4ZGaoAXFrhRn
 extw==
X-Gm-Message-State: AOAM530K4wXwQKROhSP2IADrmImdyx2N14Iu7mHy1mcEOlPWRrlSIVva
 lTTjclMtORy28KMjW8Z+3NBanw==
X-Google-Smtp-Source: ABdhPJzoJ3jpu2gMr23wCIGloRNrgpIsJ2+v3IOQoisBILOkqmt4IYkR95cczVCL8YIRw9y4TEz4fg==
X-Received: by 2002:a63:6dc7:: with SMTP id
 i190mr25839985pgc.304.1595409501160; 
 Wed, 22 Jul 2020 02:18:21 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:18:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 12/76] target/riscv: rvv-0.9: add vcsr register
Date: Wed, 22 Jul 2020 17:15:35 +0800
Message-Id: <20200722091641.8834-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:18:25 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5b0be0bb88..7afdd4814b 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -60,9 +60,16 @@
 #define CSR_VSTART          0x008
 #define CSR_VXSAT           0x009
 #define CSR_VXRM            0x00a
+#define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
 
+/* VCSR fields */
+#define VCSR_VXSAT_SHIFT    0
+#define VCSR_VXSAT          (0x1 << VCSR_VXSAT_SHIFT)
+#define VCSR_VXRM_SHIFT     1
+#define VCSR_VXRM           (0x3 << VCSR_VXRM_SHIFT)
+
 /* User Timers and Counters */
 #define CSR_CYCLE           0xc00
 #define CSR_TIME            0xc01
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 33c77be06e..e05acb5a24 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -252,6 +252,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_SHIFT);
+    return 0;
+}
+
+static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
+{
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
+    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return 0;
+}
+
 /* User Timers and Counters */
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1270,6 +1290,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
     [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
     [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
-- 
2.17.1


