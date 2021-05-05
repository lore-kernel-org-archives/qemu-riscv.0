Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3t-0006ax-KE
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3m-0006Wi-M5
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3e-0002jx-Q7
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:36 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so1099389pju.2
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MbUS3FHXaTjfTejD26jINumm8NjBKbn09fwRKpQblAw=;
 b=eiGK5FRI04TeEes6Szi2hA5iz8ACryGxY7ntsqmtV7tYPeuC5a7xazXIRTFOan0o6y
 b2qcQbm8RdUbfFcsC7PiSWuscTpEs1rRFFIdrS4i0QFUX2+VOb4ZTt+CwlrsuzV6//R7
 Qqnr3y5xZomy543S5jTvncgH1HCaT5d/2i6owwMEJ9MAu143a6tUMTxaqjjxMjoOCFGJ
 HKjLT6BtUAKPvE+WhnIPjvzqGw6t/WmMrztwcd2BAvp93/D4O68IpG8YHr6PluX8PI1d
 W6Zmfwa/H7bqDCzpNFaZ5wiHHo21ihqG/lXbRqkC7kxz9v+E3+iIXC9OdEwBP7hhU64e
 jXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MbUS3FHXaTjfTejD26jINumm8NjBKbn09fwRKpQblAw=;
 b=MNig4sqmU0gIcISDBYejZLyknX8DbbepDNnHWIo8IiYo3mhB9GymqKEA5KCY0UiBd0
 ZciPNyvDk6rpCphoo/DAWwQxfQ6Y8GtA/+wn/cRFOuxkLsVqSF07LhDSshWlOl2BP2QG
 vM/7hUI89Io9mDAvcGFs2NB1RSMlixkRKeoNRRVUffTTh+Z2tX/yyEQWZwl6bd8j0aAs
 qQT3FatRv7PAEDPrV/7nLLBToCCs/5lw+71uHddXxTMzOfa9d83fFt6BsbbKr9EPHe9Y
 OrkkssypYBj5d5wVW2UDd5GaIUnawyQmnbHxSR74lhk0Pd3qmxSqzWJsGa5FgvCG1uSv
 m6UQ==
X-Gm-Message-State: AOAM531bL+hrtnE1aK5WUbkgsIaKhf/pqGO99AI7B1b8tsVS6eYQ1Dp7
 1lQ8Nm1nzQ4uNK36KME2Yly6RyY1NS0rvKBo
X-Google-Smtp-Source: ABdhPJwi9ss7vhg50XDNQ4GsckZKzBg2u4ugODOLs9EPrbQEJw2ofSHUDpcUDkxQHuzSUNY+uTAhFw==
X-Received: by 2002:a17:902:fe98:b029:ed:23f5:7d54 with SMTP id
 x24-20020a170902fe98b02900ed23f57d54mr32388707plm.57.1620230846721; 
 Wed, 05 May 2021 09:07:26 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:26 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 16/17] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Thu,  6 May 2021 00:06:17 +0800
Message-Id: <20210505160620.15723-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 05 May 2021 16:07:39 -0000

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3191fd00822..1b3c5ba1480 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -486,6 +486,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -556,6 +559,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f95bcbd8e10..3cea62cd4c4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -284,6 +284,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


