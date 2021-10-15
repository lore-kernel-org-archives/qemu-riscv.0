Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbSuC-00007C-Af
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 15:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStp-0008NO-6H; Fri, 15 Oct 2021 15:29:49 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStn-0008Sd-LF; Fri, 15 Oct 2021 15:29:48 -0400
Received: by mail-lf1-x134.google.com with SMTP id x27so45565166lfa.9;
 Fri, 15 Oct 2021 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjznzoCbvQUGcmziNtfKcywsooW2JglJCdT49kGN5+E=;
 b=b+t8tFBI1D4HnagiubACS3Ail9ahxnBEgqWsvoCrQHzVpPuR32TV1ctfvD+VtLK53O
 92Vhce6axj2ywuZBInod/4ES7UeyNezAoQ/P9mH+aiCwDMOgpJ+0863eRVmyFmM4SGVU
 DQXLC8JX54ZiQ35xnbBi+qETLB06HSh3ePow+lhZU8r95600wYk5qxjDet2oJMR5w77M
 uSyHFWpHI267qr+RmPTmIVhLSR14KtlDAIhzut1fctOkyzXjTWcHXlixa1atDnST9Nr3
 tg9b2UqVueQbeT+t7GQyUvp1bZMGvBFYV4ymtILD/Vt3pEyDDBQCIHJaiCBUQp2lOzfT
 jnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjznzoCbvQUGcmziNtfKcywsooW2JglJCdT49kGN5+E=;
 b=5ujU982sScjoKdzZjOhZ+DoUPunH4OjNQ6AKCvnFu/4KHqm7UngdnrI7FTaZrxRwFk
 RpmWRK92Mv+wcfWsRbt3Y6hnBH7BHSFwj04cL7XdDzkw6MBRbs6eSznEqT506XLY3Gmy
 Ags7Iw8dEhPQQeqz80GT3SPvT6djKcovHk7noQSASg+TLPOAZPcFcLHnaeM8jvimIF0f
 XaL+66+1fmdK7+/CvKFu9ItGnY/dNSkKtUt5hVtSNCDwPY/6wF6w+/EODEq6aFLigkcP
 spu5DhsjsVSgBqJka1ZgdOWNLYQZSNGO29WLjAgqnls2OpIQRTgpunw5uUx7eqkD/r9q
 vSSw==
X-Gm-Message-State: AOAM533B/y6uq8pOidLfjAc7kncJT9X0oMhsuplJAUErC0pO+BPDhqDk
 7cg60XwWInH3+0bVrymFkrU=
X-Google-Smtp-Source: ABdhPJxJNAjhqYjgzaH3x/ubwAhlCofFcgO5XvSe7gam4eY1xUWsEo3BRiCtgBuJxAGksrymrOJrQg==
X-Received: by 2002:a2e:155a:: with SMTP id 26mr15255657ljv.156.1634326184814; 
 Fri, 15 Oct 2021 12:29:44 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:44 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v13 7/7] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Fri, 15 Oct 2021 22:29:31 +0300
Message-Id: <20211015192931.227387-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x134.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 19:29:49 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7f9dde70b7..fb08c0ffb8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -558,6 +558,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            target_misa |= RVJ;
+        }
 
         set_misa(env, target_misa);
     }
@@ -624,6 +627,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.30.2


