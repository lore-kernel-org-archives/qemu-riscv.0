Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6546C3ABC0
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uD1VO-0001lr-Qi; Thu, 08 May 2025 09:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1VO-0001jt-0z
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:41:42 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1VM-0004c7-4h
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:41:41 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b200047a6a5so431308a12.0
 for <qemu-riscv@nongnu.org>; Thu, 08 May 2025 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711698; x=1747316498; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqRI2bUWFL/LTWDPgHwj3plQ/Zek5ug5WOQHcPBpHVI=;
 b=B8ixyavlGVNn72GR+ktMu1GI2RNoKl/1jZ1zZkglyjs17bGIsRbg+NttK7ZHtd7nUK
 AB/IrubSQfetl1ZqZwY/SQlpucNwlQ2zqWxDpI9PIEGRbUrlifB+m5G1C9sh16dhNiNI
 EF0Y4D/1anaDp7kdnsyle7pAqDsnMD3y7VPDDB/+zEHpgsURfrINdArM5Krxujk6eo+b
 rX+lsUZ/T3zYaQ1+PUQDc41ITDlcjewADM4H6yQCjNhzYoFpKbQ6mu0hOsS9BS5rJ/b9
 bw8FOGexKfSXSqbKiohMpBLHW/Oa2kjgkgsQz2oFc12LaDSOaul+P3H/Ss+Gay0TAQUv
 reTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711698; x=1747316498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqRI2bUWFL/LTWDPgHwj3plQ/Zek5ug5WOQHcPBpHVI=;
 b=cAyhGm4jhY4STDiM3bf0M8QyWA7GTEheX4UkxlMIH0lFeS0AevD7W3Pr5nzGHL1Y8L
 QLAAF86J70Iq/RSmcmBBRhXyJSL/ERa7CF0SATWvI8hTSXP8kx6fXzfKbEquW6vBBRP6
 6q6fLYDtTryNWxQ1cC4692B2+shO83neefAAJpiAko1loTT+9J4T+IfRD8DBF6Frj2wN
 ScbqKT0BssXud6Bnh4wO6VEBv7eHm8eQo1IG4EYjYM5uDz2aHod/Vs2hPrWHY2FsKITB
 aQWyILcuy0HauWgN04oyzc4rzJDc6X+jzIja38uNT/Rr1s+p8QG5r6mGKFIwg2C50K8b
 CToQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKBvk9mPMgK4KPWiJam2H39o22sgA7JQ73jpgzAOl1MKr7LhLTPojDOPKtSM9DJLZ+Ce1fKe/yRrxL@nongnu.org
X-Gm-Message-State: AOJu0YyBqqUGZWZQf+vkf72/p29FOcbdh6jS5RcBF09d7aOi6KV6OzRd
 y1IM8QW/xtj78D+71sqk/oc3QgK2SgIy7huVBdSUmuoNde3IPSf9vHdYZJAdXco=
X-Gm-Gg: ASbGnctoXydmMw6ASM1qxNQxr2U/iT9LXT5v8dKEeypUXo8sCBZzOZIhJifWCfpFM8Z
 ioyMTPAzVLl/Kl+wVom6I2kRrBgoKf8Ukkk8seRpb4Zg5y93uN56tJx2c2/Y/lxgDB7ly52CbdE
 CDeMMtWL7M9VIoHZLOJvCrxRxkG5lIkoedu4rxZsEWL4yMryfm+bkBUpv8O2a4uIl/VTKGolEDR
 w5rYKWcmAQACusSCZvNaeW3je1SZV5NlbTNOxhJ69Ip0ulZFnSz41x/g5ln1qanDImtbO8qEars
 yr/bG4+lLIok9zbSomq3Y3+GvLwYc+21zG59NW+dQmaZ66KR5IbrB7TytJ3M6oj0xrznqC34x20
 0IyrRzuTbk8yKkiM=
X-Google-Smtp-Source: AGHT+IFhRKm8yP4ybLtVM7FMTYL0LsALgcJNgjwXO7oc+jzCvJH9Gi2a3jIUCJN8VIl19enCQAvxwA==
X-Received: by 2002:a17:902:c94f:b0:215:a303:24e9 with SMTP id
 d9443c01a7336-22e846a2ab2mr48657765ad.3.1746711698591; 
 Thu, 08 May 2025 06:41:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e766dffefsm24985605ad.33.2025.05.08.06.41.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:41:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 15/27] hw/core/machine: Remove hw_compat_2_6[] array
Date: Thu,  8 May 2025 15:35:38 +0200
Message-ID: <20250508133550.81391-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x533.google.com
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

The hw_compat_2_6[] array was only used by the pc-q35-2.6 and
pc-i440fx-2.6 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/boards.h | 3 ---
 hw/core/machine.c   | 8 --------
 2 files changed, 11 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5f1a0fb7e28..a881db8e7d6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -841,7 +841,4 @@ extern const size_t hw_compat_2_8_len;
 extern GlobalProperty hw_compat_2_7[];
 extern const size_t hw_compat_2_7_len;
 
-extern GlobalProperty hw_compat_2_6[];
-extern const size_t hw_compat_2_6_len;
-
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index e7001bf92cd..ce98820f277 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -275,14 +275,6 @@ GlobalProperty hw_compat_2_7[] = {
 };
 const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
 
-GlobalProperty hw_compat_2_6[] = {
-    { "virtio-mmio", "format_transport_address", "off" },
-    /* Optional because not all virtio-pci devices support legacy mode */
-    { "virtio-pci", "disable-modern", "on",  .optional = true },
-    { "virtio-pci", "disable-legacy", "off", .optional = true },
-};
-const size_t hw_compat_2_6_len = G_N_ELEMENTS(hw_compat_2_6);
-
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
-- 
2.47.1


