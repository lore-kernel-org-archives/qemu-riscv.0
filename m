Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTgNu-0002N2-2V
	for mharc-qemu-riscv@gnu.org; Sat, 17 Oct 2020 03:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kTgNr-0002Jh-3f; Sat, 17 Oct 2020 03:12:07 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:43310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kTgNm-0003jk-R6; Sat, 17 Oct 2020 03:12:06 -0400
Received: by mail-lf1-x141.google.com with SMTP id l28so6249025lfp.10;
 Sat, 17 Oct 2020 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJ0KQb6Ozzm+TKAEStsx77t+LpGGqIZVP5UuxdMy3MY=;
 b=sz/cSqdRUIo3p9a3ARPyy1gyI3vyqOtzDF28cgOHtAMJPOj5ARvk63VBLmQEqYQLeK
 pwXyIDCfSX9y7Be0lq6EkSqvNYieh1xkNKfDav5ej7MNFaf69PfXeoG7DJL1tL2hMwH0
 E7rEc6LQIHJmWymMzsKEbIFrLvEN/lhJkGazQYJLjPBqLlSKaqqW1WTASODdD07BuqV0
 hk9Jc4/nIdWJmXYu0FcPwG+7+RA0AlFpy8LXwxha1f4dz/6KvFK1gw9PxXBvhaZ2Awx+
 OFiSEDzA4Dcqj/Vh4U7YdSEY7Zx5W2G4nHwXeukWKUJVsGZdrmdiPf2zYG73gFbwZhwE
 X0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJ0KQb6Ozzm+TKAEStsx77t+LpGGqIZVP5UuxdMy3MY=;
 b=PggjKgQIL/JgnWz0lyMsNJSXdgHEZ+9FKIvYqIdzeyIA3sjrF7BdlIsHk3z7TF0FFp
 mJa3uFJs4DsxhlgXyK2UIUmVcpbgVuzMFvH1Ib89Zjh022VlYbTuiqTusE65oqCSMgUI
 kT8OYIOEAzZcwcU26SJFZDLo4wzcu0L4w+/8QyG0hTka7JWmICXNvV4tZq/7cDd1QUbH
 fwdcxXpM6NMtkW7fkAN0EZOM156pDG5JKQucJmE/pnnvYUHEpuxCjMWzrtELCiqv7IQ/
 yi9XM5YE4/XGxfxQKT4deSq395H7+rXr2ZdQ8dLjpYYgVI80wBjouiBhJ7sf/P+oK8Dj
 ciDQ==
X-Gm-Message-State: AOAM532C9l02seOjytIMHYeZwhpkVwZdpLI/D86kEqE+PbPGfpOxzJsP
 Gaqbp95zK86r57aQZIRbT5k=
X-Google-Smtp-Source: ABdhPJyqRAdibYwDaLFbWrD5fgNcWEJuhtqfGMQHIDgJHRDawu9OOBVOuDFnLjPjYI6nvur73xYBEA==
X-Received: by 2002:a19:e014:: with SMTP id x20mr2566022lfg.444.1602918720007; 
 Sat, 17 Oct 2020 00:12:00 -0700 (PDT)
Received: from neptune.lab ([46.39.229.194])
 by smtp.googlemail.com with ESMTPSA id 184sm1626905lfh.232.2020.10.17.00.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 00:11:59 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 1/5] [RISCV_PM] Add J-extension into RISC-V
Date: Sat, 17 Oct 2020 10:11:50 +0300
Message-Id: <20201017071154.20642-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201017071154.20642-1-space.monkey.delivers@gmail.com>
References: <20201017071154.20642-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 17 Oct 2020 07:12:08 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0bbfd7f457..fe6bab4a52 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_j) {
+            target_misa |= RVJ;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -516,6 +519,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de275782e6..eca611a367 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -277,6 +278,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


