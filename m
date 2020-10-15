Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT54j-0007LD-8p
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 11:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kT54h-0007Gr-D7; Thu, 15 Oct 2020 11:21:51 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:35983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kT54f-00060E-J5; Thu, 15 Oct 2020 11:21:50 -0400
Received: by mail-ed1-x543.google.com with SMTP id l16so3519930eds.3;
 Thu, 15 Oct 2020 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aJ0KQb6Ozzm+TKAEStsx77t+LpGGqIZVP5UuxdMy3MY=;
 b=OXVszxVLFimgwpIqc1n0s1xqtuShZsq5Xrpbqa/ixMYQ/4Ow2UfcRIVTYuTWNZ7D7H
 g937XVt7oSZHMfzBC84e6Uy4m8iIb+m0b6Z+OB+tSacT5ZAe562W6qF0wBaDli22rVkM
 0fIplViQQ0L2yy7U4MsCu04UZ8bY9cS9VjDvYlc3/SuN3C8GRP8R13sWAuhdyxJI6Bxx
 uc9VQQfWzKC9CHOiw5fKW64PyQ2qcZQ6pOaYIf0hSvPMlYrNfzZoMOOnk4HCBcTljtP+
 mcLYlGzSDI5rueElXo/JvE7n9QUK0Ijp7orF4WsicfeMcpA8BNaqUHlTb+Q/JniSjx3r
 iL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aJ0KQb6Ozzm+TKAEStsx77t+LpGGqIZVP5UuxdMy3MY=;
 b=r8QZlKDrgVE3zqOPSGbgR4xFStv43RsQe82ozMVwfk7T5Eu8z7n3f0o9yOJsTZOyLb
 Z1V+/fHsj9vD7XMWVFA47yC+SaAeZi004mjSzU/EAD8ZCe4v0uLfgM/9vaFtn7vZJ+31
 Z3HNrL+Ok9IvxK1W4SU3UeB8UBlX993TbVTxec3IZs2xhbuSNSIPlNUrTGVJt3QBoYKj
 jAPZG2DR7Gea/ZAWbTtnmOmEJtBELc6VD/LWBFY/RJqcZsL+q+iu59TDNOSlNTnxkVA3
 +wp4I7aT38dNluF3TwIF2i7jOUxYCUPL/X4PMeu/eRQLTkDv/1uDqRTEZXYqU6WzHM0Q
 iI7g==
X-Gm-Message-State: AOAM5331+WaosFqm8pG6GEgVGmSpUs/57fHf20ipv7PFHejB2kRZYo/w
 tCD1ylneW3DBb1RBIOZSnds=
X-Google-Smtp-Source: ABdhPJwjOE6fLykMsgqYNOifFoQZHHMaKuXVXgVVJtsxkKgnimUPMRtS4MdkOFb6f7NtaJrY19SP6g==
X-Received: by 2002:aa7:c948:: with SMTP id h8mr4691523edt.171.1602775307533; 
 Thu, 15 Oct 2020 08:21:47 -0700 (PDT)
Received: from neptune.lab ([46.39.229.194])
 by smtp.googlemail.com with ESMTPSA id i5sm1819539ejv.54.2020.10.15.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 08:21:46 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 1/5] [RISCV_PM] Add J-extension into RISC-V
Date: Thu, 15 Oct 2020 18:21:35 +0300
Message-Id: <20201015152139.28903-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x543.google.com
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
X-List-Received-Date: Thu, 15 Oct 2020 15:21:51 -0000

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


