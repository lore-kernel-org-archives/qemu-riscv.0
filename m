Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gprzS-0007G9-LG
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 04:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprzI-000700-Hs
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:53:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprq7-0005h5-VD
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:57 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35168)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gprq5-0005RH-UQ
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:55 -0500
Received: by mail-ed1-x52c.google.com with SMTP id x30so7494528edx.2
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 01:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=5dQJ4zl+5rKPankU26RpnFJFlJ1SfResswif75QqVIo=;
	b=NAr8gWh/b68UDaNHkPU8NHdBTCiaXbkdjfSvcVbsCcCfbRkS9jMAlOPZ7jT5vvYf+y
	skcsyxHQpCMtraKsYUBC1lQuZwTKYAspq/9soqP5ptrpqxof3SzhS7s/fT/egyy/Gogn
	sMa+FMF11omZxHydrCQiU1kUudM6X22kwTqInTRgR1o/IyHuIL7EnVCUPAN9t9gN5xJB
	YB9gXhJoem4hZRaaywuwUj1ZYtHypB1gELpepTrEplgbWdmliEotzupMubnI1QCrLfZ5
	rNb2H++RfoBR07DmO0n5yfAmRoiWg4aI3ZOK/Utl1zO72xJvmfM6Hj+Iysfry6jFTcIX
	DHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=5dQJ4zl+5rKPankU26RpnFJFlJ1SfResswif75QqVIo=;
	b=GwttnE+ZVfxrbdIxHH2WBTrwrBBRpIHvuDILUcwrjYyoRiytzglqqGHGbtMWCmkAz8
	b8DhzY1kuSSgdlTkXhGJwGg3Dnb/DJlii0aGTCE7c9DEzhIl4CpVx+S3cZ66n4XMEvTd
	P05VR/eiZ3jtI1ZCkePqOaZxPuT4W7VRbIRjkpa66jG6E4sTFTH9WkovJctoU+IM3Ug3
	Cxvlu+mriDUdZXilzh0q0JRl6mF3oYwMtIsz797mLwybGfv1N69f+s4pe2HUWgSRB4FY
	7/3VXQuChkZ8ZnoFEJtyh/AfxS1MSXaEA6VA1JMfNkrf/jED3ePTaJWO891n/+b2ItP1
	rpnA==
X-Gm-Message-State: AJcUukdzsX6i8t3pXWvqaZfTPPCgWHMBMj1uDhhKpoVTRkThTD5zYca3
	M3AvFZk+HgvcouWXX86H1HFHBRWQdezy5g==
X-Google-Smtp-Source: ALg8bN7VDkzsORvvHnLyEMPK9iwBzKaACIaSM4ry77G0eOJlE6O2mGj6cUiO3uVgbmKED2TYM9t4ag==
X-Received: by 2002:a17:906:19c8:: with SMTP id
	h8mr38497898ejd.199.1549100622014; 
	Sat, 02 Feb 2019 01:43:42 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id k31sm2664776ede.5.2019.02.02.01.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 01:43:41 -0800 (PST)
Date: Sat,  2 Feb 2019 01:43:22 -0800
Message-Id: <20190202094329.22874-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190202094329.22874-1-palmer@sifive.com>
References: <20190202094329.22874-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::52c
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
X-List-Received-Date: Sat, 02 Feb 2019 09:53:27 -0000

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


