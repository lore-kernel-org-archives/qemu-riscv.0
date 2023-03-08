Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GK-00085k-Ei
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GI-00085J-Rr
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:46 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GH-0002U6-Ba
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:46 -0500
Received: by mail-oi1-x230.google.com with SMTP id e21so20693oie.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MllaajdX1fwdPjFAr0zO+Y5CuLxZh/hvmr+W4o52MIA=;
 b=oKwH+a/uYB1Zm/1so0aVursroSJUsRdiguLnmxGOovItJX/SZ8KFrCbT20DY7P84fk
 P9pYNwTNYMfHEd3aiQs02PWlLc/7sI2AQdNCMZHQ95YEDGJ/FKinjMyknK/NfY5+JUM7
 q8zIy0c5BnFxDlVNpgwptzpxLlQ+Q4S2sTlNT9A8xWEZDWra45BI7HeYiYyoicJ0ueWV
 NAItbmvtFsF5O4rOaezlE2JVn5iYvo1Z9aKQzdscfa/x/3/aWRgkXeJ0WTeYn7/mi+1s
 vSqPHXNrKy7p1pd0aZN4j3eYNRVJfW4HYaJe0W2UCea8bmxlSmVYIUsR7wRkYMcaaBWz
 TO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MllaajdX1fwdPjFAr0zO+Y5CuLxZh/hvmr+W4o52MIA=;
 b=a3Z1Hew03x3CmxNqdDHcJC7sgQvGDa/QaD+0iTFCzQc0Ir5PkjNN7SVAlHyPFHxE+C
 5/yI9J5NTuzUrnhYS+Elz740Y6D7eK3XQ+hIY7oNbMmOYvuTnCzbIHpVs3CJvyoKWpoB
 l8DK/kH1gDrZPRj62MFqwyMiqqXTjgWXPy7xZH2DMnG0GDm32bAQ2EhgU4XCn5nPmsmG
 ayCEicEDULvGHhHpZx+Xto3Ik0ItP9qaVlkZDqfTx9N3nexN5MnzXzZpn44sKUNplRKX
 e2mKSKT90UDG6/bNRKRi/U4pN2qMTSuntm5628cbLSMlWSpLw+lufLaUiO9FQ6xRIJ/Y
 /JkA==
X-Gm-Message-State: AO0yUKV0AKrQsNwzN2W5Z8Q8cpnZ1492N4SOa5wpuGEJ8kRpkwmQg1tZ
 eYMoVKNidEtHz8WrF0MEKo7KAQ==
X-Google-Smtp-Source: AK7set8hhSuHJlaeRmUQQSh5A7lmaRJ2v8lh+R8+f79TGi4TEDwCB7EBG+NaDeYNIGRryPoggHamIw==
X-Received: by 2002:aca:f0d:0:b0:384:416:19e3 with SMTP id
 13-20020aca0f0d000000b00384041619e3mr8941567oip.52.1678306784133; 
 Wed, 08 Mar 2023 12:19:44 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 04/17] target/riscv: add PRIV_VERSION_LATEST macro
Date: Wed,  8 Mar 2023 17:19:12 -0300
Message-Id: <20230308201925.258223-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:47 -0000

PRIV_VERSION_LATEST, at this moment assigned to PRIV_VERSION_1_12_0, is
used in all generic CPUs:

- riscv_any_cpu_init()
- rv32_base_cpu_init()
- rv64_base_cpu_init()
- rv128_base_cpu_init()

When a new PRIV version is made available we can just update the LATEST
macro.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 964817b9d2..62ef11180f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
     register_cpu_props(obj);
 }
 
@@ -350,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -426,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -439,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..af2e4b7695 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,6 +89,7 @@ enum {
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
 };
+#define PRIV_VERSION_LATEST PRIV_VERSION_1_12_0
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.39.2


