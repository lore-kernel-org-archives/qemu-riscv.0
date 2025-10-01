Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63794CCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3ySR-0004NS-Nu; Wed, 01 Oct 2025 11:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3ySO-0004JZ-EW
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQR-0000rx-PW
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso15757105e9.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331239; x=1759936039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/C42/g+0ka3x6Y+pYcvJ/oLioyVbWee9ufrhd822gyA=;
 b=lxOxu10nX/5NAUsftF1fEfaP596+wwcyHADtf2Bg6g70woIu2/5ELd2Be9fQkDENes
 /kiaYkNmbx8iMp4zFg+42u4qvoYnV8/1PuRvwJ94K+KSe0vHdm041NhkRTaZaMbvHoxv
 YOcs9VgucT846875wVZItRioxuU64De9lhOWB/M4yC1eFcsJLL930rnMYb6h8BFnYMBT
 Wt177Q0ctn7+dI8HUv1JwniO+gmEd33gn3vQmPqD2+VAbpb3/gXpVDQlUByDXLjH1E3r
 GcEWzQ+mYQL40fV2j4xH+4LP/GtNzsgWxBze4Mm+vNtpIUh5/817RNTLGu5PF+q0cGXw
 /15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331239; x=1759936039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/C42/g+0ka3x6Y+pYcvJ/oLioyVbWee9ufrhd822gyA=;
 b=xJTNsJQC3ol13meLt3jTIBvm1zIoM8wOpbwHppgCkBqnRnVM9ysnwVBB6/qLxBsokS
 ZQ4EyxXxOFHZtzqZUC+Fmf+wEb6Pvf5loJDZAQ8M7D5Wv3KjY3nsfwSaTYAgF/5RLtVe
 8p90NovykXveJmE4PQ2Hg564J/0p6q1nAevefPRPRKTAAId1/2Bw/gZ9jeQiPozuSSSF
 7YbjZrPp+yoHOmAsjpyQmqTvEFrxIW8Yu4UCLIMaITrElTqvu5R7b9RRMbqvmE6p5gHl
 UDjw5Afxc7GQXBjhDbXQQ4ESo7m/qRyOy8tT2mwmbu7AdrztW/Rehi0CbaU72vn7/LJ0
 viyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhJPaCnFxGOO2f1jM/q/+P2/M40d2GAJrJUsikwxZiZRnVjae1vzUz9X8BoxRsndlnJcjfNC7ncpVG@nongnu.org
X-Gm-Message-State: AOJu0YwffAXhBnxhs86VDCjjdBhqg/C1iyvXrF8wn/AkwHsybsGfUcmO
 Z6w0zB2F3xpziNzNXLRJSNDddk437D4G0BSQyaVhI6ISgJsBnsUPkyQM67qlIwzj1+0=
X-Gm-Gg: ASbGncsvEUhalnyC9O39zUZpGFLMj5kl1eljsSt7L3UTwWCIQkH0ksuIPctsLFpQqOL
 MwktigpABw4sTTIdxQeTLHtM53wCLDTYd6Q6pnZjxvc+RFcPec82CoOAYSrHt9KHQfiR8/3QoHK
 2Ag4qOt2pVrLYwpuqieUHmlA3LfljkLUJJSHx4NkTr2pJRrCJUEfJ2Md+pswszqLr6DM2s5LUH+
 YiuokFEbSCY9O8roUE11xYeW9LvoFJkQDSNNWAHZfhTF/wLOePbiBrGXZg3Jjv56ze7+KJhjhgg
 QqjQ4vw9bu4RB4KwOHEN8Z5Xg5AztLuegwFxpJbGcxIXSIAiFyzsPXb+fPKHVtxFRKxbRrLXvs7
 uB5uaCOcNLZQLJe6GtSnJs6Y50i2YoCPcs+2JP/N5ZYDRgXuUGxHIsnd25GNDx21gjqv25B1lGF
 YOWUXBFYrbpN8rXqovt+KmrriRTpKXpbM=
X-Google-Smtp-Source: AGHT+IF/75mknZcUFVld4k25ibBW5an9rIxlCHvWPhGUKdqmIQ2eXg+Qp+sCollNQ71J/V4FjW/XTw==
X-Received: by 2002:a05:600c:3b27:b0:46e:4784:cdf5 with SMTP id
 5b1f17b1804b1-46e61219f94mr32963235e9.15.1759331238590; 
 Wed, 01 Oct 2025 08:07:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e675b557fsm17554035e9.0.2025.10.01.08.07.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 21/22] exec/cpu: Declare cpu_memory_rw_debug() in
 'hw/core/cpu.h' and document
Date: Wed,  1 Oct 2025 17:05:26 +0200
Message-ID: <20251001150529.14122-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

cpu_memory_rw_debug() dispatches to CPUClass::memory_rw_debug(),
move its declaration closer to the CPU API. Document.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h |  4 ----
 include/hw/core/cpu.h     | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 910e1c2afb9..ce64a999035 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -150,10 +150,6 @@ typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
 
-/* Returns: 0 on success, -1 on error */
-int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
-                        void *ptr, size_t len, bool is_write);
-
 /* vl.c */
 void list_cpus(void);
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0f7eda1a10d..1e928f57c99 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -685,6 +685,26 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque);
 
+/**
+ * cpu_memory_rw_debug:
+ * @cpu: The CPU whose memory is to be accessed
+ * @addr: guest virtual address
+ * @ptr: buffer with the data transferred
+ * @len: the number of bytes to read or write
+ * @is_write: indicates the transfer direction
+ *
+ * Take a virtual address, convert it to a physical address via
+ * an MMU lookup using the current settings of the specified CPU,
+ * and then perform the access (using address_space_rw() for
+ * reads or address_space_write_rom() for writes).
+ *
+ * This function is intended for use by the GDB stub and similar code.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write);
+
 /**
  * cpu_get_crash_info:
  * @cpu: The CPU to get crash information for
-- 
2.51.0


