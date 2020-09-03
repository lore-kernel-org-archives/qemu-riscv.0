Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDmg4-0006TG-6s
	for mharc-qemu-riscv@gnu.org; Thu, 03 Sep 2020 06:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmg2-0006Nh-64; Thu, 03 Sep 2020 06:41:10 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:53984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmg0-0002II-8L; Thu, 03 Sep 2020 06:41:09 -0400
Received: by mail-pj1-x1042.google.com with SMTP id k15so1323560pji.3;
 Thu, 03 Sep 2020 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E0+89gACSq0DbIpTAUJ5ClPjbEgWU1Xtql9kIfdqQFA=;
 b=TodLDyBq7AQM1agY4N8wJxyeZfI2zXbHlofyEaBnej4ePqETTDA7X16Vdd51CjOv/U
 mrTdRSNxiIL07iuriwJpH/0RKVPQyCFGIdrqwE3d/NJBTWuXdww6FSA2q3K6M2oPihej
 zAo5fA/pEyPXbMl579SFjigSc4d6UyuCvhICH2DmAAxH7Iil5uHUljM/wD2IPTVAQ5bI
 BnbPMEgMqNRtfLYbcSkG3WEphK9HAaccEkl79JJJmC9Uwe0rdH+xW86mSAcYDT5DOkYF
 istMn0Jpq8Hr+dI/XrSIcRzO2GDDyXhA4wr7txTMZviw5vQ33xTQdNdRJzWAfyU5mEe2
 Hrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E0+89gACSq0DbIpTAUJ5ClPjbEgWU1Xtql9kIfdqQFA=;
 b=R4PbBFdkkahlyMW0/obCoaDnk/lYWp77imm9S/5rul+z2w5XMiWHmpLFiSNSJCnCRU
 RCOwKl2/JvVk5Zc0uzIzQ6I0CV7gHKUePPcxpbGKuaWKqg0+5XJC3Hl4i/B8shxNT5FM
 vBCxEyrQHtva/2lfA2Je5UEqHqNTPM5eZgrPQ+nwQMred6ymtDYeEbA8LzWAYteGOXyg
 QYrEFmAdjUDxS0bCrjB8/zkf5pFg9Vim1Xs3g34bn4YK2jd1LsLbcgAt+uSqeY9WDioC
 n38SSZjA5OIOnx3JrjEUo67SjUm7Mp6vdwQW6OzFhsmxlbFP0d5OJMYSDQMX861YpRE1
 HHaA==
X-Gm-Message-State: AOAM532XNdABv0JH7C0MnIYyt3A3dral5957gBP44ovZ/X1Lm+3Mygbo
 qPns432kQhYCLJ1G9wL4Y1g=
X-Google-Smtp-Source: ABdhPJyhaBTAgmaRSCdj8PFJlo71b27Q+tm/w/IMkFpdm4fcn+8HYciACDSTgIWfcLO8q48j8R2PWA==
X-Received: by 2002:a17:90b:30cd:: with SMTP id
 hi13mr2732157pjb.82.1599129666710; 
 Thu, 03 Sep 2020 03:41:06 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id b18sm2137098pjq.3.2020.09.03.03.41.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 03:41:06 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 11/12] hw/riscv: Drop CONFIG_SIFIVE
Date: Thu,  3 Sep 2020 18:40:22 +0800
Message-Id: <1599129623-68957-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1042.google.com
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
X-List-Received-Date: Thu, 03 Sep 2020 10:41:10 -0000

From: Bin Meng <bin.meng@windriver.com>

The name SIFIVE is too vague to convey the required component of
MSI_NONBROKEN. Let's drop the option, and select MSI_NONBROKEN in
each machine instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/Kconfig | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 7d017bc..e152fdc 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,13 +1,9 @@
 config IBEX
     bool
 
-config SIFIVE
-    bool
-    select MSI_NONBROKEN
-
 config SIFIVE_E
     bool
-    select SIFIVE
+    select MSI_NONBROKEN
     select SIFIVE_CLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
@@ -18,7 +14,7 @@ config SIFIVE_E
 config SIFIVE_U
     bool
     select CADENCE
-    select SIFIVE
+    select MSI_NONBROKEN
     select SIFIVE_CLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
@@ -31,7 +27,7 @@ config SIFIVE_U
 config SPIKE
     bool
     select HTIF
-    select SIFIVE
+    select MSI_NONBROKEN
     select SIFIVE_CLINT
     select SIFIVE_PLIC
 
@@ -44,20 +40,20 @@ config RISCV_VIRT
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
+    select MSI_NONBROKEN
     select PCI
     select SERIAL
     select GOLDFISH_RTC
     select VIRTIO_MMIO
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
-    select SIFIVE
     select SIFIVE_CLINT
     select SIFIVE_PLIC
     select SIFIVE_TEST
 
 config MICROCHIP_PFSOC
     bool
-    select SIFIVE
+    select MSI_NONBROKEN
     select SIFIVE_CLINT
     select UNIMP
     select MCHP_PFSOC_MMUART
-- 
2.7.4


