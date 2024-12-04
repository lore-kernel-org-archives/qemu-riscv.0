Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CF8E7716D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvx0-0007T2-FN; Wed, 04 Dec 2024 15:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvwy-0007Rw-MZ
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvww-00070T-Rr
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:20 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4349f160d62so1361435e9.2
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343977; x=1733948777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPV/ubcrZI2iapAPKTXZkCgfGpvNQPE7G4ysbpy5Jw0=;
 b=dRqngvANIAybBI4plRQlxbGRt7LPEOiaCux0KvE/ZHgfjadcIpzfr0vJYNoYv20AaK
 /wZvLKovl491nwxERsQyNHincW8MTSAgH1bpoyFqa6Wsch/lUMGFjEZY/aAFsvKYXHVw
 dxCjmzXDOgGfmonYcPcLyjF7ncHNBnCJGTBuwVxkS0/cAHoIYnsVnCH3Ivdd3BPYeD2j
 0Pd83NvnY49xelDwl3I8T8RBjRNUrDChC8wuQ4kYoIZTGQu0fEhduDxDAbgTtzpiS62o
 +2vlgpGt3n6H00hJYR4Z2kWeXqxwbVQryGLCgj6/2K+yxE8pEvlhDscguxfvj52uGaaj
 w2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343977; x=1733948777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPV/ubcrZI2iapAPKTXZkCgfGpvNQPE7G4ysbpy5Jw0=;
 b=NVjscGkwJ4dJlq34l81+LtKaBT+KrfBv8vW0fFb1AYbMAEHJC1JMfGPBcJCttaI8CB
 V27ZRaSXag7M6fmwXFroyYNecsfMC9IFebQbMr4nLRj01aW3s2vnNdTJkli0oIpa4ceL
 rO0QQFfjGUWN+zE1rty7gEKlgakLhuVPNHzh2xFrYZJ3HrOdWalodgXfAEzlo2b/GSrn
 CY8M3o6XIP3BOm+wjhdmtOnmqj4F/gxViT6uR+xjWfnR1nwhRJu5+8n12C2P2JEVa+9c
 tklojuD7NjOpVLnhp3dbsJ2ZKrVvXGr2lZc7mvzO0Wb7QG7nl32URv7ANNjWKA4H9Z71
 i7yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCg/M5ED9V/wATzV2GX++CxwUTLHasuleX4bSNlts0ez0DLwcWV4k64eE9lW1fNsnFMmwZlxDJm368@nongnu.org
X-Gm-Message-State: AOJu0YycguIVo2slMrzbxArJebplLf8O+RFpDKUoRoKS1M1jJCvkAzw7
 1kdTwQMq5nbokwEv0WIj8UiVAbZiv7hHDwH4usiWklhUOqRJ77lF1dT4iQaQ5KI=
X-Gm-Gg: ASbGnct3m3YGouBaXo9VbHFSUJ+UzJVoRs6osX/YyzFcD5AfViOoix2U3RHpkvKFebP
 WXOLCFMYYU90CYkfumbqfyz9OQtOY5FgNakgAbCY3/8b9Vz5Q7D+HWtT0Dx/O32dlEKMczC1OwW
 7UsF/RnxjWLChCe1Hzm5DE1IkEsQgyIwf6Y4WVe+sV1Doe9tVyvuKRI45uXiGHoZMXDAkcEl1jU
 p6V71SXqImODhCzz5C99aPNTMINcmidBKvQZeF7yefg5ZsfIc2qMADVKucCN6wWzZpq94ycYqUM
 YABV81fseGqSMLuRyqIh6haz
X-Google-Smtp-Source: AGHT+IFeaA2c209Xgk6HxXqyhoIdq9s4nD1+pCKbz/xRkRw7GRhfUdt4Ky6Zy1ZjVBGrOnLx7SCaQA==
X-Received: by 2002:a05:6000:698:b0:385:dea3:6059 with SMTP id
 ffacd0b85a97d-385fd429a01mr6525111f8f.49.1733343977503; 
 Wed, 04 Dec 2024 12:26:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385faec0c9dsm6672009f8f.20.2024.12.04.12.26.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/20] hw/core/cpu: Introduce
 CPUClass::datapath_is_big_endian() handler
Date: Wed,  4 Dec 2024 21:25:44 +0100
Message-ID: <20241204202602.58083-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Introduce the CPUClass::datapath_is_big_endian() handler,
which returns whether a vCPU expects data in memory to be
in big endian order or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb3..91c6581f814 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -105,6 +105,8 @@ struct SysemuCPUOps;
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
+ * @datapath_is_big_endian: Callback returning whether the vCPU expects
+ *       memory data in big endian order.
  * @mmu_index: Callback for choosing softmmu mmu index;
  *       may be used internally by memory_rw_debug without TCG.
  * @memory_rw_debug: Callback for GDB memory access.
@@ -151,6 +153,7 @@ struct CPUClass {
     ObjectClass *(*class_by_name)(const char *cpu_model);
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
+    bool (*datapath_is_big_endian)(CPUState *cpu);
     bool (*has_work)(CPUState *cpu);
     int (*mmu_index)(CPUState *cpu, bool ifetch);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
@@ -750,7 +753,7 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
  */
 bool cpu_virtio_is_big_endian(CPUState *cpu);
 
-#endif /* CONFIG_USER_ONLY */
+#endif /* !CONFIG_USER_ONLY */
 
 /**
  * cpu_list_add:
-- 
2.45.2


