Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wz-0001vd-SK
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wo-0001nm-Uf; Sun, 17 Oct 2021 13:27:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wn-0003Ht-EG; Sun, 17 Oct 2021 13:27:46 -0400
Received: by mail-ed1-x535.google.com with SMTP id r18so61200775edv.12;
 Sun, 17 Oct 2021 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WX5XX48DMBcs3sY/O4MWnvihk8w9+6+uzGwdj8DEbnQ=;
 b=ogAntw5mD4rgmA5hsWn9INRaSM1bxJOtQspAWAcitYNwI+fDaHvPdG1sd8EKjo7uhk
 JRY6RFAmRFcI5S7Q++eqIAtNdWVyznNtjj65A/igSpcY/LvDQguTwT4CcvhVv5auLF1E
 bnm3vDUWoFGYg33iTd05ADme616Uu5siPjd8piwc46DXjqLkUQk7TUUggd2PIf+2rU1R
 K2200Q/q8jBnbxL83QL9Eu2NCLT5VGdADz+cXq813WrLWtnuquckK7+iLgMvE6GTLPpo
 QXjPNmU1KiSR+mTAURxFY8rl7MT2m/zEbUmw8+O3GkZqbvxLY4EUjwVwnnJQJCfsgSAT
 +xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WX5XX48DMBcs3sY/O4MWnvihk8w9+6+uzGwdj8DEbnQ=;
 b=bMP65Uf/9SUigpKrZvpcRjwDgh2FrvfL1rG+o1GvEOwE6+ah8N0CkAx7U2xoU5PfHK
 xHpqTNWcOMGNx2gBjnCSc++Cej8A53Jvsd8jOAv+dQMAB9/U7IU9QgL6FZumri/CgTHz
 PH8EHe3DKJ/p2GCEOFc3oyN8xypMRkiC1GTJT31c6AXtnHHhQv/+czD/RTzi9D6McnKW
 95KduUQ6AGrI13VgUBljM5jxPaiPOS7V++uyNnyqrGyTjVuf3E1NRBvDL03Ki+P+V3Ip
 swTlvfPs/j1Rv/Kx8rTWrP/W7Iy8g/zlShQsOygUeannWbSKqf3gk1eBwTfV++Iv2tQG
 jzpQ==
X-Gm-Message-State: AOAM532mGBbI89Igl+ZQHS14l1Z5/vSChULwnKzgQzNa5KSBLVKPmNUX
 9dPe8LK8aKSSdh09IYU1ADM=
X-Google-Smtp-Source: ABdhPJx3yzWHr/xQyIrUFpKb0hxCW1dxXSjZuOSLEEltAJ8VyRT20YH9cnf+ccd+uX4Zf6ZjWcqrhQ==
X-Received: by 2002:a17:907:3e87:: with SMTP id
 hs7mr23886026ejc.403.1634491663665; 
 Sun, 17 Oct 2021 10:27:43 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:43 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v14 8/8] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Sun, 17 Oct 2021 20:27:28 +0300
Message-Id: <20211017172728.759687-9-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:49 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


