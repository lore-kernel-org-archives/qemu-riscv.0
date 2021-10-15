Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHvW-000554-HI
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvS-00052N-O0
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:46:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvR-0001nw-6L
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:46:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id g5so5894834plg.1
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bscApJyP0qk8vQLzbV2z2IMB4KhdiKcUF9p6A2PbLSg=;
 b=eff3nQR6TR/SdS35rFfFZJNPdLI4ZtBjm2ZLUobIxL4+Lb85vA4m5hHQs3qXGiMWHu
 X8q91MLhul4l4V0myg/+XaUdVVwdF0AvnFxjpit4UclG7cF2qRbqdrYCSZHNHKj8D48O
 L0ybSqPnokwTFVhjsGV5bcdGa4HxLaravq4erbWSBietnnrWBxZHMTnQkpB0zPfu0QFx
 QUh34WqRV3RVEm8NQrIBgprsTe/VwagEXkJGUOsWi5eu4H20Q5sjv6D68KvuG7/Gq9iv
 uUJDDbxzXF/Z/swOmht8BjD1afTNxmTSzgA872IN58DK4PbhodbDvcrIUzIiauAJszMi
 yPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bscApJyP0qk8vQLzbV2z2IMB4KhdiKcUF9p6A2PbLSg=;
 b=hk6+bOSRgOX37twBUaBr8G2JY8fCv2RUPtLu41pS306A9GMQKv9AuwWpGdISkVT1lp
 Memb2HyMkhvmIhZrfQ1Tnkt5DGBQMSWL8IMvY2QqmD09aa3/NNIeffcLIEijyVXM+m+1
 KA0BWlfy7b9KbTcLEWMGgXUfZLfjo0vNbWFUBHSCkXGwAFnqiFibn08WXXjyv4ws3KS6
 vl7kKaVKcXG6glRlh4MrevyA50lregJDhknv7NEsf2swVi7ymucbn/g6UO325iwlHfmX
 74ZBjeAlz2QGNLTRnZ15Ng3t8U1kVkKw9sohMF15HzIFdWNPXvCoPSqqwOMMkHXOwwU4
 03fA==
X-Gm-Message-State: AOAM530k6N0Az7ccZwgqluGSuVEBKKlzDt4KvRmE0A4vgoe6YLilOz0L
 wb0AbZe+gwK/uHgpE936hYxf/w==
X-Google-Smtp-Source: ABdhPJyBLGHniHUTDpERmMDJJP9rMDbmB4EnpWztHzQQT81Nzp8Ke2M3EdudJL/SidMU5OWP9bzu5Q==
X-Received: by 2002:a17:902:a406:b029:12b:c50a:4289 with SMTP id
 p6-20020a170902a406b029012bc50a4289mr9688622plq.56.1634284003476; 
 Fri, 15 Oct 2021 00:46:43 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 02/78] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Fri, 15 Oct 2021 15:45:03 +0800
Message-Id: <20211015074627.3957162-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:46:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 89a612f7606..36448e61572 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -492,7 +492,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             target_misa |= RVH;
         }
         if (cpu->cfg.ext_v) {
-            int vext_version = VEXT_VERSION_0_07_1;
+            int vext_version = VEXT_VERSION_1_00_0;
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
@@ -517,8 +517,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -527,7 +527,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 }
             } else {
                 qemu_log("vector version is not specified, "
-                        "use the default value v0.7.1\n");
+                         "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
@@ -591,6 +591,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     /* This is experimental so mark with 'x-' */
@@ -599,7 +600,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
-    DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d63a08b6e4c..8ded9da5623 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,7 +82,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 enum {
     TRANSLATE_SUCCESS,
-- 
2.25.1


