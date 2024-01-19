Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFFAC47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:41:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnCF-000821-VE; Fri, 19 Jan 2024 06:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnC1-0007lQ-58
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBz-0003Ae-Dv
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-337d5aa5ef6so420742f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664266; x=1706269066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6KPMPhrgsV+R1Z5ztift8+++ccJQHN9jxOgkalvdDo=;
 b=DdiKiNYz0c/zCpyOhoeYIzrJK8kuod//4sgt9t55UmqgPvhgR1Df+AbDGpdvlc1kFg
 jQwuApvNkBVxPvaJ93DPIBIGzeDWviK7A9GSpyMBUfH9fcfKckVjEIssdDgm42Wh9f1g
 F5nVJT2yogi80/Moi0KD9NSvHfZ30Nnqm2EHUKquUqKgp8JoRYcG8Z8ji/Ln80ggiFPK
 w1TkboegwWVYERvB63Lm+z+xFtvfIz8/xvUj8Iv4UehIbrioF0vrWE2EZYo6OQFO81Dw
 mb7xE6cSlQ2Zr+iw5mCKcMbmwkmbPTZm7BlaHBfWECRn3OlXexAzmzt54/lTrYN78dwO
 Hz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664266; x=1706269066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6KPMPhrgsV+R1Z5ztift8+++ccJQHN9jxOgkalvdDo=;
 b=COgdsmwttMifzMkKEtZrHYJnjUG59Ty3+fELLy1+M8CeTPoXEgVOIPmjfu6eU35HlX
 cpqxJujg7Ji2W+SmCwoJMusirCnbAeSCnPimIsE0TCfgoL0zytz0OCo3KxaclGFN50oz
 HSHGIVeRKR/uNrdufZRFcWqZp4Np4ZAm2nglnhjxe7RcvQ+tfLFjaQ/GZ0ZXQJt1w5pT
 HsDUr6HQz6sv3Lu1cJzyuoc/i1DXBJHDzuuAC2TdsN/OWsyOnOGve4tX1JryXzNwYI3i
 0T81nwMZrbIeFkNBJ7madwOCLkhYM07BMdgjb5YTdws56jCXihFRsr3TNfn1ailNoYfM
 jXYQ==
X-Gm-Message-State: AOJu0YyAlzOtG413AWERGxJ/gSDyxbpkpNDeCpcPABjWUbJJqKZ7MZy1
 H/bEwYc0FB5sHjDz8sZzk3Nfhssss3nUc4xDfRuq+4fIg0QrDlRMP5GjE7TyGO4=
X-Google-Smtp-Source: AGHT+IFnzuR9e6d5wkWP4aE52eqp/JSY3F8p7elPY0H2j63Wnte+kDfWqLjOAhAUySr1SDPpNcC29w==
X-Received: by 2002:adf:e7cf:0:b0:337:d711:ac9b with SMTP id
 e15-20020adfe7cf000000b00337d711ac9bmr282569wrn.139.1705664266147; 
 Fri, 19 Jan 2024 03:37:46 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 n7-20020adff087000000b00337bb0f370dsm6313328wro.40.2024.01.19.03.37.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/36] MAINTAINERS: Update hw/core/cpu.c entry
Date: Fri, 19 Jan 2024 12:35:04 +0100
Message-ID: <20240119113507.31951-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

The hw/core/cpu.c was split as hw/core/cpu-common.c and
hw/core/cpu-sysemu.c in the commit df4fd7d5c8a3 ("cpu: Split as
cpu-common / cpu-sysemu").

Update the related entry.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240115094852.3597165-2-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 760acdea66..dfaca8323e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1867,7 +1867,8 @@ M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
-F: hw/core/cpu.c
+F: hw/core/cpu-common.c
+F: hw/core/cpu-sysemu.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
 F: hw/core/machine-smp.c
-- 
2.41.0


