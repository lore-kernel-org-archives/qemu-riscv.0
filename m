Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuEZ-0007ME-42
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEY-0007Lx-5e
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:54 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEW-0004Qw-MM
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:53 -0500
Received: by mail-oi1-x233.google.com with SMTP id c11so9485501oiw.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUJ8HI8MiTVtaRGy3i1ybf9oQwSyF1Q4b3hn/5uDxO0=;
 b=jsRoRNL0Uxrd+KCAQNTkSIkF6Gm++uJ4mLyW091d8t3zDAt08PVZXnYgkhYKqZ13bf
 0YrS3r+kZ8SwSMWmcKpxGl//J4l84s/c+g+t/CahvoLLTsDm9gDep620MQTDVKnmii27
 Smqr704fSBVev4VmDFQF5SXQom3zI5EcCeFgqEmqdE1WXhboucDL8mvLMus4vPXBQNXG
 qdzAR6tfot9pqjpRD6O20Mgg6PZJ8lFdMMmVAmWkZ0FGoX3J6UKcygYsaKV/JsX9rPRh
 5mGYBBdJe5Ozfwmmpv2DR2ujIVhVTNY6yCFi+QKqNeMkISBxhWcfk39JojQUcEpmxzM3
 sDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUJ8HI8MiTVtaRGy3i1ybf9oQwSyF1Q4b3hn/5uDxO0=;
 b=nGgfekzllLDiAOgYMdufQatXGEMXruEwCa7g6PuNDCZ6ErkD1limLmytq/f+pz1wNU
 S+cbEMhcimXiIVsjyf5KMbw2Qac9AOcBSMthfEy6qX7IP8HN06b28kLlGwneICwHh1cE
 zb6SF7i1pdWbEZ/yTY5yDhmOPsESOIQV96zSPIFggPq+Djw/Vg0CLV+N7XLJr5rpzDvI
 g9EqqDWxalPGqWKWpugXLhaOjuknKGpwN1QfmIWzm1nrsP99gZJQ8DKrmfDbNXc1YG6a
 C3AAHWgTTFSRwo+/p08uGavyp/OTH6PtKZ8UCWjDa2lmZ874xYFM8hHN6r2pQlsZ7R6L
 BodQ==
X-Gm-Message-State: AO0yUKWg0QCaZV5Sq3BjzQd/hVkA5e0yxCQ9z3h8WFbMNYR1xctWoZ3I
 dH5gNPck5rWoCaaj5vN4xt5Hcg==
X-Google-Smtp-Source: AK7set9HOwER9V5uYQrjOrk9VjjJjPd4fvGn0qZOBICKPgBUevwKmuNQYV9ZIeb4FhH6yjTALUJu4A==
X-Received: by 2002:a05:6808:189f:b0:37f:b133:91d9 with SMTP id
 bi31-20020a056808189f00b0037fb13391d9mr4120560oib.26.1677091970133; 
 Wed, 22 Feb 2023 10:52:50 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 10/10] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Wed, 22 Feb 2023 15:52:05 -0300
Message-Id: <20230222185205.355361-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:54 -0000

The attribute is no longer used since we can retrieve all the enabled
features in the hart by using cpu->cfg instead.

Remove env->feature, riscv_feature() and riscv_set_feature(). We also
need to bump vmstate_riscv_cpu version_id and minimal_version_id since
'features' is no longer being migrated.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h     | 12 ------------
 target/riscv/machine.c |  5 ++---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fb0f2afe0d..29a12acac1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,8 +173,6 @@ struct CPUArchState {
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
 
-    uint32_t features;
-
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
@@ -525,16 +523,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
     return (env->misa_ext & ext) != 0;
 }
 
-static inline bool riscv_feature(CPURISCVState *env, int feature)
-{
-    return env->features & (1ULL << feature);
-}
-
-static inline void riscv_set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 67e9e56853..9c455931d8 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 6,
-    .minimum_version_id = 6,
+    .version_id = 7,
+    .minimum_version_id = 7,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -351,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_ext, RISCVCPU),
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
-        VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
-- 
2.39.2


