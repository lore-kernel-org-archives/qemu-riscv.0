Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHvR-000524-Tx
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvP-000517-8s
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:46:43 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvM-0001jj-F1
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:46:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s1so4059189plg.12
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wu/at50n9I3pTMa+vYdztF1Zh1WOMhcO/j2Xurj2X5A=;
 b=m4x5S9AM8zrGrCK6S5MpVF2NdlbcK8QZzEL/DzbgV3xYnJqCR2/Ky2QwzrRO4mGbsB
 Zu2lOyacIYtMgdyFKECwrxafvCAh8ZeNVrt9uer+dJff63rJSVbn8TRpSNuyqyf5DZm+
 ImvxflCSb80+mmCDbX+W0/erWyYKKnNGKaq936w3FnMvIYDF4eiN5W2q+rw2DtZagPFi
 5x7l8h2xzdQKp41z/Gu4D6ibXi6Fa/xe76wOQ+Zo8+n1EbN7TJzyz56V8NeohHSa3FWk
 odtTTQ1Jrwh3CYtn7/2Q0plxp7ZdINsZL8r6oVTRmiflE85vRNOcuj8WYDkdzauRAl2G
 NnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wu/at50n9I3pTMa+vYdztF1Zh1WOMhcO/j2Xurj2X5A=;
 b=FbIaP1VV4lw4cRaT+irwlJHrHJVc+fSbX5qRT9cuFsxfOqPwoNMZBW3PORBIMk7HIK
 Uahehjm+Aq3wSPdtRAaIdvB9a0RatG6ynFHyPlfhSJQ28JXq6XQjLyo8Kosmr3NW6I0r
 NNi2qBTY9ELeaOTN3awzme0K20cVyFOkQ/0dUw/jqOZ/8gTHfYn+5wGC5HMfhUL23ltN
 N+33AwkJfktlhUHNJFmXrIdErL8enbolgVJnxywh5ID3n4Ugya0XzHORc9/VlnCvget0
 EdCMOsLtxHqe+RCV8I8K7/UCyE7QyU55q6hg7EKIaYvuhfHXcggYfxIbLoptkIgrGuQp
 XonA==
X-Gm-Message-State: AOAM531VxAPF9hqZr8Doevq8Qn+q7YrvZBy3siHCavWV+kKsqfnFcqJV
 ZIYn6eT8G66WzEPCofBh5VWMHQ==
X-Google-Smtp-Source: ABdhPJw0D6uShXEJ4DPSf2ut/a9nnuED6L20rNR2PoaxYD41s/AgCRG3Nx7cLeozqrXFT61+jVBITA==
X-Received: by 2002:a17:902:e984:b0:13f:17c2:8f0a with SMTP id
 f4-20020a170902e98400b0013f17c28f0amr9789041plb.74.1634283999055; 
 Fri, 15 Oct 2021 00:46:39 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:38 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 01/78] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
Date: Fri, 15 Oct 2021 15:45:02 +0800
Message-Id: <20211015074627.3957162-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:46:43 -0000

From: Frank Chang <frank.chang@sifive.com>

TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
commit: c445593, but other TB_FLAGS bits for rvv and rvh were
not shift as well so these bits may overlap with each other when
rvv is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h       | 14 +++++++-------
 target/riscv/translate.c |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d70f63ddfe6..d63a08b6e4c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -380,7 +380,6 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_MMU_MASK   7
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
@@ -389,13 +388,14 @@ typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+FIELD(TB_FLAGS, MEM_IDX, 0, 3)
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
+FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, SEW, 6, 3)
+FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+FIELD(TB_FLAGS, HLSX, 10, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f23bc919c08..a7a66cf9db1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -544,7 +544,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
-    ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
+    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-- 
2.25.1


