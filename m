Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgopr-0007gg-1d
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgoph-0007ZT-20; Sat, 30 Oct 2021 09:55:42 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopb-0000iO-8x; Sat, 30 Oct 2021 09:55:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y1so8689897plk.10;
 Sat, 30 Oct 2021 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m/EL/5IeIfZtcKl68A4SvFzBb7yrmJRRf3J6MnZmVv8=;
 b=ayAoNt1kjIzpaKU7ZFOaZuJyVAu/055zC5Lae+zz4hlsmt0ekX9Khp8Q8QVs4yNK5M
 CIH9pIT+CAZyysG6iHQxRBfOVyB0ODcrbdtXTlvgcq/60VrHqgI8yhtD5CkQLm7u4q3v
 iQbKbEYAtw0HKDoZNIaz9LWmc9S1RIBW++d2pR+5shUEPcED3Xj0sNzvNPb/rAT+RQmJ
 ZT9mP2WnUzlOISYc1mRxHFWUIlF93wpqzK3tW3MVcSsvtkw9gmZdbYvkIF3f4ndCGpdH
 s6EyGPeRTtWXUEpWTx3rY9meAHz3Fx/YgCW4wU4CC6szZjNAODfDGTFjPKG7crmb0bOQ
 l/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/EL/5IeIfZtcKl68A4SvFzBb7yrmJRRf3J6MnZmVv8=;
 b=QnlXwbRppxQ6gbqUbpHnGM/HR76IW1BrOV09GS8TtsahzLv5T3l1UqXwRBkkgtXUXe
 9DIrtI4j6Pw2TV22FxXj3sDj3p+azr8Lkq7zvI8jvhAtm9jWxN8RuEyow4mMJ4dYj53W
 swlogJyB1ypvwmwmHhvP5H3fPSjl2MCVD/+HmKzlrOpTBahG0BDD39NW7C2eQs3MwAaT
 jO8VKdz9MtO0igHsmbKqFwf8KlVLPHcvnmQdDBNZGXAt/uAyKy39nhIyvLcRG1HsYjr6
 0yuwHTo8yBqilaxQ1+Rhz6uY8ezXlFvYdapb6Surs4aw2IrlhfikmE13gRQykGQpapth
 O6XA==
X-Gm-Message-State: AOAM532an5XZGEl2n8P7YqrjvzQ55gzEt29lxRh0rD928XfZXV0A1nFH
 YhG8GH8yEnTeuHcFjXMagg4v8wnpr5A=
X-Google-Smtp-Source: ABdhPJzvaFiExvLXOfIzlU9b2cqBx+A/DmkmK+Ygb8raD6tlgPiFriCFP8S88sbd6NQ4i/g3GCygiA==
X-Received: by 2002:a17:90a:de0b:: with SMTP id
 m11mr18102021pjv.90.1635602131405; 
 Sat, 30 Oct 2021 06:55:31 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 4/7] target/riscv: cpu: Add a config option for native debug
Date: Sat, 30 Oct 2021 21:55:10 +0800
Message-Id: <20211030135513.18517-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Oct 2021 13:55:47 -0000

Add a config option to enable support for native M-mode debug.
This is disabled by default and can be enabled with 'debug=true'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- change the config option to 'disabled' by default

 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1fb13e8b94..b2301425c2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -75,6 +75,7 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
+    RISCV_FEATURE_DEBUG,
     RISCV_FEATURE_MISA
 };
 
@@ -327,6 +328,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool debug;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7061ae05fb..84116768ce 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -448,6 +448,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.debug) {
+        set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -631,6 +635,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
 
-- 
2.25.1


