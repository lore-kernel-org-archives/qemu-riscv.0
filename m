Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BC3606A31C
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M59x8trc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMoOC-000752-CJ; Fri, 30 Oct 2026 11:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMu-0005gQ-Sn
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:18:16 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMt-0000CI-DD
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:18:12 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-18cdcfc05ffso1080362c88.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373490; x=1793978290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sGbrF5LygDW3ceui1OfwylCKsorUyXpzXpw3dzNJEUs=;
 b=M59x8trcVOIrEiYkMCmKvG+aZBLP3dD7nByh0vH+qYxWsGfBYYCALFM+Q9Lp24wG3a
 ZAD+oRzxU7ocOdBszW5NZnPKJh7Ax2au3zXUkNbHWJPmAv5laxAXseNlfBwLtPT+Z+Ce
 CqO5FA7Fw18afEpjnKyz22jFPLxQnr7jtXW7RZQAbu3V2AKW4T6yg6pWZJIkecxaHCgQ
 6MNReWSvJV1AUEA9Gr9+7Hgx/pKFda1753VduU21er4n8ElGdrsB628XzniiX1T5m7O5
 X8OaBrAMMAyOB+skEUJ/eFCUMEQ3FrzE4qbx+29DA1nJ2wLAFzTchw9Dc2bUwM84MgPn
 BJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373490; x=1793978290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sGbrF5LygDW3ceui1OfwylCKsorUyXpzXpw3dzNJEUs=;
 b=BEFprnjqmtlPG22jcPvQ3cgthic7twDcUN8pEj1sYqSs0HcDDOWoN/++o9BwHde84x
 OOsynIJXvz3SoidjyCC0ItAnUtNvN9/Lqd69AcVAPkKRGXQBmQazORNIntABaTL3mXfA
 YR15GJmzi+ll+FnMPb2njFDKZ5D0vfDtuRHqx0TeTJAru6EtAkjqarIMZNpExdJbvnN9
 sKh5h4ir494n+jZvaFFBjTPi4zK7CSQb8POIPWoKpC/BR3UqMQdGd4ZZ7QBaWZcUByDU
 8fKUEBoVhQtszFqICDqGPEvKS3Cebo+e1PfFjCS9q/UGuDZChFrATiPypfcuixfEejT8
 aFIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwaf0nHyfqZVC52KaKZo3qVPifJqaLqOYb8f7Whzchy+ymr2O2bWgMt9ZkWPi9RBXfKaaRImUURLWoj@nongnu.org
X-Gm-Message-State: AFq9FYJRiiQbfIqJX7xm3XXQqVxi6BFO7pZwzoXDn3/ycNca3VnLQY3M
 gyTLI98DKHVhypT7XQYkjDyxkzOOfKmZV51iQHEDVHMMfsG52ewt/lVs
X-Gm-Gg: AYBFou0AZ5LtE3azn62ZxgV9LhEZMtS0obC9u9OpKGfI/jNB5P0lh1aBpw5Bov8yEH4
 IRQ7IqVUH69NNnl+OBZTiUJdSc9t/+FDu+4x2ZV7ENsQiL4jlXtdvaMiTaVKsBsoMAnNOwSRyEV
 i5kdUraXJ+f7wozqGe5tfS2zyN6ziREtPHpegDtlTEPrTkwj8OhicGRLxtAnlooJ6TxU+Pch2ou
 mpFyVQTLTJvuRAQsL8M43lpQF6uProHR3DNOHGPniU1tLqw4bdOeV56u+FJPXSXXY1Jdd/GP84Z
 aD//vVHdzd4+o5bgOtH4uuoLKMy0iccCHy6MPfcQ+YvPhFe2mBd6NAHOzXgazhlSv8TfZRaDVFx
 lA47q4hY8FzEKqrjaSsL27jROXfqiRM3GKM6m51IuVJ26Qg4x6/77RCTu9MqU7f26ieyBkuNxPB
 Uf6NIms8gIIYssuQbUjy5t/oyU20GJZqQHuen/imrJcQaYqOeBH2iJLvtFhBIv9zp7MM+3YLmna
 60hSOnMiHqxQsU/1X+e7H++AhmW53Jbnkk08bGnE7eOx6e/cdfk2zWtzs4rNvO0UhESFPA7jihY
 px+iBNSodagROrzezqgiPy2VYngXk88CuGeEVSy5K13/YDVjrWcQs27oV9k+dQr2htFmUw==
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id
 a92af1059eb24-1ac5eea0384mr4400234c88.47.1793373489939; 
 Fri, 30 Oct 2026 08:18:09 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:09 -0700 (PDT)
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
Subject: [PATCH 12/15] hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
Date: Fri, 30 Oct 2026 23:15:33 +0800
Message-ID: <20261030151539.1872-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122d.google.com
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

Expand DEFINE_MACHINE() in hw/xenpv/xen_machine_pv.c to
xenpv_machine_typeinfo and xenpv_machine_register_types() calling
type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xenpv/xen_machine_pv.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index c406821c34c..85ba65a3243 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -61,12 +61,26 @@ static void xen_init_pv(MachineState *machine)
     atexit(xen_config_cleanup);
 }
 
-static void xenpv_machine_init(MachineClass *mc)
+static void xenpv_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xen Para-virtualized PC";
     mc->init = xen_init_pv;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
 }
 
-DEFINE_MACHINE("xenpv", xenpv_machine_init)
+static const TypeInfo xenpv_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("xenpv"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xenpv_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xenpv_machine_register_types(void)
+{
+    type_register_static(&xenpv_machine_typeinfo);
+}
+
+type_init(xenpv_machine_register_types)
-- 
2.55.0.windows.3


