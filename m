Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpMBR-00019Z-TB
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBO-00016C-2I
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:04:50 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBL-0001DA-1U
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:04:49 -0500
Received: by mail-pj1-x102d.google.com with SMTP id lj6so644535pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+CWaIlbPzrY451DhxfSimx4EEc+YfrZK05ZurdY+u+Q=;
 b=UZUZ+dORZNY7hg4SBRL9soUYrZi/FL6QOT8HmWhInOPAmZU3SnH86t+U8k4X+o5tlu
 CtTtZsVF9PtRVdMKyFCVq5j9bSBnVYjq2j2/T3mJPPBQDB/dnunbbr2hDkIdLazXk+t4
 ndffAirt2E2frIKT5NqmK42SBqq0o71/lIuOlLKJQP77I2cfFrXBfoQamLFcVs21fKFe
 3Gzy6SbkvVMw4xKB8b2VYNK2JzbLR1MfeCeG5+vrExGJ9yk/J9BuklimsXX6uKDOBF/4
 2TqOLtuG3a0P7mJM7MZgKeQMLxQkHYvtI1ziAomMugfua5+ZHtVDVRBT1jN03ybnCDW0
 EizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+CWaIlbPzrY451DhxfSimx4EEc+YfrZK05ZurdY+u+Q=;
 b=O3TInmt0ewB6pioJK8yZjtxGj0wOMem1elKF3Ji9p8GfrZzGIM14PUwNg5xFqm4gdX
 /mmeXuKr6s2LPS6UYzU612qZyF2g2d3hWP7/qOVASHTYtEk8zaNCJ8FYtTjmDy0q4Lcb
 1nchG3xp6evkQcsysfdvF9rzbZ2MhaZQL3Xtah43aEdTAdCxWSPBCdIfvDy0Hp9PR5Xc
 CW1WUIspcTOZ5qo5RNSUOZdKhUgSmvnjo0qxw/+UMTsUTGczgdzF2yNcGno+j1SuruTG
 sfLTBheF5/q1NZQ8A1vDruv6smt7zWKjkpTIU9nuhiUnH+z8l453TGrWWc94yF/LaxSu
 4lig==
X-Gm-Message-State: AOAM531mI496xTxc5Ez0xorFz3/2EwooBESJDGtjI5EDvuFz6rzoFo9z
 RM3azVdA/dmYKX+bb8HLnBsMpg==
X-Google-Smtp-Source: ABdhPJwwQvotbGA0qJVwAgpoKnZU/WiL1oEoLFy/RNH+pNPObuWmwFU4SPlZ3UyQUgSLVJTX6wMppA==
X-Received: by 2002:a17:90a:eac5:: with SMTP id
 ev5mr1205567pjb.65.1608084285859; 
 Tue, 15 Dec 2020 18:04:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Wed, 16 Dec 2020 10:01:40 +0800
Message-Id: <20201216020150.3157-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:04:50 -0000

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a0264fc6b1..33fa112c4ac 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -441,6 +441,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -511,6 +514,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0a326c8430..4868f62f32b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -276,6 +277,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


