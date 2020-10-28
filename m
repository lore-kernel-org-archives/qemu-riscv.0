Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXe2a-0005BD-1H
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 01:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXe2X-00057n-6e; Wed, 28 Oct 2020 01:30:29 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXe2S-0000Wp-K6; Wed, 28 Oct 2020 01:30:28 -0400
Received: by mail-pf1-x443.google.com with SMTP id w21so2258259pfc.7;
 Tue, 27 Oct 2020 22:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yJFd9nYJ8F8KDhYRP8bxcIkScp5dptWLlxHFsMuoOKA=;
 b=AQhRtz8WZS/CLXBZMph5zWMvzZMtx+XF+FMQnIaUdLdWVmW9VXoGIUoubHplb1rFOL
 zjU87bc5SQhLhmEhyqm/qnKqz+U50Jh7uk8nEd7VzPT174Oa8uNUwmBkhEwBHvxtYz5M
 tS/XXdFaIhy1ReSDGo5rKW3Wq5XDgmFBp9rXfnx7b88wC03gEYy+iPW204dLlMtPYNxI
 vcJB61F+T7skfQzgkN1QIR6eqn5joWdM9MT9JZUU4dy53+zLqW+X5IaCT2KSiUQAABDk
 Fph+rH6l8fkX663Beodnsa5rBOYji2jyLadQ+WfaNMNtia0UvQ5FGqfltVWEhks5Qdqf
 FP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yJFd9nYJ8F8KDhYRP8bxcIkScp5dptWLlxHFsMuoOKA=;
 b=mQnrLMwDjS4Thrs7tDctW5ykAMu2DIFF8iKtpE52x8//POJ/WsSKMMbdDYi7SLrSVW
 8oaPNI5OhUjtjn5TqhiqL1DQo3VUJWY3tt1IOT7n9+WUCmTUpr4p6n0EEynNeauMvHPB
 KC3W5sRUfhxEYa0Wvl5YA/bJjTU57l2EvubabdXPt7xyw2hLzMIL+ev6ZdKQRO0/YsVN
 p9xO1QignAJSLRfnXLyBzIbKw+vaDOEqXgOoLyFZAusz679gO0+wtjW9s1sJiEx3IWdD
 4RczV9QhaY/JsoPd9KTYqYdOznr1NWazDjPxudMzEGXpTRjh16y3FxACRaD+15ql554L
 XXaA==
X-Gm-Message-State: AOAM532+4qoQdAptraa4ZuVNJRTQ8s4y9x/Ix2dpHMm5oZ/kfN9Ea7dW
 m1rM7gm7E2JrkmShsdrFTjg=
X-Google-Smtp-Source: ABdhPJxdWbmkIz1aWG0taenNh7DyclIFRn7azU/JcwDLT/jwcRNT9G20aubfkCeBrDaz5RPP1tL9tA==
X-Received: by 2002:a62:3782:0:b029:15d:2c3e:ca14 with SMTP id
 e124-20020a6237820000b029015d2c3eca14mr5983832pfa.38.1603863023144; 
 Tue, 27 Oct 2020 22:30:23 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 9sm5031887pjs.1.2020.10.27.22.30.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 22:30:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Ivan Griffin <ivan.griffin@emdalo.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 01/10] hw/riscv: microchip_pfsoc: Document where to look at
 the SoC memory maps
Date: Wed, 28 Oct 2020 13:30:01 +0800
Message-Id: <1603863010-15807-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603863010-15807-1-git-send-email-bmeng.cn@gmail.com>
References: <1603863010-15807-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Wed, 28 Oct 2020 05:30:30 -0000

From: Bin Meng <bin.meng@windriver.com>

It is not easy to find out the memory map for a specific component
in the PolarFire SoC as the information is scattered in different
documents. Add some comments so that people can know where to get
such information from the Microchip website.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: Document where to look at the PolarFire SoC memory maps

 hw/riscv/microchip_pfsoc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 4627179..6aac849 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -66,6 +66,24 @@
 /* GEM version */
 #define GEM_REVISION    0x0107010c
 
+/*
+ * The complete description of the whole PolarFire SoC memory map is scattered
+ * in different documents. There are several places to look at for memory maps:
+ *
+ * 1 Chapter 11 "MSS Memory Map", in the doc "UG0880: PolarFire SoC FPGA
+ *   Microprocessor Subsystem (MSS) User Guide", which can be downloaded from
+ *   https://www.microsemi.com/document-portal/doc_download/
+ *   1244570-ug0880-polarfire-soc-fpga-microprocessor-subsystem-mss-user-guide,
+ *   describes the whole picture of the PolarFire SoC memory map.
+ *
+ * 2 A zip file for PolarFire soC memory map, which can be downloaded from
+ *   https://www.microsemi.com/document-portal/doc_download/
+ *   1244581-polarfire-soc-register-map, contains the following 2 major parts:
+ *   - Register Map/PF_SoC_RegMap_V1_1/pfsoc_regmap.htm
+ *     describes the complete integrated peripherals memory map
+ *   - Register Map/PF_SoC_RegMap_V1_1/MPFS250T/mpfs250t_ioscb_memmap_dri.htm
+ *     describes the complete IOSCB modules memory maps
+ */
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
-- 
2.7.4


