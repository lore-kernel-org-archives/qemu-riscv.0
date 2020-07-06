Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsNea-00072R-FT
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jul 2020 05:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amergnat@baylibre.com>)
 id 1jsMlc-0005vV-FP
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2020 04:46:24 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amergnat@baylibre.com>)
 id 1jsMla-0000tc-Kp
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2020 04:46:24 -0400
Received: by mail-wr1-x441.google.com with SMTP id k6so39916310wrn.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2020 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Djt1gr0/S2tGtCGU7xh8b2ka2pC16hBw7TSjsoH+kGI=;
 b=BOfUxphEMAp3HLd4ceoMc9DVRiHLqfMuWbvT0IBmN1kjNH6aTXOlvIbw0Upi1wWtNT
 H05LbpTi+rji6h824ZuCj4oPtBYdO7WGJbEtYzAG6lcPp13L5psm/OBrBBFN7YWsjrjp
 KM10yImtoTlXaT2l5op5I0Z8plc0aMJnemIblPKa6V6XZYiK2sT9+HZrSDbHeHv2XMBX
 BHI/HhNvXfnfAGl+T08bamUaRxC2ogBeYmyKcuyNjmXAHno4xTh+lja+LkEkT8ICLuty
 cbE4cqqiQ5Ysr5OIsNHW8nyAFQekQjI283wUzCFWLNjwg+JOdEc9qxsT7so81t6+Jn5S
 MRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Djt1gr0/S2tGtCGU7xh8b2ka2pC16hBw7TSjsoH+kGI=;
 b=klxy0jDQfYLE3FHYX1UmP7Fk6h6NaFlfLk9Zirt/QDDPjj+7/sxKUvXp77xpRi1etw
 CrUaZ1JLB2M4SlZEfMdRsGZR1uMAv8EkT1rmXqdZdIjL/mQpFfbH1rpoEeMMqQ/wESex
 kTMGnNCx74ffciQl7jMg1cc3luUHtj4dMeCL9qUtd4JVNzC0Lgcv/veQRDKgjH95NPX4
 Yao+ZLLuhnZfE6vNMrIHxIu+YbKZ1jPD4w4LhrK1Ot84VgJgygXHD3Sa3muBxK6cRK4k
 HnQ2rpYTSfLZuA0AqJOWHDTLtTJZZCBSmXnZRgIodKelWbTxixj7H+k1oOUmFzMlZB+p
 QHEQ==
X-Gm-Message-State: AOAM532UYL1aqrSAPeM5wNmsAQ3Psl6JXowH9AUcREkMuiHV9lR/551Y
 Xjcw0SghNs8OYHpTSWiR9DeAsA==
X-Google-Smtp-Source: ABdhPJxUX+HA7GAigFKfS+MUke35EFH3CmMi6xbwzGrcwVAyCLoMRsqyjqC0VgbgDvUFlRCgv19oeQ==
X-Received: by 2002:adf:e948:: with SMTP id m8mr48775025wrn.398.1594025179341; 
 Mon, 06 Jul 2020 01:46:19 -0700 (PDT)
Received: from pop-os.baylibre.local (158.73.152.77.rev.sfr.net.
 [77.152.73.158])
 by smtp.googlemail.com with ESMTPSA id h13sm22786439wml.42.2020.07.06.01.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 01:46:18 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 baylibre-upstreaming@groups.io, nroyer@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v1] target/riscv: fix pmp implementation
Date: Mon,  6 Jul 2020 10:45:50 +0200
Message-Id: <20200706084550.24117-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=amergnat@baylibre.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 06 Jul 2020 05:43:11 -0400
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
X-List-Received-Date: Mon, 06 Jul 2020 08:46:24 -0000

The end address calculation for NA4 mode is wrong because the address
used isn't shifted.

That imply all NA4 setup are not applied by the PMP.

The solution is to use the shifted address calculated for start address
variable.

Modifications are tested on Zephyr OS userspace test suite which works
for other RISC-V boards (E31 and E34 core).

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 9418660f1b..2a2b9f5363 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -171,7 +171,7 @@ static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index)
 
     case PMP_AMATCH_NA4:
         sa = this_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
-        ea = (this_addr + 4u) - 1u;
+        ea = (sa + 4u) - 1u;
         break;
 
     case PMP_AMATCH_NAPOT:
-- 
2.17.1


