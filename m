Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf3tv-0000Ro-Eo
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 13:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tt-0000Iu-7u; Mon, 25 Oct 2021 13:36:45 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tf-0001zU-24; Mon, 25 Oct 2021 13:36:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id a26so2537950edy.11;
 Mon, 25 Oct 2021 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qRkVlY5FpL2EgGFei+8X6hixFzpDnG8xWG9BcSES9JE=;
 b=YF7HhlfAadTNxdcj+cPS/1PHxvPJvqQiC9jtl3ojuXgAUv5JndLM1DSaozN1WZjLhy
 I7q6YIreJFXs2bqH3nER0Hh2ymfg8jiABKXMyMc5+7sR5fk7wpCSbpsoTUYYyf/5MQHQ
 mZkMDXl5f5hBt54129ZbhQ2GLdFhv8NOBmyZJa1NOfXtMQOuNAX2mGhY/oNuQR4OwRno
 61JaD+T8pAZqTp6oql08yl24K5IDwoshTzL2WiGnwbORzIrX7Fgnr4Te0/Eg4kV9dNOP
 Pbvrstb/fF9EWom97hryHv7m2N0/RzPuJRVXNTwvcjoADqYHcEVdIkAekuocMkLwPwCS
 iy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRkVlY5FpL2EgGFei+8X6hixFzpDnG8xWG9BcSES9JE=;
 b=fLtX7mOz8e5EqALWvpaijkg0L73OhG7cwvQtZJ73d5uGDX058fssDQdwIxf4l94QaL
 QhRgK5u1hsy9tRlg8erxfMnKe4bvXLQrL7JFYCAkbNjYdLd7kTh1UFXwEb/dEcohAJBy
 Pb0S/VN5t/WlXFWZ1cTQqhbAJXVafETOsAEHVtTIh/Jsr1Wg7pxEJC7oiVGC2RX0Oh6f
 DBrmTHH6SqP3l03u7t5T65KFx/77UlY9AGKxJAcPRoW+2myfAMocvM/EuZ7nqskAWHfd
 z3hwkCH5BfayqcOge6eUGPG+nnC7eKcz+hAPH/5J3vkIKZBWAJEXc4F7akFUArY13fd/
 F2pQ==
X-Gm-Message-State: AOAM532hZGpe+Oftn9hQBKuQuJq9gMwjtVwnLGDLDEpbC0+Cgd7omJ81
 tmyUgTchZkX53iSd5f6Hm1Q=
X-Google-Smtp-Source: ABdhPJxTAzF+ZsCghQnGvurSKlCcAC5VXcSmurHZWdAEAckdVIJIA7CCpOlnjo16UalSU1E/3TkwVw==
X-Received: by 2002:a17:906:1d1a:: with SMTP id
 n26mr24166573ejh.479.1635183386722; 
 Mon, 25 Oct 2021 10:36:26 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id q14sm9718871edj.42.2021.10.25.10.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:36:26 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v17 8/8] target/riscv: Allow experimental J-ext to be turned on
Date: Mon, 25 Oct 2021 20:36:09 +0300
Message-Id: <20211025173609.2724490-9-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 17:36:45 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16fac64806..7d53125dbc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,6 +562,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            ext |= RVJ;
+        }
 
         set_misa(env, env->misa_mxl, ext);
     }
@@ -637,6 +640,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-- 
2.30.2


