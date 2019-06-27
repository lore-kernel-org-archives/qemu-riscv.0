Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHy-0003Tx-NO
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHh-0003JD-TD
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHe-0000Ie-3X
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHd-00078Q-M8
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:57 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so1408628pfn.5
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/utRw/o8PW3YQm+ZhJWNBeL8gDnPNYLiS6dXiDJvvqI=;
 b=fKpsDvrtIz4vKO4Vc1E4SiTSbd521mbE7IsuPiFDMDbhM5SzXX9UJNJVXNAAF0zTdV
 v2qPqxocaPpT16IXnjloCH069TsP+iYN52ZnyserbW0yAswDbMpMtiqg27ASkeP03Vdr
 n7g3YLjheuXRzvGj42ok7NDbXNfzA1UFyYsuYydjznvi2c1sF88hDUD8a8L3GFXPSpGN
 Tq9ZBJCu/rnXHGX1nLzGnDliAH5pDHoMh3OPkiBl2mHJopeueFrel1Rsr3KcsqyMnTkj
 WJ+/lnwUSlCgcEr6IHY8kzcJH9gJhY2XwhJl5zjCn8BhsoEMSsfcXPMOSoVmIVouuhHa
 8HbQ==
X-Gm-Message-State: APjAAAXICbm20TjRFVqYuWmnrDbhI4r8KbHmJLu1CZkST0wVoSueEJ/y
 Fmpvf/ktaI4tESETIICpAE1WW37CxjdAhA==
X-Google-Smtp-Source: APXvYqwqMNKPZN0oG/XToM+BO4sKOn/5VD2//Xh6ky/uOvwnVSrI8PIxKIsCGc8JOz/LwDQrOkeiGg==
X-Received: by 2002:a17:90a:634a:: with SMTP id
 v10mr6872490pjs.16.1561649058777; 
 Thu, 27 Jun 2019 08:24:18 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id p2sm5388157pfb.118.2019.06.27.08.24.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:18 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:20:00 -0700
Message-Id: <20190627152011.18686-24-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Joel Sing <joel@sing.id.au>, Palmer Dabbelt <palmer@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-riscv] [PULL 23/34] RISC-V: Clear load reservations on
 context switch and SC
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
X-List-Received-Date: Thu, 27 Jun 2019 15:26:06 -0000

From: Joel Sing <joel@sing.id.au>

This prevents a load reservation from being placed in one context/process,
then being used in another, resulting in an SC succeeding incorrectly and
breaking atomics.

Signed-off-by: Joel Sing <joel@sing.id.au>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c                      |  1 +
 target/riscv/cpu_helper.c               | 10 ++++++++++
 target/riscv/insn_trans/trans_rva.inc.c |  8 +++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 915b9e77df33..f8d07bd20ad7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -297,6 +297,7 @@ static void riscv_cpu_reset(CPUState *cs)
     env->pc = env->resetvec;
 #endif
     cs->exception_index = EXCP_NONE;
+    env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1b079e69c60..e32b6126af05 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -132,6 +132,16 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
+
+    /*
+     * Clear the load reservation - otherwise a reservation placed in one
+     * context/process can be used by another, resulting in an SC succeeding
+     * incorrectly. Version 2.2 of the ISA specification explicitly requires
+     * this behaviour, while later revisions say that the kernel "should" use
+     * an SC instruction to force the yielding of a load reservation on a
+     * preemptive context switch. As a result, do both.
+     */
+    env->load_res = -1;
 }
 
 /* get_physical_address - get the physical address for this virtual address
diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/insn_trans/trans_rva.inc.c
index f6dbbc065e15..fadd88849e2b 100644
--- a/target/riscv/insn_trans/trans_rva.inc.c
+++ b/target/riscv/insn_trans/trans_rva.inc.c
@@ -61,7 +61,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, TCGMemOp mop)
 
     gen_set_label(l1);
     /*
-     * Address comparion failure.  However, we still need to
+     * Address comparison failure.  However, we still need to
      * provide the memory barrier implied by AQ/RL.
      */
     tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
@@ -69,6 +69,12 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, TCGMemOp mop)
     gen_set_gpr(a->rd, dat);
 
     gen_set_label(l2);
+    /*
+     * Clear the load reservation, since an SC must fail if there is
+     * an SC to any address, in between an LR and SC pair.
+     */
+    tcg_gen_movi_tl(load_res, -1);
+
     tcg_temp_free(dat);
     tcg_temp_free(src1);
     tcg_temp_free(src2);
-- 
2.21.0


