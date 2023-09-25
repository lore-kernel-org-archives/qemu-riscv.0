Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF3CE7A94
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:52:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmta-00012w-9H; Mon, 25 Sep 2023 10:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtY-00011A-E9
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtO-0008ET-Vd
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40535597f01so65001175e9.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653336; x=1696258136; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/NxOuLXpZoY7AKhUkjRhpOIcVG1WqxnVG0wjWhT+R4=;
 b=lrK3xPKSkWbMQTJIMaEdcHOecIZ98V4bvJ9ZO1dcAeafvlwSeanOoJ8rPoWkyVnCru
 Jl2w/DKpsQjX6P8ZTfDK3un5htEDN3nO/xK0TJxSaczjtcURpuDxNfEP5SHYJzISXYoP
 rdIYPDfU3k/TEBoo9NmYoT6REdMqGx6vEdaGyHKSiV7VvvxT/YM9jwGEaWM8rR6BKeSc
 9yYqfw8wIvzLpk/lNc3IPLAdSEKo3w45IpFtRTj+Ol7a+dTeuV+63DYHexTum3Jm20uq
 UwlJss2KyroxYOov/g7Fvd1vCq0MEUs3l4K+5GKvRpbIanjkzFPpU1iX4mfxnpalMBlz
 8nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653336; x=1696258136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/NxOuLXpZoY7AKhUkjRhpOIcVG1WqxnVG0wjWhT+R4=;
 b=IxrSKBFAIvzKilwhxe7c9Kwjsj03Qro3mIMi65fKIMNxOm7PpF4cIgfvmgq+YD5+vC
 6Rphpg+YlqE+2kJfmm81ZDbdFH/fFJ75l6QJearzprxFGjCj+pqI4TEhtOVVC2fh9Bof
 l2/EdOf5ZIk2ddPq23q4Jfh+TGJyi5AYQjh03iU4eqtCNCBld6swNBaY/IpdpIeeDR5S
 CV+m/2koh78AXG7NxJ0awfhFnGpf+VZ7F/zfGxDN2QQvD1cyaY4Out9L6N+HqcWENVB3
 W3WZMP5HxqqgzhiH/kqh/jB1aknOOjUz1l8pVWD568zskJsa4CiEyUCABT0nNNUU7s1k
 tYLA==
X-Gm-Message-State: AOJu0YzkGaUf/GYw/fedxhgJwuK4o26pc9nzefJBMhYg8FrXQGM3dqY9
 /PnQaiNsCqb4+IY0aWTzZPtKmQ==
X-Google-Smtp-Source: AGHT+IHlCGeK/tvgna3gzkxwfVFAY6TBWSp276ajeWZiDVI1lQWGadbKDsxgUtYGPZunOy0YBBalYg==
X-Received: by 2002:a05:600c:2215:b0:405:1baf:cedd with SMTP id
 z21-20020a05600c221500b004051bafceddmr5505385wml.1.1695653335748; 
 Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d634c000000b0031773a8e5c4sm12032016wrw.37.2023.09.25.07.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B0B31FFBC;
 Mon, 25 Sep 2023 15:48:55 +0100 (BST)
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
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 01/31] tests/avocado: update firmware to enable
 sbsa-ref/neoverse-v1
Date: Mon, 25 Sep 2023 15:48:24 +0100
Message-Id: <20230925144854.1872513-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Update prebuilt firmware images to have TF-A with Neoverse V1 support enabled.
This allowed us to enable test for this cpu in sbsa-ref machine.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Acked-by: Leif Lindholm <quic_llindhol@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 25 ++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index a794245e7e..b39f5566d7 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -28,33 +28,32 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
+        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
+          https://github.com/ARM-software/arm-trusted-firmware/tree/cc933e1d
 
         - Tianocore EDK II
-          https://github.com/tianocore/edk2/tree/0f9283429dd4
-          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
-          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
+          https://github.com/tianocore/edk2/tree/29cce3356aec
+          https://github.com/tianocore/edk2-platforms/tree/fc22c0e69709
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
+            "https://fileserver.linaro.org/s/g4C3WzJzNBES2p2/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
+        fs0_xz_hash = "374738599f7ba38c22924b2075ec5355c2b24a47"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
 
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
-            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "https://fileserver.linaro.org/s/scJRninsAFTwEct/"
             "download/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        fs1_xz_hash = "5d3f156ebd6c6374da2121e15c7c8f4ed0351dcc"
         tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
@@ -144,10 +143,16 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:neoverse-n1
         """
         self.boot_alpine_linux("neoverse-n1")
 
+    def test_sbsaref_alpine_linux_neoverse_v1(self):
+        """
+        :avocado: tags=cpu:neoverse-v1
+        """
+        self.boot_alpine_linux("neoverse-v1,pauth-impdef=on")
+
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
-- 
2.39.2


