Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqsB4-0007Ec-21
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 05:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAz-00076n-BM
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:08:03 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAu-0001NN-Je
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:08:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b52ad6311so5254169b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327274; x=1684919274;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YZkT/mJaQEVE4BJ0UCLivl6r6Ulqlc6LfLfb+GExIU0=;
 b=c5DojMkbArsYGM8weGe4bNC4IRNlcafiuRLh9F1nLaRYMNHDSqxnsbM14rkYbRjYsy
 DdieWuvexa0HCAid9N5B8hyMLbr5bGIt5mC4qXRTP7QIgynIkiERR+cN/D8FqJRFrJ1s
 xuTeRywkA1o+VeBb7QTyNHqvaH4maqEDqs2MHRXoEkmTAcg3+4mIZeKbBXWcyok9TCGY
 GugOJZduu0PFa68RoAVRQNAMYzCaW6jn5QDGWgyfXxOu/7Bd6fE8VBXxxnSyQ+gXTqea
 eDQZSR70YTxaZWznQNKkQeobzBSFBGsNyZp7VvxqUa/GqEcVlCbyKG0Ip+u0cACb386i
 H/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327274; x=1684919274;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZkT/mJaQEVE4BJ0UCLivl6r6Ulqlc6LfLfb+GExIU0=;
 b=glHgjaf53iUPwPYCPkGqbJylRPkmGVi7qUdB9rrwNUFSl7RJjl478XjDGppF5vJwrT
 9/SBkB5olDwXAJd5LY43EaQ2na5ruZK8GQAET9bOlC5G9KLBmc9dn8GR4bl5qPk1iZU7
 pc543vmmXM/QUNyrVBWj3E86y+jVQhaqdzY5kqamBPzf5RxnwC1a+Uzk+djFRJ9QsE/2
 GkaWqnPnK662ISd9sp2A073XMaSFv74dpZ7XJiYWRgo9mo5rLOcacz6An8wckF29UUly
 qTKA9PPCoweAV3DjRxTZJvi4JTZ/ZYDAbBAytqhqT0/FvxWdBHBPnsuWeoWFAEe1neYB
 oO9Q==
X-Gm-Message-State: AAQBX9eN4lo5cbrH8bvwZKggOaWNVaOOt4HU4O3Lb0C1k3Kxtg9YLxIZ
 aTNSTx8R0C4BPjqC9xceEpd6pA==
X-Google-Smtp-Source: AKy350ap6F91TGSpJPWRnLbYY7Oz3owGZjtivJpBN94nccA7kn3x5lehvSO4PrpnbV6uGyRTuzd0sw==
X-Received: by 2002:a17:902:ce81:b0:1a5:32d7:90f4 with SMTP id
 f1-20020a170902ce8100b001a532d790f4mr17380475plg.50.1682327273910; 
 Mon, 24 Apr 2023 02:07:53 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:53 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 6/6] target/riscv: select KVM AIA in riscv virt machine
Date: Mon, 24 Apr 2023 09:07:08 +0000
Message-Id: <20230424090716.15674-7-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 09:08:05 -0000

Select KVM AIA when the host kernel has in-kernel AIA chip support.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 18aede7b23..908b304991 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
+#include "kvm_riscv.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
@@ -1215,6 +1216,15 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
             msimode, false, aplic_m);
     }
 
+    if (kvm_irqchip_in_kernel()) {
+        kvm_riscv_aia_create(
+            aplic_s, msimode, socket,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            hart_count,
+            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
+            memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE);
+    }
+
     return kvm_enabled() ? aplic_s : aplic_m;
 }
 
-- 
2.17.1


