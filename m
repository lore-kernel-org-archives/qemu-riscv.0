Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23758606A320
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGpjbsEi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMoOh-0007uy-Hn; Fri, 30 Oct 2026 11:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoNN-00061V-AQ
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:18:43 -0400
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoNI-0000Eq-7U
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:18:40 -0400
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-170135e43c7so1231779c88.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373513; x=1793978313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NpRZPrdA7p4HsMufejy4KcfzX3kqDfNgpM3OElffcBU=;
 b=VGpjbsEiZpc0+NaYLJ+UL8uzEaaiqm40dUD0RYNxYf/874QzQDOEH/qtfgmJjLW2mB
 NKbFKV8Ga7C6ixOyyePxFs0GOLibUy1906FCoA5biZaxZz7Ca870lMgbcCTfyWAUPeTy
 emah0qZd9/s80KFUmW/4XbpeXzqgQqDZCRe/wXgzjsPZvp/um5lhXngkBNBudIhX8H9m
 PbaFtq45jMg4098rVWuH+wfiDhM4m+Cb3qUCnagBzUFYthGfRCsNU68oJ7NcWpE4/Cc+
 W+tD69MAtSJJoE13W1s+t2HbjgKLcmjxKfY1D/VIRrlr1+Xxt+qrCMfBub9fcdCjC17a
 rwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373513; x=1793978313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NpRZPrdA7p4HsMufejy4KcfzX3kqDfNgpM3OElffcBU=;
 b=aEKD5rknNNl7jU7Uy8AfPRJvzEcsPjeLCXyl3fHJBqsMOnUDl/ngxSFi97/nEjz+ka
 annIkiGCrauip+E55u5lKFQscEG32rPTkup20RX3h/WeO9f5mUl84VMxg1tucDxnCqz1
 Lfsxajnbo/M7rv/CTKgtSpughJyZbKq3E8VSGjtbH8y+lXygqre4ZOwyjA+CoD5UCx9S
 CWWTUD3jrmAHlG45jTSsgfUstUbHSeFkn17MR+dUld1EmWQRfxcNbIzAMlCMmSDoScgd
 fcf5wE4Imkiyrwv+w6xAWQnHQHQSXhbxnhtQ5tkc7ILAffCYyHMOhJdp58h5Mn9Bhv8o
 /lmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw0q7gAS1pfF7AgmKIM18xiSU+fsePvO05cokEzdFyLDyKYP1pmvZrDeNQE2CJTfm6I+3WzwBLdpkSU@nongnu.org
X-Gm-Message-State: AFq9FYJ7NzNMVjZjK5Or60+zDEmErzeeVEhU4PYiek6PMJlJbnMXpQYr
 6yQs7k1H3MZbkDLZLxRMu3ZnUn/33GCv4F72uOGrxdiQ2pqPJ7njWFE+
X-Gm-Gg: AYBFou1aF5aWIAUP5JVAVOiSovI5KehBQYSrwOrpjdd+lcSEOHvamEhTNesqmGIF39i
 mriQUIFOOUzTw8CsqlTkH/9b8ZZ6XyGOeWCWpknhvxl7sWFY9+VTtYPKlGMSWY8Lag/FtFD6dt5
 XcmVCG4FZ9xBX219JFCZsP2c7jc6tg0X0Mfx/LNoveuN4pjYnyJgVbHY7UN7izHSbVdlJsb5tTG
 amq0c4xumh49AaiV8drI/lc4w5baPLKF7Ab8cJ1MKJYo7knAos18Q69BoQzqR1Ux5VvIwYuMyrS
 ebhHN0sAiQCoSBAge4RrFDzdSeGpNB9cg3NOXIENErpKVUNl2Rvf3OICf89uFIUuvFDt/F0Y+aa
 oITLmYqmkz0MSr84nXksFYFga5Fd4zgDxvgDiSzDemMi+3O82HiuQpR2gU7P9HjH+tPFTFJQL+i
 qW42voSwvcePmpGfUWWLU6lZJSsr+uR25lt1reOt4qDdHDRJOw3xiz6PQ9sOReull+exF6l1iPc
 FfknAEj0ahgWxn9JC/ety0hFIjfspBty6LBAbk5iH54AkIWe9N6dviCaB+X5BKbHxpKdR8v32v/
 FM1to6z8HwxrXY8l0E7erm7VcoBa12eFxqvDZgRZUOmZxlKX6yasB9m7PxMf0daHPHdUXg==
X-Received: by 2002:a05:701b:2082:b0:143:271a:3df2 with SMTP id
 a92af1059eb24-1ac5eea21f1mr3303233c88.44.1793373512457; 
 Fri, 30 Oct 2026 08:18:32 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-ppc@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH 14/15] hw/xtensa: expand DEFINE_MACHINE in virt.c
Date: Fri, 30 Oct 2026 23:15:35 +0800
Message-ID: <20261030151539.1872-15-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/xtensa/virt.c to xtensa_virt_machine_typeinfo
and xtensa_virt_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..8c8fdad72f0 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -115,8 +115,10 @@ static void xtensa_virt_init(MachineState *machine)
     xtensa_sim_load_kernel(cpu, machine);
 }
 
-static void xtensa_virt_machine_init(MachineClass *mc)
+static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
@@ -124,4 +126,16 @@ static void xtensa_virt_machine_init(MachineClass *mc)
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+static const TypeInfo xtensa_virt_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("virt"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xtensa_virt_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xtensa_virt_machine_register_types(void)
+{
+    type_register_static(&xtensa_virt_machine_typeinfo);
+}
+
+type_init(xtensa_virt_machine_register_types)
-- 
2.55.0.windows.3


