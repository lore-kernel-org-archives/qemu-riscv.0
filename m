Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6x0-0006kG-7R
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6wy-0006k5-46
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:28:56 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6wM-0006vT-DA
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:28:55 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-541a05e4124so364344057b3.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADneTQ/OBJ/eO647FGCO0OgM+dmE7RZtYQ6phFnnTGw=;
 b=V8FUOWnmkpBZSrKJKuSqDdifeTDtSSUgDGN8Z4lDflNdiQc+bR7IAcDDCBc4ghJMsb
 WErA9aP34dDk4zARoTSxvj/W6tgSdChLWiYeOGbLSEXYXm6mCtxBQMtxwlq2SIwaHjTT
 XXGbYmXM7zIdYIkfs4qRX7wic4jWolG1h+8f0I7NWd4fhpBpGbE8IMgIwglksoFsDpfB
 Ehnpgh/LIU7FBKNcth4uFnQxcvjTg5GCZavspwVvQChVoVuAqz1AcNQ6hkAGq0DyJ++W
 BFia1VMz/r2cZRLYPR3Iw1znfU7ik9A88YHY5RhSB42F6SQMmvjJ784sM8+WA6LPFoQi
 Z7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADneTQ/OBJ/eO647FGCO0OgM+dmE7RZtYQ6phFnnTGw=;
 b=vGAu/X9FOmeJicjzDj7NSwLaXRJUT3yZzUQTavqVJ6ksFlXuJxRaWSWFN7I9ni354U
 +hxXHevLxDlyo46DA63p0b5vRG0wJCi8/3hUqxHDkrMpLOmoTzTP+5WRXWKvAKpc7VbE
 CtdbbjT4jhqCKUtkf0N+Iigbw4yZDho10XgSxhPAk5jFcv5WpEbBWyqHptrhdKn8cvP7
 7JV0RsY9zVpaivaNQJX7rJ3eoJhN7w/4NCawBeNEH+17f5v8NUOuj2zWsyzN11waFuuW
 A9X4c0w6iMPT8Uad7zj5Oc+nCH0n4jJor3BA+4XK4f+IyZw/SyAVw7SG+psDOPqplY1f
 XVRQ==
X-Gm-Message-State: AAQBX9fOTaxB2zX3ctXIHxwDsCJ0MsOKYIvW0stmxM/molz3woaOCb5v
 ibQXlUazokd6TF4k/NGDZn+puw5MZnzMNomIXBo=
X-Google-Smtp-Source: AKy350Y0j2q7ScyaSD1356WDgabKsDQF08uxLQj9vcDwEqP08a7E8mfQ6zxLzrHbMWnBhv/sePdJEA==
X-Received: by 2002:a05:6870:7025:b0:17a:cb34:758a with SMTP id
 u37-20020a056870702500b0017acb34758amr916964oae.34.1679523628772; 
 Wed, 22 Mar 2023 15:20:28 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:28 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 02/25] target/riscv/cpu.c: remove set_vext_version()
Date: Wed, 22 Mar 2023 19:19:41 -0300
Message-Id: <20230322222004.357013-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1131.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:28:56 -0000

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 18591aa53a..2752efe1eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -245,11 +245,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -839,7 +834,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


