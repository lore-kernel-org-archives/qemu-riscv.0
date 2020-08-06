Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dR4-00017U-2J
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dR2-00014p-Um
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:44 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dR0-0007iY-MK
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:44 -0400
Received: by mail-pl1-x636.google.com with SMTP id r4so16672139pls.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r/4q3H+Q35N8lb7C4VyThnkgjoxPJ/6J8Yc4D79xI48=;
 b=XoPbHHOSOw7yFnKyTpC/3lYapo9n5myJ0ShEKDkt/3vVcop+UQISGvhm9hnBN+bPxy
 zbY791D5ie6VDB+mPUaswmTQ5dWfjvcj06X3UUxQ/sG/lU61/gCkYRzhI+2+z2mMArN2
 Mp8ZnVltOHjBvaDX9D10B1M+eWauLFnQMrXgVMZjCdlHlO3rGS/tAgO2f5RSZW0u1+CP
 zNA+mSc+3bIgtFu/JeErbyfloyVM18nfXzoksPik24A0ckhQI3kXkF8KxE5asBOdfMPM
 Xgv/T47NLw6snq+rmfwmWW8WdEiiAtYcv3gGwvSH7A6dYv2UQ37aN7XErM4WArnJthCz
 fadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r/4q3H+Q35N8lb7C4VyThnkgjoxPJ/6J8Yc4D79xI48=;
 b=kOApbLE0lGD4j/GkLrbzwuVFWPOjvNSbUHksX0pNgyIKXLwbpig27iy33K6dM0h3ja
 nLvhUoBcbtBVoBbtAtowGCyCqFQWCT2FLJG/uTvOrGJfOJgWXt5P2TSQ4T3WrECaRg6X
 ThKPNOf+lnaiH2tRt7n7JKZoRA2Vh6mVmK7SipT5MQT/QDGdTagFS2qHrG77LyAvYCIx
 +v/I23e2P1QlbZ581lmOhknlaOTeRPMLqift8W/iSXJWzIUXmp8T8sQtShgGYgvIxsnx
 rvCljTfvTx7Ah07OUaAwj0qwsqLLiY9qZ8Q7K+FGKZ/uN53lkkISyqPiZces6w5afUrT
 fDvw==
X-Gm-Message-State: AOAM532xittcKu7osEwgJehOJDk6UGanjo9rXMHW4GWuCw/JwjLvGomI
 jlAu3BTenbG3TIOIIbnxLmKZbA==
X-Google-Smtp-Source: ABdhPJznV08PgUvHXqAisvGRrU3rw7OjCIxmqZc8pby7RKp9qVCZY/vfKzHmZRxjGTkUIgVTuUOL2A==
X-Received: by 2002:a17:90b:255:: with SMTP id
 fz21mr7773213pjb.50.1596710860208; 
 Thu, 06 Aug 2020 03:47:40 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 08/71] target/riscv: rvv-1.0: add vcsr register
Date: Thu,  6 Aug 2020 18:46:05 +0800
Message-Id: <20200806104709.13235-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:45 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5b0be0bb888..7afdd4814bb 100644
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
index 34c951d5d4b..ca85a54a0f1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -251,6 +251,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
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
@@ -1269,6 +1289,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
     [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
     [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
-- 
2.17.1


