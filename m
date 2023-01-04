Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBve-0002Sg-HM
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBv1-00025J-TE
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:33 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuy-0008L6-Ej
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:31 -0500
Received: by mail-ej1-x635.google.com with SMTP id jo4so86006395ejb.7
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmavs6sB32iuk0P3966mjPd+ATivEhkJqHU5LgWaQJM=;
 b=ZTzMbgFdAqNU+m8VRz2s+o2Vz5VeZXQ51dVr6ermRNbcO2+233UkuOZmWsdCFLihOs
 v0NXw4mi10RJSrjJCmmKxb8/gYg3P0mXfq+NxcpORte0pdXovaS3JVTJ25t2rLUFUfk+
 mZX0m/TGcZbfZPvUip8vtzJqd8G7akAuh02cbjT1OvyfQHZHZIWsR6PbB1EW0xr+rkx+
 h5m7sRBLJwiWrXIUApTFMu5D6mBbZLvYsgc22QA34RcoAddm/pQRR7S83oTSA+ZQ4osy
 l5slett8vvp+vKJfZK2xGrBj7EpdFGvAzv/RxR0lhebPGF/AaOHVI4mj0xNqryqEHtjI
 RLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmavs6sB32iuk0P3966mjPd+ATivEhkJqHU5LgWaQJM=;
 b=pMObk+Csw5DlDz4HVAkBOGB4aNkRl/xBOJwFUnQOZjq617napNBXIyii4rBMBZEg8h
 SK4KIj0Lo6VTe9PXSqspH0bjklPNUOwTncfFLtGmNGVbygZ0HgPunNyQyttLtBL57ZgL
 NvqVyjGopAV7eX8PaQmtK0BrCxVbDzxDEAkMVSsOesnCLamBa7WzZ5SQrJeEEbHCxNd2
 wPsQReCH/qHQ50xf+vqW8vM8me2uQMsgwEXeHqZoSl4zYnho/KkmDZ4kgn11H6FUaijm
 yM1wVNjaZJ0rPa4iql8rYtUGaUIu8SacFoRMXWeaXomQwY6zOfKxD8V0lSdwY6gKCuRX
 c8Vg==
X-Gm-Message-State: AFqh2kpdELUvx3vuSgHFqcOBUAKnDfMx22aeQNqYLhZEurDTRc8yryIh
 denFkWxWOBU/lci/eKaSfxigig==
X-Google-Smtp-Source: AMrXdXukaIMGAoPUZxP9E447Jv73dbe7wRKGQx28j0E/6RmcT20yWBP4LJqjos7iiL226lhZ/tjlPA==
X-Received: by 2002:a17:907:1385:b0:7c1:6167:7816 with SMTP id
 vs5-20020a170907138500b007c161677816mr35390562ejb.28.1672870047775; 
 Wed, 04 Jan 2023 14:07:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gs2-20020a170906f18200b007c491f53497sm16084240ejb.170.2023.01.04.14.07.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:27 -0800 (PST)
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
Subject: [PATCH 18/20] hw/sh4: Open-code pflash_cfi02_register()
Date: Wed,  4 Jan 2023 23:04:47 +0100
Message-Id: <20230104220449.41337-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:35 -0000

pflash_cfi02_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove to remove pflash_cfi02_register() from the pflash API,
open-code it as a qdev creation call followed by an explicit
sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sh4/r2d.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..43a8c56d14 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -302,10 +302,11 @@ static void r2d_init(MachineState *machine)
      * addressable in words of 16bit.
      */
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
-                          0x555, 0x2aa, 0);
+    dev = pflash_cfi02_create("r2d.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
+                              0x555, 0x2aa, 0);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
     for (i = 0; i < nb_nics; i++)
-- 
2.38.1


