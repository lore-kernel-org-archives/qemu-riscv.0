Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD41CA1012
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu5AQ-0007cQ-IQ; Thu, 04 Sep 2025 04:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55C-0006ff-2E
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:12:39 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54c-0004ED-S3
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:12:37 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b047f28a83dso80603166b.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973521; x=1757578321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dryPG5cdTvon401P43IQAncMYcpBnZGjJaBP50H9h5s=;
 b=Z+VLcHiKE1AbteVM4e0xrE933CXRtp7Cd+3Dc52K669bV+8jEIQKbHzlOV8BnzMbOs
 YI0Y4pLm46aIKaqhnTwIJ5ZFtyyABlwzfm3lZzMzuR0ScA30jiniA/X03OLEBs0SkUM1
 xR1TWu7yoaVRtd3UiFntzM3QMs0w4MEqsZq6H4h9Q+xUV2PVQluKFBVK+W7J0AJRjC3z
 uV54SnVNP91yeNL4bbBFWy20Ss4N9V9+qIfbQ1cJ7uCa157Gg824AwZtwHTjzBEiMNtd
 Sh394/TllXwDjQobOX3x/3Le3jq0Y7JEe9ZehXkkHQ4Iq94/gfULSpQ4aG6m+cxENQKl
 MziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973521; x=1757578321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dryPG5cdTvon401P43IQAncMYcpBnZGjJaBP50H9h5s=;
 b=bijgwlVnnamEa9kUm8O13+E6H+Hb7GRdXJUPz8j+ug+LVsXO32J2aE91MlCcCDRG/V
 BF5aQWuuHltiHfJDsCa5sDS8Z2g5NWvRK515hDDwLi+dxwiwCYVfuZNwpvviTTBemBuH
 5sEktnJ8Dxq8zMSTSpKCeuE1rjgXjcCFH9zYps1T5Z59t22EC8gehzXzFViTV/qw/jew
 lfrwGh3v6G03tVm/pH9Zgsd2wOouI5K5/og4xElnMf7ww9gKbpftSLRKGvc/IOSdtitV
 hCMn2LXdXZfsCv2FjX6ouxH42kRKyTlvajxtsxJs9cTPsqYPO+toMkAdT851uPWjTu42
 MzFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZuIYmqcxkW6BC0SN/iIb7+CTjYM910VBaYShYcLs1rCuuw9e2V0xdw0Zcx8yYM3ozQEn9AE1zK6SP@nongnu.org
X-Gm-Message-State: AOJu0Yw5kpp9c+VlcWuSi3rwBeJ78z97FbQkPhjNLkDp2+GwcRzel2+8
 pkdu/GYEMJPcqo91hIHvR8xDuz5OQXNdNbnh547O1hKlcJHkrB68EQ17x1yRiuUgkfY=
X-Gm-Gg: ASbGncurxDfw15BcX7yqKFyk/pRCWs9zomhDKPe5MPj3Hk992Fx9yX3KpNUwRYUKD4h
 6E/mYpZWg1asIH7GQlBgc6fyuQidVkqoMpGPCYXohOu54y3Ihq1AYLtveDLv7ramKBhhUzUyjDC
 99hlfDJdFC0Vpfv9s2F5IA1QJClM5UTvRJItSlTzXn8XBwwSazB1+pu9iWlsaS0k4gu19bkj2Fl
 +s1s4rGehck5BO1X4uFTFfyXBaJU6hhP2bZcow91Ht0VSowznPNJUN2u9iMMKk6pV4GpNRNNokP
 sCH3cdeXV4V1Pr653fHqpGnR20IygizH/9frvyJzgrJPTQOyi5diETyNhBqLmG6FP6Xge9BcfBa
 cZMZpc42YLKGCNnykbmvHYWE=
X-Google-Smtp-Source: AGHT+IGDnb25U4p97OCHED0J2lFk0ur4/KBbXrud2PABbqZVX6GA8E6Xsu3KLiaHB+cjs0txk70Kjg==
X-Received: by 2002:a17:907:7ea8:b0:b04:53cc:441c with SMTP id
 a640c23a62f3a-b0453cc4688mr868679666b.28.1756973521151; 
 Thu, 04 Sep 2025 01:12:01 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff12a6b404sm1395198066b.88.2025.09.04.01.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8A375601B3;
 Thu, 04 Sep 2025 09:11:34 +0100 (BST)
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
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 051/281] linux-user: Move ppc uabi/asm/elf.h workaround to
 osdep.h
Date: Thu,  4 Sep 2025 09:07:25 +0100
Message-ID: <20250904081128.1942269-52-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Move the workaround out of linux-user/elfload.c, so that
we don't have to replicate it in many places.  Place it
immediately after the include of <signal.h>, which draws
in the relevant symbols.

Note that ARCH_DLINFO is not defined by the kernel header,
and so there's no need to undef it either.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h |  8 ++++++++
 hw/core/loader.c     |  4 ----
 linux-user/elfload.c | 10 ----------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 96fe51bc390..be3460b32f2 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -133,6 +133,14 @@ QEMU_EXTERN_C int daemon(int, int);
 #include <setjmp.h>
 #include <signal.h>
 
+/*
+ * Avoid conflict with linux/arch/powerpc/include/uapi/asm/elf.h, included
+ * from <asm/sigcontext.h>, but we might as well do this unconditionally.
+ */
+#undef ELF_CLASS
+#undef ELF_DATA
+#undef ELF_ARCH
+
 #ifdef CONFIG_IOVEC
 #include <sys/uio.h>
 #endif
diff --git a/hw/core/loader.c b/hw/core/loader.c
index e7056ba4bd3..524af6f14a0 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -295,10 +295,6 @@ static void *load_at(int fd, off_t offset, size_t size)
     return ptr;
 }
 
-#ifdef ELF_CLASS
-#undef ELF_CLASS
-#endif
-
 #define ELF_CLASS   ELFCLASS32
 #include "elf.h"
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ea214105ff8..4ca8c39dc26 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -35,16 +35,6 @@
 #include "target/arm/cpu-features.h"
 #endif
 
-#ifdef _ARCH_PPC64
-#undef ARCH_DLINFO
-#undef ELF_PLATFORM
-#undef ELF_HWCAP
-#undef ELF_HWCAP2
-#undef ELF_CLASS
-#undef ELF_DATA
-#undef ELF_ARCH
-#endif
-
 #ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
 #endif
-- 
2.47.2


