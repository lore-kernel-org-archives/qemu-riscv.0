Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9JZ-0001fQ-FN
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9JK-0001Zs-PV
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:34 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9JF-0002HU-K0
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x12so551165plr.10
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5HXgmt6k/G8n17p6GbhXA6B9PdJjhLw8veADH8tZoHg=;
 b=gL3moGeyO92ikwW+1bK67EMseK4g7Lgjy++B8dpDgw4guL+TcclAXkLMaz01lOPC3A
 EM0Bl/FYmAh9eHsJ2tTBRS9Nq7J/s9YWAg8/nOTbtFp16R1H8Mrjt/geeiXaASxPo3ig
 +WHW7SnAyXmafROB1ATeCSk6ZqIlH4BH8POQm6WZM+gSmzbUjqMec9R0fqZZwgfr+615
 xuO4XtPOnkqwqTTQm2VhAVfXtqMoc131CEx95bm8wy2OOlqA9d3lRx23vdROhzYvJJA2
 +Oyw5edTVPBFpmxg6cTzjNn0FKtssGoVAdYBWJDA9aepEM85JzBabWPmq3X86pgT+HvZ
 yCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5HXgmt6k/G8n17p6GbhXA6B9PdJjhLw8veADH8tZoHg=;
 b=Ql+JUl/fs0fHrTq6MUJqael7OPy6TocRQOxkdaCd7PxzWw6l5B9AWpk57hubWtp97N
 LDoU/fR19CVjGR7mrJ8kLFknKuxdhtCh+JDDqzt6zc8D6ScGZNnI7IZfw0AitXJIKoiG
 pJewKk/GpK79EuFUG/NBn1p6LqbPxyhY5NQSIDySbJyT1weBLq/gmbZorGZBINpHXAiM
 LxZv7uDJlyAsx2rp/TVFWH2ACscm/SxVHNv1xtJXxew1gkqad/s4J4vOsv0svg6adR9t
 YZrp6lBaXTdzCOQoRexIJgsFAyLiahSbpISuH/H+ndAOfJEGeKixULtdcoTAO33Hea2p
 KaPQ==
X-Gm-Message-State: AOAM531P189TnXLy9vFhe77LcPB5MdanwfmclaSBczFImEM4SPN8/lHP
 Bn16E0I4+V0nvn0qpr6nhKLt8A==
X-Google-Smtp-Source: ABdhPJxPRFrxgXSHJPrfNjSGKFXOITRVz8cNBLqDuji8QqW5oGH6KIgnJIJAwKJVM0eHBal8Y3DHOA==
X-Received: by 2002:a17:90a:f48b:: with SMTP id
 bx11mr1960463pjb.48.1610418083591; 
 Mon, 11 Jan 2021 18:21:23 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:21:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 16/16] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Tue, 12 Jan 2021 10:19:57 +0800
Message-Id: <20210112022001.20521-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:21:38 -0000

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9d..7379a0abc6c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -472,6 +472,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -542,6 +545,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6339e848192..d5271906db4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -282,6 +283,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


