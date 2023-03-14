Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7rN-0006Bv-NA
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rM-0006B9-KQ
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:48 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rL-000331-2o
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:48 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 a23-20020a4ad5d7000000b005250867d3d9so2402771oot.10
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZchHCpbCNurGYGzCknrdABpRZLtEe8JKLQAwB+SapM=;
 b=a71moXEMoBE8kVC6fGZX2kkBJUHVsG0NJmF1WoqI1PKMqLQwWewtQpD6qlPaU04Ljc
 KMyheISz04y+wBqG2Plna/pFpcsriNl40qtdb4fZ9Mjn0kiO+rg0u1GYm/N9lMOy+OeO
 v62l6LbPcpfciwIz/X8bxte8zUVRP3+UCcL+Gk2wtd9KgM/tgaAIyPKrWkLqOlZplK88
 N79Adn+eRmv7YCn/rTMXjzj6z/H+QxWvPiioIOk5hb66LwXwS+2ll5ny3f5BBJ+ghdWb
 yxX/iY+EDo0b9iSgeUoambb6tyVY+IUSQI9zYZc5IkPS/BvDpYyO851Cx5E3tfT1+G6d
 8K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZchHCpbCNurGYGzCknrdABpRZLtEe8JKLQAwB+SapM=;
 b=jRt2J5Y3JAJsgsEtqrs/kl3N0X9aFxt7vNL6prkxo6HYBwxyEcG6Z/KaVHPzaFzMiM
 pND79S/qrHQDJyYOaArI0UjwQjfOCsODYaYLqt9uHiBDMmTlFjZ1P60aqcUYtiHdDlMp
 3QuHCjCgL7wMl5oScBPFVOWndxwXb8z9H5lkFbmZy2XHyqVWlZCWQFK78eTtFb5IYlV4
 6i8SlWCZdC6B8cFMedl1zfd0TIxkLjk2X5AxHgDfb2n7FTYOIO+SWtEBnmnBDvr7hlVm
 5RuGqVAt50WWC2tPPATYQv0OKQQyCDk0v4ofZLgdDRcUMtguyukMxsEdMNB7z7o6Y50S
 apyA==
X-Gm-Message-State: AO0yUKWXo8OZ92rzJjdkS/RuwbsWYjf5jbNkUjlUvWmegDfx994cr4x3
 EGJpJyk08BATFxnk2L8BrCdFkg==
X-Google-Smtp-Source: AK7set9EH8gpWkHUcbyaWGzntxCB7zD18TLyg5o7p2yz86rta3e38fFLQ7F2LiyiOZAK7ZxOPsFRpw==
X-Received: by 2002:a4a:b78c:0:b0:525:2d37:5335 with SMTP id
 a12-20020a4ab78c000000b005252d375335mr18448613oop.8.1678812645909; 
 Tue, 14 Mar 2023 09:50:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 17/26] target/riscv: write env->misa_ext* in
 register_generic_cpu_props()
Date: Tue, 14 Mar 2023 13:49:39 -0300
Message-Id: <20230314164948.539135-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:48 -0000

In the process of creating the user-facing flags in
register_generic_cpu_props() we're also setting default values for the
cpu->cfg flags that represents MISA bits.

Leaving it as is will cause a discrepancy between users of this function
(at this moment the non-named CPUs) and named CPUs. Named CPUs are using
set_misa() with a non-zero 'ext' value, writing cpu->cfg in the process.
They'll reach riscv_cpu_realize() in a state where env->misa_ext will
reflect cpu->cfg, allowing functions to choose whether to use
env->misa_ext or cpu->cfg to validate MISA bits.

If we guarantee that env->misa_ext will always reflect cpu->cfg at the
start of riscv_cpu_realize(), functions will be able to no longer rely
on cpu->cfg for MISA validation. This happens to be one blocker we have to
properly support write_misa().

Sync env->misa_ext* in register_generic_cpu_props(). This will leave
only a single place where there's a cpu->cfg change that needs to be
converted back to env->misa_ext*: right after disabling priv spec
extensions, at the end of riscv_cpu_validate_set_extensions(). We'll
deal with it shortly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 133807e39f..af5a1e6a43 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1595,10 +1595,12 @@ static Property riscv_cpu_extensions[] = {
  * Register generic CPU props with user-facing flags declared
  * in riscv_cpu_extensions[].
  *
- * Note that this will overwrite existing values in cpu->cfg.
+ * Note that this will overwrite existing values in cpu->cfg
+ * and MISA.
  */
 static void register_generic_cpu_props(Object *obj)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
@@ -1609,6 +1611,10 @@ static void register_generic_cpu_props(Object *obj)
 #ifndef CONFIG_USER_ONLY
     riscv_add_satp_mode_properties(obj);
 #endif
+
+    /* Keep env->misa_ext and misa_ext_mask updated */
+    cpu->env.misa_ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
+    cpu->env.misa_ext_mask = cpu->env.misa_ext;
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.39.2


