Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscV-0005xv-Mq
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcH-0004vy-12
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:53 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcF-0006TN-9t
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:52 -0400
Received: by mail-pf1-x435.google.com with SMTP id i14so2368721pfu.13
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pnewDC7oACYylR6ETv6LhEgaXr44u5lu7gFfAFezVj4=;
 b=llBepXg+O/cQ1KgSc+WlRHPJEx9VwsIZEQCk20R14rnzTT9uD8+34wUCHxAxLwV/7t
 VCDTvP0WRqnu3qkwj4nwfdOVfnImWIVKiZOV5wnQ8BrBSqFCSKa07mOUuMfmcBzbyotv
 dtYL265RuAQdbZhjbY9SBaEc6+8SMLIkOnyFV3Mr9QTGG1FTEAVDj7/Q9GP03/cEN2ly
 dfHgqJE1SByi5/QqgESpUC8waZqWofbV6QQbRxmuyD6Ztuum3Z4AX/B8K/RdmWJnDD4D
 ei8gsWFPaUPxH/Nmpize4ERdi2qriqunfhsj9Gwu1T32D4ibYJoJitq2739RRaz3W/NN
 ExWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pnewDC7oACYylR6ETv6LhEgaXr44u5lu7gFfAFezVj4=;
 b=HvAEKh4m0HR/OJds+YOsSLUBkMRPCJKx2scTK14S3ADNqLYfh4/n3HO6CNf7ZHYElC
 YfnszuFjoksw126mrzvym83tTSwNslX9LQ4d9hQ9srKlmsH3d9IQTG9vrU6ZIumsn6z0
 RbDod6h6XhPU/2UR+r98zEzcqNglcoKVanDx+jY0DVfu1r9Ba318RMYRgBo7bWHLGgoA
 3vC6a1b9Y1/plLzfi+xeABG0v9CIya4XUDVfM3/0umSnmbHPjfKAcrN7jX7Q9dp+pB6s
 NBMUd0PSdT96Kc4Bnkr2J9Z1MbxDgb4ar7KLFww2skQi/jWOC/t77Q4UbK32PXTgj1CT
 6J+w==
X-Gm-Message-State: AOAM530BLCHCfBdWVwP80FuslcU+AyNFiIf7E5H3i8SWRPqVEKj7/kwq
 OxuHQygB3wD0qDXkBLp7I8qXvg==
X-Google-Smtp-Source: ABdhPJwUHUuNF8CBySI+9x6+qjtmIejJmFaaxh4u3f2TQy9SWaCTNhYNsLxd14cc07LvoAymETvD4Q==
X-Received: by 2002:a62:1407:: with SMTP id 7mr58600290pfu.88.1594378250027;
 Fri, 10 Jul 2020 03:50:50 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 06/65] target/riscv: rvv-0.9: add vcsr register
Date: Fri, 10 Jul 2020 18:48:20 +0800
Message-Id: <20200710104920.13550-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:53 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8117e8b5a7..202440e5eb 100644
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
index ac01c835e1..34ce509e64 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -238,6 +238,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
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
@@ -1255,6 +1275,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
     [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
     [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
-- 
2.17.1


