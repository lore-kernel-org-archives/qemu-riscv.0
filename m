Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsco-0006aL-7z
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqgJ-0006Yp-2w
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:55:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqgH-000776-EO
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:55:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id s26so2389999pfm.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C1U8Izc0b3t3sXzcooCzT3Y031BGcWH4g1HXYarHp70=;
 b=QCu4nkqwSNQjO7B7PB/9PqqSLZPJs6G9pZOTH7SVhsE3k090cyi0KwPRIB4Sysbnk4
 l1cbuq4PdsEh+5l8HV1lcCkf7RU2AgOvO2hWLoylw/yaUM7aEpmNwf5vVLsOQiD72M7T
 uICYQo5nvJKzekltVTXvkJ1ksxRKxadjYPW5gHIYWRJ3fX+ceUDkiPQBCRveEmSTibWN
 yRn92mgN9BammY2h3ufW+5zpo5D6HfcSlRWco1ZeWx2Cs9L/HgDO2pVfsC61tR503jJ4
 WV+x5b+WlQeCTO3LjjT01NeYVQtqcEtf1J93IY9BaQPeAcen5kIMAafGVAxcRp8LKGNo
 ibMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C1U8Izc0b3t3sXzcooCzT3Y031BGcWH4g1HXYarHp70=;
 b=Hgw8beT0ugjEffvzFB7aWbMSZc6pL/vaDhyI9WIcxbSgxnowjHEXiiXYm4X0/b0a4O
 nCSN0zTEW/aF7u5tjQaM7Re5BqSquy30GsXjdCSoa7ehYPw5/V/dYDunBkJMnwDvvMZm
 8w7MPpP4zUNaHrz7DuXUmd5d2srTW2slZnC3YDfWht/FRru/djnqEd3j5Yb2gH7UbqPP
 MrxGTqeE5TKhK77MNE9kVJ5PGBZzMn+8gkSHpy8ZREuhtm6GpO4lnCYkijUKHkXAE1GE
 wfBGPXxVVccTzHDHV9+zymkXHsnfox0frlBw9/ib/8xjvpHu1l+98dJsVl87N4es5inU
 500A==
X-Gm-Message-State: AOAM531/Et94p5kzyX5Ayux5/+e9a9rQkZU13ULOHX0PN8joIU86dSin
 FdfYCd6DSZH4DJDilAle0z8j9w==
X-Google-Smtp-Source: ABdhPJzJNWZNMwAhyvn9MxbO2+Q2/9fpd0+JT4V1jb1eG06ED6ktmTLisBlYZfVnaKNXiIgthPFQyQ==
X-Received: by 2002:a65:4502:: with SMTP id n2mr46508147pgq.132.1594378500297; 
 Fri, 10 Jul 2020 03:55:00 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 65/65] target/riscv: bump to RVV 0.9
Date: Fri, 10 Jul 2020 18:49:19 +0800
Message-Id: <20200710104920.13550-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:55:03 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 871c2ddfa1..6168166e64 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -340,7 +340,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int vext_version = VEXT_VERSION_0_07_1;
+    int vext_version = VEXT_VERSION_0_09_0;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -456,8 +456,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.9")) {
+                    vext_version = VEXT_VERSION_0_09_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -466,7 +466,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 }
             } else {
                 qemu_log("vector verison is not specified, "
-                        "use the default value v0.7.1\n");
+                        "use the default value v0.9\n");
             }
             set_vext_version(env, vext_version);
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b4a370572..18015f0bc0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,7 +81,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_0_09_0 0x00000900
 
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
-- 
2.17.1


