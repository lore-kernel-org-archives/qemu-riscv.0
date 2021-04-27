Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbVqk-0006OH-Ro
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 18:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqh-0006IY-51; Tue, 27 Apr 2021 18:06:31 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqf-0002jf-GG; Tue, 27 Apr 2021 18:06:30 -0400
Received: by mail-ed1-x529.google.com with SMTP id y3so35521938eds.5;
 Tue, 27 Apr 2021 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cBG/vn+Mouc2f2rVusu430afCyfWYcUQo1i/pxUkWk=;
 b=QARGwzuhI2sHHICFMvR49bz2qgPU7VlY+DRx5JRELUBr/m+UDd3JpNeHJs3jcrTFgh
 j4x+hpGiZ9zGeilFNiTJc5e1+eik7ocE0JNmMzgFVYtFXkqj+R23ToKccsWemxvLnZJb
 42ise5rpBVLNekKs2ChT4Jw0N9WxNWZ2kF5izpkoex34gvJY2jc/+HSGbj9om33DUcmP
 RGjgP0O2oza7NC12q9r0hz2vVYz6ZJTq3bFDNakc/48fMnTzCyKT9B1MofZaaAV7CQ4U
 /5EWSzhl/Qe+c9Jnywmn3bfheRk2Eum8W5K6DYqXCYlMni3fwFs/gJn4poM3gaG3w1r+
 QH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cBG/vn+Mouc2f2rVusu430afCyfWYcUQo1i/pxUkWk=;
 b=Hf73cnSNijAEd6wtIddNCUdpYkcoZnLACcErQ3RIxz65ysZHDpyyqtWC8IrDDuBRn2
 A5TwAbzMNOuQpl+TA63rzHhJEVTRUFsIv+8kbbICC6qO9xPUtNix/pNERRzASRW6pWFU
 KkhhYRnOAnbEbqukjgdc2RKors8M+v3mClxSLcoKZFtNX2MWS4jYMK1f1Dx1v71Rv2ke
 oPfAh13IhMZ0KGzZPnLWUsjvEGjvKkBTKc6yeozLm+frYb8BEmyLhu7hYuMjdUhtbhjh
 hDjwKmamYyNHXbdS650frH7sBPHL2mAycz4M2lK8xGoxkxE4zVjlaOkQWZDajqGlwNKO
 VwOQ==
X-Gm-Message-State: AOAM532gmB3CJPYmKugOZ4mlgwGspyLpWG5fTTeo9idBLAZMSc0Zn8FW
 SHAU5E7NVpfGcBXavYPwkIw=
X-Google-Smtp-Source: ABdhPJxFgiZ8PdBRsz2ArMh7VCCBexta6ipErli5pxXo+jN9R1zXwX6Tb+SyJUh617R+7K4IwPMDYg==
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr7014007edd.387.1619561187776; 
 Tue, 27 Apr 2021 15:06:27 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id r10sm640049ejd.112.2021.04.27.15.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 15:06:27 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Wed, 28 Apr 2021 01:06:15 +0300
Message-Id: <20210427220615.12763-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
References: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
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
X-List-Received-Date: Tue, 27 Apr 2021 22:06:31 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0682410f5d..fecc64d7ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -502,6 +502,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 #ifndef CONFIG_USER_ONLY
             env->mmte |= PM_EXT_INITIAL;
 #endif
+            target_misa |= RVJ;
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -574,6 +575,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.20.1


