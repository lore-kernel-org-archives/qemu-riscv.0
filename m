Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqo9-0002c4-Bq
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnz-0002NR-Hn
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:28:04 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnw-0003uS-UO
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:28:02 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5475e0147c9so101535eaf.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083680; x=1684675680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2BCmuELRJPh5SQX498hmY8SpGq4Krgaf5b8ZbejSLc=;
 b=I/gNfDm9PRV15z6N+RPnRVLc+RNPjb9lLUGEXhCikK0tYw6wu2A4LGrvo4sWcbsRkf
 AJwoStuUuoQ2DtNvGKCFBSgIjXCCcNENNRBrj1WE1zSkcdnIBDzFS5UoSGP0RHGe4v3s
 noRvMQd47dSj+IoeX74KJVDL7+DOA+jUAoyttFYq773mbbTgmz+lrYKqRT+q/A86DzCT
 sXet67VHwNu5w+T5FJ52d7ofRf1TmR6oDRdQ9HTZf7XbROn40iJTi8OIO55SXKfvBNXa
 yZlcfMWCk05fy+ePA9yXR2S1UPITtq8WhiPYVdDF/YCPjWmn0DjBj7OBjQc+d5xBkSex
 gTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083680; x=1684675680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2BCmuELRJPh5SQX498hmY8SpGq4Krgaf5b8ZbejSLc=;
 b=lHr+T7HGqPCY5xEdptQ+55HV9wVRSMgWGaSIqOSg7sUbXCXh4l2cm8g5JgRTvwFY+4
 ULfBqHZTWChWYFeYY9ROI9XM/ERHGFSss4daVGYmK2G6aF4l9xPdnFi5KcAL3eX0Lkir
 aEzDesBarm9o28A2GVJDW/xAy6feItigQc1+S8eryUk9vcf819f1xEGXD6OlDJOktvsO
 PwT2llp/3AYwnnN1i0mHmYqvD8+JshlkEugyIHQOOY9nJ4P4EHaj13bcaNuxfpeq4v6z
 55R/8KGV3ujlJ188k8LzhRfdBp31sKgld4HhwvWPDrVhpWtM7cPgxGGJUAJ9KDLudxUw
 n9cQ==
X-Gm-Message-State: AAQBX9eA/JsZG4heQ/AoyIDCQVpsaQX3U5wG56zHBWeHpBJyjKoa2X+P
 CFvF/n0Wsc9kbYqqq7Eg3iWl9w==
X-Google-Smtp-Source: AKy350Yuu3nMmxKxnah4dWBFzHvxLEYw/nYb/jHKIHOzdLWH0tbHCXvkg4Xm4MycYNgXhRGQMt9bCw==
X-Received: by 2002:a05:6808:2907:b0:38d:52bb:9f60 with SMTP id
 ev7-20020a056808290700b0038d52bb9f60mr2545706oib.2.1682083679967; 
 Fri, 21 Apr 2023 06:27:59 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 09/11] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Fri, 21 Apr 2023 10:27:25 -0300
Message-Id: <20230421132727.121462-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 13:28:04 -0000

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 43635144bd..2d7f0ac785 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1257,13 +1257,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1271,6 +1264,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.40.0


