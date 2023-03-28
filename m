Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phDEo-00087U-Bk
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 13:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEn-000872-36
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 13:36:01 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEl-0005MC-KY
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 13:36:00 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17786581fe1so13493645fac.10
 for <qemu-riscv@nongnu.org>; Tue, 28 Mar 2023 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCyQ646C0mVMkPcWOjWnws2MgdEze6R0Nd3WdD81i8Q=;
 b=CsRPpSJPtUSh8tPmGpXlfmZzGO4Paz+6STdXdRuv+pnUA2UpjJ3Iv2iFYsqD7yuAP6
 Ayzj0FvL0bclfHfCDYs+vHr3gIkcrJ71CkSsLF1LztUVh5kI2QgeY5JiwA6NuEKpFohQ
 m65Pab5t0N5GxTpiKFJpIN+W0/nE+l9js3QSy4+Fq0CF8J/RBhnE5Ex0xW++chN8Jv+p
 cdhgYdcVVAAabVSrKdIjxTRNb/yXOn79U6/Ps0sEpyh9EpPo25AWL5VPbko5sQN8sAzF
 7ReIejd4jWuYaytPNTYYIJ6AAQtl+Jc8NYfJ+/s0qDMtuktvnxEObPnEz6If9sWrEI7D
 X0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCyQ646C0mVMkPcWOjWnws2MgdEze6R0Nd3WdD81i8Q=;
 b=eG2VofQHO9vdFU5rXdzprSpAKW2B7/aMNLsagZR8njVPcwr/Xn8yPKTdgZKeDcte/W
 8QcwLfMbCcQeNC/GUBS4Oqu1aTbbhG0dI+aXhOi5tgZS6IE5c7j5A+E4REXD/K+Ucpd1
 x32mOE//37kiV7INmDnwGAihDnsVzPU/xu+TmId1VGjpKhWTSZnKrw4BsAPXzcIzwje2
 GHgMDt6yFbigR4IBxpwyel3bmEmEKERWD1pzgLwSIY0IJvYPic0pRRXSgLvN/kI7XaJa
 pbXhDZQo/UCKT+vPE38pAT2Zek0q3o6bIx28RrKxwL3bRiKOStEe+PGVavBL1EQs2EMs
 W3Hg==
X-Gm-Message-State: AAQBX9f+5VrwfZH0+YCbUl+vZEdNRiOEWkyDbTd3rxw318ZVHcJMX5Mk
 WVswqZoJqadA/avTo8cM7atj5Q==
X-Google-Smtp-Source: AKy350ZfubuarN6lwqTLfWiguIVedSf10RLtT5j6FZeaLSQfUZPQgtwxbQPds7k0wEOxHURL6bMLWA==
X-Received: by 2002:a05:6870:631d:b0:177:b6ed:a154 with SMTP id
 s29-20020a056870631d00b00177b6eda154mr9981392oao.34.1680024958651; 
 Tue, 28 Mar 2023 10:35:58 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:35:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 2/9] target/riscv/cpu.c: remove set_vext_version()
Date: Tue, 28 Mar 2023 14:35:36 -0300
Message-Id: <20230328173543.431342-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328173543.431342-1-dbarboza@ventanamicro.com>
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Tue, 28 Mar 2023 17:36:01 -0000

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bd6d65365b..f59e52ae4d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -246,11 +246,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -828,7 +823,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


