Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxliW-0002iO-NE
	for mharc-qemu-riscv@gnu.org; Wed, 23 Nov 2022 04:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oxliQ-0002h5-Me
 for qemu-riscv@nongnu.org; Wed, 23 Nov 2022 04:06:47 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oxliP-00019O-44
 for qemu-riscv@nongnu.org; Wed, 23 Nov 2022 04:06:46 -0500
Received: by mail-pf1-x42a.google.com with SMTP id g62so16752412pfb.10
 for <qemu-riscv@nongnu.org>; Wed, 23 Nov 2022 01:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNKYCtytvr8jFQvz0O1WJIqKW1bn3TAq0RY0MvG6XUU=;
 b=iJ/dEYcOdT1MNvY0THm89Cu7LkTChFKOc9U/GknA3u2o6T1JtmTnHZSQGqMpCwMAkT
 K+H9qjriRb+ysclQoVCfVB54VNoIUf37pHfvZFJ7KBpsXqWkHyNLHLAyeF3pgzhrzdVm
 Xo6sHU+8rhsKE92y8m6lDrcucIJFO3FWLvZtfdGbFSAwAgvDyBj7BTKGP4mX1/CAFeJi
 BBCDTRgi6wnmZR+Yp+5FDlQoC9r820Kk3xcrZgWlWNhM/rCJYciFJZJ9Pwkj1fGo05CT
 YJlTpIBTYqTrTllshV8XmnQt635dMgDIkXkr5EliquYjY9cijWr2lAFlwo/09s84o9F9
 B/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNKYCtytvr8jFQvz0O1WJIqKW1bn3TAq0RY0MvG6XUU=;
 b=vEp7iiFrL0X34G6RT4VaNZ5NIGvLCGlllOl25POFp5dmR6VFkQLKmXQLh3ASdEcYN4
 8SwrhORAxvaWmuL2ZH8jFFxYXPDTZPUMKxXqq5SOU4XkV5PbfTNf7gNdJ/VN2P+NW/ak
 23xmXU/zzHtk480zs5xx9PiNsxG/abIKWYu8M+53yMCAHXqCOFbXBQzUZirEtxxn5zt7
 cEpz41wOo6FvMFMSlI39hFVekhZpnVWPs4xqCxPmnTd878o4mSgFPNmCMhcV7lz5F83W
 ipi6ZskQrYh0UWzRwBtwO1LdWu0u4k2B1Zy896/xRxUKDp1XG9a06mT54lIEWcCj5uKC
 fVtA==
X-Gm-Message-State: ANoB5pmzqX10/H4zvACVjt1fFUbIabWo3wvz+iYcdAPDdJAHdwNMfTFq
 pkfVvw4ovfFK8HwRko9U+7ZPvA==
X-Google-Smtp-Source: AA0mqf7IxKfIqv1Xa8sX+fVOCp7xaDzsWCY9Z491objvYCupwQecjBNsvddVAU2L71LPRojSe7jPgA==
X-Received: by 2002:aa7:8a03:0:b0:573:4ae5:e479 with SMTP id
 m3-20020aa78a03000000b005734ae5e479mr7757878pfa.71.1669194402851; 
 Wed, 23 Nov 2022 01:06:42 -0800 (PST)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa79906000000b005613220346asm12004559pff.205.2022.11.23.01.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 01:06:42 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: support cache-related PMU events in virtual mode
Date: Wed, 23 Nov 2022 09:06:29 +0000
Message-Id: <20221123090635.6574-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 23 Nov 2022 09:06:47 -0000

let tlb_fill() function also increments PMU counter when it is from
two-stage translation, so QEMU could also monitor these PMU events when
CPU runs in VS/VU mode (like running guest OS).

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..a52a9b14d7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1248,6 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         }
     }
 
+    pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (riscv_cpu_virt_enabled(env) ||
         ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
@@ -1311,7 +1312,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
-        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.17.1


