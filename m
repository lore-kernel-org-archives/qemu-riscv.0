Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPQ8-0006jt-Ky
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPs-0005h2-I9
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:01:14 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPi-0003Ib-Vl
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:01:12 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1878504c22aso17053371fac.8
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740061; x=1684332061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyptJ4c227hjyJcT2iaCzQnVJjxff8HhOsI7SdfqkhU=;
 b=hOg2bLQbdrz9NH90BQEAyfXly1NTfd9xXxLId8qfPYNjs1jMZhinhZRyL2DZtE4IKc
 WNrzQI2MagzK5j5IzSiK5GoJ6tsBi7aeo5gDHpuSQ0ZP8dEGdJja+9gKJQMtdHthwMF3
 wS4xswzqGLlDVhDy79ook2sVeZ+ClBjH6VHFneOyGan2f2QNe7JIG6Rd8Nw/QwvQ0tWY
 vSqJVzbW2Yw/XmbbAtbIYeKiehje3pf3RSqCEGKHvunNKQUD9R4hnU3ondxJhj/t3R8B
 8ogX8wgEuYxJV6cLHP1675SlprPMuyNoq17oi2F2xg+s2eVzsAi3upBY1ol1MXQGjpkn
 Cm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740061; x=1684332061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyptJ4c227hjyJcT2iaCzQnVJjxff8HhOsI7SdfqkhU=;
 b=kcrzqVJQxjrYIY5PRTME5QXDRl6n4nTJd0tmDSZU8J7rajKy5RdBZRiGW5OayWvd8G
 ZBmnBRvOBCe21yMIwZVuggfTKQxwW65OAd4bsR9JJik0Dk2JXWXBiM8F7urpVU+gZnMe
 oTxDkcF3KvYTdZ2TETGTKONVvZpkooTth+cRXBH1zVHJewCyLHNhQEiIiTE2X32bE8Rx
 cgxFcCkgnkEvGPRThx3ZIzy9bXWbjkJ+Q0XmIv51/nbpBcDQsC5jWsHVm3xIIGzC0x3b
 U9IKsjGQfVev0Vxn9YfNIluHhHLMyoryq/SPiaEUDBDaFftX7jqpM8af6GqrbSnIUXx4
 TQXw==
X-Gm-Message-State: AAQBX9e+Bpzb9hPuDgDPg7RBxmu5LiWUO1T11CLy1kVJ/glCW4+B3gF0
 bKlSskPZZ+KlJ6CtaM5WN/Q+uA==
X-Google-Smtp-Source: AKy350ZWeLv9CYD/ZYc3J1NDjayRYlCaOLSMLlKQhBwFLiDmBXFQqOL3EJx1hLe4cNfUGfaW1R5f8A==
X-Received: by 2002:a05:6870:17aa:b0:177:be5e:4532 with SMTP id
 r42-20020a05687017aa00b00177be5e4532mr10407379oae.10.1681740061271; 
 Mon, 17 Apr 2023 07:01:01 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:01:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 12/12] target/riscv: forbid write_misa() for static CPUs
Date: Mon, 17 Apr 2023 11:00:13 -0300
Message-Id: <20230417140013.58893-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 14:01:17 -0000

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
2.39.2


