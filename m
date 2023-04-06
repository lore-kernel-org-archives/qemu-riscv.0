Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyb-0001Iq-Vs
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTya-0001DX-37
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:48 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyY-0000bw-Df
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:47 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17aeb49429eso43238767fac.6
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poHf77vQ3VNnHuESrhfohTdDZ+AufSDEZlCfhUB/J+s=;
 b=DB9m3t5LyFigP2GxpXvC5DUXVG/fa9S9QSi7bAlUrM+in9Qkci+1h9GXwOxAzIB5DE
 YYObiumr8gjBYS/swvfx73O3CmN8eTX1QJt69QK2T4mEfvCXpcsXmS3XTf+WpqYP+p/E
 zlnTteCsTbGoRPuNFnjV+lItPI/HTc8OShxtfwMQt7DosMTBqGzfpO3NMH9KNsLypz6W
 xTWlGaAvtT02jVPlMUckioGkx7MiAcA7M4IFNCWTVwZf2lq9+wyuLhF6mdYr+zpww4VX
 sI3eyABmUGIi/C6170UZTLnH1dh4SEhJ13fKQkJcOIRR/6wB5lHcJ3ba0Yqddgo5dg/F
 cKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poHf77vQ3VNnHuESrhfohTdDZ+AufSDEZlCfhUB/J+s=;
 b=nefWvQ5J8iVGpqc+nuoop1HD8U7E6sD2bkeUeSxU3tHMa0Mzn8p+vPUB1K9rr618LE
 GdPul72cGckzA+K/Aj9ZTxOTC0ahOLp98n4ws3Gawrz4n7661nuwnmbKizYzZeB0hckf
 wf2EFLwfVHtyMbO2+sUemRCEXzK2FwZnNa2P1TRertDBonP16i4zY7Wpqa7mYnUXZWup
 y70mWeiqFClveA4P6u1EEecP3A1e4KM778SrWt7VEdM4vCprG+3XAVVXjZ2/yUPtxfDy
 AaIDQknAmBXNDvDuY9QyVKosFMvzGp5N2qutoBjx1CM6dmqgk+UgERBRKIPUfUnDM+eX
 /8BA==
X-Gm-Message-State: AAQBX9fDjwqMfY7GyX5pbyz2PLn3wP9VX5poxKNcl8LuzXrxDgTTrDQD
 wag/JYXPz0HLauQfMA2KVxqluw==
X-Google-Smtp-Source: AKy350ZpbCeXu1Bm664BV6kMsdxmFsRbj4dXcVTWB2mu70x3HcCIveJA3BAfEMV75LnaKYfLdX6VxA==
X-Received: by 2002:a05:6870:3909:b0:177:a97c:ecde with SMTP id
 b9-20020a056870390900b00177a97cecdemr137065oap.22.1680804285816; 
 Thu, 06 Apr 2023 11:04:45 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 15/20] target/riscv: remove cpu->cfg.ext_j
Date: Thu,  6 Apr 2023 15:03:46 -0300
Message-Id: <20230406180351.570807-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:48 -0000

Create a new "j" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVJ. Instances of cpu->cfg.ext_j and similar are
replaced with riscv_has_ext(env, RVJ).

Remove the old "j" property and 'ext_j' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 +++---
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6291224905..3bdd6875a8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1178,7 +1178,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_v) {
         ext |= RVV;
     }
-    if (riscv_cpu_cfg(env)->ext_j) {
+    if (riscv_has_ext(env, RVJ)) {
         ext |= RVJ;
     }
 
@@ -1511,6 +1511,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVU, .enabled = true},
     {.name = "h", .description = "Hypervisor",
      .misa_bit = RVH, .enabled = true},
+    {.name = "x-j", .description = "Dynamic translated languages",
+     .misa_bit = RVJ, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1607,7 +1609,6 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
 
     DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
     DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
@@ -1648,7 +1649,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
          * We don't want to set the default riscv_cpu_extensions
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 823be82239..1aff93ba91 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_j;
     bool ext_v;
     bool ext_zba;
     bool ext_zbb;
-- 
2.39.2


