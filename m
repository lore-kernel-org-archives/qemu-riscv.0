Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTfn-0006bg-5F
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfk-0006YO-95
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:08 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfi-0000jk-HQ
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id u11so4533810plg.13
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uadTkYfzo+YG9e5ucG8Z35n7LUmgfavIK4jw99rogok=;
 b=W0KLD7c8ax5uzrmzyfnaBXoR3Hs8H8/etNyx9CMgsjjsFsO4rV4G+m+rD8IAWwPGVh
 Rqw7nbMK5CkOKpdZqrFToVoAi4F+LvR9Xq7S7abhh97VhLP6NR5diP1wXecpCKSFXPDb
 b17qspUHIGbXuMgixi0vlEJUm02JdpBJz5jvQeS2pbebDs8IhMuDINevtupGRxKxnRVi
 +/zg4taOL3DkROORzGvfI2wPNjBJiPt6nCiseVLx/Fw0mx4+Or2Ep81DZZc7gohIEmWc
 J5SX1erK0/tYGpEJspId2CEBbu0wXb6UHIRF015/xNI8Rhf6bUuCwpBdjhU5cIeapMTb
 vjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uadTkYfzo+YG9e5ucG8Z35n7LUmgfavIK4jw99rogok=;
 b=VtgP0JHFsHDT3eQgJmYbtGLUismtCmG4ZYaJ43r3tPyjG7i44eqMMXyLcKlEz+/rUl
 lKpyNNmlM64xQMjLAz/CHY6PkOb/qQYMT2Z8exOCr/TeYlJhI58VFvLOHGGxtkOPXqzN
 cEcN7vb6DwKpSy+9bk9bOIN1l7kZPKRdoJQizMc7bjU3sw5igYBNm7aPFcBlxxD5K0pq
 +HShNXMzEcjH0uMDgwrMR4aPPpeNDROp3AvGl4KmtBeEGaQ7R/NUYOmY6ZuqrIWwuSCS
 vBFGI5rckHSVruoDFU2iNdzvQNtwwnSopWRSxZiWG2qIwryhvM1+Nvj3d0QrUqqvsaX4
 n+ng==
X-Gm-Message-State: AOAM531XQo7oZ8rxZZgimDmh/YpEDuZ1ojvOPDro99vWbOC9LAmAjhFQ
 Cq5gisVcJ+i8ISDG6E/g4lNAxg==
X-Google-Smtp-Source: ABdhPJxBDFMywqJksyhJulaQg7hflgzAJz8vLqeFDFRiBSGSWc2lSR8aaqo76q6VKXQ9vSlTXziaAw==
X-Received: by 2002:a17:902:bb90:b029:df:bdbb:be99 with SMTP id
 m16-20020a170902bb90b02900dfbdbbbe99mr1224441pls.52.1614309605203; 
 Thu, 25 Feb 2021 19:20:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 08/75] target/riscv: rvv-1.0: add vcsr register
Date: Fri, 26 Feb 2021 11:17:52 +0800
Message-Id: <20210226031902.23656-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:20:08 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 73e88c2a7b1..03a26fa680c 100644
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
index 5152bb84261..f70b67cce3c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -327,6 +327,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
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
+        return -RISCV_EXCP_ILLEGAL_INST;
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
@@ -1389,6 +1409,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
     [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
     [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
     /* User Timers and Counters */
-- 
2.17.1


