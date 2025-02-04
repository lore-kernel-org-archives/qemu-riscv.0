Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806CBC02193
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNMc-0005nn-K9; Tue, 04 Feb 2025 13:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLR-0004Uk-Cy
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:08:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLM-0007CU-2e
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:08:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so69980205e9.2
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692493; x=1739297293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gnZ9WpmYKnZRCdSHS6mGnNZU52sWxPUChowKsSNdKf0=;
 b=lF9wVj6v6jmym3yWL16HVS1ghwUdpc7yDB6yOWNzWDO5hAgk30huJJpQgsIGFTliEI
 9UIwbocpYOp8RXFjoJBr+/7R0dAfWLygJCL0ecEuRAPDhcTWyN+xTWwCohfGh7KdYGeD
 Zkh2RSDsxudbEh2JVjr0UdRD25zckrqPYybpAyfPhpCrBG9iEcYnNlxthGqHnHzE8zzo
 JZCGmDJkAAmovSC1QkQoK1rF+S1OzSm4PdtFcYIGF/5ha4pO6TMYcNCaTngUFsSo8U00
 AkoNYA8tCxc3Mmr+AS0wstj0MCjD5BH0Obt0WCzv5YJbwzld+jPvyFF2KP2K0sirjLpC
 J2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692493; x=1739297293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gnZ9WpmYKnZRCdSHS6mGnNZU52sWxPUChowKsSNdKf0=;
 b=mAaQ1PJCHMF83aO7xg5tgbSQV8RgjVYMrygp18qQoY14XSYhCf3Yi4I9kLpuutoAdo
 JfmBx2/4E8VWldrkBJZrpovXgXmeUnUGTvsndvmWAiDA/9QKGHE2tJ90wijeJu+BE/aw
 cfGHUcrVu1ell08tStiXY3mlXlIMnUEnvQeVFTfg3Wf/Czm+FbZrjnRol/z3+L0UXEjf
 T7R6NUi0pJTHaeWB5qN3PckkZvtBJVjKZo2Vw63cJQZmL1z3+/W5RNZp2hRho1Jtv7lz
 ql5UpdXkOPxI99nGvRo8PLlLHSN6a5TdppoXrh4xT/19k+MBko3CduKqWT0RgwkQd61p
 7TrQ==
X-Gm-Message-State: AOJu0YzIPLTK3UBb0jznf5r4YXA7V4yRDVIhDt78qfKF3ed9Mbi3zNyn
 hKtessLrnoMEb0M/8JHvgjjWPG5JiSoNlEZtPkukoyj6RRUSCeepEk4pHsbOxZ+2s/DoTcGsPoM
 9c4A=
X-Gm-Gg: ASbGncsG8jaKyYiVJJs7CBmme/zgGYT6PJw+mqJiB3+MK2ICfo+2L/Kz9nc7K3qYlfS
 nAUL9R0DII1NEGxd5pf/zj/uakyXFSLLtHTsqZjib0521SbzSXCn0k7Di2tvrsvrEHLuxi8p2ug
 hs1y7CQuHtDmT9ToizR9p7mit6H7gz3j/qYUorm0QQsnVhD8B16U6yh/7S9ND1Qc9N+f6K5Tw2J
 oecHKxKVRwFb0+jCfW+RQ+WyXxRrBhKWvzLxMBIVsCKlxVhSrTqAse98oR64XaGgPevw9kasQvX
 WmxpPTi3us995fCxPbhcDyv5O1ju+ay0t1b5wm2WVMYu6U2G8i6rO4IGegZjOhLOsg==
X-Google-Smtp-Source: AGHT+IGTJZV0aGVO9MoQJyL0Qhv8RFG2VuSHnx95rtNRM4+mA7NEWT2zCLsgfge+bk0Wyc+BZ2kfSQ==
X-Received: by 2002:a5d:64e4:0:b0:382:3959:f429 with SMTP id
 ffacd0b85a97d-38c519378b7mr26145829f8f.5.1738692493241; 
 Tue, 04 Feb 2025 10:08:13 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ebfdasm16677986f8f.17.2025.02.04.10.08.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:08:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/8] hw/ppc/e500: Remove empty ppce500_machine_class_init()
Date: Tue,  4 Feb 2025 19:07:43 +0100
Message-ID: <20250204180746.58357-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Previous commit left this method empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 59208da87de..26933e0457e 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1285,10 +1285,6 @@ static void e500_ccsr_initfn(Object *obj)
                        MPC8544_CCSRBAR_SIZE);
 }
 
-static void ppce500_machine_class_init(ObjectClass *oc, void *data)
-{
-}
-
 static const TypeInfo e500_ccsr_info = {
     .name          = TYPE_CCSR,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -1302,7 +1298,6 @@ static const TypeInfo ppce500_info = {
     .abstract      = true,
     .instance_size = sizeof(PPCE500MachineState),
     .class_size    = sizeof(PPCE500MachineClass),
-    .class_init    = ppce500_machine_class_init,
 };
 
 static void e500_register_types(void)
-- 
2.47.1


