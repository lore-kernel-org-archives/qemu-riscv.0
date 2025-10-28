Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4BFCCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 07:57:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDeaO-0003tI-NY; Tue, 28 Oct 2025 03:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeaN-0003pk-Sk
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 03:57:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeaB-0008Eb-Ld
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 03:57:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475dd54d7cdso10556825e9.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 00:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638248; x=1762243048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAOz2csCYno2mCUJfERE/km5CitqJUewmQUOxMdlado=;
 b=Pkl4zKxxDgNKUTdPqAtwqlI9uHAAIqFblfXW8DtbOW9AEEGD/wksVobAfVo0iGtddO
 tSzI2Co1aRbn6sAZxoeWd/Gj1mRZHfXfnASht0NJnHqH8Jz/UXL48Hq1eRlWMUWGFJ1H
 InUMt4HopgtGOaHLK44Or07xXyst+4PHaR3W5ZX+v3vo+dWhgaKLUgtOw2LIZdOQiEJL
 9xcN1WgbCSwTt0vur50D419Dam7r22SfHWuP54XcIDZEGfr+JdlJctYBR8VAH4LAXnoO
 q2SbOKAMDK2uEyv7HteDv3T+cPOsPa6UIvCfTh+bgtEOVFVzlml7GFivwaAgLHAM+2M8
 u92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638248; x=1762243048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAOz2csCYno2mCUJfERE/km5CitqJUewmQUOxMdlado=;
 b=Ctpy4uEPOiI8TtMB4dOOj7fXp9ypUC8NFYLCe5w0WxhBvoYudlmyCOMTiODTsPGFUa
 t5yU0MxyyCcncwMAfbk1yoBDds/Ka7mKfy3XbJRNwXCS5G/MW9z8LnVwy1QuK3n5oybB
 zQILapMG+i+WnpFn/ukEvpxMpdixvjSt6PPfqREU1iee5jZNMYQHFrW69R+7IW20+/Lm
 5F+yYGWv//Z53Tup1YRQl9XsoT6SPVfl2tvn8LyLJ4TbInTmHTLcM12eutgecIOOAU2V
 UhClst64izo6paqqAh/kBvuSje/kFu5P5xK9P65UibZaEgcHSBc7H++dZGd781X2wjzT
 +izg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxQlX+Z82BwARrEyulTh8k6Rl3quWPHY1AiyAkk6M8MTk7uxbSJTJxeXdbk42gbmN5VDcjIEXbUQIw@nongnu.org
X-Gm-Message-State: AOJu0YwEXQ2FmZs0OCc02jkT7+DuYs9wfLKqYGmpKllHNCWWGmPvOAPO
 AChUkuhUHzYfsfswKv+TjwLGJh+oi5lC5+Ro8FjZ+cXFoE3Nwy4vqR5j7iFMJCrbUP8=
X-Gm-Gg: ASbGncuygk3zyqpStJ5arnU88gcpIKQvmb4MW/8JBLn3A0l25qN1TOR7Kb/qd/EccIo
 ZlhetH6v4NUFiZf2CbeChgEn1xnDsO4KbMdvvsSLxESnV1hfX6xdYVRD4RWnt/NYnEjsPK0GUao
 nMyzgAeS48592Z79b9vI3SnkQKEiUWPhJnn+PhYfExkWItRyD56chE5L6i/TE9+CqhgIra9BKpG
 vYUFnN4nWhzLjo9Gp3OA/Z39j1Pysvmwq3erkUBP5aYX0c+QyDZRp9mBKrYU2d5SvlPsRwcIQ6k
 te+4F7FFzheq8f+VqL90nc5jyeRjdNe7kKiBjWRlJpCk84Y/T08wF72xfufA/ZMU0bvR3yfuHMl
 x6A/cUG0+fiIesl7No+r4G6E+007IfFXe4D4F5Ggi7nWYw4pEWxgcucZPGCvXbBqD3B5hPZGn70
 8CN/KfV8lBtker03TMczolisuLRYwnDOGVNWlT2l2XnWwd8XQLCSU0H/o=
X-Google-Smtp-Source: AGHT+IF3LZNMDgS2QwB0NYDRHjXxvJqYPpwx2TusRSii+sMtD3wqJGYUBSbbGmtH34NxqAXIAs0hzQ==
X-Received: by 2002:a05:600c:190d:b0:477:e66:4077 with SMTP id
 5b1f17b1804b1-47717e67befmr19212065e9.29.1761638248323; 
 Tue, 28 Oct 2025 00:57:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca979sm19250685f8f.14.2025.10.28.00.57.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 00:57:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PULL 23/23] hw/riscv: Widen OpenSBI dynamic info struct
Date: Tue, 28 Oct 2025 08:48:59 +0100
Message-ID: <20251028074901.22062-24-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028074901.22062-1-philmd@linaro.org>
References: <20251028074901.22062-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

From: Anton Johansson <anjo@rev.ng>

Since fw_dynamic_info is only used for non 32 bit targets, target_long
is int64_t anyway.  Rename struct to fw_dynamic_info64 and use int64_t.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20251027-feature-single-binary-hw-v1-v2-3-44478d589ae9@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/riscv/boot_opensbi.h | 14 +++++++-------
 hw/riscv/boot.c                 | 22 ++++++++++++----------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/include/hw/riscv/boot_opensbi.h b/include/hw/riscv/boot_opensbi.h
index 18664a174b5..ab9999be3f7 100644
--- a/include/hw/riscv/boot_opensbi.h
+++ b/include/hw/riscv/boot_opensbi.h
@@ -29,17 +29,17 @@ enum sbi_scratch_options {
 };
 
 /** Representation dynamic info passed by previous booting stage */
-struct fw_dynamic_info {
+struct fw_dynamic_info64 {
     /** Info magic */
-    target_long magic;
+    int64_t magic;
     /** Info version */
-    target_long version;
+    int64_t version;
     /** Next booting stage address */
-    target_long next_addr;
+    int64_t next_addr;
     /** Next booting stage mode */
-    target_long next_mode;
+    int64_t next_mode;
     /** Options for OpenSBI library */
-    target_long options;
+    int64_t options;
     /**
      * Preferred boot HART id
      *
@@ -55,7 +55,7 @@ struct fw_dynamic_info {
      * stage can set it to -1UL which will force the FW_DYNAMIC firmware
      * to use the relocation lottery mechanism.
      */
-    target_long boot_hart;
+    int64_t boot_hart;
 };
 
 /** Representation dynamic info passed by previous booting stage */
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 9510fca939b..75f34287ff1 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -388,7 +388,8 @@ void riscv_rom_copy_firmware_info(MachineState *machine,
                                   uint64_t kernel_entry)
 {
     struct fw_dynamic_info32 dinfo32;
-    struct fw_dynamic_info dinfo;
+    struct fw_dynamic_info64 dinfo64;
+    void *dinfo_ptr = NULL;
     size_t dinfo_len;
 
     if (riscv_is_32bit(harts)) {
@@ -398,15 +399,17 @@ void riscv_rom_copy_firmware_info(MachineState *machine,
         dinfo32.next_addr = cpu_to_le32(kernel_entry);
         dinfo32.options = 0;
         dinfo32.boot_hart = 0;
+        dinfo_ptr = &dinfo32;
         dinfo_len = sizeof(dinfo32);
     } else {
-        dinfo.magic = cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
-        dinfo.version = cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
-        dinfo.next_mode = cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
-        dinfo.next_addr = cpu_to_le64(kernel_entry);
-        dinfo.options = 0;
-        dinfo.boot_hart = 0;
-        dinfo_len = sizeof(dinfo);
+        dinfo64.magic = cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
+        dinfo64.version = cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
+        dinfo64.next_mode = cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
+        dinfo64.next_addr = cpu_to_le64(kernel_entry);
+        dinfo64.options = 0;
+        dinfo64.boot_hart = 0;
+        dinfo_ptr = &dinfo64;
+        dinfo_len = sizeof(dinfo64);
     }
 
     /**
@@ -420,8 +423,7 @@ void riscv_rom_copy_firmware_info(MachineState *machine,
     }
 
     rom_add_blob_fixed_as("mrom.finfo",
-                           riscv_is_32bit(harts) ?
-                           (void *)&dinfo32 : (void *)&dinfo,
+                           dinfo_ptr,
                            dinfo_len,
                            rom_base + reset_vec_size,
                            &address_space_memory);
-- 
2.51.0


