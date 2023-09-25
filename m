Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9263CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmuG-0002Sd-1Y; Mon, 25 Sep 2023 10:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtq-0001c7-05
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtU-0008J0-EG
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso31128255e9.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653342; x=1696258142; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AwYBjX11kVwleBQYnG52lCtDdSTJ4dxnB89SY/KP3O8=;
 b=UjRPGS3UCbJHCt6ODKJBpBQCRvaNegUrFGp81vd2nfl1F7V1OIJeQRkLA4JU8bBxjz
 SKk69b5a8N2VFPKYR377UwEMWNd0YZUa4rTeOK01ToRQ10S+u/i+RUoVHr/ZdUP73Y4F
 A6dHzR9glkHy3zBVNY2WHi8NEvW/MdVVMVPjyjoEhePU2YhYVrtwAcAzYIEpELLEo/nq
 8m7qHYsHm49dUzIe/YiNBBUdK3cWPW12HZdHdN8YZEqCjz5lQo0IixodZqLQYcBtCcZa
 6ff5F50wzp666r8hvYVOhgsPGONKZBkmr2DlRAguUqMi1K/6vAoOdmsDVvblb7pInMLi
 1eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653342; x=1696258142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwYBjX11kVwleBQYnG52lCtDdSTJ4dxnB89SY/KP3O8=;
 b=Dq7Or5M+zVmIy6BDWfQVtVDsoL55ZBbP4nEckZUWx57CmJV5dOjPyMr2AdyrKYDit/
 XI41NvrtcsL4Lo6Ims9lBBfsOKKRWgJHdzAia3fz1vPRc4YKwWce87lZYWR0oBIhUbhJ
 aqBbg3dWqlI0muV6bUqHnX0zGHDPNm6RvdUWxpVa5pGPxrK+tbupGVR+GM+svY7jqDP5
 TRNK8EZmBOeVG4j1dGtFsNLMMD1uA0SMSob4aRJNrY6IDnqiNSyKfMjj+ARE0CyDnAsp
 f6xBMBN8h1lIxUlf5BHxzkFcHK1+xoHDvB7ZctNzmjiGrLuDt6nZ7kfQnb1y2HfRobZC
 GnqQ==
X-Gm-Message-State: AOJu0Yxy4LZEyF9QMxVqMj5uNRsTXs0NHkxZHeHSdkuEfzOpeB8sBXkT
 QDI7sBZsDRErFClhpUwZdK7kgg==
X-Google-Smtp-Source: AGHT+IFfEWWhRGOWllDwvUBwcJYmT874H+l2IMfxtr7TeYA+0ZRRBGEBpEveD7GnIVCqIJ1pBndzvw==
X-Received: by 2002:a05:6000:1048:b0:31f:e980:df87 with SMTP id
 c8-20020a056000104800b0031fe980df87mr5635374wrx.38.1695653341772; 
 Mon, 25 Sep 2023 07:49:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d424d000000b0031753073abcsm11995462wrr.36.2023.09.25.07.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:49:00 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADF201FFC6;
 Mon, 25 Sep 2023 15:48:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 14/31] target/arm: Move the reference to arm-core.xml
Date: Mon, 25 Sep 2023 15:48:37 +0100
Message-Id: <20230925144854.1872513-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Some subclasses overwrite gdb_core_xml_file member but others don't.
Always initialize the member in the subclasses for consistency.

This especially helps for AArch64; in a following change, the file
specified by gdb_core_xml_file is always looked up even if it's going to
be overwritten later. Looking up arm-core.xml results in an error as
it will not be embedded in the AArch64 build.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230912224107.29669-7-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b9e09a702d..10fcc61701 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2393,7 +2393,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2415,8 +2414,10 @@ static void arm_cpu_instance_init(Object *obj)
 static void cpu_register_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
+    cc->gdb_core_xml_file = "arm-core.xml";
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
-- 
2.39.2


