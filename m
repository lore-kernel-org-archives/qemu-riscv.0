Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A00C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 10:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thQzs-0001EG-Q9; Mon, 10 Feb 2025 05:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thQzq-0001Cg-0y
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 05:26:34 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thQzo-0001nh-7o
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 05:26:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso1658285f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739183191; x=1739787991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xBCJMHcPe/iIrLZobFxGzbZ4tBIo/mQI53ey/01FGoU=;
 b=bMbHC/XJjZQZE+anDENSgs+Oxj/cF0MhoCrpjNkFZ7+3Dus7jmozeLgcvCKMz9tGW2
 +1yAZLmw/Cq2w2mvqe/rG8z/SmcFBMN6gSXa/D6wn55s3t2Y5eaTL4h9qsc5mCC68jDu
 Mfrdx4EL/g0Jl0v9dyJKhkWQ67MNlRCAkUysZJJ8ZSSvW33Xq49R1zjDXnXu+bfdOzut
 eB2ede7S9FVE8XF5wp+HQEw6PfrXp8Gr3JWPimg+LeJJqOz18uJH1B4kddFfsqehbNfH
 Dc/gfU0K1a3O2chK4+2gSkrgkRIvbXFkZcInxu682SaZFdHdg6hPUICkcYzY5S9c0LyV
 UAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739183191; x=1739787991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xBCJMHcPe/iIrLZobFxGzbZ4tBIo/mQI53ey/01FGoU=;
 b=JGPrHxdEDA/hqYpULfVkB8RXYI+M0YoLgi61I9GzUQjyhUTCKyZ58bNImBLLkJ2ua2
 G/KKELTt1XeyndSDtRQDAnSo7XKYNDqYXglwXxekNlVoxg17C2rHvVCgl8zQyO4tHO7w
 F1b/XG1P9OW1cA40r2zKUzdfSQ0p4q5Naj1T8jRL3siPgXbawtwyD1ceHN0zL7CtGviY
 XDa7puYQ+LwMX7NVtN8Xb5gz4lEY8BIlmNCCVA47hn+ETdAtuYhNO+pGR0sQxbaqJxNr
 WfjZnSbxywM/DF8CvoIW8UVhDIxw3lMJXXxp2+7kGNt4AJnSgOgJgD1JMhpXRypznlF7
 YltA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdiRwXEMWZ0teJ4sZ64qVaJQPp+0pmZuCqpZwcfels1pPaup6ZhiinQnz1BcSN01mDgs2Hwy1kxqRF@nongnu.org
X-Gm-Message-State: AOJu0YxAYcqjujCEKuIjN+kR7ZqZ0s3hP93WZDbRgj5BeHfxtJvC4uXD
 2jYDn3Vzzu0EDDla3Wfzumnj1ctnFqanga7u4S62fXks1B2YSmLBuToZ0PFDnM3NeveCegPV+U3
 04/M=
X-Gm-Gg: ASbGncuyn2xqiyDJzmPM1SFUyn/v++eydzenljehw73LC5pYsj5Z9cZJaXx0ipQjny2
 q/hPb/cwtfwhmviMo3CFgn/XV8iYqUmN8ZNO4Ru87B91/ZoZ0iZc5H79v26+AVNZx2BC3FAi/iM
 5vdYjaVBL23PGVCITHTb2Ts5XwrmzXgZTJ3pdBV2RKHxKAaYp4OMtdABDTGF1I+0Gy7jGKfknUa
 QU+xf1T96rL6e4Sdxp2yk5CJ0uDLsh5DZvMGeyviukMeuf7dRAPGuFSuQI4CfAR/0YWyt+86OD9
 hwaIncAbsqXDc+RZa+nIV1rb69PnIdImrch1IpSutF6/zlYMmtjwZOhgJ3QAxAS7nNzK9BY=
X-Google-Smtp-Source: AGHT+IFsk4Sm5GtJcrljfyFdZDFfEzE6alyDValtScdGjuwRyLdffPNgRUGjpr98MaYFefZPsvEAQw==
X-Received: by 2002:a5d:64ef:0:b0:38d:e092:3d0a with SMTP id
 ffacd0b85a97d-38de0923f1dmr1426772f8f.9.1739183190610; 
 Mon, 10 Feb 2025 02:26:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd368c9sm12051181f8f.34.2025.02.10.02.26.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 02:26:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org
Subject: [PATCH 05/10] target/riscv: Convert misa_mxl_max using GLib macros
Date: Mon, 10 Feb 2025 11:25:59 +0100
Message-ID: <20250210102604.34284-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210102604.34284-1-philmd@linaro.org>
References: <20250210102604.34284-1-philmd@linaro.org>
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

Use GLib conversion macros to pass misa_mxl_max as
riscv_cpu_class_init() class data.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f3ad7f88f0e..9fe1b23a297 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2955,7 +2955,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
 
-    mcc->misa_mxl_max = (RISCVMXL)(uintptr_t)data;
+    mcc->misa_mxl_max = (RISCVMXL)GPOINTER_TO_UINT(data);
     riscv_cpu_validate_misa_mxl(mcc);
 }
 
@@ -3057,7 +3057,7 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         .parent = TYPE_RISCV_CPU,                           \
         .instance_init = (initfn),                          \
         .class_init = riscv_cpu_class_init,                 \
-        .class_data = (void *)(misa_mxl_max)                \
+        .class_data = GUINT_TO_POINTER(misa_mxl_max)        \
     }
 
 #define DEFINE_DYNAMIC_CPU(type_name, misa_mxl_max, initfn) \
@@ -3066,7 +3066,7 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         .parent = TYPE_RISCV_DYNAMIC_CPU,                   \
         .instance_init = (initfn),                          \
         .class_init = riscv_cpu_class_init,                 \
-        .class_data = (void *)(misa_mxl_max)                \
+        .class_data = GUINT_TO_POINTER(misa_mxl_max)        \
     }
 
 #define DEFINE_VENDOR_CPU(type_name, misa_mxl_max, initfn)  \
@@ -3075,7 +3075,7 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         .parent = TYPE_RISCV_VENDOR_CPU,                    \
         .instance_init = (initfn),                          \
         .class_init = riscv_cpu_class_init,                 \
-        .class_data = (void *)(misa_mxl_max)                \
+        .class_data = GUINT_TO_POINTER(misa_mxl_max)        \
     }
 
 #define DEFINE_BARE_CPU(type_name, misa_mxl_max, initfn)    \
@@ -3084,7 +3084,7 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         .parent = TYPE_RISCV_BARE_CPU,                      \
         .instance_init = (initfn),                          \
         .class_init = riscv_cpu_class_init,                 \
-        .class_data = (void *)(misa_mxl_max)                \
+        .class_data = GUINT_TO_POINTER(misa_mxl_max)        \
     }
 
 #define DEFINE_PROFILE_CPU(type_name, misa_mxl_max, initfn) \
@@ -3093,7 +3093,7 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         .parent = TYPE_RISCV_BARE_CPU,                      \
         .instance_init = (initfn),                          \
         .class_init = riscv_cpu_class_init,                 \
-        .class_data = (void *)(misa_mxl_max)                \
+        .class_data = GUINT_TO_POINTER(misa_mxl_max)        \
     }
 
 static const TypeInfo riscv_cpu_type_infos[] = {
-- 
2.47.1


