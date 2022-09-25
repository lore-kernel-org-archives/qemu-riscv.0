Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocRYj-0001uX-T5
	for mharc-qemu-riscv@gnu.org; Sun, 25 Sep 2022 09:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ocRYX-0001ni-1M
 for qemu-riscv@nongnu.org; Sun, 25 Sep 2022 09:20:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ocRYR-0005gA-TO
 for qemu-riscv@nongnu.org; Sun, 25 Sep 2022 09:20:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id v1so4035551plo.9
 for <qemu-riscv@nongnu.org>; Sun, 25 Sep 2022 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=jdXKxa07OJy+ZDk6KdAV1YTitNjsRp/JtV9nwD4Pvltwm5rJ+HOqTUjpNwU5nEFahK
 +9lK6X/vnY10SMfnY2fRt2qLk6Niviml2S8SJ1ZMIAAvUbWtSTwo+veuMFBjFUMmnvpE
 rIy7UPfHvkFXDnrsfJKT3uCX+BHZAlpsbMfR31/U15YadOeBQeJ+/t4v3ydU2k+rIMJP
 Wzp72mc4aNUSbp+8C4bSc3Awz6MTxj3tM3b67KiFCrcpjDAkRTZFFZOIZGWkoEWWfuDC
 a1Qi0TLafaRV/I8D7JZZAu8uGU3yXuxcz8xwFvj3Xg6/supnhSwjnBqMMpMPKjPTsVTg
 5WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=Att+d/5uEWTI+czOQ4VSVZI6Q+tq35MDckALzo77tjPj+g/JnRpA3OcyxPiyxzrRd2
 kFMBnjD7ad5ARyt1B9MJSWO59GVKq738n6HUuerwmhIU1NKRbFsbT2bJVc4At/kjgVpV
 af2kSVh+WlVpoGc/1ERFmwA/UPI98ZszF/dLK1jNAkBKI4LYAmuLGbpeeXNlhF5PWrjz
 i1Pjeou9AcJRjYOwnifbWU2UL5lYdWj+LWDvPuW+0uGsbqrZ/mi5AdEUJb+sdi6AG/Rp
 RZSOaH8iXkduTkCGn3uRNpWvqFh2xpa7ma8K4ALWoLqjC0CZtDO3HNvYCbXKFz1I6TN7
 N9ow==
X-Gm-Message-State: ACrzQf37Ig5qcon4IaiYaAxqc8GkAkwuaOVSo8+IGmDdcDn128QrKE6c
 TgQszqTBvpyk8e6628I74PO0UA==
X-Google-Smtp-Source: AMsMyM70jkZOzdj/GH+EFVcJY2pUEEBVki72jFKeVfIv8HmI1soYMjSAYK402ZF67SQhXuYh67TewQ==
X-Received: by 2002:a17:90b:4c45:b0:202:6308:d9c4 with SMTP id
 np5-20020a17090b4c4500b002026308d9c4mr19688464pjb.40.1664112017660; 
 Sun, 25 Sep 2022 06:20:17 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a63d30f000000b004393cb720afsm8913295pgg.38.2022.09.25.06.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 06:20:17 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Emmanuel Blot <emmanuel.blot@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/intc: sifive_plic: fix hard-coded max priority level
Date: Sun, 25 Sep 2022 13:20:04 +0000
Message-Id: <20220925132010.5336-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 25 Sep 2022 13:20:25 -0000

The maximum priority level is hard-coded when writing to interrupt
priority register. However, when writing to priority threshold register,
the maximum priority level is from num_priorities Property which is
configured by platform.

Also change interrupt priority register to use num_priorities Property
in maximum priority level.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/sifive_plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..f864efa761 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        plic->source_priority[irq] = value & 7;
-        sifive_plic_update(plic);
+        if (value <= plic->num_priorities) {
+            plic->source_priority[irq] = value;
+            sifive_plic_update(plic);
+        }
     } else if (addr_between(addr, plic->pending_base,
                             plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.17.1


