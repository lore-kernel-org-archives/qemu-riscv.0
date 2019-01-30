Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotnC-0004lw-OQ
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:36:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn7-0004hP-It
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn4-00008D-MD
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:49 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotn4-0008Qz-Ef
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:46 -0500
Received: by mail-pg1-x52c.google.com with SMTP id n2so128538pgm.3
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=5dQJ4zl+5rKPankU26RpnFJFlJ1SfResswif75QqVIo=;
	b=TpHv87u9wzTFwORoLI6ebDaHjcM226wXoCWh8CKEzVO1WClHp24bg0sBE3891XLm5L
	sWB2QHn8MPqD6tvx8Yk06gy3EeyjK+l2QsyDjqFPKNteCDTztJpn84uGxti8ASMQy1Nt
	X6+q56XL9UliqRIPYjCxJdCvClmqA51mkMpZgkJ3pSe+L07ztE5QkzgzUjRXfLQL2FUJ
	ff10ocY5e06TMvr+d7wKRxTN/DKumFIbnG9w8vZwAaAeRKMk6TI32c9QMom8q2YilMH9
	yMfZvzpBEdDCX06IhFhA7aCJ/ltTCjDb9lP1Q/BHUK7LmgG61pMvU8J2JCv0dm2ZEbeQ
	lZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=5dQJ4zl+5rKPankU26RpnFJFlJ1SfResswif75QqVIo=;
	b=Y30CrUv0mihp1NrhZ+ImEkdUaJE647m9b87lr9YXANM2Ovs6itzO+fe8VieQ18zjGJ
	wKjlXrz8H/BSZgEApf/NnkuQcIRhqrVjPTC4q2geugHBNYfsbegHPpbsmbpp0Z0VSDNV
	IVerPPIwXXJ0EtoVJyzRxrYor9bjIj4gA6aMdJAf+NbnR85ZaLFBJZLcEU4zEb5ivq7j
	4oVQ1LNX9Ij9uizxEb0mMdl6Ctt4n7svKVinjhjAtedkgye1n3UuLWYAT4CgCLISsyRT
	ToTGsoqw1MMXS68Kzql8eHbSmA2yfgnxDlSP9FXLf4z+wuZWsAwm4FdAbqvzzmixaWlQ
	O9FQ==
X-Gm-Message-State: AJcUukd1k+Yx7UaESVxT2QEcMOWp9z+fyFnKXDwCpdW139rhXeIWkBuM
	PCIR5ja1+Lb6XEhTjevBm9gkUg==
X-Google-Smtp-Source: ALg8bN6iKxMm+D9NIHE4CymkXmDv6Sju4RdwY4V8VQ7tia4Cgw+agn/Lj3J/E6zsZvXF0hUoGq/coA==
X-Received: by 2002:a62:35c7:: with SMTP id c190mr32291386pfa.76.1548869780830;
	Wed, 30 Jan 2019 09:36:20 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w128sm3562912pfw.79.2019.01.30.09.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:19 -0800 (PST)
Date: Wed, 30 Jan 2019 09:35:54 -0800
Message-Id: <20190130173601.3268-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
References: <20190130173601.3268-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52c
Subject: [Qemu-riscv] [PULL 03/10] RISC-V: Implement mstatus.TSR/TW/TVM
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:52 -0000

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


