Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKlQ-0004tS-J6
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlP-0004pt-Bv; Wed, 20 Apr 2022 20:33:39 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlN-0008L1-S4; Wed, 20 Apr 2022 20:33:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ga4-20020a17090b038400b001d4b33c74ccso2443396pjb.1; 
 Wed, 20 Apr 2022 17:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/pnhp1A4GJG7oK6uz/bK1pJd0JOqr3ziTmqekfUUDc=;
 b=i7T+xQuR1cCLH9AduNJoBmfex0badMn+W2SUVR7cARiwQqMmKe5X+bSRKGnQpnusuW
 JDBcIj+9KtxR8XilK8wAfJq009by2sQBZcZd++IaUwBusBqGXnau3moSvbtpfintppNN
 SwfBMUte2NW0FVmDCR0OX91v6iOoYrPIlj3ZfCpsidmV0KLe5MeZn/ib+b45mIIblute
 7Hj3WF1wFI9AcXrY/2FveN9LM9hvm0Mcrq2U5rhV3ufZO7fWfGOaZRqf31GLPRUPZAIe
 5UwlXdExBAJJotJk3OtrcuYKYdBRsvGGS2yJEubV03EErWWEjgkl/zaaL08ObYLCN1km
 104w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/pnhp1A4GJG7oK6uz/bK1pJd0JOqr3ziTmqekfUUDc=;
 b=IdvoysdYErcP2W1kMrePNKJbW2ofPDghVjLsGqQDxdTy9+gtOZJmbm98wHafecRFNq
 vl3OoliBwyfsHlbQJGgxHaPFRQDkzEdLU1mrK4FEcPdLA601VG5S+iorhf38OzncsVZ0
 RqoJAdlfELsEa93aLPht6ly0tS7x/5ggQ/73i8MGo8E/QJRng1uuCrqiZSGugPXmxZgT
 5qWJ9Cx1trmDufKTjw8ygMQN+Szalhw6l8QDu1IZ3mOlUobZkW6rly3qyK6k64l91vEN
 i5fKqMkCJevHmv8AYZa64cbNPTGFtWZ2AVZuFKpAZJd9R3W6XVUMun78KJWdNx3jBWU7
 4/PQ==
X-Gm-Message-State: AOAM530xe66jUCElDdzLd/OPzgZ7WF6BedxrRZRRuHHNnCzZwry4hCQG
 ansIjY4zF24GWIoxfGJne4Q=
X-Google-Smtp-Source: ABdhPJzaop1L3rgvA45CD61PD1pZCrNAjCTxVNc0Qq6K4pucO8Eue0uOITryWpyS038lmCJ721M8Gg==
X-Received: by 2002:a17:90a:7e97:b0:1d2:7bcb:ee78 with SMTP id
 j23-20020a17090a7e9700b001d27bcbee78mr7455398pjl.40.1650501216282; 
 Wed, 20 Apr 2022 17:33:36 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 2/6] target/riscv: cpu: Add a config option for native debug
Date: Thu, 21 Apr 2022 08:33:20 +0800
Message-Id: <20220421003324.1134983-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:39 -0000

From: Bin Meng <bin.meng@windriver.com>

Add a config option to enable support for native M-mode debug.
This is disabled by default and can be enabled with 'debug=true'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v2)

Changes in v2:
- change the config option to 'disabled' by default

 target/riscv/cpu.h | 4 +++-
 target/riscv/cpu.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 39a9ff17d3..62e53e3653 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,7 +79,8 @@ enum {
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA,
-    RISCV_FEATURE_AIA
+    RISCV_FEATURE_AIA,
+    RISCV_FEATURE_DEBUG
 };
 
 /* Privileged specification version */
@@ -405,6 +406,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool aia;
+    bool debug;
     uint64_t resetvec;
 };
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8919928f4f..477961b619 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -548,6 +548,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_AIA);
     }
 
+    if (cpu->cfg.debug) {
+        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -795,6 +799,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


