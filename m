Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4G04-00080A-EP
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzo-0007hL-Bq
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzm-0006bu-8n
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:40 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzf-0006Os-TG; Sat, 31 Aug 2019 22:53:32 -0400
Received: by mail-pf1-x442.google.com with SMTP id v12so6916866pfn.10;
 Sat, 31 Aug 2019 19:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=InrNd1kY5fhWv6+wZr4U5uOiCT/8aoXjdZ+OCAfAKeQ=;
 b=XgfWw3kh6Psrc8p8Vd/pjMdHSdXfYacZEiqAtomgbkrnIEPILFfKtKTMUg3lUUdory
 ovyFBiVkN0XHEdIO1eHqaleXv9sHaFI2DHNMb7+ASMWuGXYY5CfykU4hGCuv0SXBfc+b
 kDFo9t/mrSJy334nyghb3neH8fvzkPn2VdOXeP0g9PVZl2N+z9X8BjxhdUInYPw5vIMG
 WND/FFDZf9dXt5yCd9zCX0RTKFoJdoKp4Yh/2V8Dujt/vSQxZ3bWFz0lddsbuoje78AM
 qWdt5zKjQe0cuUzWZ12i0Rc6F2N7PZqz8xeU1IG2nR45D2NrOufLdiyy7tz7JIzwlBdB
 0oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InrNd1kY5fhWv6+wZr4U5uOiCT/8aoXjdZ+OCAfAKeQ=;
 b=WubggYuppXLC4Rty9Cu3crNpY8AT8j/dD6V2ypUF93nuGsGQabril2KdmY3CNToV0c
 +V/N6OjRuvtjAkvN1Y6gca7kescLXqdUij+NDJwrZgnO3q5kz0WTqS7BmwocD7rb7rkY
 8kTvERk+K0mqBGU8lwiOH0BEBojatoz8RK34BlnT83lLpWVF9383/7saMXwYjk5L4xL/
 sBTMtpSOMjvnYNB/lNMzfY+khH+RX2CivJ9B1DlxYzYsSh38mkyY+pdGpgRAKhvbRIJF
 BiMriu5XZn+0uvad5SJSnL/TdAQUt7su1bNJXw3jGiJD5TrpKtvr6LUcq3VKIwmkWJ/A
 TqXg==
X-Gm-Message-State: APjAAAWH124lsEIeNure2oxeLlS/KTCdZvRdVgNwnboH2OevnnkvOU3F
 pDN119tReZ/TyB4NiFFYDqE=
X-Google-Smtp-Source: APXvYqwg3q6z95pIWksWT2neqNj3WRlHEWKqlyFy1+sb4RSTXLhaklbuzbiKpCK2gdz0/L3IPMhxFQ==
X-Received: by 2002:aa7:9e42:: with SMTP id z2mr14657069pfq.2.1567306409628;
 Sat, 31 Aug 2019 19:53:29 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:51 -0700
Message-Id: <1567306391-2682-11-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v7 10/30] riscv: sifive_e: prci: Fix a typo of
 hfxosccfg register programming
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:43 -0000

For hfxosccfg register programming, SIFIVE_E_PRCI_HFXOSCCFG_RDY and
SIFIVE_E_PRCI_HFXOSCCFG_EN should be used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_e_prci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index c514032..71de089 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -90,7 +90,7 @@ static void sifive_e_prci_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
-    s->hfxosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
+    s->hfxosccfg = (SIFIVE_E_PRCI_HFXOSCCFG_RDY | SIFIVE_E_PRCI_HFXOSCCFG_EN);
     s->pllcfg = (SIFIVE_E_PRCI_PLLCFG_REFSEL | SIFIVE_E_PRCI_PLLCFG_BYPASS |
                  SIFIVE_E_PRCI_PLLCFG_LOCK);
     s->plloutdiv = SIFIVE_E_PRCI_PLLOUTDIV_DIV1;
-- 
2.7.4


