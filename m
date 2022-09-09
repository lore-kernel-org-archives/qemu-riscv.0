Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHH-0007Ou-GN
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHE-0007FZ-KI; Fri, 09 Sep 2022 09:42:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHB-0003Hl-Sa; Fri, 09 Sep 2022 09:42:36 -0400
Received: by mail-pl1-x636.google.com with SMTP id p18so1816378plr.8;
 Fri, 09 Sep 2022 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DmTjsDhwqcYB3JNytOjLIO7Hhe2bPzZUddEoJtoSZeQ=;
 b=i0OvOEP032SSKPpQp7LXyPTonOMXCf9FlxjvZ4b+NIUcBvxEdhPGGmtn6whYQBnrEj
 GTWbxuuD2SBt8sQU+Sr5VzaVQIycK+HxM/ijFIwWFvsqlqmFk2KFf0M9SkNftLro5nlb
 qjam6Qj0kDPBbm+27tgZGxhOSuTtA3Eq8oL5fhFr9wGbhDMS+MEHyUHM96gJRytov9tj
 4Inm8YeK6GXIhSVl3sTD+mTCIU2Cbs6EbDgifRGPmbe5tPIwXiQBQ3YvjeRjrqP6m7iZ
 YUe4IJcjcRTglHA1RCpMt8h2dw5L/QkW549hKE1kTSVlqN+ZKO7oM3+uGsxoVAtKxuBr
 oywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DmTjsDhwqcYB3JNytOjLIO7Hhe2bPzZUddEoJtoSZeQ=;
 b=64VwD1yyX4xDpOHfQ1nFC94oRPUuwQJv1QeDFsqCXfXp2FjiWDRuYYg4dv/bEhtxUv
 sV2JUi1ekyhdmUShp6Ii+hwabYxJUYl5XqLb0FuUskmtJY4y/z4JHdOiWtqXXtK8NVMM
 7v65kFF4sXqhXusl9uIn7/wwnm1UDui5Yx8xPrXYY5Z4fR5KKAHDF88Dbo3PSkAa1ICb
 cC7z0pqH2Pa85WYX8iRp5OW6AAJlFu2TUlUcNaLlGXB92Ol9cVKiwWFgCFYfGGwF7qbJ
 5DNrEEpqZupL6x2rIa4caBnkR9po2h1xDRLRdIQke859jsLg+tYlv/k+gvs48d7Xexcs
 RP0w==
X-Gm-Message-State: ACgBeo1m+PUHBDIa3gmAmV/Xx62LN2grrrPm4zwEVdO0G1h8hJ0KO82z
 9twSsLwH5cNsE9OCGQDXKleDP4uzigo=
X-Google-Smtp-Source: AA6agR5gkdiM5oAhrMCzYI/K9W771YoIW4iaesoBAyDG4VAw0j7EF3Ao1fA9wWU97rj/ml+S44vATg==
X-Received: by 2002:a17:90a:640c:b0:1fe:1763:e169 with SMTP id
 g12-20020a17090a640c00b001fe1763e169mr9634164pjj.35.1662730952106; 
 Fri, 09 Sep 2022 06:42:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 4/8] target/riscv: debug: Restrict the range of tselect
 value can be written
Date: Fri,  9 Sep 2022 21:42:11 +0800
Message-Id: <20220909134215.1843865-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:37 -0000

From: Frank Chang <frank.chang@sifive.com>

The value of tselect CSR can be written should be limited within the
range of supported triggers number.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 target/riscv/debug.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 06feef7d67..d6666164cd 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -127,10 +127,6 @@ bool tdata_available(CPURISCVState *env, int tdata_index)
         return false;
     }
 
-    if (unlikely(env->trigger_cur >= RV_MAX_TRIGGERS)) {
-        return false;
-    }
-
     return tdata_mapping[trigger_type][tdata_index];
 }
 
@@ -141,8 +137,9 @@ target_ulong tselect_csr_read(CPURISCVState *env)
 
 void tselect_csr_write(CPURISCVState *env, target_ulong val)
 {
-    /* all target_ulong bits of tselect are implemented */
-    env->trigger_cur = val;
+    if (val < RV_MAX_TRIGGERS) {
+        env->trigger_cur = val;
+    }
 }
 
 static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
-- 
2.34.1


