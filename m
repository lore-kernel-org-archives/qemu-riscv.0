Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3FC606A31D
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s8cjdxin
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMoLL-0004L9-Nd; Fri, 30 Oct 2026 11:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoKx-0004Iv-6P
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:16:12 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoKv-0008Pg-Am
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:16:10 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-181516de561so770745c88.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373368; x=1793978168; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=etdm1aeawsytO27AD2qjJhqW2J7wH4UjI2RO2JWtCa8=;
 b=s8cjdxinyd7QRoKvA7vJC+7PAQe4KEGVx1Je0jfh6rIA03/cfwmh+VlZ6tk7GcOreD
 A+jjuCehSnCzXTics+wlFT6oCczCtz+iPU9WfXou6YqQPqgZDnFsBbdi7AHKIxEvLO+8
 G88G++j8cGb8nvQS1DoxSYx2KCnF0/boCvQvX4LtDkU8vlXB1Z12bCCIUNBnVsAMCpNN
 Spzxj+JN+saavfkfYOCSn2vh/oTWighgWB/zc64iVHDVZJskUjXqgBezED4mvJhA8CKU
 F8JcxO75yeqx5q2ddbIdqGTs/zrs9LW0u5Dj/Mru2EzcezCoGFdKDbS912MnmtWHKgI6
 N5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373368; x=1793978168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=etdm1aeawsytO27AD2qjJhqW2J7wH4UjI2RO2JWtCa8=;
 b=RptXs2Cpk4zgjzQ2iEtANpGFMNPLQPRbCsCzLAKi7KkCHWvJcaIUBgUzoWArUVdsrX
 LDEqzWCbfHFgZMNXgZa9yW6W2Vi5rY3qCL++PxYg9VUsuJ9JX+5vK+ZuRR4BRGiD+Xl9
 C/prX7HPoFJiQ5MUg6h2RD1KfCbthB76veuSOZk6nJHRIaRg9dJ8AWMr1dp2YWFzoPOK
 a0ZKIFDlN4LUmIDgRWAvC36Jlx0a9jB7aVxN8gWeTBIJUg2zU9ZXPvY7mtDVUXpEieo9
 qxlgZlUInIxbNw1yX0ELxQdV1iBxMmTjPVX4KZaHDpv8nFJe9SN4x4E7QPiCYCXLvoMS
 kVNw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxlhiscvgI4XHGjQ4xWNNcxN+ipK9R9i0xBr6S8g1BUTTpsv4gqyx5ND2pnUkUWj8snCywVbpgio1U@nongnu.org
X-Gm-Message-State: AFq9FYLPuxR717eOvC4Pw6kssWAd0NBVKQGH0Hc0aGpuEru/Xq3kVlbr
 35/OAMIXH/gYwX3KVtjug82Es6hXh0irTTq0NvGGB936spRfSZ01duFd
X-Gm-Gg: AYBFou3TTAR71eCVu44kC8cNtr8KCmXM9KWbM99t24g6pStqyRTkfhkv74pChEqy61H
 9nwYw+n4vAGzTLOYPvx++rZkDSvBrMK278OyKa3CnRaCAiA/zM/TGH62hjpvmEIkJQG1B+TTK7Q
 xiLYH9RBHUj4EB01dUtH5UPeg4RJdVWehBLYrja6yn+Mo6FsiH8rYsGOk/w08nGoF8k1pGbvQA/
 WIh/b6Uvduo55OYDYdrIo+TDAXRUcj5czCKZldF2rnE6h6YblFV8++KT6kaPDIt5+C/5jvHIuk5
 52Jmc4t1k1RTqUCdl/04KFers/xEqJCxIjM6sQa6ynbmVdWM8tCLnHKI/KVtAtl3ydqxhl44ywg
 iv4npadOJn6dYZb4TBHBOzjl1Y/E/BKbyMpmm25tJ78GMyS/D7cRygKHjV8KOWZaEjNbjmW7Rig
 9jrszP09eLecqwa9fI9byP9VQ2CWUYf7CTGNZmUsv+nSPQMjCBfXeBFxe5z84/OxFjeSqX3pHN3
 CgFxSL7UYBVULLIrMRr1TLdIfARveH7xIQ+gVK61bPBViO7ToSIN6oB72TO6Y/Pt6B9bPiXItez
 vK7+5ecz779fciJ14JSKfPodRWdc9hKk1QZoYi6COSAtT0xFKwPLMIiwOEtK9xENNrLesw==
X-Received: by 2002:a05:7022:ea57:b0:190:716:4822 with SMTP id
 a92af1059eb24-1ac599f506cmr3074840c88.8.1793373367717; 
 Fri, 30 Oct 2026 08:16:07 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:06 -0700 (PDT)
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
Subject: [PATCH 01/15] hw/alpha: expand DEFINE_MACHINE in dp264.c
Date: Fri, 30 Oct 2026 23:15:22 +0800
Message-ID: <20261030151539.1872-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1233.google.com
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

Expand DEFINE_MACHINE() for the clipper machine to clipper_machine_typeinfo
and clipper_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/alpha/dp264.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f928e0cee82..83e9a0853c1 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -201,8 +201,10 @@ static void clipper_init(MachineState *machine)
     }
 }
 
-static void clipper_machine_init(MachineClass *mc)
+static void clipper_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Alpha DP264/CLIPPER";
     mc->init = clipper_init;
     mc->block_default_type = IF_IDE;
@@ -213,4 +215,16 @@ static void clipper_machine_init(MachineClass *mc)
     mc->default_nic = "e1000";
 }
 
-DEFINE_MACHINE("clipper", clipper_machine_init)
+static const TypeInfo clipper_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("clipper"),
+    .parent     = TYPE_MACHINE,
+    .class_init = clipper_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void clipper_machine_register_types(void)
+{
+    type_register_static(&clipper_machine_typeinfo);
+}
+
+type_init(clipper_machine_register_types)
-- 
2.55.0.windows.3


