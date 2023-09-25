Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7ECE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmvy-00056F-2m; Mon, 25 Sep 2023 10:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmty-0001pv-Ia
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtV-0008Jr-A8
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:29 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so47666165e9.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653343; x=1696258143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afBvhFP6609M8IIBIfYpGDboWuF4PMsRTHYI59b4V3Q=;
 b=ARsFEKFKB+0+gsHCoDorzenIy0R2PpUMhPOGlZ57PvASeOM+jN/p5bCXD7txWtPZf/
 hLWEA0JqsEZMN9+elVzpg8Cefe2uax6QT/EAn0xeoy2+KdlMwHuYOlTpmHQ4/nfn4iDM
 zVy4dZfXaLRxwUPnzMt5jZsxlZZxmSoCRoG+M5s+FbNKJwmIBza4cM9kcIRDFlIHTk0Q
 BxAcVmMfaOZCOTln6Q5BMGP34LIRhS1iLbuN7XRQoDk62MLV7pzMEYIG6Gz7PVQ56P7y
 m7DqvMg9Wqg5KEluOlH5ah1ecAk6Z+4D0GlBG58UIKiGavdkCMgG1K0exjTHXpyIR1eN
 iC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653343; x=1696258143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afBvhFP6609M8IIBIfYpGDboWuF4PMsRTHYI59b4V3Q=;
 b=QPxmKpo0iUco4RC6IkIpkuCz97o7M5TgSWNHc2a1DU9fZTj2mg/Ej7YAsYRMiQTSCs
 eGd5O177ydgcN2zwubRyorxkJ6PkrpP3FpXl64cHV5HHlX7xi+s670BOSGQOwdaPp+q2
 ssfwBEuBd5SStC/gaq6xPA0hJDsQYIvUpGYA+zynSuYDOD/GOwRSITYXCIh7jyklyiwD
 hf/5QxqCTUpuXMfFqvZAkYNwm7Fup2XY8uOjhOQxXzVHoH5TYZWH5fGaSPcRrLntDzSZ
 7lurLzVPo0Rcbkl/hH8IbX3yzMG1+8UNxE0w1IaFZXX+JaQNQVySHjil0hIxvMD0Q/gb
 +w/A==
X-Gm-Message-State: AOJu0Ywu9qYKkUO9SluZk8etyRsLwXgEb8m72PLiqzOUr+sVHZAlzwCQ
 pekMeDokyGNXM212TNfG4jEFuQ==
X-Google-Smtp-Source: AGHT+IE81+2T4xmz33lUTgO9MMdDyXYA17Iq1qAXs2BdCLV4x8cBgbMmfstz2B6rR+o/BoOtK15D/w==
X-Received: by 2002:a7b:ca45:0:b0:405:40c6:2b96 with SMTP id
 m5-20020a7bca45000000b0040540c62b96mr5826835wml.3.1695653343173; 
 Mon, 25 Sep 2023 07:49:03 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a7bc8c2000000b003fefaf299b6sm875831wml.38.2023.09.25.07.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:49:00 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E4351FFBD;
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
Subject: [PATCH 11/31] plugins: Check if vCPU is realized
Date: Mon, 25 Sep 2023 15:48:34 +0100
Message-Id: <20230925144854.1872513-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The created member of CPUState tells if the vCPU thread is started, and
will be always false for the user space emulation that manages threads
independently. Use the realized member of DeviceState, which is valid
for both of the system and user space emulation.

Fixes: 54cb65d858 ("plugin: add core code")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-4-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/core.c b/plugins/core.c
index 3c4e26c7ed..fcd33a2bff 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -64,7 +64,7 @@ static void plugin_cpu_update__locked(gpointer k, gpointer v, gpointer udata)
     CPUState *cpu = container_of(k, CPUState, cpu_index);
     run_on_cpu_data mask = RUN_ON_CPU_HOST_ULONG(*plugin.mask);
 
-    if (cpu->created) {
+    if (DEVICE(cpu)->realized) {
         async_run_on_cpu(cpu, plugin_cpu_update__async, mask);
     } else {
         plugin_cpu_update__async(cpu, mask);
-- 
2.39.2


