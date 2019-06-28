Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul9-0000Pc-O6
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukh-0008La-IK
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukY-0000K5-Mt
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:34 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:40096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukY-0000If-Ee
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:26 -0400
Received: by mail-pf1-f178.google.com with SMTP id p184so3324155pfp.7
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=CCTUA83WsmaGam2XV7hw8vEWvHgX2YXg8c48BvbdAho=;
 b=VlUOPmuIbfwvW45XgQ+sT7s9Ju0zcjn9d7nvAxuijslpDL5PoT0L0dJhK3GfNlue5o
 A8LD1/soPvF/6OmF1GE6yTJFbBfJ+YJkTDsTty47lXjOW2J/BtBYFdV8Hc71QN2plSAb
 LqeBSq3bnsboxkxQUPdVrtcUgqFGZs0O1wOrQY5XJehyODBPrM/PMmNwGKtVCKro1Q3r
 EmatV1oPG6QNNQmkE4bmmv/4Bgr9C+xnfv/QxYcn/dWOF91HMpBj+T+FhQX2gX33JY1u
 RlxTSHyovF1FgBKp+97gMIUdF3wYluKSk9X81k3wBZtof1C4VW2D0T0tTW5odfAJxDhf
 4fcw==
X-Gm-Message-State: APjAAAUy7E/iIezgf5srL5Q9UVLBEfBSz+/3JP/TzQEHGzNmpihIDER+
 KQu0GO/IEjwIgiAkxXgDvJinlg==
X-Google-Smtp-Source: APXvYqyjebOnfjPvXX+QHILdKfDk4xPc0WaY9uOOJ1IZpiws46erv+8vmIkfOQ4i0M6fg8lWf9jhqQ==
X-Received: by 2002:a17:90a:2562:: with SMTP id
 j89mr14607457pje.123.1561743205281; 
 Fri, 28 Jun 2019 10:33:25 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id l13sm2470753pjq.20.2019.06.28.10.33.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:24 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:09 -0700
Message-Id: <20190628173227.31925-17-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.178
Subject: [Qemu-riscv] [PULL 16/34] target/riscv: Set privledge spec 1.11.0
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:42 -0000

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


