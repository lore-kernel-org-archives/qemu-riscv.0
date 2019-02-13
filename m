Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwjD-0002PD-A0
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj7-0002Iw-Dv
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj4-00075D-MM
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:33 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwj2-0006YO-Ok
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:28 -0500
Received: by mail-pf1-x435.google.com with SMTP id h1so1309738pfo.7
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=5dQJ4zl+5rKPankU26RpnFJFlJ1SfResswif75QqVIo=;
	b=nt0f/Rr7RvgJgIXP3HamAcrCX8VYsxLw0ptljY8GnGznfJQhcxuNYd5EXWLf4s+S/M
	vLs7M+wj2q16WjHFFrv+D7ufolAfP2C8uhXBNLaTC4oBPqDhssSRSV47gWjsKcgiIhiS
	/WpKgAlVm6LD8nVF3syoqkG9AG2ExJ/atFicfYXyjUZ+GyVr6w0CzALI1oYFWjBZZmuq
	h5O56EVuKDtYYrQNT/i2qJEyyexuqp2KLqqifgcc4/M98FBhkZ+HtEs6dw48zGt4+p4T
	y3DlQMxZHQZZ9Vvg4h47iiU8eFGo4pjhF8NbJxdgxxXuQd6ywDvewbu2q3RybY5h6hkc
	3tKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=5dQJ4zl+5rKPankU26RpnFJFlJ1SfResswif75QqVIo=;
	b=LGMH9hqrR+anD5mwTO8M69LtIpxVcq2vgO6wdO+6CweKBrDyOCTIQALX9gVzmzNrcU
	YksSrQXqzmDOnHc8VXj8jdS03EfuO54MMR5vtNCZqDfmeg1NjV6drDup96L89p03xH7V
	RWlqR+5jXZNdkv509QdS15taK4J7npQOa1BYkDq5qc3j8Or1nzJWXD4R8JVtjV5NwRXG
	iQEd+Vl3iPuBsPL/GUWDcE5OAiVnS9mwV6U7oakmDEx9S2354v4efmxscoFDWQUjA8nx
	zyEbMpaz8eAuiVmGDwdkvMDMOkuw0SMDkRieaAD1bKmLdFWmxcu25BRIss31YImY4BaX
	BRiw==
X-Gm-Message-State: AHQUAuab84i0dO5ZUd7cvBfzq2yGgfC+iMekGUBTQ6unFkMdXyMCnFDc
	T3bamsDuAnk2ygU7y7wuGsNx3vQcw6w=
X-Google-Smtp-Source: AHgI3IbzUJcsRolGaRCTa4g/C3e+mwml9AFmFumfP5YtB5thSPV9AqIkX36ow/QT3Aq+uK0jLfwK7Q==
X-Received: by 2002:a65:6105:: with SMTP id z5mr1077642pgu.26.1550072706902;
	Wed, 13 Feb 2019 07:45:06 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e81sm13891731pfb.65.2019.02.13.07.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:06 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:42 -0800
Message-Id: <20190213154450.14749-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: [Qemu-riscv] [PULL 03/11] RISC-V: Implement mstatus.TSR/TW/TVM
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 15:45:35 -0000

From: Michael Clark <mjc@sifive.com>

This adds the necessary minimum to support S-mode
virtualization for priv ISA >= v1.10

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Co-authored-by: Matthew Suozzo <msuozzo@google.com>
Co-authored-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c       | 17 +++++++++++++----
 target/riscv/op_helper.c | 25 +++++++++++++++++++++----
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 571414768992..390d3a9a5634 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -305,7 +305,8 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
         }
         mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
             MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
-            MSTATUS_MPP | MSTATUS_MXR;
+            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
+            MSTATUS_TW;
     }
 
     /* silenty discard mstatus.mpp writes for unsupported modes */
@@ -642,7 +643,11 @@ static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         *val = 0;
     } else if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        *val = env->satp;
+        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+            return -1;
+        } else {
+            *val = env->satp;
+        }
     } else {
         *val = env->sptbr;
     }
@@ -663,8 +668,12 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
         validate_vm(env, get_field(val, SATP_MODE)) &&
         ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
     {
-        tlb_flush(CPU(riscv_env_get_cpu(env)));
-        env->satp = val;
+        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+            return -1;
+        } else {
+            tlb_flush(CPU(riscv_env_get_cpu(env)));
+            env->satp = val;
+        }
     }
     return 0;
 }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 81bd1a77ea90..77c79ba36e0b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -82,6 +82,11 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
         do_raise_exception_err(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
     }
 
+    if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
+        get_field(env->mstatus, MSTATUS_TSR)) {
+        do_raise_exception_err(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_SPP);
     mstatus = set_field(mstatus,
@@ -125,16 +130,28 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = CPU(riscv_env_get_cpu(env));
 
-    cs->halted = 1;
-    cs->exception_index = EXCP_HLT;
-    cpu_loop_exit(cs);
+    if (env->priv == PRV_S &&
+        env->priv_ver >= PRIV_VERSION_1_10_0 &&
+        get_field(env->mstatus, MSTATUS_TW)) {
+        do_raise_exception_err(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else {
+        cs->halted = 1;
+        cs->exception_index = EXCP_HLT;
+        cpu_loop_exit(cs);
+    }
 }
 
 void helper_tlb_flush(CPURISCVState *env)
 {
     RISCVCPU *cpu = riscv_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
-    tlb_flush(cs);
+    if (env->priv == PRV_S &&
+        env->priv_ver >= PRIV_VERSION_1_10_0 &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        do_raise_exception_err(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else {
+        tlb_flush(cs);
+    }
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.18.1


