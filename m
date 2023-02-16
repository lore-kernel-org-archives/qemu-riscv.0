Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdwr-0004Mn-S3
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwh-0004J6-IN
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:10 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwe-0002BV-W0
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:07 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 x19-20020a4ac593000000b0051fd19ac59bso205307oop.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=Q6ZfqstKdSMCBt+AQrpSDkK+1RW2xGatL5kKb8IVMWR4o+sAbjgHtPQ4tcFJGVzowJ
 98iC0QlG+SqQLkNJbK4R5YuNfr8aiC6hTY13M17TFXaZOKQGbX5svOPiyvjirM13iW6G
 IUA1J0OdKcyOmzRXkM7KaSrXeB2aigEy1qS8Ugg3aG87H3N3aFmT4Ud83z9qE06qzE+d
 O/XS7ZA2O+i4P1bdK70ISRYs3oOQWI9KDCO4c/crcwZzq4ShnLaiNgavJhkL8zPnWvx4
 6663ruu6A1ZVF4KvzIxQqyVbb5FSdsAdaMHpJA6Q6Jq8i6cO00gHaQwg+7/1J9x+SUTm
 blEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=EWj6L4qyJ4VvoEvUFXhA3IJcmv/UfiDkpkZgDdH54wPSeMBQRBBp0s78Gbv7MYgcbV
 hBtn0vAsBsQsGv0MkQo25knAKoE+HDoZmk+Buxi/060ZkQuMVY6ypcW3aT6RKQgM8ya0
 Rl+YnJrHtu2CbK7oWsq5I1qdIcFA6WQ6QAhhK1DRrPj/jfF9W7UnjLbr9dUZk+/SGTHb
 NspvgNYcuZ+RQ3Cuj8MnOLxcBorbmLLqKDjOmEdT9YxwG7jZVZNsmvFl4xofCtFQbQ91
 2iwIE9boH/fiOtmdJPfSlo2abs5/VsKlqwW2gH+J/vAQDui6anJK3qFTBKKQ2/u+jquK
 FQSw==
X-Gm-Message-State: AO0yUKXKT3iDVXKDq579RavJ99Dr1Kg21IvyovAeFP9DLyc+jxpyWaex
 xd8isZtQ9SQ65Tf2+9qiAR5MFw==
X-Google-Smtp-Source: AK7set8IpNStI+mC3jSdckhet/H/zyyD2NbrRka8JWail9/qNO4360WH8NBBVTBxC1u8M2YCjzsbZg==
X-Received: by 2002:a4a:94c4:0:b0:51a:35de:d4c1 with SMTP id
 l4-20020a4a94c4000000b0051a35ded4c1mr2615202ooi.5.1676552703594; 
 Thu, 16 Feb 2023 05:05:03 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 03/10] target/riscv: introduce riscv_cpu_cfg()
Date: Thu, 16 Feb 2023 10:04:37 -0300
Message-Id: <20230216130444.795997-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:10 -0000

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 01803a020d..368a522b5b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline RISCVCPUConfig riscv_cpu_cfg(CPURISCVState *env)
+{
+    return env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.1


