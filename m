Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plsH6-0000zv-Hq
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 10:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsH5-0000zK-DA
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:39 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsH3-0000Od-Uc
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-633af513162so640593b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136016; x=1683728016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MqvM9/VuHqyom9sctVAsCf+d6Lm30FMiMWZkKOlSFc=;
 b=R4sE6fwSc08VabBZRDn6Xm6J2por/S+BwvqSCByKMjVzjk9+4kpLye8nrM33s7cfvU
 v2ExlIph9nwyXwNxor8hzuHLM3ED7xjV1iLG6NkMmBTaB51+59t9x8gFGKaCUA0aEzfa
 hRf9CS9wELZTYATL+4bS6cR5wxAPUS3UTyDSwKyppar+LkTFgCU1ePedlNaFLuAr9x15
 uOTXWCSfHQwBfOMtATtbKMKc686GupuwHwIwb0YaZHBGgplS9blzqaRsH5rpbFLuPnpq
 ojEMB9Yf/+hZZugwzDPgf2zlmwg4P8lQSKCFq8cXkO0Prd+c4z2I50brOkwYq+vk9vhw
 xi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136016; x=1683728016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MqvM9/VuHqyom9sctVAsCf+d6Lm30FMiMWZkKOlSFc=;
 b=xdMiyb67YAd8B4CKQwMaHIcLIuc1XA6V9GrGVI7NBrXhi2/300cFmgVE3avHbgYsYv
 FOvc6XwLHj9P8exVITV7GmZqoURZ9pHOPMDk2Ip62LQgHeuiY3JT22sttD1xc9NLn1sg
 Bjg7KsP+dcFcnxEUEn18nbG7gMg1b6J8AE3sGWr4Rrjps2Gqhi/ODlqHl1PiDnRHkY33
 Ii/O+lWM2c/iUc8w+HbPsM7e0ymXwfn+KrP4miLUHogkDP1nrIXnA1Y7lJpMIfO19qst
 D6g7ebOW2ok1kkRk3EDIv5MMOmVnq/dsOw/NhWXqXiZqiksso4ABE7suVfAD1Xxzm83t
 5GTA==
X-Gm-Message-State: AAQBX9eZ0c/bAglwSXpzAWQ+KOHT8RxM065cL6Uh6E7QQzcxGyWWu7QI
 JF61G2oD4/R8oUOc4HyD3NSWUA==
X-Google-Smtp-Source: AKy350bjgRafbqVKZuPHbsurAy7wKhqYPymXNxvKe3m7+Tt3RD8SZx+NpBXyrqTDR3ERuYtEcN+Jtw==
X-Received: by 2002:a62:840b:0:b0:626:41b:2598 with SMTP id
 k11-20020a62840b000000b00626041b2598mr11191431pfd.26.1681136016454; 
 Mon, 10 Apr 2023 07:13:36 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:36 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 2/4] target/riscv: Add fcsr field in tb->flags
Date: Mon, 10 Apr 2023 19:43:14 +0530
Message-Id: <20230410141316.3317474-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141316.3317474-1-mchitale@ventanamicro.com>
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Apr 2023 14:13:39 -0000

The state of smstateen0.FCSR bit impacts the execution of floating point
instructions when misa.F==0. Add a field in the tb->flags which stores
the current state of smstateen0.fcsr and will be used by floating point
translation routines.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 5 +++++
 target/riscv/translate.c  | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 132cf06ff2..9c6b10d29a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -653,6 +653,7 @@ FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+FIELD(TB_FLAGS, FCSR, 27, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..1590e6e480 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -117,6 +117,11 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     if (env->cur_pmbase != 0) {
         flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
     }
+    if (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE) {
+        flags = FIELD_DP32(flags, TB_FLAGS, FCSR, 1);
+    } else {
+        flags = FIELD_DP32(flags, TB_FLAGS, FCSR, 0);
+    }
 
     *pflags = flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..4880eaeb89 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -77,6 +77,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_inst_excp;
+    bool smstateen_fcsr_ok;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
     bool hlsx;
@@ -1187,6 +1188,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
+    ctx->smstateen_fcsr_ok = FIELD_EX32(tb_flags, TB_FLAGS, FCSR);
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.34.1


