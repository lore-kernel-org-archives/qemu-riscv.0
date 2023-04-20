Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQU6-0000cY-7s
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQU4-0000UN-B6
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:44 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQU2-00074u-Mj
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:44 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-18777914805so3735514fac.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982502; x=1684574502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4Ti55fZmsYhQLe4LOvl6hR0lkFX2jcmI6dQjQEhJyU=;
 b=JUO8pvU8bWNkDBgCtZBSfbuZEnMeeHNWxlLkPa+1bx9R4HTj78PQ4WuFH+2cP4Imsr
 WPgczmG/kyjmt8VzOQuybfNnRD3yGG6IiNd4E3NIfka2H8lIoSIeTgvMhO2ojZIWidRL
 rAatdzu+HiIljayMfjU3IyvNHY3BEk42eULSqJgbNpsYgdUxWR8AZ59rqMhOxruxUnbk
 hwozWAUiUR8mukg2p8sunIyC2y4uKniIblrTNPcDh+KiHkSHJC1zSVtejQCXPzwWNuqF
 DbzVBZzUi1TEeUecidnKIXUEh+h5ZHPPD7qMHwNQ9O57fNBupmy9kQkJT3c8kF2Y++OJ
 05aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982502; x=1684574502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4Ti55fZmsYhQLe4LOvl6hR0lkFX2jcmI6dQjQEhJyU=;
 b=EYWkaJWBVOO446XPS9T8mNZ2QreudcKi61Vb4VDGl6Fyf9B+RxyAhsCwQ317yQg5uY
 sUsMczXZ+SjCo+PBUxPBf454Ti/NwZrWSNE/nRws2nFz1WCvYrfYrtpcFsm1VcV4SYq0
 N0hhoXAv6t0zBBiDzefKnLqdwxCfB2XhPOcAC6bh6YOWyV5DfaowRmU6JW6jxvNNOZ0O
 /aioqsQ+6/GcycWYdTYKvZ6iRy4uZ0m/19aoMSq9xuwfMDXgy3RJYS5wWgtwwmJCtZum
 oiNu7l5sXh+HlyJsyDUm41TQ0ittHdkK+solMgy6EDFc8VOLLrp7Dj1WbIn86gjUavvc
 T0Cg==
X-Gm-Message-State: AAQBX9eHeQjnJvUKCrzOOiwkMsCpC6+v0TwP69GAvP1Q0N915+Zp8uI+
 gcPjgei37X6VXhYQ8mf4zcjT7g==
X-Google-Smtp-Source: AKy350ZtgQ9NUAe/tU0Tj1MRbLgkEm20NcjYOp6+HDzJ7c2eDPgt0mglEx3TJYLSYvVoSh36cZqWsw==
X-Received: by 2002:aca:ba0b:0:b0:38e:295b:2e18 with SMTP id
 k11-20020acaba0b000000b0038e295b2e18mr2887084oif.4.1681982502009; 
 Thu, 20 Apr 2023 02:21:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 12/12] target/riscv: forbid write_misa() for static
 CPUs
Date: Thu, 20 Apr 2023 06:21:00 -0300
Message-Id: <20230420092100.177464-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:44 -0000

Static CPUs don't want their extensions changed by user interaction. We
can prevent it during init by not exposing user facing properties, but
write_misa() is also capable of disabling/enabling extension during
runtime.

We have a way of telling whether a CPU is static or not by checking for
TYPE_RISCV_DYNAMIC_CPU. Use it to make write_misa() a no-op for these
CPUs.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 2 ++
 target/riscv/csr.c | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4fa720a39d..3cbcf6d320 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1452,6 +1452,11 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
 
+bool riscv_cpu_is_static(RISCVCPU *cpu)
+{
+    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_DYNAMIC_CPU) == NULL;
+}
+
 typedef struct RISCVCPUMisaExtConfig {
     const char *name;
     const char *description;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1f39edc687..1913ab9d8d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -587,6 +587,8 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
+bool riscv_cpu_is_static(RISCVCPU *cpu);
+
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d449da2657..929c5477dd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1391,6 +1391,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     uint32_t orig_misa_ext = env->misa_ext;
     Error *local_err = NULL;
 
+    if (riscv_cpu_is_static(cpu)) {
+        /* never write MISA for static CPUs */
+        return RISCV_EXCP_NONE;
+    }
+
     if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
-- 
2.40.0


