Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnLt6-0002EI-CE
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 12:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsp-0001uV-5V
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 12:02:46 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsm-0007I8-Ik
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 12:02:41 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-187b51ed66fso2208785fac.6
 for <qemu-riscv@nongnu.org>; Fri, 14 Apr 2023 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681488159; x=1684080159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=perATyW0cckcJ920vv15FR2BOwASFN69Rds4SyzKxpo=;
 b=ZVS3kkcmHY+rUf+vlCpBZIeh/KN5JSWldKZZqy6bSe30eZOE/vxkh/lh0wwzO6y5mZ
 pxQrOCTGODWfth4ziIut/no6pA2WfxYt7krZ9mGLjSF1TPOsGq1Uo4u9PNRWXh/EOkih
 CkMHix0600DcuyzfYLFNJvSVm1HQRNI0RmmS3Nb2Qf+Q8900wnV11qo68GQEEt1qZggD
 Kk4vA+FrzqebZpAtux3HStLMB/LVsCPVNuhypnXlwQwjS5tIKOXdw+GKzccQYe0ZnIXY
 P//XVYOpaYqip5ovnzT7P8nqS8nakyy8GdWnYipNP5mw2mFYvdnhHZcKgLVQBl/bpNmS
 2pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488159; x=1684080159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=perATyW0cckcJ920vv15FR2BOwASFN69Rds4SyzKxpo=;
 b=GPC9Eu7XDYd6SJANMPFVPc/1/xoOBBJOQzBEEApav8AENDO1wNzRHUDmaZDLHIs+FY
 uW4QfT5vQ5M+QP9TAp3ZAwdHnQW/+1OeImiVmyJVGhVICBWGFBFNSUP4u8KIIpDTQ9xr
 OJ1z11yZSOqak23J446D9plW6RjRLJbjTmnsMV8dBUHC6Eg9Jur0GOMu285Cx5yQRqWb
 lwSIU6JI4NWyuXMSJ3Kg5klvp2RMVxgPSc9DPhw5YFQ9i/VVQnba28Yd6U2S1Q8GDIXa
 qvf9hm6hSSNJjs+fS4hvBSq5a4MTNaSntT8fWInhefYN9YMCf74obG5+fma0Lstl17Ch
 LFcw==
X-Gm-Message-State: AAQBX9e6uWbDsmqBeZA3J3OygCSm6HtEPko0kNUqD28vz8qVhQ0Oncra
 ml47dXv47buQfBYGPIt699ZUCQ==
X-Google-Smtp-Source: AKy350Zok570ce2gcX+JR60dlpe/XST38mRsKMUQHCAFhN9UrMzCvw+VwxZnYMzv7wMvgi8y7jlp1w==
X-Received: by 2002:a05:6870:f114:b0:183:cc50:f85e with SMTP id
 k20-20020a056870f11400b00183cc50f85emr3724633oac.56.1681488159271; 
 Fri, 14 Apr 2023 09:02:39 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a4a5706000000b00524fe20aee5sm1794323ooa.34.2023.04.14.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:02:39 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH v2 2/4] target/riscv: Reuse TB_FLAGS.MSTATUS_HFS_FS
Date: Fri, 14 Apr 2023 21:32:00 +0530
Message-Id: <20230414160202.1298242-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160202.1298242-1-mchitale@ventanamicro.com>
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Apr 2023 16:02:50 -0000

When misa.F is clear, TB_FLAGS.MSTATUS_HS_FS field is unused and can
be used to save the current state of smstateen0.FCSR check which is
needed by the floating point translation routines.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 12 ++++++++++++
 target/riscv/translate.c  |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 433ea529b0..fd1731cc39 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -105,6 +105,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
+    /*
+     * If misa.F is 0 then the MSTATUS_HS_FS field of the tb->flags
+     * can be used to pass the current state of the smstateen.FCSR bit
+     * which must be checked for in the floating point translation routines
+     */
+    if (!riscv_has_ext(env, RVF)) {
+        if (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE) {
+            flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, 1);
+        } else {
+            flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, 0);
+        }
+    }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0094922b6..e29bbb8b70 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -79,6 +79,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_inst_excp;
+    bool smstateen_fcsr_ok;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
     bool hlsx;
@@ -1202,6 +1203,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
+    if (has_ext(ctx, RVF)) {
+        ctx->smstateen_fcsr_ok = 1;
+    } else {
+        ctx->smstateen_fcsr_ok = FIELD_EX32(tb_flags, TB_FLAGS,
+                                             MSTATUS_HS_FS);
+    }
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.34.1


