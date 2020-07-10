Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsco-0006bg-L0
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcQ-00050b-5z
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:02 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcO-0006VN-KE
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:01 -0400
Received: by mail-pl1-x642.google.com with SMTP id o1so2109141plk.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E7bp8grnE36z+eUmiKKXYp8Qe6/62Xe1PrKPT1X4MlA=;
 b=gu4W9CQpT/oFHnjyfpnsB/4Y4nC1tba0EQdO+4lkrCrZbh2OJBl/UbvqlZj4m49h3P
 PLlU1nbahDfMMSVxGwMEuOkCFykFukwzTMfO/w7AMjHA0A4gzKDYzzR8+XXiRcSPTC68
 zaKWm0H0Z+bTbJOyfK8ozorsBAhPeIdzIlBn2ZbEfajL2cRnvYouPsTDaJXWqqt1kQ/5
 GpAUjT8O9ykCK+mnLCbRkKC9RklfrYrWDOmA7JqEN8JtbKx6KpwijwkJqaTgMzca7sD9
 zguvxfvSBRZRwuTHyauPCoPawckB9byhcsxmqNGF4ob6hpThAs1cuDPJh2644re75rr8
 PMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E7bp8grnE36z+eUmiKKXYp8Qe6/62Xe1PrKPT1X4MlA=;
 b=fLaGSvB/ZAp69HZqLfx4BaK+3BMXCfPz+CeESJ+KG7iRYVCS5MG3gIcJsn/KGymsUf
 DB4fFj75Jb4V7KsL3KC/luh2aJlFyIzwD+gXmeZNluzeITSs/rPyq4L55cIWmJ9HkElH
 aj6a37IJm1ct3PiOpY0dHJhtkqcGSDrXenpm1ST5/JHGo7Lb8dil6PulDs7qh43NPrfD
 n2vbyKt/7npyZA3sgBA8Y82AW7uV1Yz2eakblTPvBOMyK/VwAQkCZBkubaCRE/5aL2ys
 bTAC967gMBFZ9Jd/0PQ8tjYXzKIC5t5+fYPpE8sT63Dtse6VvG2agpzJbb4OqjiPdUUk
 4qOA==
X-Gm-Message-State: AOAM531LKYOjHJo5LfRl+QJwW6KbtMvBEj+7bYbStsC6kOeKEXUrXei2
 vUiLpFMx0PhdEF3Q1d8YU1XgCg==
X-Google-Smtp-Source: ABdhPJxK9OnuJTN95THgeCkudxVJwz9AhLGPttHGLpyYSoZw/zDrMnvOkcQ7Dt91qFGIdFifrz7NEw==
X-Received: by 2002:a17:90a:6509:: with SMTP id
 i9mr5107743pjj.104.1594378259373; 
 Fri, 10 Jul 2020 03:50:59 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 08/65] target/riscv: rvv-0.9: update mstatus_vs by tb_flags
Date: Fri, 10 Jul 2020 18:48:22 +0800
Message-Id: <20200710104920.13550-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x642.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:51:02 -0000
X-List-Received-Date: Fri, 10 Jul 2020 10:51:02 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h       | 2 ++
 target/riscv/translate.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0cf3fe9456..c02690ed0d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -361,6 +361,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
 #define TB_FLAGS_MMU_MASK   3
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
+#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
 typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
@@ -411,6 +412,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAGS_MSTATUS_FS;
+    flags |= TB_FLAGS_MSTATUS_VS;
 #else
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a806e33301..02b4204584 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -796,6 +796,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
+    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
-- 
2.17.1


