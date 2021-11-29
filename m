Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWxS-0000HS-Nw
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxQ-0000Fg-Nz
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:03:56 -0500
Received: from [2607:f8b0:4864:20::630] (port=40579
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxO-0008KQ-Kj
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:03:56 -0500
Received: by mail-pl1-x630.google.com with SMTP id v19so10970020plo.7
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3TRWsOcV7rG4/VC+b7EShZkWEAaon2atmxtcyuwMqog=;
 b=jBRakRSu6zJcFKiVn7ZMV0KqnppWaneNHXJNaLF1cjWXoQMxnj73xXBLX/j3Yj5bW+
 NztxGJr7YGZiZ5jmr3Z/UqdxGpTqkbqf5ePFapTMGA5uerjujyL6SzXRO5Q82Z/jllRb
 a72hkTNxg1Npf286OLGj0Lh1MihzTO6MuPlzhanT5QCC6eQFmDY+2QrHKcqGL1SzW5ly
 EsDJQaRCO0+6BCkvAd6ersapTyEpLpBksMFaO8KbiiRxFiMO1lJ1fHKhCln03/qPa0Hf
 YmrWRbUWD7iIXLGw7iCNOs8N+AyB9CnvVyiXtSM39O4IdiqBkBz1Olz1+0oxJfdTdyIz
 Bi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TRWsOcV7rG4/VC+b7EShZkWEAaon2atmxtcyuwMqog=;
 b=G6iBpJG5nUCKJ85c1gzc9OxbvhKrp54U/3k2hXbJ5ttvXseG7F+hy6Fg4UmMn/Y9tw
 1BMjiQFwQY/9YQ8jhcj2CPYhivehdeyD8Nucyfxx5IQQthcafs3wO8YTQrBp8YE4Fqav
 +p2FqLCOTY/lyRNd0d3SMo9Yqi2Z+Y9l0A9XB+W9RSUmiNS8y8ai8Yms0hIRPNeq0Fpl
 P8rsB6fk564Zw1DPnqciEQUSZjhQ/EvXEgZkSCYlLq/V5LiBvp5XZB6ws+4ZU+DrD5v+
 FiyQ52OPtv0ZXojqozpg/fne2aXC8NKVGsUcDIxtYVCA8VLDQqymMc57zOHKqsg3TwXS
 3qTg==
X-Gm-Message-State: AOAM530qe0xnk4/8tgdkFyfQ3mES6TaF+zzHy2Kixl+DaBKhiFy8YGyn
 ZH4MErVqjBYqSOnNx2+so5ab6Q==
X-Google-Smtp-Source: ABdhPJwt2E0wRBLGd/BNzYkQmMMblHJQlNAkQKw4i6kZTwvfc0EWv6kNFIdQcAFN4HUG9v1JYdsnCw==
X-Received: by 2002:a17:90a:7e10:: with SMTP id
 i16mr34556421pjl.185.1638155033112; 
 Sun, 28 Nov 2021 19:03:53 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:03:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 01/77] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Mon, 29 Nov 2021 11:02:21 +0800
Message-Id: <20211129030340.429689-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Nov 2021 03:03:56 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 target/riscv/cpu.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f7fda686863..c760ea08621 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -523,7 +523,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             ext |= RVH;
         }
         if (cpu->cfg.ext_v) {
-            int vext_version = VEXT_VERSION_0_07_1;
+            int vext_version = VEXT_VERSION_1_00_0;
             ext |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
@@ -548,8 +548,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                    vext_version = VEXT_VERSION_1_00_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -558,7 +558,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 }
             } else {
                 qemu_log("vector version is not specified, "
-                        "use the default value v0.7.1\n");
+                         "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -635,6 +636,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
@@ -643,10 +647,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
-    DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef677f90922..5ea2004ae02 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,7 +81,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 enum {
     TRANSLATE_SUCCESS,
-- 
2.25.1


