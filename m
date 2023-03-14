Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7sE-0008Jx-Nd
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rw-00072I-IW
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rr-00037h-2F
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:22 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-176b90e14a9so17978485fac.9
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkB0vzqH+m6CKp6htpyofVNxkBL9rh1LR/W7819esvg=;
 b=ZLvosooEoS3DJpnQztGPBWtBHJCwE8HhEwrErmdxyenSCt7tJkF58d0VWmcYR2QDWL
 hOPMRKn6Og5S9nZVP3k6dWDNa1co51YQK04Zlr99jghOJe8mnzJSG+LGM6+mUyewXVGO
 hUU90DCzaW5/4n8G87UTQYGLOsAzys34Ow/9hBjSql8JL1EaiJhYh/EIUEVFClvVsM5L
 MscVRHh5ugJekII4cW4114dsLeAtZFsR8FEysRd5J9mv/3A50iczuq4lUl/BdOSNADgO
 uo6ic4UeIFr9sXwVe6/0rfWEJahWoQwplaonJ9qmcbqY7O7RBTxTYvH95LJtO7IDLjEF
 xGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkB0vzqH+m6CKp6htpyofVNxkBL9rh1LR/W7819esvg=;
 b=BKF8iVJ7JoZMWyLTpS0+YHY7eE4rL5H8dx9sIy28lErDiErDIcORx5Cl/Wwhqmd0hi
 rl3BMljcPe0dMVPZfMrh+m1QnHtNMoK/zvJn9TuViX+ZOEGpA3lWIc8aDU84UDzesjgf
 wKxo+PY+cQYQ/t5iK5hRX5RLMyyvW+VRlIWY+7+7JRiMRxk28TJIP6ID6onGd0uCIxw1
 mT6znXgnHqGdvLHyrrTG3H8erVwpbL08gQO4rgOZHwaPd9XXr+9hDTPNe0XB1j5XX7rr
 G6A3w54z9KZfoGkU90y61ZTumTU1kWkEJ2lvJTVYJxXuYvs4j+fITnc9E6yI17BHLmy0
 OGHA==
X-Gm-Message-State: AO0yUKUs59/xEcQtGtnJZORCuWYNF+e7jOO9IeFnIQCTvtvdB37PDV7+
 c73Y3NKPyBv1dV6Yl3lydEpNSw==
X-Google-Smtp-Source: AK7set+x3zGNygrJLqPJVfp6zR52y2zDSQH8ehIMyuOty1ocsKSmQ6EoSEe6lr0qGIX1GZPdmBNK4Q==
X-Received: by 2002:a05:6870:5703:b0:172:2d00:99f7 with SMTP id
 k3-20020a056870570300b001722d0099f7mr21206413oap.20.1678812674876; 
 Tue, 14 Mar 2023 09:51:14 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:51:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 26/26] target/riscv: update cpu->cfg misa bits in
 commit_cpu_cfg()
Date: Tue, 14 Mar 2023 13:49:48 -0300
Message-Id: <20230314164948.539135-27-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:51:27 -0000

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
index 4789a7b70d..059931daea 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1225,8 +1225,20 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
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
@@ -1385,7 +1397,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index 6f26e7dbcd..0da0ffdaed 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1387,7 +1387,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
@@ -1395,7 +1395,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* flush translation cache */
     tb_flush(env_cpu(env));
-    env->misa_ext = val;
     env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


