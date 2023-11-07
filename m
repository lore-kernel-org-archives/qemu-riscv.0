Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9843CC0032E
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:28:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0L8x-0005RY-9g; Tue, 07 Nov 2023 07:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8v-0005Qe-QE
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:17 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8e-0004g8-Id
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:17 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40839807e82so34473285e9.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359897; x=1699964697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwIwGURbiF//KmePmfvAI1hLU80w6lpRnRx+VzJZixg=;
 b=IeYl6qcmsiGdXJ3fA/WTi60MmAgpFTr4FccCKum2M6LxtBIec6ToYB6VeCFPeKB+8M
 n31PcXB0kwC8XU15ICxlh6oqqLLm63ApN97jW5r6LGJWo4rePYB7ylcOuaZMCNlkX562
 P9OrAyruFZ19tK7eeOMXL0GdLTuNhq3R7Y2HG9lKxHURqQYVrq12egIyfREa0YLE2lwi
 yyv1R33ruKyVlZVRfg91QAn9BSFaq8nvhIJJMjyKogiS8iOk2f/nEffkeEYPJ1tjqucc
 jaAZei+Xuh6lKMuBze1gH4nqjU6ThR8yYlY12As8Ele0sVDpfMWks9IclGNhf561CmcP
 R7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359897; x=1699964697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwIwGURbiF//KmePmfvAI1hLU80w6lpRnRx+VzJZixg=;
 b=O25nxSg99cLxx5KqpAZQcQhF3v58H1GOMixoj9YYaHJb81XI6xwUmqY5djMTihL/AC
 Gafj35HS15JWnRyLGXsUH5UYCgtjiW1s70ECG4tAQNOYOotpU9UM+lRcSP0fFd0/NLVe
 3Art8ttB1vAXAjCARVdDy3R1xlYX60OFvPTwC+gbP0krl3CsUuxg498DCLoIaWLAbqwj
 F8axP0rmDDtjLBkuwk6b9p682OUxxIEscc47w22VoANzOI7xv5wv5YpwiLBNUuCKVUJk
 B7J+CfVfLPSpZHfrMUg12TJVlKWofO1l2UvlPpIf8aEyBO/vWaEH2wPqbqzJiMtxrlS9
 D7PQ==
X-Gm-Message-State: AOJu0YxM5sNsbkpvzA+PXrsSvXMcumMOQVu1qsnVEtOYwcSsnfHPE9x4
 f2jzrM6owH8BhLG61emtCGmfCA==
X-Google-Smtp-Source: AGHT+IGGQ1rM6RveScTmRQAjHmeqN9I73tv2WvCvi1oJorR3AZRW+OYSPUodwSys9zJ4olqahJuvcA==
X-Received: by 2002:a05:600c:2191:b0:407:4126:f71c with SMTP id
 e17-20020a05600c219100b004074126f71cmr2988795wme.6.1699359896987; 
 Tue, 07 Nov 2023 04:24:56 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 az34-20020a05600c602200b004076f522058sm15891852wmb.0.2023.11.07.04.24.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:24:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 37/75] target/ppc: Move ppc_cpu_class_by_name() declaration to
 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:27 +0100
Message-ID: <20231107122442.58674-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

ppc_cpu_class_by_name() is only called in target/ppc/,
no need to expose outside (in particular to hw/).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-4-philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 2 --
 target/ppc/cpu.h     | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index f681bfb4a6..0b8dfa5fee 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -36,8 +36,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
-ObjectClass *ppc_cpu_class_by_name(const char *name);
-
 typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 02619e5d54..f3ddfd7a26 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1342,6 +1342,7 @@ struct ArchCPU {
 };
 
 
+ObjectClass *ppc_cpu_class_by_name(const char *name);
 PowerPCCPUClass *ppc_cpu_class_by_pvr(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_class_by_pvr_mask(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
-- 
2.41.0


