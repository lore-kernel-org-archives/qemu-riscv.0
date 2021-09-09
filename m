Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOPIH-0003pS-WB
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 15:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPIF-0003jY-Ky; Thu, 09 Sep 2021 15:01:03 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPIE-0007S9-2a; Thu, 09 Sep 2021 15:01:03 -0400
Received: by mail-ej1-x632.google.com with SMTP id kt8so5598289ejb.13;
 Thu, 09 Sep 2021 12:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3pj1DPmi8DTGKllsifyuDynP7WZnIrBYUU0x0EmreAE=;
 b=haM1TZMbRKADERz4nRRKfYm8TWd+69+k7FX6HDnO4yTifABmr/D7F1tjMBJn2cwu+/
 sDsxpDaUh81Nut39is2I/Wk/2c95A5vBoz/hfz+za1iU+pj4ajOeldKY0LxNYhvuikp8
 1XSu3mNL3pEEoHZVypPpNLT32pMoFDvEPRSlCBgqSImK0MfT1dxagJaVg3eTCzhaM0n9
 Odt0tfQFzqTs08uiF2pz6EEGpmaU16gdaaQYmz11YcCEut8rjowERbIuKOVVItKq+FTF
 lZO+XmN7Cq72PAdUg3cwAlvis+as2tIatqDRP8PmGCWLLZ/paWsBycp9HryRNgjBYm9I
 O1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3pj1DPmi8DTGKllsifyuDynP7WZnIrBYUU0x0EmreAE=;
 b=gj6SsHrImSLtomrJUa5t/kikuyYqGuLK1MlMFatrg6uGGWepnNyHMher8qy8KPMVN6
 8KdkEvVSXh4b1pSEZTuNa5pJDgXRiMR/V6KaSIGS/QK4iUOQeGd3SuE1A5ENUA/vYzZT
 hWepNw/qV4TyAQZMoFk8AiD4wHCBlIKtbce/GW1Cgi1TtNga32ma9lanGez2pfIag+Wb
 fMzm0WKIQuhZIDD9BIZPpq2O+hggrPOK5Nft4mccCNmKPMiGs64m1Je6ChO7/cwV1Fub
 f4Ht6Nu065QxnwLxSpJoL/Hmc5PyFLIDKqz+F5Jmle9T4CrSW8u+RKopej5R5O8WVwnm
 wSeA==
X-Gm-Message-State: AOAM531ntgxz4RBSzYTQY9NarYWzBtPEQ68uyvc9hOpHVYG1DmErv/k1
 6nzRuG+v/KsDdhznbDTHzGE=
X-Google-Smtp-Source: ABdhPJxA3c+PhAJfTIj+EeRkAVxZ8IN/9T/f/q4xUoa52n7hS+ovbP6UaK8T1sdsos4TG9YMu6FfJQ==
X-Received: by 2002:a17:906:5855:: with SMTP id
 h21mr5049761ejs.230.1631214060320; 
 Thu, 09 Sep 2021 12:01:00 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id c17sm1514588edu.11.2021.09.09.12.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 12:00:59 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 7/7] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Thu,  9 Sep 2021 22:00:33 +0300
Message-Id: <20210909190033.1339448-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Thu, 09 Sep 2021 19:01:04 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f5fdc31fb9..4a1dd41818 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -582,6 +582,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            target_misa |= RVJ;
+        }
 
         set_misa(env, target_misa);
     }
@@ -616,6 +619,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
-- 
2.30.2


