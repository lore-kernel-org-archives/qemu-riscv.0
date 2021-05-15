Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEL-0000AR-LY
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEJ-0008Tc-EH
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEI-00067z-18
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/10dvLOYecsAQmUGPkwxrFRTrjd5+JzocYSZHgeVfk=;
 b=Z2p/LIHFqWaInrFByTLNk/FrA0FWx9GIy5/9lrNzCpPN7r0IGokSOnaF8ujZrOv265k53n
 7wSyh0zSFWVMgcaZO2IR1pn5x3VGXUrsfRBfQUVBzkE3sPe9/UXNF6hhwO8aYxAQFhJQSM
 2bVBqqTjA4IlldMXq4VITqg6YIKCQrY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-tq2FthsWP3KG4VCoD_2o4A-1; Sat, 15 May 2021 13:37:29 -0400
X-MC-Unique: tq2FthsWP3KG4VCoD_2o4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so440361wmc.7
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/10dvLOYecsAQmUGPkwxrFRTrjd5+JzocYSZHgeVfk=;
 b=r2gywq/t5XUE/jXubMU7fp+7UUFJA2PoWM6mixvNdlZvEV/YFxcBJsmMwSAYTuCa81
 vf8UhyfYVVDfJdk1ABd57wA8ljuXbQoIkWCRVHRIdqksw/VRhhObnsmOO+e8DokNSWNs
 pXs4y2DIj0Ck5Mi6w+f+LJlo33lrQ+nIqCfw4LBY47g7KBDkCbtT1g429DoxCp0Fr+bv
 cu769w59g3TGoEdvOs1bR5mspHhmM+oEvzSuJzAa8ZpGNz7XED+OOdZqxiSOTas/ghXe
 GsDVrY3l0eVmKQBNDez8hZcNuIsk2BHyXJS8Zjmrx4zFN8N8frLX/QKGJN/pbXtfvZxu
 eLzQ==
X-Gm-Message-State: AOAM532/cbR+eiBiexLniXWxxeVICYOTO15y0FSrvQaweNd7s9G3qRcQ
 9K7/CozeXG828Gz+KOeXCsB+NCmzgqsZdd9DftcuTqzrPobWqouCN9CeQfKjDK0ZIcmieyRKWe9
 aER1kKpoyd2HSSCM=
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr15474335wmq.180.1621100248599; 
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBI/OGWHQJw95jKNSYxvduONqDOFNeiW3sAzEu0dZbev1126HPcjQkDuw1xmVEaAqMlhE2ew==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr15474322wmq.180.1621100248461; 
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q3sm8260103wrr.43.2021.05.15.10.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 02/12] hw/ide/Kconfig: Add missing dependency PCI ->
 IDE_QDEV
Date: Sat, 15 May 2021 19:37:06 +0200
Message-Id: <20210515173716.358295-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 17:37:35 -0000

The pci_ide_create_devs() function is declared i hw/ide/qdev.c:

 $ git grep ide_create_drive
 hw/ide/pci.c:491:            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
 hw/ide/qdev.c:127:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
 include/hw/ide/internal.h:653:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);

Fix the correct symbol dependency to avoid build failure when
deselecting some machines:

  /usr/bin/ld: libcommon.fa.p/hw_ide_pci.c.o: in function `pci_ide_create_devs':
  hw/ide/pci.c:491: undefined reference to `ide_create_drive'

Fixes: 8f01b41e109 ("ide: express dependencies with Kconfig")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ide/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 8e2c8934549..dd85fa3619f 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -8,7 +8,7 @@ config IDE_QDEV
 config IDE_PCI
     bool
     depends on PCI
-    select IDE_CORE
+    select IDE_QDEV
 
 config IDE_ISA
     bool
-- 
2.26.3


