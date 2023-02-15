Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyh-0008Cr-9i
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyO-0007lZ-TU
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:45 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyN-0007wS-6q
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:44 -0500
Received: by mail-oi1-x235.google.com with SMTP id r28so16665422oiw.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=a8ZrW13ClEJW9k3sGdoDd/f+UNGHaZrkEemRiReeQDDQnD+qn3rTtfBR8+KQItUhcy
 6OMhONJdDJE+CRjYKHGcm2mwKVqXEu+Ex0IkbZlulc0ZBHj+RPZ+cNVaQk1K3rI+l/1J
 SvQWJk5WoPQvWeJSWmRNFyFN0p6sikJio/z4co/dxlDU0xXG9XDJ6fVXxyHo4+qTrYTN
 JiKCb28ynJeC4dJqLsVmzhI92GEUww1Umbe2Bn3t6r83RqV3ggQF0pZtw4hDEKUzT5kH
 Po624CfWPD+B239xrSAY5j+f3ua+PvVn2gXa3qIY2Ncvo7nJ3CXlEFDGdusQizFgPArm
 1N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=hNmPx0tPFequQOGG8hVDRZUQiykA74vt3KRNSHaobHk+w5WvZ1tWKYxrj6tGhmvk+V
 rGSOlKLpbSR7pSfJh+GfmKbe0qeAW4lWzP0nZApZ2/w4ZKCgfqXGe8Jp0DvG+ES+67R0
 vwlqaBCmX7Is4rORptqsZFfUk+kG7fwezArBLqVlhizstcYkcnuC52j4DpgrmRtVEq9A
 60By7sJQpXdflyzA7lLcyzBWuanzeNpcVRSKIswVR9AQvOMkQCPNKaEnm9b/Az7oXywb
 CPpnyJraIkjGyHKNH2NhOJ9vFaH6NRt2fPEfIqav4Ew1WirWQ6Z3eHZJFXO1gk6GeBdL
 +NCw==
X-Gm-Message-State: AO0yUKUE8EaXJNnwtpt29SapIiuOcj1UEpW1mBiVmKEIPOxHS6ZhHvl4
 oPUWKU+4N3Jyx+n95rXnmjcYnBuqz2ra4bNq
X-Google-Smtp-Source: AK7set9uUatECYM/r7dub4NSKg4e1kFYuWBBnWLAba6RQt5b7r7VozhT9T0eA3wEUMkwWkRwpaYsyA==
X-Received: by 2002:a05:6808:9ad:b0:37a:d54f:8c7a with SMTP id
 e13-20020a05680809ad00b0037ad54f8c7amr1191017oig.59.1676487461024; 
 Wed, 15 Feb 2023 10:57:41 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 03/10] target/riscv: introduce riscv_cpu_cfg()
Date: Wed, 15 Feb 2023 15:57:19 -0300
Message-Id: <20230215185726.691759-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:45 -0000

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


