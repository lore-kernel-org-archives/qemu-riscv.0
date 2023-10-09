Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25215CD610A
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptMF-0001rd-8i; Mon, 09 Oct 2023 12:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptKF-0005pE-B9
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJj-0001Zv-PL
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32799639a2aso4705629f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869673; x=1697474473; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxLMY5+XDlEqW//GnK/X2YXdg2+UhZNarbeVkfRpn9o=;
 b=Ngrkyp0w1ib/WMYkG6Luw8PlnOwYhwT1tT3fyV/R22vGjWXmfTHps9FBL8V9PYMrDv
 LwBOdbm8NY7l+NcgtGFbd99ev037qDQbG3ZO/wG6z6C+b+7ZM3Ed8CRglEOxJJmroRNS
 UhzFejCnY0A8/DV/3PBbMGg2HhCrcsplz4DLoBHpkL43Iy5eBRU5k59VsuDJzUkMsNzw
 5d6LyEfd1x+wq30VpMk4tSeN6MBSunesoD2+p0e1IqC5esyRoAxDIKYhmP22wBQ4KMCe
 6jM4Xg8sjOqDOUVrOA7ScKHRrO6u6Ke82l9XvwaMArFtgw45EEoZdUSjiplgnrtxmM6q
 DoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869673; x=1697474473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxLMY5+XDlEqW//GnK/X2YXdg2+UhZNarbeVkfRpn9o=;
 b=XdfeB0XFjmATcsdYuHSO6w/0wFBg3ECnU5JBWJS15rw/mjv8Er/RaSzE4FGxh7ZHRG
 RGxp32lT1ks2+76cAJGWaMiIgJsQ+viYjsoIc9+DGm4RFI7kjhy+tYprCt5//opjKYOn
 5F07i/FGdilGZGSzJyxhx+Dk4PHjR98UiXoZSRBA3I5cou34+YozSQOiFUrm8ArWYRTB
 vIPUcDzCqjERAQxnoWBQNQHIVSbTQu1A4UBNy8RNL1RQXLL8/3Nls2G1n1UqQv+PsH4i
 8ns1Hh7jd77P9unfjX1nJs+jwB0j5xdCe6vcQgF7MpTzGXG7XqKDxU/sQVxaSyzHREzd
 39Sw==
X-Gm-Message-State: AOJu0YyeWxroIe2MF9OvJ7a5Ld6lE3pvFDp+MWTHo1HilQDqJ+v/Yg0S
 JPWHe2UkPAH6vzz6ttRM4tHrWA==
X-Google-Smtp-Source: AGHT+IHp41fYjgOAnF5lB5Gy4eo71sHuPq39ciYyf+3e2jnm9IMeLhhNVUeUBfbmSne0pHK/JuMEFA==
X-Received: by 2002:a5d:4dcc:0:b0:319:785a:fce5 with SMTP id
 f12-20020a5d4dcc000000b00319785afce5mr13247438wru.38.1696869672794; 
 Mon, 09 Oct 2023 09:41:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d6904000000b0032710f5584fsm10040929wru.25.2023.10.09.09.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:11 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E32D1FFBE;
 Mon,  9 Oct 2023 17:41:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 13/25] target/arm: Move the reference to arm-core.xml
Date: Mon,  9 Oct 2023 17:40:52 +0100
Message-Id: <20231009164104.369749-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
index 831295d7cd..b65e8cfea3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2392,7 +2392,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2414,8 +2413,10 @@ static void arm_cpu_instance_init(Object *obj)
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


