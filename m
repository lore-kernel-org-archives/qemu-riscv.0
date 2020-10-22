Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVVaj-0008Kw-KC
	for mharc-qemu-riscv@gnu.org; Thu, 22 Oct 2020 04:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVah-0008Eu-LB; Thu, 22 Oct 2020 04:04:55 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVae-0006vH-HI; Thu, 22 Oct 2020 04:04:55 -0400
Received: by mail-lj1-x241.google.com with SMTP id 23so937572ljv.7;
 Thu, 22 Oct 2020 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+goKHHTPNQf+byU52c8msGIZZ/A616sN7JzkzNgsEM=;
 b=eGUGsPqXXOW4Dux81lCwXZwM1fRbvW6bynfQ5kBLRbJHDUxRfzQvNye053UtjvVy+x
 bbwOdBM52iqmOivy3wOk4U4Dw3OZgWP9z0AelSAH7oGP9DQSfwpze4lkjlO3df9CfaOD
 kLX3g8rgJ6B72Z8BZVY3oVuHMc69CKDuOXlQGFR7wvisFVhhKRUW5LjfIjmhryod+MTQ
 xKmABKlgp4y+S2AadW5H0uF4X2Raum2YIWX7FNmVaItIZ+dy4C1yXnchc/qAtelxVIH7
 u3UcVRJkkl9Yf5bc3FK8uDxANQF6DwEPxnelZ/QBWnywodqR7o6d67TQ6fGcLFskBzOe
 79iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+goKHHTPNQf+byU52c8msGIZZ/A616sN7JzkzNgsEM=;
 b=N9VyUV5fHT6+ACGVPuil47l1yICMoMVY+Z1WB37dUtYBngvdB2WXzGHJC/xvbC9BrC
 wqiVxdJb4NIW8QTrcD/CeD0IJtq8HsrIUBCJH1LPK3jWigWKjCAW7nhHV+9I0ckqTIk3
 BDhdPenMuS5XRMtbfWYSH8+kcSPDcY5LV8AucqGbhXaR9chPWsS/fuP3XBUomnbUQFM+
 mv8nIfw/mTmqnnJem5HcAE6foIi82m6hr8StHRKLH7Ut1Kb4EJB+lXsVgZdX6HhF7eTo
 LP8ziB+w7od6b39wkzdrG1be+t7OEFxVsDgK4YURn1nCg1vAnP7U1v5HEYTVmRmpPxcy
 4C7A==
X-Gm-Message-State: AOAM532u6hosW67OSqmJuVALhO3Ot5BD8SaqpBLSINRWtyjexg68ZOWH
 Ww80xv3gHFLFaF/gf9zAIXk=
X-Google-Smtp-Source: ABdhPJy+S/GK9tFztX8WGZaPTddrWpZAV8oNJhrMbR7T5pS4yZHmxhB7jZU/TVw6DF2nf/iF7JG06w==
X-Received: by 2002:a2e:8702:: with SMTP id m2mr469768lji.21.1603353889363;
 Thu, 22 Oct 2020 01:04:49 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id l8sm143682lfk.203.2020.10.22.01.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:04:48 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Thu, 22 Oct 2020 11:04:40 +0300
Message-Id: <20201022080440.10069-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
References: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 22 Oct 2020 08:04:56 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1c00d9ea26..56633c14eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -465,6 +465,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
         if (cpu->cfg.ext_j) {
             env->mmte |= PM_EXT_INITIAL;
+            target_misa |= RVJ;
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
-- 
2.20.1


