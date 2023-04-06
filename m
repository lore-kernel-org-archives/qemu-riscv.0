Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTys-0001Ti-QD
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyn-0001Mq-Lm
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:05:01 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyg-0000mE-5M
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:58 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17997ccf711so43253135fac.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHPNf4kdLUhpUsUNMstnp9axE6T2pMxIcnuffMw58a4=;
 b=EdtlV3aRc5K+rHsVsm1W84z9aiAxgA70QeZFXVBf/vOa4ABM2he4S/pdqmoCnpAdKK
 TDxpabc1qAABFacHg97TjBOIxpremerN8o0uXP58dc2kbzx51mTuX/LDUaAx/gdtMAIO
 fgTnCHCPErg+DrfxbbuAmV+JQQ//KVAx7+LBn7VTQrr5lH1IlfbTzUxrXa8tOgmtYY3C
 tHUKx72eALECWZTrHOmhWC3lj5aJ5opPytMoLXVFeq8BZIJKu9dnzf28SSe/XGZKSv0A
 ejj9yQlFFJXoP1S6gSWyN78AjWQn1hXu8TRuONfEo33Ljj3j33/bRAbqNkvvml3YyTZE
 345w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHPNf4kdLUhpUsUNMstnp9axE6T2pMxIcnuffMw58a4=;
 b=RDp5V0klmtBAgY0y3nQg6an5JunQU4dxI6xEErFta/erUWuLIX+II96eo/rup7YUGw
 w0CJUA4snJZkX/zBL11QSVzfI7qV1AJIXiGDpzTEbi5I1arChsD6LvcxS8ltkC/KQN4n
 PdlJffGXSxSZY/evwuDw+gSpVEv3PAq9BIY4GHxzC7rQp/3lpvCAc212bSXqSVN5wEJw
 gysM1MKIRo3LEpGWzaH80s+qhF+17dOEO2ZCQ8BIMAWX81AnxRrnHNRutCi+FFQkBz7r
 79YMwYMW+9VahUzanyTD6Qz1LEGKDnvTKalxGdVXZFm9pqxLTzCKQPgIEGr3A+0xQ+ep
 UZtw==
X-Gm-Message-State: AAQBX9efavs/1xC2yXNmkkxxuUm/hyw1lwEblWoGDS2e8dd5Z54xPjkt
 ZV4exMNYM5dUOnHHndLb17oCng==
X-Google-Smtp-Source: AKy350ahXSaM7/GUi/ATigD7oYJpzur469Rv9JgQVNIzW+cScj5ColLyTvx9DijFWgg4Fq6xisimuQ==
X-Received: by 2002:a05:6870:c1d5:b0:180:1faa:7c1c with SMTP id
 i21-20020a056870c1d500b001801faa7c1cmr63077oad.46.1680804292295; 
 Thu, 06 Apr 2023 11:04:52 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 17/20] target/riscv: remove riscv_cpu_sync_misa_cfg()
Date: Thu,  6 Apr 2023 15:03:48 -0300
Message-Id: <20230406180351.570807-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:05:02 -0000

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 52 ----------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13ff37250e..1ecb82bb5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1141,50 +1141,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
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
@@ -1228,14 +1184,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


