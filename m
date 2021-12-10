Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvamO-00031w-5o
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamM-0002y9-VT
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:19 -0500
Received: from [2607:f8b0:4864:20::42c] (port=34639
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamJ-00069w-D2
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:17 -0500
Received: by mail-pf1-x42c.google.com with SMTP id r130so7804392pfc.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qZiSxwykrgxZoHHJ0AJItFxXzk97/oz7gYiyR8owLFE=;
 b=PPf4H7V1UCBNJDu3gl5gU07+7Hk10xBJpWUKzESrHNaqpHppZ4YJD3l2BjZR6ZC/xR
 OoMftb6QKg9sdeTlY7TJlYRnrnKneQUm/8p67ZfLSHveRZpfQ6CgSDS5njutE9zro0XX
 mHHSM3U63V0AuMJo+4OMvdse7ZFi8vZ1RTz8hGDDAFsj1PUB0jKI1yzI0BVzsXGVT7Li
 JegJq7yu7OBogWXxb7wGJILujnOZMt4L2sO58Hdvh/tF9FylwFcdagit3J/ScV+eUEaW
 KOGYSfEQgsecIeF2HFVn9TEghFJaOtaZSuRjtm0NAJs/CoRlhOpBcYdnsBiJ3+jzVtoj
 6YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qZiSxwykrgxZoHHJ0AJItFxXzk97/oz7gYiyR8owLFE=;
 b=A33Zg3gVxIt4dR+PGIo00WjiBhzgrth3gPh0WxMDwyi/G+2WEgu1T6q463VbjVj2u5
 Z7y/txcjxcAQJAWKm+a/z3Hu1Xp32m/DN6+NqY9lsqMk7HCIrRBpM4lMOy5UV0m4+R0u
 Tp3FjGoiXb68wOSyRTxCwcTUXnNwGOOpyVyyHQYR7oPRjuFsdnTaqxjz9pY6lP4btulB
 lzwy+iEF57L5OexVHrrUSeyNQEFZ+P/jxMX86p0IAkx2POpUzLQjQrFZT80Ovyho94YM
 iQ8gqCg1XAJOeJJV6bWQq7b1Kvigyqtji33oFXypVpf85PPp5drcrSi3RO6W+DB4WcCj
 KXXA==
X-Gm-Message-State: AOAM531BQDexYtI7zk9LO1VPsE4lB8uuoLTAWG6IxrtdeMbdNwYz5QIu
 ANQKBNR3VN1J3n9R7A7GaXt/AA==
X-Google-Smtp-Source: ABdhPJywsBv279Sh383CSoIPTQaNRYW2A612/priK6P3T4cI4webgVh1EnSgZnsN0qfRJ68uT7K/DA==
X-Received: by 2002:a63:7e0d:: with SMTP id z13mr37462961pgc.349.1639123034060; 
 Thu, 09 Dec 2021 23:57:14 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 01/77] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Fri, 10 Dec 2021 15:55:47 +0800
Message-Id: <20211210075704.23951-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:19 -0000

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
index 9835829588..728092f78c 100644
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
index ef677f9092..5ea2004ae0 100644
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
2.31.1


