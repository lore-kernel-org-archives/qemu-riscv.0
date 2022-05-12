Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npF35-0004I2-2Q
	for mharc-qemu-riscv@gnu.org; Thu, 12 May 2022 16:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@rivosinc.com>)
 id 1npDUE-0001Xt-6m
 for qemu-riscv@nongnu.org; Thu, 12 May 2022 14:24:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dylan@rivosinc.com>)
 id 1npDUC-0006IU-BE
 for qemu-riscv@nongnu.org; Thu, 12 May 2022 14:24:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id d17so5749790plg.0
 for <qemu-riscv@nongnu.org>; Thu, 12 May 2022 11:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=avYUf2/iWu4OFYZWWIgFyzsfV2T6GMlWlHPCDUoW2N8=;
 b=AJmRq0o61BzXjSljMFuauSYqJNYCJbZgXXksDwXaOZrL9/E32bENDiTC2jr6NZR8vZ
 /jQ3BKOifD66CA1zGbjaiRwnHhgmfn7fcQZyKLy8kFQKzh5UglR+vXi6DA/WPZxf0Jt8
 hqh5YxkIyNcbCumloF8rAFK1NtjQveXXS0Sint2wIRvt8rLvlYv4p3XZRBnfD/Aw8lnR
 g/5ZNd/qGGaMOSTEw8l/dPm90C4SwuCKLENvjQrX8p0UlrJxZUIU23lqIBJZ2/9veHCW
 1LUIYBQ14O0KCcFK7e5oa7QK46ftwKQishQGYtcTSiH4fh/QSeHx4ALHgx4UBWYSvr1T
 o2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=avYUf2/iWu4OFYZWWIgFyzsfV2T6GMlWlHPCDUoW2N8=;
 b=ZunLN4C2NdP9DWuoPNAZcx2wSFg8unJYPkW/oS1k/DySozXrEW5Stda4dbCBVccsTk
 AwRVJIzo2PF/AaIYzTgC1X6W2aaWWdOd86q8j9AwQ6yB5pc3vsuJnpF8aqet1OJXpHD6
 w9X7VeHDzAjJG3QMRjIF1DevkiN+zRxeLniHeJQOQh6ur3LnDny6s/zCLlr1t99kVuzA
 2ryrlW7ScnfjBJCTqMxrDWHbxnVGA0A097gR4jiQC3ms4JVvEdzttj9gbKVlbpeJr0W0
 6qPUf5aytB6srGmko9Hngc8N7vUCABjbOTG8Rqz9pbHTSV7wPA8UdxTlRrdsmWwUNzdZ
 y1KQ==
X-Gm-Message-State: AOAM530CJQiR8Qt8Y5XhlZ9VUVOrWqTImPSIwyPmEmcprdwjbXefohxA
 9NDU4EkxhV/SIif01YeSyiofdO+tznoVWHMw
X-Google-Smtp-Source: ABdhPJzeZDPtzZklwtENkpPiFLB2bZgnLPnycMpf/tZABBVtRWmRDIIT82xOskfPnsVoGw8Rcnq4lg==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id
 n18-20020a170902f61200b0014ce978f99emr1115781plg.23.1652379866134; 
 Thu, 12 May 2022 11:24:26 -0700 (PDT)
Received: from localhost.localdomain ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015e8d4eb298sm193575pln.226.2022.05.12.11.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:24:25 -0700 (PDT)
From: Dylan Reid <dylan@rivosinc.com>
X-Google-Original-From: Dylan Reid <dgreid@rivosinc.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, Dylan Reid <dgreid@rivosinc.com>
Subject: [PATCH] hw/riscv: virt: Avoid double FDT platform node
Date: Thu, 12 May 2022 18:21:03 +0000
Message-Id: <20220512182103.408627-1-dgreid@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dylan@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 May 2022 16:04:33 -0400
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
X-List-Received-Date: Thu, 12 May 2022 18:24:30 -0000

When starting the virt machine with `-machine virt,aia=aplic-imsic`,
both the imsic and aplic init code will add platform fdt nodes by
calling `platform_bus_add_all_fdt_nodes`. This leads to an error at
startup:
```
qemu_fdt_add_subnode: Failed to create subnode /platform@4000000: FDT_ERR_EXISTS
```

The call from `create_fdt_imsic` is not needed as an imsic is currently
always combined with an aplic that will create the nodes.

Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating platform FDT entries")
Signed-off-by: Dylan Reid <dgreid@rivosinc.com>
---
 hw/riscv/virt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3326f4db96..d625f776a6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -561,11 +561,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
 
-    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
-
     g_free(imsic_name);
 
     /* S-level IMSIC node */
-- 
2.30.2


