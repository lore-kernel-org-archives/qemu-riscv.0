Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E8606A31D
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvddITIR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMoM6-0004em-IL; Fri, 30 Oct 2026 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoM2-0004bp-0h
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:17:18 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoM0-0008W1-6G
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 11:17:17 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-1931ff67a29so121242c88.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373435; x=1793978235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m864uzH9D1nJnXhJ32zoDB2BUw6AVK2KA1WWNZhkMsE=;
 b=UvddITIRGppPhk9RxFZ1M/UETsEUgmdxoB86M8NSL032pxbc/5q02QcGEcIszdnCuW
 jLeuEJuyX3Vn1kb8Uhz9hCxBwkf82vm1ITfM2bJJerRzgJ4hQaEwjO3/e0KiqP4Tni8P
 DKSc/r+nJITU/Muocw2gKHVf2TfCHOd6at2u8fA3FCaYhjOhHXKmOO09WFwPdne67MUT
 J45s/QiLXWAhcJ/AkYrEio09H+qeieLXNCujtEI1ClWtFIRCuF4Sb37Z9Dbrhaduogpa
 HtDLo+jig+3zMSIiEKENl3zwUpF3Z75VcdZc/7Rd+05u0AjrATODJiVVrgRXs/6LgZoO
 MjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373435; x=1793978235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m864uzH9D1nJnXhJ32zoDB2BUw6AVK2KA1WWNZhkMsE=;
 b=rha7opfUrOCrODu24kS68pfoxB5gqZVaZmgk+vLUwWEa+HqjHt6bqjtsCAAUeOPwx9
 qUN5IHJ2plkbnvsDcqRtJ6GwlebMGpZjzCdtwLOxFLz7s0wWmeqOBxE2PrKtomi4PBbm
 IDsEKLS1v+A476n9Z0rUo9EmwTZDZ3j4IrilKkpRg4z2B0r6HSl14N46DMZLn8ilkL9u
 6IhidHi7fPFD+uPB4GDS3PvgeO6GYGr/6+pW05ubQzMnEKTy+nAemQqQ1t6IE3yJ38R4
 2A+cibgwFxQkZoz1pP6qtzfwiiKjsXcVa2Ttc2Rh2cIhY6cvTpxWoIwgDuhQDbY/i4/L
 JMyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5OT3PmX5ZmjpbplK0/zKgbSIUt/kP2BGThaFWovHN9iYTX4cq4cjXRn9pYkFVeRQdJ7eeETgvv8yI@nongnu.org
X-Gm-Message-State: AFq9FYKrGZg3mCKdRdtmtdjyFWCSlt0hpCq3bJ107+krKmjBFe+cESv9
 6S59qMDo66Pna/15nxg9rp6tHRCisiHHhazpHigBiv7Hm6pb92J8CIYJ
X-Gm-Gg: AYBFou0sV/O6j17J973OFqnVcJ0Yx+gv/BEM7X3FPgNkPPhzFtFc2vW0pVRiyTHp/C6
 JgS1si1xt9h9bqvTO6r30MIa+acinLeeklytqfb9QBJmQ8E3TQX70v72+IP2zScT9urHRpJLacw
 Vy4JINv/ZSxk77F1iY00bTaMRf+2z3XBaaeEq/FlNiMm5g1AWsqQGUmN80gS7i9gBVMUg2zRs1F
 6Y6bMTZ6r2XkmpECHyuFRD+L9f3aDICY3w7mKiiKptcCU0U+NKHKFnGmRFlOhAoJ5mWP6UujyAx
 /az/vU5ePx5HsrEcLFSj2di75fOwZGMhL0aR6XaL4gsvcAXSYeKp0s9bZVfG/0FR9+3wCtY6U2q
 c4GF6Ra+xzQf4cmh8JysevRSDwiPIjA1cJ+Sp0LfPmkonmf87HxxS+J+WD1mVd7VjPtZ4OYqE+e
 itpU+OygXGUxfzt4BZsPoM/wFHsbaltJsQCcw0auVuDgliVpwwHfAsceOM3ux5GCUPIfh8jY1+y
 e/vDFKv2iIqem6b2K8di3lrD1V/QR92s4YOP6y0VnWlePSiHIhnxahx7BHIEPJV4gCHWaxGa0fl
 JwyGCuFC+sXniKDeMp8sG+dVhZqaOr555g==
X-Received: by 2002:a05:701b:4512:10b0:181:73fc:e53 with SMTP id
 a92af1059eb24-1ac5b7e21fdmr3546543c88.29.1793373434663; 
 Fri, 30 Oct 2026 08:17:14 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:13 -0700 (PDT)
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
Subject: [PATCH 07/15] hw/core/null-machine: expand DEFINE_MACHINE
Date: Fri, 30 Oct 2026 23:15:28 +0800
Message-ID: <20261030151539.1872-8-luoyonggang@gmail.com>
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() for the none machine to
machine_none_machine_typeinfo and
machine_none_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/core/null-machine.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 60254913019..1f35b9169d1 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -42,8 +42,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void machine_none_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -55,4 +57,16 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo machine_none_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("none"),
+    .parent     = TYPE_MACHINE,
+    .class_init = machine_none_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void machine_none_machine_register_types(void)
+{
+    type_register_static(&machine_none_machine_typeinfo);
+}
+
+type_init(machine_none_machine_register_types)
-- 
2.55.0.windows.3


