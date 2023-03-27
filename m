Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmCQ-0000U4-5u
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCO-0000J0-La
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:44 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCM-00039R-W9
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:44 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17aceccdcf6so9086755fac.9
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2VVvJozrKwcizVRNwPco566fLw5fVqjzs3N7kh8V3g=;
 b=CkW7BwzzGNMGTC6g/6jcFkdG1E4AWQeuRvJokYQvT8O/SAYxbW3Oyf6c23+Jj/DxpJ
 02F7aluPoWWxviIIFjtpZhQx2NFJCLe8j55k/JD2RiZHwDrfPqnIVkOWpqR6NNi10LNG
 nJWgl4niUaekxDBwHSBHguFzojU5jP45nSBT/QMZhwiTml7de4TmmYvI8cbSbDfHMHuy
 TdXTJYMC7lQcEeZ90YPhfCODXVIA8bRQuUaMcIqlSbDSaSYabpdDMIaFhgNTl5El3eZe
 iNogn1U+yLMLwqkd2U0A4lfpyW1CXpjC03+cjLiqHde7Rtgzxg17jbCYYa32rMOsEoPR
 hPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q2VVvJozrKwcizVRNwPco566fLw5fVqjzs3N7kh8V3g=;
 b=imCxPxAv3GJqzdZzjWBksgq8H6GG6OLmBrR/nQwW5a7sxMwGPt0mshK9634oUwvTPr
 cWI9BiCNvhkfW4zGaJ4bTLC/YCyvkC9Ar/CLDsQQKHnyiSUGARoQ851J8fn3A0rikvcH
 1Uff3nzVMH7q81KpODhuyd1+K3gYWcjE0he8EoH+wko+AWH1ovRJJU4Lz0uoZlbpWrZE
 nwrAcNM4r4CF9kSMgc7St7F4iZo4w6mznILVFHbW0WEDyNcUfK9P5vMlDkzTdf7EIgWF
 olvqUZo8Ug/MrO4dZFpAG1Q4R2wg6o8nqqSP30FRiHxpf9PR5JGobWelo3x0PHi6OoeB
 KdNw==
X-Gm-Message-State: AAQBX9fRNceaPGiadE6CCBHfuKGGdw/7Aafv0L5Dq/ULYj67LGR6YEID
 yPeq7ypVgY413tiWPQVXhJKo4w==
X-Google-Smtp-Source: AK7set8zWmeqOvAFlpY5Z13XlbNsh8PRfEbtDmWnC1W2db+8xpl+7S9FofuMtsdEPLkvmVH7u7ZrXQ==
X-Received: by 2002:a05:6870:e40d:b0:169:dcba:1ec9 with SMTP id
 n13-20020a056870e40d00b00169dcba1ec9mr8666586oag.41.1679921021761; 
 Mon, 27 Mar 2023 05:43:41 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 16/19] target/riscv: remove riscv_cpu_sync_misa_cfg()
Date: Mon, 27 Mar 2023 09:42:44 -0300
Message-Id: <20230327124247.106595-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:44 -0000

This function was created to move the sync between cpu->cfg.ext_N bit
changes to env->misa_ext* from the validation step to an ealier step,
giving us a guarantee that we could use either cpu->cfg.ext_N or
riscv_has_ext(env,N) in the validation.

We don't have any cpu->cfg.ext_N left that has an existing MISA bit
(cfg.ext_g will be handled shortly). The function is now a no-op, simply
copying the existing values of misa_ext* back to misa_ext*.

Remove it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 52 ----------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 025d1f6258..81c8e0d541 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1082,50 +1082,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 #endif
 }
 
-static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
-{
-    uint32_t ext = 0;
-
-    if (riscv_has_ext(env, RVI)) {
-        ext |= RVI;
-    }
-    if (riscv_has_ext(env, RVE)) {
-        ext |= RVE;
-    }
-    if (riscv_has_ext(env, RVM)) {
-        ext |= RVM;
-    }
-    if (riscv_has_ext(env, RVA)) {
-        ext |= RVA;
-    }
-    if (riscv_has_ext(env, RVF)) {
-        ext |= RVF;
-    }
-    if (riscv_has_ext(env, RVD)) {
-        ext |= RVD;
-    }
-    if (riscv_has_ext(env, RVC)) {
-        ext |= RVC;
-    }
-    if (riscv_has_ext(env, RVS)) {
-        ext |= RVS;
-    }
-    if (riscv_has_ext(env, RVU)) {
-        ext |= RVU;
-    }
-    if (riscv_has_ext(env, RVH)) {
-        ext |= RVH;
-    }
-    if (riscv_has_ext(env, RVV)) {
-        ext |= RVV;
-    }
-    if (riscv_has_ext(env, RVJ)) {
-        ext |= RVJ;
-    }
-
-    env->misa_ext = env->misa_ext_mask = ext;
-}
-
 static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
 {
     if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
@@ -1169,14 +1125,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
-    /*
-     * We can't be sure of whether we set defaults during cpu_init()
-     * or whether the user enabled/disabled some bits via cpu->cfg
-     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
-     * use just env->misa_ext later.
-     */
-    riscv_cpu_sync_misa_cfg(env);
-
     riscv_cpu_validate_misa_priv(env, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


