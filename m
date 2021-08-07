Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCDSA-0003js-F2
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 23:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mCDS8-0003jR-Se; Fri, 06 Aug 2021 23:56:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mCDS6-0001cd-TW; Fri, 06 Aug 2021 23:56:52 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so25535936pjb.2; 
 Fri, 06 Aug 2021 20:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKLm9+ORkD6oeWCH+iXP7ePpCXO7SLxE1TrYr8/hAqY=;
 b=VEKAUa+JGX7GsmuLS8Al6iDy/Wzp1MUd50It0oqRrhXFzkj7+lD/HSKru5ihYW73N9
 9FHHHXsclEs9FeriyEeMVvwn9osEgiEMDL4Zt216CYterDBhVs8o0LnoOxAD9iD9tndw
 8clH0bcjTX4hNLjIkduCPB8RC7kED0Y1KEl7tL3iNkK9C0Vd2NgoLNbNfxNtBPN+gPgy
 8ih0o9sA3fYVGDmVDe0zUsOGsNW0YQbT8YWoGUnn32taJE0KqAizEdxFlQCXSDhH7rX0
 bNR1hq94p5yiXmxV6ZGfjMsZK6pwqGcbE0zI+ud3blIN/+QqlOKH+qu8Aq3JbHdir9ta
 AB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKLm9+ORkD6oeWCH+iXP7ePpCXO7SLxE1TrYr8/hAqY=;
 b=qpVl7jHsialrgtVdxsoTWqisdQu81kcA0/2Fo1XgYXQTAE0o7mGDWwh46Vcj2OYqx/
 Emia9kxJpUZj2SqB2kbbxyur/qibbR3A8WhCeSmD/CNZeJciXFGvqOrSJrh9a4juxVWA
 Lx+xMsaXURfgNsMFftMAtg5CTQenf6L06AqD8XY2qADqKzTgZAXtvNxyAZYApYIQ6eCp
 kiPtHDBA/zo5+r+84+6D47qc9iSBIeq8Oq/nIGj0pSm4SzYRNlF2Nrt8eUDvfeoaoCMg
 LAFBCoOZ8fo85JZoRsu8YOajr+kuZSz+KbQ2lyGgtL+O01ALeSFuO9M+QpEYJqrxA81R
 j+pg==
X-Gm-Message-State: AOAM531GgHtvcBr/Tf/VbfX9yqeU/2nucys5YXVqosvL4oTCKX34Vhm8
 a4wqHA7uhmaBvZtv1dK8hac=
X-Google-Smtp-Source: ABdhPJzrbwaJDtt13ydw/4NMnp9+JomZNfTT8Kq26VJ6HiIrhnPpaAV1z28AcSPMDASg9Si9m/pSpg==
X-Received: by 2002:a17:90b:a54:: with SMTP id
 gw20mr13631246pjb.215.1628308608918; 
 Fri, 06 Aug 2021 20:56:48 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id s5sm11633102pfk.114.2021.08.06.20.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 20:56:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: virt: Move flash node to root
Date: Sat,  7 Aug 2021 11:56:41 +0800
Message-Id: <20210807035641.22449-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Sat, 07 Aug 2021 03:56:53 -0000

The flash is not inside the SoC, so it's inappropriate to put it
under the /soc node. Move it to root instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a3cd2599a..89fb607c47 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -455,7 +455,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
     g_free(name);
 
-    name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
+    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
-- 
2.25.1


