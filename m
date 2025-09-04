Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7925CCA101C
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu56o-0000Ao-Ri; Thu, 04 Sep 2025 04:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54p-0006QQ-CT
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:12:18 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54P-00045c-4D
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:12:13 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso137851166b.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973507; x=1757578307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cDNuaOsGD6r42U8ngLUfY1h4DF7myqs0cRJmalDhUb4=;
 b=xUWz195pqBsLmcCReE/sfbXU7RMWUFfpEB9xYxaQBt3qPAqqr4zqCpdKxQESjLRxvE
 cH+SQexwlf9z1CdIDlXay5dC6hX60d7jKaHFGgYk2SV+mpwVaws1iuoePVuKvO05t2At
 GBPtIwTgDJcmvx4q941GCl3Utk1LP14NHO4yM58eAQiYsNk1qOaHLs3mDUbtu3CV8dJa
 feXuTsiGGmntjRXmdpu93YZNoAZgxOdGNOe6QJzLWcHZjIH6HO7MB1DV/9WyV10DuMLp
 RPiBHEYX3yO0AYdDeiaOZ9vhEhgULVKpiNYx7xTPb5jU/D1IoXvhjhLB+8CmDCeWPGcT
 WIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973507; x=1757578307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDNuaOsGD6r42U8ngLUfY1h4DF7myqs0cRJmalDhUb4=;
 b=nnEZiRbpAQf1VeG6ZJHNNJ1CAzdnPe3R0frHWKbJUDs3in1v82ODUfEyIjCm9N8hzu
 vWNceiPXAue4VizY9YGDojOYPX4lNzun2qgItcQRw7RJSzdFA/jlMLp9PpWufJp0+81s
 SVLWs0x+e5m0mfifGPimXmBoT5CSLuQdS16JI4oNWDhAuUJDknzxz3m1Dwx80LhO4ual
 vVN91P5P8viMDe9trBneog2SZI+CUVdkzASpdHNhC3srIBtm+0xnbcztrIjKshCuOg46
 aSGw33AZJ3tmbNbEoykOOCa9K6HgrD/R6jxlwzyPAbuEIAG+uuIG9iFdApt7dbMBa2be
 MFig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeadagJULUkbojs7/G/ZhYYAwow+H1pG4DiRzsFnSrOjyHOFDMulKNohRijRp4N1fibveQBXkedgM0@nongnu.org
X-Gm-Message-State: AOJu0Ywdc6Azc7ZnymDRSrRppfrqytdvMT6GDiu1POrMQKy8fH9cj+/o
 wWCD+P0k8bojjCn92pXLguyMiw1iHuMipIL7oN9hj/lUZg2OIqsKOcUdd7DNacnBgFI=
X-Gm-Gg: ASbGnculrZ6esbbhlbuRo4B2Ugd0TwBHXtuSuAPHL8z9XV2qh7ZZEc2enQhqsL7eF5y
 fmMnPQZWf8xpHLSZ2/nHver4A5cjU7gx8TG+GjAACx6Y9EtEJGHQpKpzEJf1bOLFRhb6jlEh/2k
 B5IPfOIugOrCRodeBqVGeEkSfHWQOGEM8sNWcu/knJuD3iM0Um3IExn6jze2j2eAWm31x/bEgQ2
 zpYrpuG+ggJ8smI9/xEoC8i0rSJhq+JkyoHq+plB/keAbVc2yyhv3yJL9qER0S9TKHiLZiLYxFo
 mKE7qK/WXOoWGfYz/Ohs3ckuG2+Y2vUJV+eQQLJ+65KbcPRKkDVC6smyTM8ht1ZyvcYA5bCqIu2
 ZW4cZq6zuhCTzyx4vn0zOF5PQzfq3vBW6YuYK3c+UeHEe
X-Google-Smtp-Source: AGHT+IEuGPLBjng4TGodrmsMkqQv/1x2d0i2N2XuU6rOMtEyrvdgiQZZOH9o9y1LB92mX/fQfkpwaw==
X-Received: by 2002:a17:906:9f92:b0:afe:a615:39ef with SMTP id
 a640c23a62f3a-b01d8a2667emr1911016566b.9.1756973507309; 
 Thu, 04 Sep 2025 01:11:47 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0416e878a2sm1085838766b.95.2025.09.04.01.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 19D475FAD0;
 Thu, 04 Sep 2025 09:11:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 024/281] tests/functional: Move m68k tests into
 architecture specific folder
Date: Thu,  4 Sep 2025 09:06:58 +0100
Message-ID: <20250904081128.1942269-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Thomas Huth <thuth@redhat.com>

The tests/functional folder has become quite crowded, thus move the
m68k tests into a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-13-thuth@redhat.com>
---
 MAINTAINERS                                              | 8 ++++----
 tests/functional/m68k/meson.build                        | 9 +++++++++
 .../{test_m68k_mcf5208evb.py => m68k/test_mcf5208evb.py} | 0
 .../{test_m68k_nextcube.py => m68k/test_nextcube.py}     | 0
 .../functional/{test_m68k_q800.py => m68k/test_q800.py}  | 0
 .../{test_m68k_replay.py => m68k/test_replay.py}         | 0
 .../{test_m68k_tuxrun.py => m68k/test_tuxrun.py}         | 0
 tests/functional/meson.build                             | 9 +--------
 8 files changed, 14 insertions(+), 12 deletions(-)
 create mode 100644 tests/functional/m68k/meson.build
 rename tests/functional/{test_m68k_mcf5208evb.py => m68k/test_mcf5208evb.py} (100%)
 rename tests/functional/{test_m68k_nextcube.py => m68k/test_nextcube.py} (100%)
 rename tests/functional/{test_m68k_q800.py => m68k/test_q800.py} (100%)
 rename tests/functional/{test_m68k_replay.py => m68k/test_replay.py} (100%)
 rename tests/functional/{test_m68k_tuxrun.py => m68k/test_tuxrun.py} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 716127e831d..e188de813fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1312,7 +1312,7 @@ F: hw/m68k/mcf_intc.c
 F: hw/char/mcf_uart.c
 F: hw/net/mcf_fec.c
 F: include/hw/m68k/mcf*.h
-F: tests/functional/test_m68k_mcf5208evb.py
+F: tests/functional/m68k/test_mcf5208evb.py
 
 NeXTcube
 M: Thomas Huth <huth@tuxfamily.org>
@@ -1320,7 +1320,7 @@ S: Odd Fixes
 F: hw/m68k/next-*.c
 F: hw/display/next-fb.c
 F: include/hw/m68k/next-cube.h
-F: tests/functional/test_m68k_nextcube.py
+F: tests/functional/m68k/test_nextcube.py
 
 q800
 M: Laurent Vivier <laurent@vivier.eu>
@@ -1346,7 +1346,7 @@ F: include/hw/m68k/q800-glue.h
 F: include/hw/misc/djmemc.h
 F: include/hw/misc/iosb.h
 F: include/hw/audio/asc.h
-F: tests/functional/test_m68k_q800.py
+F: tests/functional/m68k/test_q800.py
 
 virt
 M: Laurent Vivier <laurent@vivier.eu>
@@ -1361,7 +1361,7 @@ F: include/hw/intc/goldfish_pic.h
 F: include/hw/intc/m68k_irqc.h
 F: include/hw/misc/virt_ctrl.h
 F: docs/specs/virt-ctlr.rst
-F: tests/functional/test_m68k_tuxrun.py
+F: tests/functional/m68k/test_tuxrun.py
 
 MicroBlaze Machines
 -------------------
diff --git a/tests/functional/m68k/meson.build b/tests/functional/m68k/meson.build
new file mode 100644
index 00000000000..e29044a6d73
--- /dev/null
+++ b/tests/functional/m68k/meson.build
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_m68k_system_thorough = [
+  'mcf5208evb',
+  'nextcube',
+  'replay',
+  'q800',
+  'tuxrun',
+]
diff --git a/tests/functional/test_m68k_mcf5208evb.py b/tests/functional/m68k/test_mcf5208evb.py
similarity index 100%
rename from tests/functional/test_m68k_mcf5208evb.py
rename to tests/functional/m68k/test_mcf5208evb.py
diff --git a/tests/functional/test_m68k_nextcube.py b/tests/functional/m68k/test_nextcube.py
similarity index 100%
rename from tests/functional/test_m68k_nextcube.py
rename to tests/functional/m68k/test_nextcube.py
diff --git a/tests/functional/test_m68k_q800.py b/tests/functional/m68k/test_q800.py
similarity index 100%
rename from tests/functional/test_m68k_q800.py
rename to tests/functional/m68k/test_q800.py
diff --git a/tests/functional/test_m68k_replay.py b/tests/functional/m68k/test_replay.py
similarity index 100%
rename from tests/functional/test_m68k_replay.py
rename to tests/functional/m68k/test_replay.py
diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/m68k/test_tuxrun.py
similarity index 100%
rename from tests/functional/test_m68k_tuxrun.py
rename to tests/functional/m68k/test_tuxrun.py
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index e2e66dcf523..d32dd4a371f 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -16,6 +16,7 @@ subdir('avr')
 subdir('hppa')
 subdir('i386')
 subdir('loongarch64')
+subdir('m68k')
 
 test_mips_timeouts = {
   'mips_malta' : 480,
@@ -81,14 +82,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_m68k_system_thorough = [
-  'm68k_mcf5208evb',
-  'm68k_nextcube',
-  'm68k_replay',
-  'm68k_q800',
-  'm68k_tuxrun',
-]
-
 tests_microblaze_system_thorough = [
   'microblaze_replay',
   'microblaze_s3adsp1800'
-- 
2.47.2


