Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n20kT-000836-8Z
	for mharc-qemu-riscv@gnu.org; Mon, 27 Dec 2021 19:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kO-000811-KV
 for qemu-riscv@nongnu.org; Mon, 27 Dec 2021 19:53:49 -0500
Received: from [2607:f8b0:4864:20::529] (port=36704
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kN-0002qp-4T
 for qemu-riscv@nongnu.org; Mon, 27 Dec 2021 19:53:48 -0500
Received: by mail-pg1-x529.google.com with SMTP id 200so14669391pgg.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Dec 2021 16:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nJte6JP6EZUPzQBYs32kg6qH8WTQTkFEHae1nTePgI=;
 b=bHVGEvfy8rTJZ1OcncAtIJrmj984Tg5RU+HQ2T322BB7+rqQn0rKI1YZeKEjYGDsOl
 xDIQx9r4wW1p6ZDaU4plUQFC9xKRmxQ+3lmZqXFuTqLV1qRNWpxixPPXRBKnoWcQS1Sb
 FFmywveWGveQ41bwE+2FUZ/+obu/fbV5tar+Rv7AcPE/DP1bWuMwuamBr5dKHB80d4/1
 yTgScS1oeKyA/DNH9CKG2xbd8ispSYzyIpIDSpXQJ5ohOsC+PKZg0QhIK58+s4tBiR9i
 Tuye3YErFk4L6RzdIyYDz5kM+X9zTHQaUfn8xs8IBUSLwS4HyKs3tR0WP9tWqNPOEVLf
 msfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nJte6JP6EZUPzQBYs32kg6qH8WTQTkFEHae1nTePgI=;
 b=umfMUROUwWnBnkyq3qI2cZcBWTqdytO7m10J5AW8XrDvDSNSCG/5UlgXTFOktqMGRL
 k/KidPMfesgSWySWiik218MY1OgU8Bbk87ZODNNIJw58UrXIwecx3mYaLEhfv7X8+gFA
 kr21Ck7fdJroEWgeOBWFu76cXudCoFuFvkCFMM3qixoPeAc4szeMVKRbAmwvNUB8iTHE
 P0qlin5dT4KRzpBrp05QMT31YRNQG0X3WqffRMlfcaPby8iMsIIR2yrlpr/SRiytRasT
 +fezA2B4GsRiEkzS4RgLcSQkjz8IP5exMjFlyQd3tYDhiyAiBo5Q1Oh0SnEwT3pF3mKZ
 /eoA==
X-Gm-Message-State: AOAM533t5vifT2pNf9kvEtRZRR4GU3/v5pn+cUxqgue1cnoyhDpmFs+T
 QU+refXdE3T/juJHl8wjQ6CFPg==
X-Google-Smtp-Source: ABdhPJwoeOSjWadWH4WVesXLVrFH7Y3POkv5+eAevixjh1i4HoXbbS2RQc4B2qcPmf1QfZwZgM/FoQ==
X-Received: by 2002:a63:790a:: with SMTP id u10mr8739039pgc.302.1640652824814; 
 Mon, 27 Dec 2021 16:53:44 -0800 (PST)
Received: from localhost.localdomain (1-169-192-165.dynamic-ip.hinet.net.
 [1.169.192.165])
 by smtp.gmail.com with ESMTPSA id t27sm19266587pfg.41.2021.12.27.16.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 16:53:44 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 2/2] hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA
 registers
Date: Tue, 28 Dec 2021 08:52:36 +0800
Message-Id: <20211228005236.415583-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228005236.415583-1-jim.shu@sifive.com>
References: <20211228005236.415583-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 28 Dec 2021 00:53:49 -0000

It's obvious that PDMA support 64-bit access of 64-bit registers, and
in previous commit, we confirm that PDMA support 32-bit access of both
32/64-bit registers. Thus, we configure 32/64-bit memory access of
PDMA registers as valid in general.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/dma/sifive_pdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b8b198ab4e..731fcdcf89 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -441,6 +441,10 @@ static const MemoryRegionOps sifive_pdma_ops = {
     .impl = {
         .min_access_size = 4,
         .max_access_size = 8,
+    },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
     }
 };
 
-- 
2.25.1


