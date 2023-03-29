Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcY-00055Q-Hp
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcX-0004yF-16
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:30:01 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcV-00019a-FQ
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:30:00 -0400
Received: by mail-oi1-x22b.google.com with SMTP id bm2so12180179oib.4
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+X5H8wqSen2nQuTYxQUmam9q3Ds0A0b+CewCRPd+rAI=;
 b=cVziLi44QwF9q2s3JplbQdPB098V7VO1w1+7tok4unDGaN6qdpt0Wtjw+2X/L3o6dI
 2oKbW1hzJgKzD0gV0RXwrrO8rFqM9VIaPHgbcVZcFAMVh7tenyhqMPPuK8mbP7ShZQAv
 vtVot2jMbSV6yoWkLAjxAlO8hsAhgTqGROCxXuQ+eQTA2NPk9rUB+1rPgboXGraT2QCJ
 u4H9ofcmFnjvYr8be2y+gDwYsK+o2j7kBEqLcjOoOBE9I1SVOjjlLyCAgsg+proMFtBQ
 g9AtLU08vB0k5fNQAEg+stuFCdY+2XPi45xWNjUSwonEZrF9kkBzZo5i/QE+H9Hsvy8v
 NEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+X5H8wqSen2nQuTYxQUmam9q3Ds0A0b+CewCRPd+rAI=;
 b=5TdNhQGSdd/v3fx0kjina1UVE/GXe7VyN1Zqt6VKbz2Aqr9o3s2aqWteXQnqVTO24B
 6wKgauslK5InQJNyIZ8c7+eJXmDF/Dxr22BaD+6SbQ3mCdduXp/P4492NXNXKBUP9RiV
 iWZ4JqcqS40GJQfyOiCDHU3VgDapEbqIeF4PDDnhP5fUZ04dZrNm9Nx23s8v2YzajQ1w
 wjvCbyECaBcEMr7Z0edXRGVkR4EJPKJThAFXR8ru65ta+Cb1u0aa4bX8/DgqKk0WQDUB
 hG38qOhOgqp5mcI7LcgBXZ2mlKL87ERlistEoc//vM20G9bNC0wyCgY+pGD4L5yVw16Q
 t7uw==
X-Gm-Message-State: AO0yUKWPTu5/1G5dTiWQKUihNYkZ9wpxhDqQAB8mV8DnUKy24ETMgM9o
 5FNsIy/2cSthgxd/e0ekcomhyg==
X-Google-Smtp-Source: AK7set/iJrIcAt93c00whz8xJAFCsXM0QcBl7KBlB4+GsWsGLd9A3vz+n38tiULoidsxPaibmKnKTw==
X-Received: by 2002:a05:6808:20aa:b0:364:5a39:ec53 with SMTP id
 s42-20020a05680820aa00b003645a39ec53mr11210189oiw.22.1680110998823; 
 Wed, 29 Mar 2023 10:29:58 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 17/20] target/riscv: remove riscv_cpu_sync_misa_cfg()
Date: Wed, 29 Mar 2023 14:29:00 -0300
Message-Id: <20230329172903.636383-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:30:01 -0000

This function was created to move the sync between cpu->cfg.ext_N bit
changes to env->misa_ext* from the validation step to an ealier step,
giving us a guarantee that we could use either cpu->cfg.ext_N or
riscv_has_ext(env,N) in the validation.

We don't have any cpu->cfg.ext_N left that has an existing MISA bit
(cfg.ext_g will be handled shortly). The function is now a no-op, simply
copying the existing values of misa_ext* back to misa_ext*.

Remove it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 52 ----------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b40a55bc8d..3eb3b7dc59 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1081,50 +1081,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
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
@@ -1168,14 +1124,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


