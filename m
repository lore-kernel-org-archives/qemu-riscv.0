Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1V5p-0003a9-LL
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 10:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m1V5o-0003Xq-7S; Thu, 08 Jul 2021 10:33:32 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m1V5m-0001J4-N8; Thu, 08 Jul 2021 10:33:32 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so6001233pjs.2; 
 Thu, 08 Jul 2021 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9S2uSS3W0hK5SUoIufNlDDDlKwis8Kwh7YaicD3Lk8o=;
 b=pzwgp4591Ln9CSJTkjV0+kId1P1liPBf0H4wkK86kp5fiSGQvXZJqF9MYLu0JRcRXN
 +w6P2piDUvcwy004q5SLKIauOCwxhDZoZgoO2UN9uzkUaj6Y6v04N6YGzaKjwV2jy2L9
 1sbndgKjZ+4K7ax//4vS/Azqiy+WXIY0NhnYlF6t4SiU4yKQmEayi8LF15gUs5NRBVmv
 EdLheVyTTEmEd87MSbusJLLZU07wfodxoIuu8vGxF2bPGYcKAACR5lsT9D7r/YMaa+SJ
 nzoi6Z2UHY3fAflFgOZT/nbUWgMI5g6kgDU0lsNfkINxCYUK8rDwhQh08jPn50nj6au/
 ug+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9S2uSS3W0hK5SUoIufNlDDDlKwis8Kwh7YaicD3Lk8o=;
 b=gVw8ChFJiIMbOST74QQTGd01QsoXe1QtqYww1RRRpDPCE4YE+z9jskPNXKNRQF0NLR
 GVIgdg9ktAKcvGolpVdpBeMRa0ISJle3M+3kuBNvDqsmSDXCUaD+YdrOcneONwKUUgKI
 h98Bvh2Yqx/t9i1rFNCsGs+22IoCyshWefj4uPlBBA7VLg+udM0UVyPyB3NmOxub1hPR
 odXbmVA0+gr173ynqctuDKd64O18Nb6c0PTmXGfI9fJU/wWCmn3BnYEaAck2DMtJ1Jxx
 jrbe/WCbnvEwPB9u+IaVNxwwYk3xeR7t4dQghmTtuLaWZGpQwP5K7DFEisLsRi4TO7CW
 oqrQ==
X-Gm-Message-State: AOAM5308xqpGnO8nllMkdlIPDZD32GOQeu+45JGnuth5iClEX6VVHeht
 KImO4SNegJlo8lqG+vlFADk=
X-Google-Smtp-Source: ABdhPJy+7ytBgXbdZlME4kSoC2EgWY4FnOHWcBTQ40EB3trDU17OYr1i/nAuWWgzeb14RNk+5Ua4ww==
X-Received: by 2002:a17:90a:3f87:: with SMTP id
 m7mr5291319pjc.128.1625754809016; 
 Thu, 08 Jul 2021 07:33:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id u7sm3669115pgl.30.2021.07.08.07.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:33:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH] hw/riscv: sifive_u: Make sure firmware info is 8-byte aligned
Date: Thu,  8 Jul 2021 22:33:19 +0800
Message-Id: <20210708143319.10441-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Thu, 08 Jul 2021 14:33:32 -0000

Currently the firmware dynamic info (fw_dyn) is put right after
the reset vector, which is not 8-byte aligned on RV64. OpenSBI
fw_dynamic uses ld to read contents from 'struct fw_dynamic_info',
which expects fw_dyn to be on the 8-byte boundary, otherwise the
misaligned load exception may happen. Fortunately this does not
cause any issue on QEMU, as QEMU does support misaligned load.

RV32 does not have any issue as it is 4-byte aligned already.
Change to make sure it is 8-byte aligned which works for both
RV32 and RV64.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 273c86418c..4d99566e62 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -599,10 +599,10 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     /* reset vector */
-    uint32_t reset_vec[11] = {
+    uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
-        0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
+        0x02c28613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
         0,
         0,
@@ -610,6 +610,7 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr,                    /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,                 /* fdt_laddr: .dword */
+        0x00000000,
         0x00000000,
                                        /* fw_dyn: */
     };
-- 
2.25.1


