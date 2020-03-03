Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmZ-000611-Qh
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl4-0002xi-UZ
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl3-0004dA-2A
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:02 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vl2-0004ce-K5
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:00 -0500
Received: by mail-pj1-x1031.google.com with SMTP id 12so536651pjb.5
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Kl0RWvUMkBe+VYlgiEkGt81O6Pkp3L6zJLT5spvKIuw=;
 b=bJBQgFqt97ZdGncAuZKbAnzA5hvv9AdnbySlcwxoPGz0a69LG+ay8auZTf5d1S4fPs
 PJ4Yox0PKIGLMi2CZrz4AyAcwlZRjFsSjYOuyiib7vhyV4a106iXuAdFPNWfT343jAc/
 W94EAAuj0rALw/W58dKtI0GwdSku9RRBeMmQszauIh2llw1FFlz9F611OQZZuHWYNs29
 myj9l8SG5UGACvn/77HkGqGYI2VWE+SBa5IY3OvM4UbHyEpMN/jE/MTEv7kG79lzcwa0
 D+6vR/MWQVDnXC546CrechIz9Hq+v873jbjupswTUUUGdwoePU/sp8VqgOuc7RulhIU7
 4lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Kl0RWvUMkBe+VYlgiEkGt81O6Pkp3L6zJLT5spvKIuw=;
 b=EzaswmgoYD6zKtFx+nHWaYGEfkfHQkD8jmP/0Pu8yVRPVmeOFhbYP1bcE6TvV+cIIH
 2lDZVH5mGSMafd/lzNmt5OnuG9MU3t6POKu7lzP3K0FDVMzV1HRelh2quwYsJdzBE+E+
 qugRBrD1bwCOBdmI+VKPr+n+34vZw7s7+/rSqY9g8yYPlDRhIOlHWW8p/xUXvdVJ9kVj
 xBGHmBM3gd9Ot1nkMfkygxLhHvMTTThBLCTjW2aKZVi3xoRwd0TkwbGipTV9aTTr1AOK
 Y4gZGoZW0VkzP5kx2kgy8LrO7hZiYEuFDD4fSbMg3D6LBY3KcAmmK8jupp68AJJRqvG4
 LOtg==
X-Gm-Message-State: ANhLgQ3+4mx7tA61sOq77yAZLoV8RpWFDu8MqEb+iQEfuIr19N1ix9Qz
 eu79+xK2hR1fOHSZfXzXDpcQU+FamkugMQ==
X-Google-Smtp-Source: ADFU+vs+SvkmuHzZji7iX/7IJ5QRxrDm4mdgx6LWA9fJZy7izOUga5jqqGlLZ8Pxe2mOTv+mGILBCg==
X-Received: by 2002:a17:902:ac8b:: with SMTP id
 h11mr1682096plr.131.1583196598902; 
 Mon, 02 Mar 2020 16:49:58 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id p24sm22823478pff.69.2020.03.02.16.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:58 -0800 (PST)
Subject: [PULL 35/38] target/riscv: Allow enabling the Hypervisor extension
Date: Mon,  2 Mar 2020 16:48:45 -0800
Message-Id: <20200303004848.136788-36-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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
X-List-Received-Date: Tue, 03 Mar 2020 00:50:04 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b27066f6a7..c47d10b739 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -453,6 +453,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_u) {
             target_misa |= RVU;
         }
+        if (cpu->cfg.ext_h) {
+            target_misa |= RVH;
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -488,6 +491,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6f9c29322a..d52f209361 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -258,6 +258,7 @@ typedef struct RISCVCPU {
         bool ext_c;
         bool ext_s;
         bool ext_u;
+        bool ext_h;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.25.0.265.gbab2e86ba0-goog


