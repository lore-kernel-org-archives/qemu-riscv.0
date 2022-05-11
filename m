Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noncD-0002eE-Dx
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 10:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1noncB-0002XI-CF
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:59 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonc9-0001G1-Oi
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id c9so2116171plh.2
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8aKYQlOfgr8kwzRZmB9IHhj7wjdwjcRTlkREKDsl0CY=;
 b=Filtk3IXaiT+bWGhkgi6gTE+KLYbyzVeOnPbq5wJC4EtZqvnaZ7+7Nz7oIeyR7fh+W
 LPYo+81K4sehGyb9XxWGRz99Sb5vNoRLidv8B6pthkaDtAmyd2aCOm1JNZvS0Wt9BI+C
 PtjzeYwBB0Me+plWOMRzLKCBbL3+4d900+mXy7iZ1yGAYVVKnFeOQnGolqldDE5uNXiP
 zt2XjFwxVnYvb7YZnlMm8IsJLBDwvRNVnu+l5sp0XAd1OhWlUHoW84ML9Prha44F4L9R
 e0IVe5RP0emlbM4HIoMmulv/sZs77EuJ9U7HrihAXDfCCf0/GD5Sa8573Z8u3Kt2jecL
 ac6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8aKYQlOfgr8kwzRZmB9IHhj7wjdwjcRTlkREKDsl0CY=;
 b=eDLq06X3OOZi7jqODmcA11svUhZs//t659hA31VUJ9SXTf5atJ28EWnwyVtwC8+ppA
 QdHueeE4oXdje4aPakkj0A3PxfmTG2+/3F7pnDkIyf1OQrEBO8Lo2N746qbYzVCJOCBc
 iBnhGLyftfr9udE9RYp0rQekadKRkAfaDuoVtbbgvYlMhSkLoW8Q9c1jrKtRTuw4Hf3U
 Oyo+h21d9tazBVk0oGOsiIQTLF5e2G79KZL63ihtZHIcpQ1PbQiHulVUIAzRqdAYwhod
 UE12LKCQOtdT8vJTskWKKWPV1Uvi6kCOlLmE3gBF+DTpoRqfm2sSYo4AiXgesSt00vqz
 vFzw==
X-Gm-Message-State: AOAM530mV6OfyCCaKOY0RaW+OHVucx0fLb6UUwd27oSFir//yt8hJcEw
 aTSvl7rN9jlneecXnQtoRLzerQ==
X-Google-Smtp-Source: ABdhPJyUYojtPApjLjgIHQ80yK2bCSIJKpzSwM02Vl8Qe/yZXfhsCentXDaswIKtsAjAk95wj/XjQA==
X-Received: by 2002:a17:90b:30c3:b0:1dc:b6d7:58d3 with SMTP id
 hi3-20020a17090b30c300b001dcb6d758d3mr5718788pjb.172.1652280416536; 
 Wed, 11 May 2022 07:46:56 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 7/8] target/riscv: Force disable extensions if priv spec
 version does not match
Date: Wed, 11 May 2022 20:15:27 +0530
Message-Id: <20220511144528.393530-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 11 May 2022 14:47:00 -0000

We should disable extensions in riscv_cpu_realize() if minimum required
priv spec version is not satisfied. This also ensures that machines with
priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
extensions.

Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
device tree")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f3b61dfd63..25a4ba3e22 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -541,6 +541,40 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /* Force disable extensions if priv spec version does not match */
+    if (env->priv_ver < PRIV_VERSION_1_12_0) {
+        cpu->cfg.ext_h = false;
+        cpu->cfg.ext_v = false;
+        cpu->cfg.ext_zfh = false;
+        cpu->cfg.ext_zfhmin = false;
+        cpu->cfg.ext_zfinx = false;
+        cpu->cfg.ext_zhinx = false;
+        cpu->cfg.ext_zhinxmin = false;
+        cpu->cfg.ext_zdinx = false;
+        cpu->cfg.ext_zba = false;
+        cpu->cfg.ext_zbb = false;
+        cpu->cfg.ext_zbc = false;
+        cpu->cfg.ext_zbkb = false;
+        cpu->cfg.ext_zbkc = false;
+        cpu->cfg.ext_zbkx = false;
+        cpu->cfg.ext_zbs = false;
+        cpu->cfg.ext_zk = false;
+        cpu->cfg.ext_zkn = false;
+        cpu->cfg.ext_zknd = false;
+        cpu->cfg.ext_zkne = false;
+        cpu->cfg.ext_zknh = false;
+        cpu->cfg.ext_zkr = false;
+        cpu->cfg.ext_zks = false;
+        cpu->cfg.ext_zksed = false;
+        cpu->cfg.ext_zksh = false;
+        cpu->cfg.ext_zkt = false;
+        cpu->cfg.ext_zve32f = false;
+        cpu->cfg.ext_zve64f = false;
+        cpu->cfg.ext_svinval = false;
+        cpu->cfg.ext_svnapot = false;
+        cpu->cfg.ext_svpbmt = false;
+    }
+
     if (cpu->cfg.mmu) {
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
-- 
2.34.1


