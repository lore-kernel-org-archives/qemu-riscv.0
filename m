Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42570C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmQs-0000sW-Km; Fri, 05 Jan 2024 10:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPS-0004Nn-O4
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPO-0003zT-IU
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:58 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33748c4f33dso1401856f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469613; x=1705074413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFGPQoyiNDNESAoFxHgGgEpoIvyyYwdHUPQolOFmxbE=;
 b=yDHJUZtuJ+/pbAiwQ7FJM6Y7cA9os0eiFqDzVhm3WM69UHx4LvAMpspc3VSq7FMsfr
 Qg2vgeASyHqK9nB1MgQMnbKrjeBKPFzmMg5CZWEuM75fok6QhuEVX1TmGUVp7EwgTwQA
 Uq/I+c4a4ig9NuVW6dAFhlcattXWiYKYA+lOmxuL2UdTn/SnAockYNgdNMTQm7BkzUW1
 oB+JMyvUUfWNp6dVTX726vWXDydMFhE2ZcrVd7aGugP7beY28JgxT6lyC3tzEWEnDcLz
 XhmWIUXQdOGuH5rQjN4/955fObhC8wi3LJiZ2eMw7OIEORdf+0XmFJqlNiQAJxjNjs+E
 DVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469613; x=1705074413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFGPQoyiNDNESAoFxHgGgEpoIvyyYwdHUPQolOFmxbE=;
 b=ulXp3Ih1Eqqe4p5J6FMd1zShfmwXb+dZY0Tn66UVap6BDu2HMrfY3/3imllUFV7LJi
 lsENmoGHi0NVQhu4rfDUWEOdoA/anz1rTDI1eayGLyHnkaIsmvTAGBanziRN4eh+xhqa
 puHpcH3XN95/2OTxok6YpQPYv3oOrcEnUSSpD1FpQVM1O+rCtQUz3BjuVoKpUOXvDlYu
 Pk+LUSwNj3cr7V8UCbtC7r+II0DT+eRRd2M5BCLOWPPZ7m5IOAQNoJjSTLP+G/9UtpqG
 xfTpv0EgNIR4mYdAPW9tjc6u2C6RyI/x2GBL07pt4XXpPqsE23OHF8+MIRzlOh9SktO+
 AZsw==
X-Gm-Message-State: AOJu0Ywh+UbtPZ5R7ukAG/kmU2oOt3kaKWdgLgQQF3BPWT5ajdEt395x
 bvA5jmFoA8cVUCad4E8UrSSzs9YdhEavrQ==
X-Google-Smtp-Source: AGHT+IFZLC2sKOmV+bj7XyN2s9p4gXiuKgjYCZfd/aPNXehtVwbSuR+sykW++shNHUXHHv21xtufkA==
X-Received: by 2002:a5d:4b83:0:b0:337:49b6:8bea with SMTP id
 b3-20020a5d4b83000000b0033749b68beamr1188216wrt.78.1704469613220; 
 Fri, 05 Jan 2024 07:46:53 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfa18a000000b00336ca349bdesm1626770wru.47.2024.01.05.07.46.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 33/71] hw/core/cpu: Remove final vestiges of dynamic state
 tracing
Date: Fri,  5 Jan 2024 16:42:26 +0100
Message-ID: <20240105154307.21385-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

The dynamic state tracing was removed in commit d0aaf08bb9.

Fixes: d0aaf08bb9 ("tcg: remove the final vestiges of dstate")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231129182734.15565-1-philmd@linaro.org>
---
 include/hw/core/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ef59de0a..44ff954207 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -437,9 +437,6 @@ struct qemu_work_item;
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
  * @work_list: List of pending asynchronous work.
- * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
- *                        to @trace_dstate).
- * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
  * @plugin_mask: Plugin event bitmap. Modified only via async work.
  * @ignore_memory_transaction_failures: Cached copy of the MachineState
  *    flag of the same name: allows the board to suppress calling of the
-- 
2.41.0


