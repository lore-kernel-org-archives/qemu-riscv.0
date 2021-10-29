Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNjc-00045m-1Q
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 04:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNja-00042z-UE
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:34 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjY-0004ST-99
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:34 -0400
Received: by mail-pl1-x636.google.com with SMTP id l13so1370013pls.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDvZee/yESvgDMFWBKfYgPQyqTksnH7apcoJubEpldo=;
 b=Zkjsf3P/M7xRx79aruvUfq83PvhfLpM2r5xsInR8QKht+jPxuv/UEW+MqQ3Rg/Xqwu
 mQHq1zZ0Z6zvAYTFtOjccgITC9J3b/++Me9ZB/Sh09Fq0GN4B5EcuAmBwluqVkyhZEZi
 91w6eTQHOjVZwHHqhfylOKtWQkWWWsSJMUNXr17y+8iTDtvT8rzBhAOwTqvI43tO54dR
 OKvQ1PTosbs4DsiS6DS/9h+jkdylSPdiQnIKqhyNlu0dk2sJVCxpQr21WDnovWTXQFAU
 qgSeYDXkQvE8DZdJ4/OVbu/JA47ysxysqelj5iAtH1pLJKFWiJsayEsu6SRjtvjGKNVU
 V1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDvZee/yESvgDMFWBKfYgPQyqTksnH7apcoJubEpldo=;
 b=WJK4+12kjESu6VhwGeKdakmnoz5dLuchk9iTserr6Nm+8LaNOfgS1TkkcYMYA73fBJ
 hiQB7U1ssBcDTFoWH4Xp5LWRHZRp9Pd4X6egRxWCslMrktOFdDNf9RZwx9UlK7t/sjFB
 url/xGLiEx2fFYNePO8ZA8T31r8GCr+owr2GEa2GJWfHdoH+9YA0dhGBTc30WbXuffns
 m7LY6Ld9inW8kRVOkMOcti15VXCCFw7mUa+5k9J1yBUnDKhnLqxoHRPjRCzozNcTYrrG
 4yhm2XWBqgFI3ISdV/vuZiy9NfxKfqkCa1Xr/Cl2rxv+eRbVhIVUvnhVsOxeyXrbGPe8
 P58A==
X-Gm-Message-State: AOAM533cpnAwULqFePtoqYgGNJs/yAKx9nPoqPR9N/BKthSjR0km/Vuy
 k8FD2kWJi0X2zjLoMhu55L+DP0XEYVhiSadO
X-Google-Smtp-Source: ABdhPJxEMXlCq408tbWtVQVHog36UEJcl9K9Llk3N6F2POnRi83PK2CqsDe3k2hNTFRwbzNmvmjFiQ==
X-Received: by 2002:a17:902:e844:b0:141:72c0:c5e2 with SMTP id
 t4-20020a170902e84400b0014172c0c5e2mr8526115plg.10.1635497970994; 
 Fri, 29 Oct 2021 01:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 01/76] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Fri, 29 Oct 2021 16:58:06 +0800
Message-Id: <20211029085922.255197-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 08:59:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


