Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llxnW-0002wP-6f
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 13:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnU-0002qj-Ow; Wed, 26 May 2021 13:58:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:47059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnT-00071w-1y; Wed, 26 May 2021 13:58:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id b9so3801093ejc.13;
 Wed, 26 May 2021 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MU3JTu3rmDbZc+WwTSzdujwDE0KKZH6TsSTAfE4l5Ts=;
 b=eqEoCViOy06LqnwtyLVD1S0Vo+k3cARfcpcaQ4tpEnNH/YYxUeLuA6pkyxuc0aDL02
 +pUY9Js58RrwVgPiS64Ww2IDxwb32M3OJmrZtkHMcR747O4SlSLWkesZlRXusZInytPj
 NMuJg3H8dLaAOkH1V9bT2L3+kegQx44nmqPXz6VcSuV07C9jukXz+edjnmiQ9TxFV8FW
 AbwtTIWhO/BxM7ZWLQGOr5THC7vQGvnXbfB3PghA/FonAec4BKgDPIWwxCPdOCijOZYi
 by1HkfFRIfwq56SfOT4ZxrSsrtqIYvXmXJn3+LOk0SIIiiAmSpo9kU83unfbf3ZI+Dda
 aMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MU3JTu3rmDbZc+WwTSzdujwDE0KKZH6TsSTAfE4l5Ts=;
 b=ABIExqPvX/RjI21yjMcbqrarpMI3+duHiYEZxW3ZNpvU7zOrC4yHR6Fxc7bPGzyEKR
 fPAic55RuQpgC5SGS00bKzJAcl42yBctmQ64+8gvQqwi0jnSziVJHAcNxWe8KUrGXLff
 E0H+OmiNw+58pCqH9cJBEPW+yONpXZQvR6qrSgRIepnoXJfgVhQ6WVRd7aCz1AfR/Iit
 jZJ97BIZpGV/TwiSKBoNTRPj/CbxaGulZqEFAzk4oMdh4qpiRJ3y/dd6Y3zVZSEn5o5B
 GnCwnTHwu4GH7lNKRc1AXVs880WXGy/AI3WXqI1Xfd7Nknywbx0FE3L0jhMGfqbggRNQ
 wFOA==
X-Gm-Message-State: AOAM53351+fv0pdN86iYDxbrsmJJLB+6vvF0/5348KNIQnDCY06ZABP0
 2l5ZUikN3t4h90J2x+dSvX8=
X-Google-Smtp-Source: ABdhPJwk6OQRE0rsO7LB9XCgo0g0lw1LvO3O949JB1hVuPuJdLlW+58ZYe10KsaIh63sB3ErfyQAtQ==
X-Received: by 2002:a17:906:5fca:: with SMTP id
 k10mr35682346ejv.357.1622051901293; 
 Wed, 26 May 2021 10:58:21 -0700 (PDT)
Received: from neptune.lab ([81.200.23.112])
 by smtp.googlemail.com with ESMTPSA id hp1sm10407449ejc.96.2021.05.26.10.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:58:20 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Wed, 26 May 2021 20:57:48 +0300
Message-Id: <20210526175749.25709-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
References: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Wed, 26 May 2021 17:58:25 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 25e28e9b95..21a96ec366 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -516,6 +516,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             /* mmte is supposed to have pm.current hardwired to 1 */
             env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
+            target_misa |= RVJ;
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -588,6 +589,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.20.1


