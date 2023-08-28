Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923FC83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadfV-0003tM-Me; Mon, 28 Aug 2023 10:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfU-0003pm-5Q
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfQ-0000qy-S0
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31977ace1c8so2795609f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234595; x=1693839395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkhqJAUVJ209lj57L0iB4q2VyrV5eDh4CMuLWSjFz6s=;
 b=OgIUQ+6lDyKbf0idKTkCE8+Q1FAhG7mNU12ib6hlwXj2UY30esy1birIswk8Qyt/B9
 gsOtsZ7UwzjbQGAA2jpuPC7oIzNQ3fsqyix/H6MNtxVS8EM7hD4kV+5Ylz5fAUbGKSzE
 YEf6WgnnZIJs4dmqAzvHvh6/APXQqEMlUZPP6VLNSiqsxy2c4GxEQm4q1eyvGWv3ZgQD
 WTznzKwsWlbUlAHWGXngqvvJtvoPZEZUOfpLQFIAVObhzyvisiuMfSgE7yO+vL+YCSey
 eo8s0M33bXJVsz52Ql4uH6fD9F7am1IkHhYL+Y7QMaTDWTOw9VACouI8f9rcJG3cAbPl
 w4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234595; x=1693839395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkhqJAUVJ209lj57L0iB4q2VyrV5eDh4CMuLWSjFz6s=;
 b=TQID9bpct+ynMfOuZnDncoY2YEdCByQ8EFbLt2/yEBdSPwxl9zoakqJN1smgz6ChmO
 8WpLnKeBDsj65rmN4wDl1/AEQf47Tl9JOlngt5XfpafqbXeotnE5TTi+F6MfcDpFUYGk
 xJl/EvWY0IcGGGBE82DItRh2VSDsAsVLBqN0qnA950tgkvLKCuMSDqTfPIlcnnolaW45
 LWFwQxmvA3Fpih7UgzTCFQD9ModW8lvzZ5KPcvtpFRg4Q/OZHO4er1qikUk0z3N5q64y
 vCEcxZGR3v+KZ/3WkX+zo0MHeZKh1JwePoqkPFAb2j5JHZvcy8Bq5ZrwRAVeqXbolHQ3
 FGTQ==
X-Gm-Message-State: AOJu0YwpA936xQlQSwSgGlrGXWVPpAQKflhL2OeBscCihRNNaEmsRVF5
 uPZpUo3O93dpUBXDfuIAe9m52wgWtPQhYPza++w=
X-Google-Smtp-Source: AGHT+IEu3ar25v/4zpVlIznV2NnB23pmN+zXTHn8sozmz2hafKPN+59TzXcQYmiO5W055Nvu59RRxw==
X-Received: by 2002:a5d:65c5:0:b0:314:1ebc:6e19 with SMTP id
 e5-20020a5d65c5000000b003141ebc6e19mr18853617wrw.64.1693234595538; 
 Mon, 28 Aug 2023 07:56:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfea09000000b0031c5ee51638sm10782703wrm.109.2023.08.28.07.56.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] target/mips: Remove unused headers in lcsr_helper.c
Date: Mon, 28 Aug 2023 16:55:45 +0200
Message-ID: <20230828145545.81165-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

This files only access the address_space_ld/st API, declared
in "exec/cpu-all.h", already included by "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/sysemu/lcsr_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index fb57bcbb78..25e03572fe 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -8,10 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.41.0


