Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKOyB-0001JM-9R
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 13:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOy5-0001BV-LY; Sun, 29 Aug 2021 13:51:41 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOy4-0003UE-0i; Sun, 29 Aug 2021 13:51:41 -0400
Received: by mail-ed1-x52f.google.com with SMTP id eb14so8863863edb.8;
 Sun, 29 Aug 2021 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYaQSFXh81moKz4o0w9zKrGkg1pV7w9Rsua2NZcVlho=;
 b=BNCXVoBoGQ0ejMP1h45/MGf2CX3RSGgA0KMz02ygWpkcCDh/C0LtoyrlqGTmYS3CGa
 jeG/+i7YHiZcamMd0BBNRU1hmHcJWGhHx/EOI1OUVU8e8WodpTjVkNSlSjwxH1V3csYW
 tJMuUuiMQKd9DVc1xfa4ISIFeL5dSAlQIArDsfiSwW4BpMe9HLN+X06U7mJwTfDMGfeP
 oCukUScs7GtgXvWfH/G9xxUUKmOemCfSMhb7rGUXfPogKd58lr2WAbxcCAPRsStepRg2
 Lo6YEiVXGqPt2UeHI0vIcFTvfr7asQ1SGM0KbIww6SvimJI/e3jcc9LClplqBoUSmYJ0
 C4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hYaQSFXh81moKz4o0w9zKrGkg1pV7w9Rsua2NZcVlho=;
 b=AtzoJWavB/qt68yC2x4YFFgiCiLVoF1L2Rr4/LhMaSi/ajQBh+QAG4xpOpTDfnqVH/
 3fsBE7GZiEYK7MIkXt0ihD22U+nyU79OxZIk9BCxQ/F1nW/jMGorIbHnk/038C2wpo2d
 FBXEtDFKQa5DcVlLoKUNzA+ACdYmyWYSgkTota9Yd2eZQIXPs7XzjQXvabM8tWQUKjWI
 mUDkdSv9fTHmWwgg7qnkC7asnexOrRUaC90uz96YyR2qvJ4zEcwvH/LIlDz8RVgxo+Jb
 a0cBVcnnLiMgStOVWTa+vq3Q/ZjQKOoYrk65iBgwBWvdNFmfD16wozuIt5xRRVyFCxf2
 fXKw==
X-Gm-Message-State: AOAM533LuhhU8dFImHlHlvJS5TlNA6BSwnTXnlIgE2S2HXUtC8lApgnK
 IRJEvvi5A4W+mBkLdYZG7ks=
X-Google-Smtp-Source: ABdhPJzedggtA4fpOX6TJGO0Nm0t05OU0WtUG4c0g4GS2w1/gI6SnCu6TQRd7lNXFDNtj+6hdRXjRw==
X-Received: by 2002:aa7:de16:: with SMTP id h22mr10712009edv.3.1630259498252; 
 Sun, 29 Aug 2021 10:51:38 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id e22sm6564361edu.35.2021.08.29.10.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 10:51:37 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 7/7] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Sun, 29 Aug 2021 20:51:20 +0300
Message-Id: <20210829175120.19413-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
References: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Sun, 29 Aug 2021 17:51:42 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ab8c81cb5e..fde96c21f2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -583,6 +583,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             /* mmte is supposed to have pm.current hardwired to 1 */
             env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
+            target_misa |= RVJ;
         }
 
         set_misa(env, target_misa);
@@ -618,6 +619,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
-- 
2.20.1


