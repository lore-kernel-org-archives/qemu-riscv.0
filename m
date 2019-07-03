Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaq7-0006ML-GA
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapk-0006CQ-6l
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapi-0007HC-KF
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:44 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:38471)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapg-000794-Oa
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:41 -0400
Received: by mail-lj1-f171.google.com with SMTP id r9so1476470ljg.5
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=CCTUA83WsmaGam2XV7hw8vEWvHgX2YXg8c48BvbdAho=;
 b=I8wwKVQi4nPDvxOnZJRfJ89by5/P+tzNXoQrbFFROAOhQYdhjkFDWdd9rI/4ETtZCd
 N89sWezq9nQng6sb9BQusl/q/1J1t5jpxYc+2ndftGk0BScOD0wQ3bgPGdkNpE44gmxx
 Q9IMDqM7P+fExXrhe9Hgt+oOKT4+Rwhl4nttEvOyCZObq9l45g1quiWQABfa/DP3AO+C
 EHGU+ABIRsAksMHlIA17pvT5N/V5RA0tz9P1uR1EF0AsnosT7jYK9PTJRaBgkd8lOHNo
 PtUZhNVsColebuEXE7HBgb4LzKNTTe3T/oeP/vo9bF91vIXeQ4jQQ+E0oFSh1x2pYGMt
 dkBQ==
X-Gm-Message-State: APjAAAUIHNtjbXF4ciGoCG/BoySQrFIxyhOr+yFNZOYywP278QzGmc3Y
 TvDtJMaD8DwMs0/GBD7yBytFCQ==
X-Google-Smtp-Source: APXvYqxGJt5wVKU0cwAAl9cE8Cx+R3FTZ4xPgJuQDOa8Oo554v/Gj4878RpUVq7nN1j5ceZqq0jHLg==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr20205143lji.223.1562143298179; 
 Wed, 03 Jul 2019 01:41:38 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id v21sm347593lje.10.2019.07.03.01.41.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:37 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:32 -0700
Message-Id: <20190703084048.6980-17-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.171
Subject: [Qemu-riscv] [PULL 16/32] target/riscv: Set privledge spec 1.11.0
 as default
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:56 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Set the priv spec version 1.11.0 as the default and allow selecting it
via the command line.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 17467c3d8705..ba1325f43533 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -111,7 +111,7 @@ static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
+    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_11_0);
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
@@ -316,7 +316,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    int priv_version = PRIV_VERSION_1_10_0;
+    int priv_version = PRIV_VERSION_1_11_0;
     int user_version = USER_VERSION_2_02_0;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
@@ -328,7 +328,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+            priv_version = PRIV_VERSION_1_11_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.9.1")) {
             priv_version = PRIV_VERSION_1_09_1;
-- 
2.21.0


