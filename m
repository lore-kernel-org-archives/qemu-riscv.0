Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU165-0008P4-1Y
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:55:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU163-0008K6-FM; Tue, 15 Mar 2022 02:55:55 -0400
Received: from [2607:f8b0:4864:20::42a] (port=44807
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU162-00024Q-1C; Tue, 15 Mar 2022 02:55:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u17so15965422pfk.11;
 Mon, 14 Mar 2022 23:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hpLCJE0TB+AuWNGojx/SKzSXXxrRzfDcoyVZcVz+sKM=;
 b=fh+ayHxj6hkQx8dRD8i9rXNby4ehGpLgVrAuEIM2j3c0b0G+qa3JdblN5gNrA7w/AI
 csABszY0rURuYD09WNmQQ6fuPAMyyELOJ8ElZcJZvrx+4F9GIu/t+3kWKqkQP04ECgHe
 k5wh/3W1CFtvmHuYtNX6YhXRDPFGqPOGJNT8VUaZGLOhKC30glkOJsKYpm/a9lkeXDJz
 seOL/yoSNjnhAKq46rQ5r8fU1pBBsDbxFb6XEdYsPs0XvvcxBKBtdqpLa7/sgGG3DvBs
 haxqwJFJHaMcAFjQFrfBUZk5Kos8799AczQorede8dU1ZcnqJEIwJC6MteuVF3F5fWi3
 NWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hpLCJE0TB+AuWNGojx/SKzSXXxrRzfDcoyVZcVz+sKM=;
 b=NzGKEfQJCex9twynND4vLmIMdDKtmF0CkbegN4oBsDv1pmLTbErgHTc50wEjBODvxz
 aONvd7nscMpoJBYjkh50NxV5mrqx0VYJx3/UbiPJ19+p4TpE/DMm+msxmBSa8yDH9k4m
 56mFGEZdgNAwqeEm9eNidS5ZwoSKWbqCyy09WETF+Ai08q3bPC6jBSDZOHMXA/Bw27Fc
 I9jjtODY2pZkc+G/9mKmTUA8dwolX2m+j7U65XBeKeLUFHdu2tNDZRxuxNfngZYYkIgH
 g8J241i9b69rKlr4EftR1JxxjViTizmmyWGdK70u1FWlxqrjrkwnEVfejKH9v4g5jOgZ
 Fxew==
X-Gm-Message-State: AOAM533nUfRVZw8sRtz3sKP1QJKVPCy5HTzmSKvJRieRUUXo5TDQBagO
 9DSjWRw5X5LsRXDEntNHD7U=
X-Google-Smtp-Source: ABdhPJyMgGoayyNa0BYR8uxlIDXoOwsqHgsciU/cKT86rWROt28GmjsZFgOOsDgWMV/7Fh2RNGAixQ==
X-Received: by 2002:a63:84c2:0:b0:380:5d6f:6b97 with SMTP id
 k185-20020a6384c2000000b003805d6f6b97mr23124197pgd.73.1647327352532; 
 Mon, 14 Mar 2022 23:55:52 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm22970500pfv.69.2022.03.14.23.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:55:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/7] target/riscv: cpu: Add a config option for native debug
Date: Tue, 15 Mar 2022 14:55:26 +0800
Message-Id: <20220315065529.62198-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315065529.62198-1-bmeng.cn@gmail.com>
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 06:55:56 -0000

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
index ad35129239..d3e884452b 100644
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
 
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -388,6 +389,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool aia;
+    bool debug;
     uint64_t resetvec;
 };
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a4c94da2a..eb2be5fa05 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -541,6 +541,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_AIA);
     }
 
+    if (cpu->cfg.debug) {
+        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -780,6 +784,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


