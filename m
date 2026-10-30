Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E6606A31D
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kR8oF5LW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMoMG-0004nd-1Q; Fri, 30 Oct 2026 11:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMC-0004kx-TQ
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:17:29 -0400
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMB-00005h-4E
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:17:28 -0400
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-1ae18eb9b69so218892c88.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373446; x=1793978246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8lrMJa0QKyERxDe5fpQfZvS/Pcg04syvA9gM/OyRcBA=;
 b=kR8oF5LW0Y79ydIYo5RMFRkYct55xYcszAyYA9Z6+M49DST4/AhZiS5F2v71HN1LGU
 Mr+4xhvaBmBVPb/vot1otcD++uKakm3dk/V/OUliRAfvvc6dKN3QPO44EtuB1iLaxISU
 iJaDXwjg9hnoVZD8f0f39kNFfTvCMRrn31lPfh8ZltaBzEckawP+3bPwNiwUtp9z0GCN
 xE2vScUQzdlK/Ef2Ksn5cTCRtfnIDpuBZcQo3lrwmriMJ5WJELZCR0G9yH/qMk42T3y1
 gm7uJGwfubTiEY+AADduyIJxxjv3xSen4p6B9YGfXQTdf8BlO56M8Nt3fd1+NQMmodUZ
 YoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373446; x=1793978246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8lrMJa0QKyERxDe5fpQfZvS/Pcg04syvA9gM/OyRcBA=;
 b=vcyINQzZCl4++1fkr4VEyhoi64C5m8j9A5iFcDO2cyWDhf4UsyrOrz30hHkfIgYlAQ
 PkzVHmSp5LnS6zvEwilaGi/tGKaqaaJgq83JjNTfufFh2MhiKKzzjkT9hPksJGGe0gyP
 +zkuZv2lu6MkUCwYOFOvxz4C28PbgiCA3LEF7MJO1FSDhZK1B5KMnP1n1YHKJHVsZkQ0
 8dxoHq1Uhs62fDF7c6n6gPgrboRydOyn+fUXDipHJtG9/qCHhjgXQvp6D9r0WiujNRuW
 gbm1/yCbZ5k3lmTTPuj/PAJ4QoNFNTDIwASwWTTS8/8ge1wS7+HOD98zVjBVX7Q4QS9i
 sNlA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhTe36iXi+tt+1onwiy0B/+Gqa0mttanmTmBQ5u4tk4Zq0wXyUFBYT8WPZEbAPmHnQlAluKcMBGNAV@nongnu.org
X-Gm-Message-State: AFq9FYJQEH9DiQ0VECPY6Fa+jdvFUfDsIROaiixN9HFZTKWAFyFVqzud
 gRkc+eV+T81mpdW775Tn1AzFbdeXeX3QTkcbmVENvKLmr/tC0o7CEyi/
X-Gm-Gg: AYBFou11GtNH7NfEFRxfQeiNhUCRNlFhqU/oEvXa0Teo06SiQvmt1gxu6u3GzXt+rai
 WyQBm/veoedfe2qQFqGNNW2sQYlVv3OX6S1ynWvrpghTIoT6XL7/1/M0tyN5nBGS3mx6Hh6p94y
 oTsHQLnrWMg+lgnkqUuL+G5y0qU6g1x+trqgval32MHLMe1xDbbE4S9gI+dyBMwwVMImjLOCvyD
 srX0jKVV3SWhzzfBWO8j2H+uL1wvKHUyXvqBijo+POvNzgBR3PmTq+T0sPKeCXtCnjcbPVA0qVZ
 bmK3Bl4vVK5mUujIKEc4RkXWpybXNrcv5lga6QAsmj79khw34Hv8xYCaEOeIfB05iT0FIELPw/H
 J5Fx5jHBivfsvSMAmP533GcUh/C3EOVfCpLJVGRFxL0pWmU5o6oXrNl2vlh0aDXrtN07KPD6G1Y
 7jgSKZa88VKRpUxp49meq+zb+Z02gWzNQuwVfuqQl+bDxpcWcx5SNtJVKua+0agAi+MeNXwr9Uo
 xZpv6QtQr97i/FnlfUzjG0SRhz//9dMSVjIqIhkq4N+UO9MU6xcPn5HlSzBadgcxIzjs84OApFp
 0PWNL23VhSz9jLAZAfn6HADkmwmlf/ltPMBXojkOswdOtFiVwKqIBJAsIJ1w7oIhv67EUQ==
X-Received: by 2002:a05:7023:a5b:10b0:160:90a3:ca8c with SMTP id
 a92af1059eb24-1ac5cb1c615mr3223077c88.7.1793373445630; 
 Fri, 30 Oct 2026 08:17:25 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:24 -0700 (PDT)
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
Subject: [PATCH 08/15] hw/mips: expand DEFINE_MACHINE for MIPS machines
Date: Fri, 30 Oct 2026 23:15:29 +0800
Message-ID: <20261030151539.1872-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() in hw/mips/boston.c, hw/mips/fuloong2e.c, and
hw/mips/malta.c to explicit TypeInfo and type_register_static() calls,
reusing mips_malta_register_types() in hw/mips/malta.c.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/mips/boston.c    | 18 ++++++++++++++++--
 hw/mips/fuloong2e.c | 18 ++++++++++++++++--
 hw/mips/malta.c     | 12 ++++++++++--
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 4579df23eb7..2c6edebe257 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -839,8 +839,10 @@ static void boston_mach_init(MachineState *machine)
     }
 }
 
-static void boston_mach_class_init(MachineClass *mc)
+static void boston_mach_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MIPS Boston";
     mc->init = boston_mach_init;
     mc->block_default_type = IF_IDE;
@@ -850,4 +852,16 @@ static void boston_mach_class_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("I6400");
 }
 
-DEFINE_MACHINE("boston", boston_mach_class_init)
+static const TypeInfo boston_mach_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("boston"),
+    .parent     = TYPE_MACHINE,
+    .class_init = boston_mach_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void boston_mach_register_types(void)
+{
+    type_register_static(&boston_mach_typeinfo);
+}
+
+type_init(boston_mach_register_types)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 9a712ee9309..96610ec1fdd 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -328,8 +328,10 @@ static void mips_fuloong2e_init(MachineState *machine)
     network_init(pci_bus);
 }
 
-static void mips_fuloong2e_machine_init(MachineClass *mc)
+static void mips_fuloong2e_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Fuloong 2e mini pc";
     mc->init = mips_fuloong2e_init;
     mc->block_default_type = IF_IDE;
@@ -339,4 +341,16 @@ static void mips_fuloong2e_machine_init(MachineClass *mc)
     machine_add_audiodev_property(mc);
 }
 
-DEFINE_MACHINE("fuloong2e", mips_fuloong2e_machine_init)
+static const TypeInfo mips_fuloong2e_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("fuloong2e"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mips_fuloong2e_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void mips_fuloong2e_machine_register_types(void)
+{
+    type_register_static(&mips_fuloong2e_machine_typeinfo);
+}
+
+type_init(mips_fuloong2e_machine_register_types)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 38c71f66f2e..0a10a2fea13 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1285,8 +1285,10 @@ GlobalProperty malta_compat[] = {
 };
 const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
 
-static void mips_malta_machine_init(MachineClass *mc)
+static void mips_malta_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MIPS Malta Core LV";
     mc->init = mips_malta_init;
     mc->block_default_type = IF_IDE;
@@ -1301,11 +1303,17 @@ static void mips_malta_machine_init(MachineClass *mc)
     compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
 }
 
-DEFINE_MACHINE("malta", mips_malta_machine_init)
+static const TypeInfo mips_malta_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("malta"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mips_malta_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
 
 static void mips_malta_register_types(void)
 {
     type_register_static(&mips_malta_device);
+    type_register_static(&mips_malta_machine_typeinfo);
 }
 
 type_init(mips_malta_register_types)
-- 
2.55.0.windows.3


