Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyfoN-00055G-NE
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jan 2021 13:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoJ-0004ti-1y; Sun, 10 Jan 2021 13:51:31 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:36240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoG-0006jW-5V; Sun, 10 Jan 2021 13:51:30 -0500
Received: by mail-lf1-x133.google.com with SMTP id o13so34758818lfr.3;
 Sun, 10 Jan 2021 10:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTICAMugPCr++O0jL/QPkllcEcIwYBNqFIhFGKncuMQ=;
 b=addr1EIKXbXn4hW+dYx7msoDFjhlv3wg1rTXipqS0jaW+7sh5RlNQnuED1MmzqsHaT
 0mPMLxqxWdYrD1mwJ79fECqwkeZcE3DJKcjhjWF1eQVhlGmcYEJN0Nin6Q+afBMGfrVZ
 Vwi0sDaVEbiM9Ht2fk4DkMOdCdOyVKS+qqXMFgRFYdPF3uKJdSJTGLjvsL1tsTVqheM9
 FvhD4+zRoLhHZFdlDeh6qGufQ7JdY0uv529gLsb2JuKXRiRR6DXRuHGg3oxpbsBoiOnw
 4IrlrBtmN3ZdsS0nOdKcwKX4v3fkID87lhv4K+3M8aZWd1MPCbCM+O1vijqw+IR6xvez
 03aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTICAMugPCr++O0jL/QPkllcEcIwYBNqFIhFGKncuMQ=;
 b=F5cK3f4CEaxYq7Dln8wI+Y0EeRScG02Y1UzQvC3UiorTFPlMPVSGp1GQbq8eEOpvFK
 hN8fsWF3SpIMC7Py9JAugQSAkEmzA9ZgDMbsjzdvlHbKtAo1tFQ6DMlsatGE6DbK6l36
 6Mr+bTFVxvuykzRsHm7Vx6W0jY8WEn60hxbOt/7rUZs5897X+H/DRlRBYvYHbPCHYjpB
 cMOWzaoswcbvSiFiAwSXekXhU8YWHVZmVpL4ApHKgWlufELVOd9M5fxNYIIKbsvJEiA4
 CHaxA8Q5TA8yTQYBG+OHfTU20x4urOKoPGqk57t9T3o8xtubTFdoZCcW/chDtVTn9XUq
 /+ow==
X-Gm-Message-State: AOAM530m9BIDtqnOvkUbfF+EtU7sbt9YxqywGgmTVsAWfGLnsIKxIfUd
 A669W3dEaFXjcel0QEoScr4=
X-Google-Smtp-Source: ABdhPJzu6eM7/P05x4OYYB60FzSQvFgmz9AjjKKO7eY6OQE9ACerI0R4QYcibtjh4Oq70mJ4Io/T8w==
X-Received: by 2002:a19:c656:: with SMTP id w83mr5455112lff.248.1610304684450; 
 Sun, 10 Jan 2021 10:51:24 -0800 (PST)
Received: from neptune.lab ([46.39.229.36])
 by smtp.googlemail.com with ESMTPSA id l1sm2795267lfk.201.2021.01.10.10.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 10:51:23 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Sun, 10 Jan 2021 21:51:09 +0300
Message-Id: <20210110185109.29841-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x133.google.com
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
X-List-Received-Date: Sun, 10 Jan 2021 18:51:31 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 19398977d3..234401c3c6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -499,6 +499,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
         if (cpu->cfg.ext_j) {
             env->mmte |= PM_EXT_INITIAL;
+            target_misa |= RVJ;
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -571,6 +572,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.20.1


