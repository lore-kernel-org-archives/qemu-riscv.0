Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730CFC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxT6-0006R8-Tj; Mon, 06 Nov 2023 06:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxT4-0006M4-U7
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSv-000591-KM
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:30 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so31051815e9.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268900; x=1699873700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0lV2v0Wmf5sVpflPIAh1iXlsF2JSjaFEuoVMwFWbSs=;
 b=TVa8c+Zf6EpP0EoqMSSudJcZMrtvmV/ODQNhymVioVnUYSCEbknFx8rgmq3AZ2Admz
 J60BbZs/EzUC9dlo0FGI6xnxpVpEtI+nUFca0+kM5nKkEUYjNchaRm82pMMgKP5g0xYq
 FkmxLG5f0mCUQU4h+D5Zeq2QeLE7Xp1+ebNaTcwVDj6+c19CKO+4Jq7gDdyTHZXxLWlu
 Jr1uZbwSdlB+pCgMBS5S3rYC51DWKbBuBYek26DKd1YIP7R7NuT8U5FVS8/ufF8FDZ1n
 ZDBPpQwx2viWMdPR6iDpMvj/2eHCdN7ucZk0WsBVZIr5lRsg1yqEVksoPOwt3YdPw6mq
 cDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268900; x=1699873700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0lV2v0Wmf5sVpflPIAh1iXlsF2JSjaFEuoVMwFWbSs=;
 b=QrnWCfVKy/Xi43QnngbMZvgD55dGmyrIJf/zylrt2dFlhTSAx6eUFhwsKAafV4UdWD
 6DAx7B4E8/p6k38plspLYW7WBvk0G6ADWnTjPI6kAk5rPp99pQ6wRY5NvK0ns7a1V6V2
 FiTlMGhTY62MxPAaQtVFi4EUVJ7/YGz81ypZMJ3y9ElMksNFd8ajkmMgUBhbpV5/NeRo
 8D+xoKJv3kG2c9rJCQIhDB9bvDbOaRUtj1HcZl2njANvoMU13O3ozfS9D+PMUfkWQzCW
 5E6X9b++9icC5tTieSSBnRJFQNJNZCQp2ZD1hB8h6+4IDGe5bTAGQVM/l1hyUhdDXKVf
 6Gaw==
X-Gm-Message-State: AOJu0YwCdRCdMTtphUgVfFOoSzORkoFFXhzAPwcP3W5ziz0MrftC8hRM
 fF4vh36bGEAfpx59lU1OHoZP3w==
X-Google-Smtp-Source: AGHT+IE5qy7fo5hvbTA76kNpTwyuY8BAliZrJmEatPyDDOojWhCYCUN5LQHLcBtUF5POiIT/JDO9Og==
X-Received: by 2002:a05:600c:3205:b0:403:aced:f7f4 with SMTP id
 r5-20020a05600c320500b00403acedf7f4mr11411925wmp.12.1699268900310; 
 Mon, 06 Nov 2023 03:08:20 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b004060f0a0fd5sm11862251wms.13.2023.11.06.03.08.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:08:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PULL 41/60] hw/loader: Clean up global variable shadowing in
 rom_add_file()
Date: Mon,  6 Nov 2023 12:03:13 +0100
Message-ID: <20231106110336.358-42-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Fix:

  hw/core/loader.c:1073:27: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
                       bool option_rom, MemoryRegion *mr,
                            ^
  include/sysemu/sysemu.h:57:22: note: previous declaration is here
  extern QEMUOptionRom option_rom[MAX_OPTION_ROMS];
                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20231010115048.11856-3-philmd@linaro.org>
---
 include/hw/loader.h | 2 +-
 hw/core/loader.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index c4c14170ea..8685e27334 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -272,7 +272,7 @@ void pstrcpy_targphys(const char *name,
 
 ssize_t rom_add_file(const char *file, const char *fw_dir,
                      hwaddr addr, int32_t bootindex,
-                     bool option_rom, MemoryRegion *mr, AddressSpace *as);
+                     bool has_option_rom, MemoryRegion *mr, AddressSpace *as);
 MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
                            size_t max_len, hwaddr addr,
                            const char *fw_file_name,
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 4dd5a71fb7..7f0cbfb214 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1070,7 +1070,7 @@ static void *rom_set_mr(Rom *rom, Object *owner, const char *name, bool ro)
 
 ssize_t rom_add_file(const char *file, const char *fw_dir,
                      hwaddr addr, int32_t bootindex,
-                     bool option_rom, MemoryRegion *mr,
+                     bool has_option_rom, MemoryRegion *mr,
                      AddressSpace *as)
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
@@ -1139,7 +1139,7 @@ ssize_t rom_add_file(const char *file, const char *fw_dir,
                  basename);
         snprintf(devpath, sizeof(devpath), "/rom@%s", fw_file_name);
 
-        if ((!option_rom || mc->option_rom_has_mr) && mc->rom_file_has_mr) {
+        if ((!has_option_rom || mc->option_rom_has_mr) && mc->rom_file_has_mr) {
             data = rom_set_mr(rom, OBJECT(fw_cfg), devpath, true);
         } else {
             data = rom->data;
-- 
2.41.0


