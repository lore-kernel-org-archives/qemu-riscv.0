Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOjKd-0006Cp-Nj
	for mharc-qemu-riscv@gnu.org; Tue, 23 Mar 2021 11:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKa-000695-Ll; Tue, 23 Mar 2021 11:52:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKN-0003jm-Lk; Tue, 23 Mar 2021 11:52:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id e9so21286895wrw.10;
 Tue, 23 Mar 2021 08:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bj7TZ4+mc83hcgkGuDGKQL6jYjIXiQVYGK6Ern5Gl+A=;
 b=Bec1UKXjtrrB+BWybUtTAxlv3QiOPKqWtHrQj1p9Q/7rgFN119qOhG06LOkN0Alm2b
 Qmv2Uzt895vctULobOpXZTDuwoXMctV4PPMv2z8HvgGW/E3snlNaFPepwNfkylFfNsXa
 EQCO35iA0DEP8dSkhUxD44yioUvGr//Z95i8PHUptCb2u/OBb43UGaQV4SPYtRcd67bj
 3LF6GhBKiC8BRIiaAUEeoAudGcSb6MstvCoUhApcTqCnwChiq3k0gJqOi4WMzXbr3HPA
 cZq7NKgP0Hamqq9NygFPWIhgnfRA7p28aAa/7i5dmQ+1GaGWZXpCAuHz7+TNr+j89MSj
 qapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bj7TZ4+mc83hcgkGuDGKQL6jYjIXiQVYGK6Ern5Gl+A=;
 b=gGK1kaVnHUSiJvtY+O9RC2PnE8+G4tOCyrZzDwZQbKVgtQXxQrGjBuMdEj/b3Eg9/j
 bS/kGAbYb+LLx2A+gl52bkuQ0kt80flIH+sGYQnXt/Ec9+gsv1CeFg2EZ6adpfNq+jJx
 o2w/8tIp4gaImHlzPkck5hdqc/ooim+6JYqsLXcsYfLBBCSY5aVu0CCDT09wHiWJLCo1
 Y6jyRxUDIxlyS178SZ5TkCepLML3VJjzy0YN+ewbvtwrgGL08/MbrQM+zwtJIzjhQj9M
 5FQYDr+BJyjX95PHbqwITo9VK3i6rFKP0/8PkgT4/GRiCJ4ilGWTrFnKLEIiLtPBMohQ
 tO+g==
X-Gm-Message-State: AOAM530xW0yEhTyujPnbPrJPPodKhGZT/KKeaf3Gm7vONAHUf4tnzGZD
 BMfTWlVpUl1D1qXVKxBrCbWU4pj7jkmFtA==
X-Google-Smtp-Source: ABdhPJyiydqH+lk+0C+/mg7jj/e7lWonsqnDL+KN0muVcKLZdpCFS0mVL02PP3Z+4arp2/amQR6IHg==
X-Received: by 2002:adf:b313:: with SMTP id j19mr4626407wrd.188.1616514737216; 
 Tue, 23 Mar 2021 08:52:17 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g9sm24439663wrp.14.2021.03.23.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Subject: [RFC PATCH 09/13] blobs: Only install firmware blobs if riscv system
 targets are built
Date: Tue, 23 Mar 2021 16:51:28 +0100
Message-Id: <20210323155132.238193-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 23 Mar 2021 15:52:33 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org
---
 meson.build         |  2 ++
 pc-bios/meson.build | 13 +++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 6f5561c2212..4b614b30ed9 100644
--- a/meson.build
+++ b/meson.build
@@ -98,6 +98,7 @@
 install_blobs_hppa = false
 install_blobs_microblaze = false
 install_blobs_ppc = false
+install_blobs_riscv = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
@@ -106,6 +107,7 @@
     install_blobs_hppa = install_blobs_hppa or target in ['hppa-softmmu']
     install_blobs_microblaze = install_blobs_microblaze or target in ['microblaze-softmmu', 'microblazeel-softmmu']
     install_blobs_ppc = install_blobs_ppc or (target.startswith('ppc') and target.endswith('softmmu'))
+    install_blobs_riscv = install_blobs_riscv or target in ['riscv32-softmmu', 'riscv64-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 73d02a57628..504f03ec925 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -66,10 +66,6 @@
   'pvh.bin',
   's390-ccw.img',
   's390-netboot.img',
-  'opensbi-riscv32-generic-fw_dynamic.bin',
-  'opensbi-riscv64-generic-fw_dynamic.bin',
-  'opensbi-riscv32-generic-fw_dynamic.elf',
-  'opensbi-riscv64-generic-fw_dynamic.elf',
 ))
 
 if host_machine.system() == 'windows'
@@ -116,6 +112,15 @@
   ))
 endif
 
+if install_blobs_riscv
+  blobs_ss.add(files(
+    'opensbi-riscv32-generic-fw_dynamic.bin',
+    'opensbi-riscv64-generic-fw_dynamic.bin',
+    'opensbi-riscv32-generic-fw_dynamic.elf',
+    'opensbi-riscv64-generic-fw_dynamic.elf',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


