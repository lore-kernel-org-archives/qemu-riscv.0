Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A610C71130
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:25:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpYp-0006xM-CU; Mon, 07 Jul 2025 13:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWu-0001Bc-J3
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:21:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWr-0005GV-7x
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:21:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so2761639f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908878; x=1752513678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvxMUI2thDzOMTo1pay//3ftJosdxs4d110g7m8EMAY=;
 b=YcHqdutKAnXeTd0OxYYnFQOiQucuo2mW0crzGtcGtbiqY4aJ6vVEEr3xvPr+0D4n2j
 X6dztEBHEGGOS78UN1LqSp3HyJDADqXoqU+P95fGH8WAIPIPbqODfyn2Kq+Fof0NqnkQ
 kqbbnb7ERHv050ibcqcFJO6f58sRlaMAbkwNERUBA5AknKZQnOis5s9gFIDIKHPB4x+K
 zfmr1/9KuAvP4LKXLuw53hsrcwuXjcyFiJwWoOV5tlp9x7HWvAsdDVeV6eJbMpsqx8Wf
 wp3aH1qDkt/9l0GiucnVYL2gOMIizRDhuQUchE9FstGeVzMhGFTljkJLEJSVj8AGCpB6
 etVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908878; x=1752513678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvxMUI2thDzOMTo1pay//3ftJosdxs4d110g7m8EMAY=;
 b=uFmAhJBTQbeSAhj1nFEi7WhBi5ZRa4WsSbMEpwcwlGNFNh09Nr+Ybo6rOI+PAVuL+t
 n/UVsm136tyAXYG7Dk63mJCG7eda34scKccEmbn32SHQmF3GBT55A5S8M17wil31D23l
 ASVxTqOCPUU/ZLKEFuBAXgZSHhsPh6z2iN5fP+z2DrrAZeWteetI5a3UeCXGAfjyFlEU
 +zlB9JoUCNnks4yJDap3qtP1HnRtWR07V8PxkC+5JNu05eJx0sCFz/pCqwsBURlLZNlL
 p6Oumkrk5mhfAA8q4RBCmG3UBQm9ThQBpEheYcXYAeJQxRms408K2mDONJP7xNkujTxD
 gBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVls6Am9+DhhsCybAGJvNJPx7rQB9FEcPHiMjzN0wmQL/dXp0JlJfYcb6kWRIiO0sedHbufWFIyoIB9@nongnu.org
X-Gm-Message-State: AOJu0YzBT5uK1121ipK+1GBeAIjx4wZ/LMOAygqOxZKSY6J0uT9cUuNP
 GNwCAArt8c1DO6P82U0cb+gyTLoRXGwtqd4657BeUK45u4xcALmt/rKSDf+nECDH1qI=
X-Gm-Gg: ASbGncu7SKZUXhDxOLwA4W2HIDQVUk3N6XIn7z/rOuMX7rNjO2qi9RVaXhvEX5bWDpy
 H2ziIr7EffrO0lVUT1djLm3uMrbI6MKPCuP91/iE/fB4SYIUkTde4IB+VaiCwVqA+Uphgr/CVcy
 AN9YxdBzEaKNN66IwAHrmkWYfUt5FkuXEfl1RqeXWmcwWzN41bT4OnoUal89N0sxPW9SQ6TKN6a
 TVeZkd1Yo0iVhtg3ulPY5PDPcVMj11da/3uhStVs4GyAqTjUO8VAbH0nUf2h1C7Skkgmxf8qB0b
 hqMGU/vx0VbCCEacFkK0s5K/k32TMHIhTZRZCWjZFHmQA81m4IdwmKTkkztTTceHJlIbvcxlz0C
 Pf3S53n0ULxzfa9FIc4zLMGlVeLKOI5OVvo1L
X-Google-Smtp-Source: AGHT+IG3R7nzDUbI7ywyegfqyBV4/z9vERQ/HKQhcLB40Q0IMcGvVvbb0hYfAK75Dye22kA1OdRJjw==
X-Received: by 2002:a05:6000:4703:b0:3a5:2465:c0a4 with SMTP id
 ffacd0b85a97d-3b4964feceemr9778712f8f.20.1751908878378; 
 Mon, 07 Jul 2025 10:21:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225b5cdsm10602448f8f.85.2025.07.07.10.21.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:21:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH-for-10.1 v6 13/14] hw/boards: Introduce
 DEFINE_MACHINE_WITH_INTERFACES() macro
Date: Mon,  7 Jul 2025 19:20:07 +0200
Message-ID: <20250707172009.3884-14-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

DEFINE_MACHINE_WITH_INTERFACES() is similar to DEFINE_MACHINE()
but allows to pass a InterfaceInfo[] pointer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/boards.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f424b2b5058..91ccb68113c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -761,7 +761,7 @@ struct MachineState {
         } \
     } while (0)
 
-#define DEFINE_MACHINE(namestr, machine_initfn) \
+#define DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ifaces) \
     static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
@@ -771,6 +771,7 @@ struct MachineState {
         .name       = MACHINE_TYPE_NAME(namestr), \
         .parent     = TYPE_MACHINE, \
         .class_init = machine_initfn##_class_init, \
+        .interfaces = ifaces, \
     }; \
     static void machine_initfn##_register_types(void) \
     { \
@@ -778,6 +779,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+#define DEFINE_MACHINE(namestr, machine_initfn) \
+    DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, NULL)
+
 extern GlobalProperty hw_compat_10_0[];
 extern const size_t hw_compat_10_0_len;
 
-- 
2.49.0


