Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf7IP-0008EK-V7
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7IO-0008EB-Ou
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:51:04 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7IN-0002Lc-3p
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:51:04 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17683b570b8so20903588fac.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2R+rQMSkEdEke1MAtmbFcS3DoytJRnqZrbo/rWklDY=;
 b=NJqzpyXsGfKIQGY29+c8PcuhbilEB87xQxba8iSwF2EuhoDAO/a6upLc7XaqHL6ZmL
 3zEiEhvubUTDJ7tO+V3ksX2w36ZijZTcJHkgdPs5Nnlh0rpnF0OkVPKEEKjWwUovz1yu
 yiNkR4fJJPgrS6Yh8jc03kTj3+b+kE3fxe4y6M6F9MxdRlkaLzR8EC6P6WTB2qlNv4/W
 FRja7d+acuSMMe/BIhoMkQIJZOB/pFRv1mGjNl9JOP/G+o+CZFDZqCueeAl7MIR8m0+E
 xgb29dx5IBv7lF1D72ujlQezspS5WWRUnS1/SckumLfE8OsZkzNWoo4nKTeDO3lqAdE3
 JEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2R+rQMSkEdEke1MAtmbFcS3DoytJRnqZrbo/rWklDY=;
 b=oyYVZShyO8qo+FOlEzNNr4Aqqx9i4wgnnP/vDFBg6PBkibBaU7PzR6v5XUhUyKL053
 kGe7RMGCUooeaOIUrDa3iJXQjYROWfgyGWjJu/FEVE3wB5Ozhlyl5KWDFmVlz3JeZp8Z
 7sngYfnfmd/Z6WwHvSw9Eq3JWDEBFteuc+uzbKAdfz1SzsllFE30FyfPx9Q1xdNj/wf7
 QwxkhVPi8xZlrCU3Taf6OXC/zOYnEXmRW5PqxjmuRhMc3Sy2jugMEcOYGwWM9brWuwgQ
 cW1c1kF+7DX0n37t3dDXlm/CDJQ1ZQnQQWPqjBEbxEwRsrDMP3t7T6nU1pKqxa7hxCaF
 U8Og==
X-Gm-Message-State: AO0yUKWz+LMJN9/TM2C829RgkI0B56pG25nBvU1bPdimNV+ddsS6XZf5
 IiPi14orjRkV3z9g0t/MX5sb5tt80LkqcqBubBo=
X-Google-Smtp-Source: AKy350ava3Qw3oh5a6QzMDjKV5HZAK66z6MEdo+1GzrbxmWBI9BW0f+duQHVQuNpnKFBSHfuch7+TQ==
X-Received: by 2002:a05:6870:9582:b0:177:af07:6842 with SMTP id
 k2-20020a056870958200b00177af076842mr864638oao.35.1679523696648; 
 Wed, 22 Mar 2023 15:21:36 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 24/25] target/riscv: update cpu->cfg misa bits in
 commit_cpu_cfg()
Date: Wed, 22 Mar 2023 19:20:03 -0300
Message-Id: <20230322222004.357013-25-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:51:05 -0000

write_misa() is able to use the same validation workflow
riscv_cpu_realize() uses. But it's still not capable of updating
cpu->cfg misa props yet.

We have no way of blocking future (and current) code from checking
env->misa_ext (via riscv_has_ext()) or reading cpu->cfg directly, so our
best alternative is to keep everything in sync.

riscv_cpu_commit_cpu_cfg() now receives an extra 'misa_ext' parameter.
If this val is different from the existing env->misa_ext, update
env->misa and cpu->cfg with the new value. riscv_cpu_realize() will
ignore this code since env->misa_ext isn't touched during validation,
but write_misa() will use it to keep cpu->cfg in sync with the new
env->misa_ext value.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++++++++--
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c |  3 +--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 41b17ba0c3..88806d1050 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1204,8 +1204,20 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
     }
 }
 
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext)
 {
+    CPURISCVState *env = &cpu->env;
+
+    /*
+     * write_misa() needs to update cpu->cfg with the new
+     * MISA bits. This is a no-op for the riscv_cpu_realize()
+     * path.
+     */
+    if (env->misa_ext != misa_ext) {
+        env->misa_ext = misa_ext;
+        riscv_set_cpucfg_with_misa(&cpu->cfg, misa_ext);
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1374,7 +1386,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, env->misa_ext);
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ca2ba6a647..befc3b8fff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -597,7 +597,7 @@ void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
                                  Error **errp);
 void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
                                    Error **errp);
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8d5e8f9ad1..839862f1a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1396,7 +1396,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
@@ -1404,7 +1404,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* flush translation cache */
     tb_flush(env_cpu(env));
-    env->misa_ext = val;
     env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


