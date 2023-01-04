Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBt6-0008SS-TI
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsp-0008JF-4B
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:17 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsm-0004zc-EB
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:13 -0500
Received: by mail-ej1-x632.google.com with SMTP id qk9so85776550ejc.3
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkKzY1HM1SiWRLbXS14jWSBKvZcyQVWsRHeTd+kMCAQ=;
 b=DarwSARFklHss2v0qIjFWeNAW6nNn1DVlR4Qz3fDpCU58Ljx5QTBo4LNk1mWeDze+T
 K0vUYHIWkRgv17TbkDomH+4N2YNXpQLmMgd4XIN8JDzrxA2/XHu7Y3rj896fTmtoN1+P
 RTATh9GVG/Np05/A9Mu1Vfcg0xeWjYaYeD5F+Io6x7aXBAfKWqOBKrIdk3JWMjNCp3ir
 vDdTOWyLwZaZQGL5WSSIhlA4YgodVPctNzGrr1UPvbI2A7Kf7oo4PNHXZpq4ATHkM7XO
 Uya4xYs9J31bxpmsfGf2AeBPNb4JGPhK4jar+Nww68/TEg995FEfqKtwttI/i28DM39M
 cfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkKzY1HM1SiWRLbXS14jWSBKvZcyQVWsRHeTd+kMCAQ=;
 b=MmiZcGV70VxlKv80KjOr6IVKgpgmfRc+Se6PpSyCtwpyZ2vTnremO0+jml+GceEn7L
 qTPSUSfEcqHJkn7ywZ+q6AkPlRf41qsuMdTr8pVJuoWdL/7tI41hFH8m9MOQ5JJxl/E+
 L2iAxvo/lDElr5EiS3N8dd4QqNP/nuaLYn5AN0X95k3TyM4mOwHUY6pFtgOTrIElM23I
 7v4vgRz42MamZEy1iVpQNr8BMVCb/5m5udHNHqh8subw9qyUHtuwI3Jj5/fQ1mKooYIg
 pNIlrS9p0QIa7fnYh1vo8lw0VuxQnOpLhdhRMZ1Z0fogd5VZZoK930BP35PzA6nO4OCA
 01rA==
X-Gm-Message-State: AFqh2kpnotWtlt3C4g5nF+4FJXcuTtCi3Ob0Myq7lC1rrvDQXPUMmkeH
 MPApkqC1T6b0T9ZnHN8HTJrRXA==
X-Google-Smtp-Source: AMrXdXvFmpmXp0W590jjU/JK0hS97Y6poWePeIXehJ3olRjRpEuAe2EOY8h+HqJzFrWUS04TKPThMg==
X-Received: by 2002:a17:906:99d1:b0:7c1:12ef:bf52 with SMTP id
 s17-20020a17090699d100b007c112efbf52mr39098475ejn.3.1672869911272; 
 Wed, 04 Jan 2023 14:05:11 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hb4-20020a170906b88400b008143bfe8429sm15797738ejb.73.2023.01.04.14.05.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 02/20] hw/block: Use pflash_cfi01_get_blk() in
 pflash_cfi01_legacy_drive()
Date: Wed,  4 Jan 2023 23:04:31 +0100
Message-Id: <20230104220449.41337-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jan 2023 22:05:18 -0000

By using pflash_cfi01_get_blk(), pflash_cfi01_legacy_drive()
doesn't require any knowledge of the PFlashCFI01 structure.
Thus we can pass a generic DeviceState pointer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c        | 2 +-
 hw/arm/virt.c            | 2 +-
 hw/block/pflash_cfi01.c  | 6 +++---
 hw/i386/pc_sysfw.c       | 2 +-
 hw/riscv/virt.c          | 2 +-
 include/hw/block/flash.h | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 65b9acba04..1d29e8ca7f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -340,7 +340,7 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(sms->flash); i++) {
-        pflash_cfi01_legacy_drive(sms->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(sms->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
     }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 954e3ca5ce..57726b0f52 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1227,7 +1227,7 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(vms->flash); i++) {
-        pflash_cfi01_legacy_drive(vms->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(vms->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
     }
 
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 458c50ec45..8beba24989 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -1002,7 +1002,7 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
  * Else if @fl's property "drive" is already set, fatal error.
  * Else set it to the BlockBackend with @dinfo.
  */
-void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
+void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo)
 {
     Location loc;
 
@@ -1012,11 +1012,11 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
 
     loc_push_none(&loc);
     qemu_opts_loc_restore(dinfo->opts);
-    if (fl->blk) {
+    if (pflash_cfi01_get_blk(dev)) {
         error_report("clashes with -machine");
         exit(1);
     }
-    qdev_prop_set_drive_err(DEVICE(fl), "drive", blk_by_legacy_dinfo(dinfo),
+    qdev_prop_set_drive_err(dev, "drive", blk_by_legacy_dinfo(dinfo),
                             &error_fatal);
     loc_pop(&loc);
 }
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 4b85c48ec8..c08cba6628 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -214,7 +214,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_cfi01_legacy_drive(pcms->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(pcms->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
         pflash_blk[i] = pflash_cfi01_get_blk(DEVICE(pcms->flash[i]));
     }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..400bd9329f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1517,7 +1517,7 @@ static void virt_machine_init(MachineState *machine)
 
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
-        pflash_cfi01_legacy_drive(s->flash[i],
+        pflash_cfi01_legacy_drive(DEVICE(s->flash[i]),
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 961b6e9f74..701a2c1701 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -23,7 +23,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
-void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
+void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 
 /* pflash_cfi02.c */
 
-- 
2.38.1


