Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNgUH-0008NI-Kp
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 16:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coder@frtk.ru>) id 1oNduw-00039k-Pw
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 13:30:23 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coder@frtk.ru>) id 1oNduv-0000Xp-4M
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 13:30:22 -0400
Received: by mail-lj1-x231.google.com with SMTP id l10so8271186lje.7
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=frtk-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=+CteDp2kmOqZ0ie91TWZnMVxcTuuiZ86qRQWo2bjA9w=;
 b=5wi5FeXny0Xp/Hrhad5wp4C6MYaS5TSjeJ9fsvoIOnrzzMkCZ81Uq/YWRTWLhc9avS
 8KmmIIEBuEY0GuwNXpKJAtQNqLt6JezgjTA4MFBfw5SWEHHlkkopwbadmF+U1ii4FNQf
 zgWZL/JqCKlvmzA6ExXiHl2gYUAE8Aw2CxCR/L5ihv0ATfwfoU6pa8iOJ+cCiOjR+piC
 Bfqem8S4wGoqSAzARBzkrqwEJ7dt2k52xDAELs7GtLYuUAtYEb1BoYvlYhBcGHzWKq2k
 ruT6Cs6YLIuUYXCEbuL5hWNofzZIMxBUBtCi1o65C2HWyE7N+pqMMSze1/yhnj9Omd3x
 5GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+CteDp2kmOqZ0ie91TWZnMVxcTuuiZ86qRQWo2bjA9w=;
 b=nwah2AwCTlnEK8h2X+rY6Y0wfXtK5vvfC4ILBAJq6sNN1nVBQna9MBo54Pv7/WZqEB
 Gb/0ueO60giMTxwyGKABS13T+evrreM234JTZHzVZ8FVowgjnKwDs8u00O1JpWQh3Vum
 bOafArBvYqkbh9XcQTa/+DgjCCoPBu3DA2DIm0Ywi7Dz8o3g6pfmQmuVgQXE83K5NPGW
 qKW9Bl/muRkK8yn0sqUG1RJwCSwggR/nqkRS0mIX5rlzUHwRWHkhqXqIO/7+CbhcMp3Q
 KAAIh8ifuI3EIeq1m8PUIr4RAHpBmR+F3l11kODf/NBorGa/Au9oJoz+HrxhHyo6KJPB
 wK+Q==
X-Gm-Message-State: ACgBeo2GFV0EP0yWIFmrA0EktmIgPrf3kvO7lJoX+mmQBYQTfIKuksM7
 WB51PXfj5wwzEDSRmWoam4zQAfYAHW00Gg==
X-Google-Smtp-Source: AA6agR4FnL7Fp5DRE7pG77wIE8XpGQDPFi1U5k3qoFrLKoOC9vL1ew98TPWFHK6PnDoSEdNIs4Rxxg==
X-Received: by 2002:a2e:86cd:0:b0:260:55e:db13 with SMTP id
 n13-20020a2e86cd000000b00260055edb13mr4929420ljj.146.1660584618401; 
 Mon, 15 Aug 2022 10:30:18 -0700 (PDT)
Received: from coder-comp.dolgopa ([93.175.20.83])
 by smtp.gmail.com with ESMTPSA id
 d36-20020a0565123d2400b0048aee825e2esm1141816lfv.282.2022.08.15.10.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 10:30:17 -0700 (PDT)
From: Maksim Perov <coder@frtk.ru>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Maksim Perov <coder@frtk.ru>
Subject: [PATCH] hw/riscv: Setting address of vector reset is improved
Date: Mon, 15 Aug 2022 20:30:10 +0300
Message-Id: <20220815173010.19638-1-coder@frtk.ru>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=coder@frtk.ru; helo=mail-lj1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Aug 2022 16:15:00 -0400
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
X-List-Received-Date: Mon, 15 Aug 2022 17:30:27 -0000

Previously address is set by default value 0x1000 which is hardcoded in target/riscv/cpu_bits.h
If add to new RISC-V Machine in which ROM area is based on 0x1000 address than there is problem of running simulation

Signed-off-by: Maksim Perov <coder@frtk.ru>
---
 hw/riscv/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 06b4fc5ac3..5e2438d39a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -327,6 +327,10 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
 
+    /* change reset vector address */
+    for (i = 0; i < harts->num_harts; i++) {
+        harts->harts[i].env.resetvec = rom_base;
+    }
     return;
 }
 
-- 
2.17.1


