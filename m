Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscf-0006At-M1
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcU-00051i-Hr
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcT-0006WF-0k
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id u5so2380488pfn.7
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B6X3Angz3a9fADBGRD8iRciXrYqjv/GzyJKhnyt8KN0=;
 b=adlI23sr1hWB/wr7xH6KCe1dssnuRPPkXCJ8wbGLyzv37r6OG6FiupB+YVJ0AT95UA
 zdDmBwSWNCrbW0C56yYzhspgom2+QHlztcONxiFLn5GAnTbL4tIQdPJcZza9G95ttsLH
 O8KU3M/gQxHsGraptX6tIzWLliqYhwMIqVzAYpf2HQ0caPnqc2o9pw6rGOThwLFtomve
 wXRaYjsvgwHboBJFtqvFHAVk9MoS0e0WDmErUTalpeFgtY1aNuiHpZx8wlfGyJoQUuDa
 HjYJ2cid6u6UnPGMI8i7ZgHsYQDn8lcRh1UzASN68JC/ZLmpqMNKmQZrpfC3qt3eoDeb
 lvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B6X3Angz3a9fADBGRD8iRciXrYqjv/GzyJKhnyt8KN0=;
 b=jje3MyhMpGuYh/bIE72/p7Ybj5JT40O/NqxT7wPNeYiBGFOd5M62Vzr7PE9aJpE9sB
 /bTebVb8IY3cstjMYV1j9pQztAymHJY6rB5UrxWDMRSioojVfuTC0iI+E9BQvtqYlYCQ
 +YseVUlMgAMpE3AIpF88wQQ0Eb46GVwDdVJYAM8BVdf3OedoFFbSenOqU/V7VRwreCZJ
 1StjePyjQDgpaTQDxzOhR29lrlL8EEFEFWqob4nEydPU7yCQc+ES7R5CCJfe0asfzTDm
 fBKMzB+iJsyBw2YY4DCRxjbllhqvZpZC4lsy5yFF9GFbZetIZfcSEy+Ss4AhWbGc9/bb
 YmkQ==
X-Gm-Message-State: AOAM531iSCWYXgpOWrLJDARNJN439hL01iNo8Uwr+u26+eLP2GCdYnFg
 UJOegcHELi+5g90HO/nFhP4wLg==
X-Google-Smtp-Source: ABdhPJzsowJFyDhitTrHXZPVHvEhFqHZNWlBjrqKg1u+v3xXXbwEoTJIChVbLevmJLdm4wLOnzt4lA==
X-Received: by 2002:a63:5a54:: with SMTP id k20mr57031539pgm.226.1594378263794; 
 Fri, 10 Jul 2020 03:51:03 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:51:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 09/65] target/riscv: rvv-0.9: add vlenb register
Date: Fri, 10 Jul 2020 18:48:23 +0800
Message-Id: <20200710104920.13550-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:51:06 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c      | 1 +
 target/riscv/cpu.h      | 1 +
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bdb5d..871c2ddfa1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -317,6 +317,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause = 0;
     env->pc = env->resetvec;
+    env->vlenb = cpu->cfg.vlen >> 3;
 #endif
     cs->exception_index = EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c02690ed0d..81c85bf4c2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -111,6 +111,7 @@ struct CPURISCVState {
     target_ulong vl;
     target_ulong vstart;
     target_ulong vtype;
+    target_ulong vlenb;
 
     target_ulong pc;
     target_ulong load_res;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 79ae0accbc..62789e3720 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
 
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 77d371f385..6b05c631f4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -197,6 +197,12 @@ static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vlenb;
+    return 0;
+}
+
 static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vl;
@@ -1301,6 +1307,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
+    [CSR_VLENB] =               { vs,   read_vlenb                          },
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-- 
2.17.1


