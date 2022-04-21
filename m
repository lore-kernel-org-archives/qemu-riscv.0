Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKld-00058u-Gq
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlZ-0004zh-CC; Wed, 20 Apr 2022 20:33:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlX-0008NH-WF; Wed, 20 Apr 2022 20:33:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id 2so3484098pjw.2;
 Wed, 20 Apr 2022 17:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArTHn4klHalFoaByuoITqQEzLR2lLcXEBce/s25Aacs=;
 b=IXUiVY7e84MTTQ8qiyZUYBLvcIAHDLy8lcV0MRYTvGCKlzEtc+im/Elr6nLhGIEFIU
 ERw7QJMX4c8KHGSof+igDSmz6tSY8XZZLOJvflWOTguAd3NXZzO+bfp83dTJqz7D9nFL
 7pjW2haRNcA+LqaHfuPm7tzGETuJI1cDxgBSlvq4u4qvD7Xx0l5fxLuWma4x7yQ97Sbf
 0BImOMOMVM+f1ydPcwDhQ3hOaCG8KUMv2dRVa7pQLRDk9GlXEtank7jjOabYcQ8bZlAe
 g4inFJkM4WH7PsNuR9KM7L1kN0XIyzU3rL23hOdcUAUecBZPkLe2L+rLZDLg6Y7I9UdZ
 HzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArTHn4klHalFoaByuoITqQEzLR2lLcXEBce/s25Aacs=;
 b=4d/Pz81Fs0R2unhX514Ans3+ZvyHKl3Yv1QPiDsBTSFrSE9oA1k1znHknCZy6ppRNH
 tHa9FAhOLBAQVcu5Fg/pMsg82GQGRe6rtAul3MeccgV4Pk1iS3gvWg9UKIzl4Sa1t07a
 rlf0cyeG028dgzJ3ra2R99sRew4lODtdStMHZRgCViJBwxEUh9ciFChANifeAwHVJOeR
 2tPY0SQLfP0K5O8xcQXS2TBcurU0VwgweNGlxw/ZQvVZcGscKoMP6Bu4jXDEoctRCNgm
 mWwKQkvpzxTwF2KVPUfO8aYlkrR/mEECboCPulMak9Ar804j3kX67cB6D7w7IMON4bWI
 31zQ==
X-Gm-Message-State: AOAM5313NnHcJq5vnu0gHaPANa81cgB/ot+EGbAXPFf8qdisYr8VVkmW
 gA9xhgDr4rFIXAFOp2N+nyU=
X-Google-Smtp-Source: ABdhPJwOEE/oFa2XO8rD4b9ibe/ZJqM9ui7tyhaAlBqD1rFfVIsdb1o53IUXA82fhYNI6NjxLRn6JQ==
X-Received: by 2002:a17:902:8306:b0:158:ea27:307d with SMTP id
 bd6-20020a170902830600b00158ea27307dmr21714183plb.164.1650501225553; 
 Wed, 20 Apr 2022 17:33:45 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 5/6] target/riscv: cpu: Enable native debug feature
Date: Thu, 21 Apr 2022 08:33:23 +0800
Message-Id: <20220421003324.1134983-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:49 -0000

From: Bin Meng <bin.meng@windriver.com>

Turn on native debug feature by default for all CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- enable debug feature by default for all CPUs

 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 85656cdcc3..0c774056c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -803,7 +803,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


