Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2b0-0000Mg-SO
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2az-0000Hr-KH
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:02:05 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2av-0003sh-92
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:02:04 -0400
Received: by mail-il1-x131.google.com with SMTP id h7so2229844ila.5
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lxv6IGzqjjzjN1C+1x2BdZrVLXQ9a8kJbiDfeO21NKI=;
 b=ALqd+kMn/Q5fSm2z30xZ7AzAwjZFaL5Ui2MVPs8PTOHdqyKoMLpI90RxMOfqAxgoG/
 PaE1aYzEYjxLD7QsnlGLz8+ZuhBT+HqsnVvbAq/8JAIsmDEDffIlNnhXER+vCVqGQQu6
 bNEZOl4kr7SCOaPJYN23eXmBAn0HR73P04c8NdyHGLRU6dlQKjvbYWWdAt2qbWS45tSZ
 8Q4WrGYmYYA3mxuZTFCsxC1L5qZOSqHL0zNsNgjuu6M47Ev+LzRHT/rTRE2TR1da9Smd
 R94pMX21JlxI4PMGU3/15FbdhN1ZgCru9BziGuzMoLWNXuUOTNN8iHHWbxRzYbbJQ7Fn
 gy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lxv6IGzqjjzjN1C+1x2BdZrVLXQ9a8kJbiDfeO21NKI=;
 b=APrKuUIyug4L9yg+jKYGIy7pYVG0b4Zy5j/o/JiLwMSA8y6mtKAuZIzbrzvC1JJ8xg
 KI+loO6AC166LsSr2VFPS+76JFV506BegNm0wDE2NtAJMm+8COK87pb4FROGQg9H/coY
 T+mTlwsuEFV3LkaHWIlcHjGkKmp6HUVFdcKQvy9n2X37ry6Le0PxCcNcGRmtTZKY+uWZ
 NyobflT23jTlFqpqN1CP6DME5oI/RufSIRNAN5EDk87nRknDRE7BgRkSsxpFcEBou0e6
 Sn2mfXyoz1K5bKRpIar//4uYZ9gHhQorJFjFKR2L29aG3BKRZVtSHT+FkGsSkyxeiMUh
 XgOQ==
X-Gm-Message-State: AAQBX9d46nddg1CWqz20Y1zuazYLp3jlUdQfFNVViuZwpPywV+w8rJEo
 xVgo0j1shQWAdeu7qG3ne7ioJukxdF1zshnT844=
X-Google-Smtp-Source: AKy350YbzyZyaOOZALiHdGIL7lbVJuyOu5f4ZJnKKMm1uZyv6uFW+l+j5XekjzQkloSogJfY2osSxQ==
X-Received: by 2002:a17:90b:1e4f:b0:23f:4dfd:4fc1 with SMTP id
 pi15-20020a17090b1e4f00b0023f4dfd4fc1mr6425249pjb.43.1679741672055; 
 Sat, 25 Mar 2023 03:54:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 01/25] target/riscv: Extract virt enabled state from tb
 flags
Date: Sat, 25 Mar 2023 03:54:05 -0700
Message-Id: <20230325105429.1142530-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 12:02:06 -0000

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Virt enabled state is not a constant. So we should put it into tb flags.
Thus we can use it like a constant condition at translation phase.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  2 ++
 target/riscv/translate.c  | 10 +---------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..12fe8d8546 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -650,6 +650,8 @@ FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+/* Virtual mode enabled */
+FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..9d50e7bbb6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -104,6 +104,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
+                           get_field(env->virt, VIRT_ONOFF));
     }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..880f6318aa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1156,15 +1156,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
-#if !defined(CONFIG_USER_ONLY)
-    if (riscv_has_ext(env, RVH)) {
-        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
-    } else {
-        ctx->virt_enabled = false;
-    }
-#else
-    ctx->virt_enabled = false;
-#endif
+    ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-- 
2.34.1


