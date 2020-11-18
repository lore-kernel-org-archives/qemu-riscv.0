Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfIuA-0002mB-US
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIu1-0002jr-Ev
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:21 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItx-0004uv-PK
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:20 -0500
Received: by mail-pl1-x62c.google.com with SMTP id 35so581678ple.12
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MgJNQhLt/SKFFCYwY2lhOXrS0IzY7NOkAfWFLkGpiVU=;
 b=LxydiKLQ/HeaeImgKvSp1Iyw9CXOpcLHye+GZ4Fi8AJnBhtjxj1Nf4RWFjYvCS83mB
 JtX5K2uAOcaVRInFdg5T403WxyhPVBpXW7HB4Mvl+wew8Dol8uzcSoLH+DQZrHIvPErd
 KNhLN+ki7xvR2LjBpV9KIIYLRBwQ6H0mGhjCq5thJ90aQs1FoxxxcsnEZG0AWnVZTML3
 aMeYkvSMsd2wOgq3QO9k98Df+l+L2eTrrAIJRC4xfwvdQ22VWXXtLDGpE+qtXfJkqqxJ
 FJgSwBM81XRtb7E4pmnRIM21akUJGau4o7SZAFNc3cKJQIwiDtqvihO928kPeC6N2H/S
 FyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MgJNQhLt/SKFFCYwY2lhOXrS0IzY7NOkAfWFLkGpiVU=;
 b=AfOQsCIoSCTYpilqX57gFZGeepm7X7SWS9tVK2+lfFRJPtm8VmOdrsfKQ6McifqEl8
 uyzmyD7q7lgKj2DlfEg/H5jyLp+4RvCvoqfwHv/bLYRMt0nxZRXJb8PEP2a3QzWzO5dW
 T857Ij0tLdcUP+4UNGEQiMkcOeiAGBxyZwhWiDy9eAfxELuZWkWyhxQJlgyKokNoG2Gq
 o3uMvUCBMAWHtI+GPmb2tifCSnPZ4On5pIWSz9d4ifdD59HkC6keTof+aymdKfxeRUDj
 Zj+9apdcQp5yZtRm1lf6Vvs62NWZ0n2436kKhiYR3KakWV42JMalbc5faulvu1mXdfzM
 /YWg==
X-Gm-Message-State: AOAM532WRgB4Qy7dhCMALvXvJxx1MHlJwwLBioWQKdadjSe7o9BVphqm
 Xua/aIR/hIN3J+2wd6uKqcR8Ig==
X-Google-Smtp-Source: ABdhPJzCu1wvW/c/by5tkKkFUntMC+WVL3kKH5gk0Ieg0/vFRT5M3J4oYVPVsMSKxU/q0MThlNfKfQ==
X-Received: by 2002:a17:90a:de89:: with SMTP id
 n9mr3050085pjv.224.1605688396444; 
 Wed, 18 Nov 2020 00:33:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:33:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 15/15] target/riscv: rvb: support and turn on B-extension from
 command line
Date: Wed, 18 Nov 2020 16:29:53 +0800
Message-Id: <20201118083044.13992-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 18 Nov 2020 08:33:22 -0000

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0bbfd7f4574..bc29e118c6d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, true),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de4705bb578..c1c77c58a87 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -278,6 +279,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


