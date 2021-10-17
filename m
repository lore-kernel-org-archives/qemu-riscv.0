Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wo-0001mb-DQ
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wl-0001eu-N2; Sun, 17 Oct 2021 13:27:43 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wi-0003Dz-SQ; Sun, 17 Oct 2021 13:27:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id i20so60222802edj.10;
 Sun, 17 Oct 2021 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHHTVDAjEJObMtEw9nLPwy8ATzu5O/k8PrPHniLY9Sw=;
 b=QaLQVM0VZ3b6O0mIgC1INlVyTLLyQF8wqarsKOIp3m0APDAXAmngWf1v29csD9jmUB
 kQqO/kjAdWpCDNu/xY1v1qB1B62Iay3rE7Edef9z5WRJ31jej9/OJyWh/+1AdDGk3icK
 y9rF7SJwL8xx9iDVca00d+tJaO0FLTJoWHvb89lNd+Q8yOR+/G6zqIufjnVkXF1jk6Tb
 KaE0g66iUXtkyY5FAQyrqDjSLY9DKGtybm7qD+aV86S8hSJ+E3rhrUefeY332eA9+TF2
 mrkPLwp0hAR6F/srRl00mv8k43sgJHOJZkfMKAq5gj6oQBQQzxq74cxS9NLXY1W+tvXb
 aMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHHTVDAjEJObMtEw9nLPwy8ATzu5O/k8PrPHniLY9Sw=;
 b=GibM2UMEcTNXnnibl2tmvMq5QA52+iQc05FyiWZGSJEwuti4+YYbHFetzi3IapSTEW
 7OKMXvyAegYiIxybenriV1RAsrbViFgNra5DtOLcRZQ3WG0mt3EiwjlfvdG+b0Syucy2
 VlP1zHDWlEQOFVCNZQQSFEZ5vOvbYyQUcLswcF6z0gLDzzsDY6MkDz1YH1VaGz0Z198d
 I58B83t6ahzzzddBIolwVY9iGxXBEVJb/vSCBUUCCPOJLOaenHrQ9jNhLIde2iNHQKEh
 g27tWCgJinuutM5VZTqMpUuGDJFQlOzNjxZLva6QqWcmXO5Zs7+JYNFpmjiQ3rqFMsz5
 OrCQ==
X-Gm-Message-State: AOAM530TcLResoMzCHrJrArui93I9JeuVRgW5wU1blLzH1OgXaGgV2eU
 6CG3nBQqgNR+dPY5zzpYLmg=
X-Google-Smtp-Source: ABdhPJyWHCDIUgjSORF0yGSe1stncYWjOQCDBbY391yOuMqIFuMzbrGZi5WU6T2czPBATLbzFZLccw==
X-Received: by 2002:a05:6402:2550:: with SMTP id
 l16mr37332171edb.229.1634491659074; 
 Sun, 17 Oct 2021 10:27:39 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:38 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v14 4/8] [RISCV_PM] Add J extension state description
Date: Sun, 17 Oct 2021 20:27:24 +0300
Message-Id: <20211017172728.759687-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:44 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/machine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 16a08302da..4d99880797 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
     return riscv_has_ext(env, RVV);
 }
 
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
     .version_id = 1,
@@ -138,6 +146,24 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
+static const VMStateDescription vmstate_pointermasking = {
+    .name = "cpu/pm",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pointermasking_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.mmte, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 2,
@@ -189,6 +215,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pmp,
         &vmstate_hyper,
         &vmstate_vector,
+        &vmstate_pointermasking,
         NULL
     }
 };
-- 
2.30.2


