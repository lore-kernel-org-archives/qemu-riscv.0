Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59203C55174
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:45:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wreik-0008HD-LN; Wed, 05 Aug 2026 12:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreii-0008Ga-Pl
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:43:56 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreih-0001uo-B0
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:43:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso816925a12.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1785948234; x=1786553034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=nilC5DGA50nOibx5tzh7GmnP5tK3pQOF62tT50jIPflRqB7ZKK8IahmJlE7opRV/y7
 /MKLFN9wLyrIGFooDIrOu7N1L88tegErcCPlqPkX0gmf679W4L/XwX0RCEGTWw5seDBF
 MBvKpPXjzvrd9HSAlu2/Z6SIR2pO/2X5f58htBAmm2u1SPhrKYMlcWpo/+kIwWwBiTPp
 bH5BxEHZQVRnQzBcBLZknWFA/qKcLZTIAG0TE2SLrSuc9YuutVlJpgncKyz9vbmVUN6v
 lVOO8KEBpliEMw0SBVeFqfNx+5lQ+9lceCmfe2u58ycQQKjw0Z2/Z2RZ0g/8vNj/yv8M
 8ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785948234; x=1786553034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=IVhE2qgutzP5PFzEt5vqkqJ8LjC4CrxJhRIj27Vp0DJ1ulHsbsJ8koF22yp3o4ijta
 0P3hKI2SfHdTO23JsGQ18dQlN93Kj/+VkRbNPfOX2k+kJs8kDCYQ5hb6uDT3TB6eZHpo
 zNbuEhq1uy5U8yG1MmY+CLYZrbtOQkz6usI/iRxfvtncO14wa/7WTGZNFwW7+lH8jg2T
 bM3FihtCuuFu2RLv9MqzphR9HDfY4i9EBeAL5zEJTphDzQK9LMkywsZBat0G61FJghqJ
 LsH6GqzRn6yQ9UYf+glh+ct++XzZ24009pK/OI79IAs2+SBusSeXvMX8bd5R606uwEQn
 sS9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqZJl9fStBf/2UGQPG7VtANPSZ1LKPDkJQX9N3xXEvGTUibekUVtNjh6BU6qijSzKlT2dTjZXtVirv9@nongnu.org
X-Gm-Message-State: AOJu0YxKXQEsjjNe8ifu5gINmvjHxDfUO+F7nwMw+tblMuRAcQWznZ1u
 hC1voKPh8owVc7dq6LDo8lGl6gfV1n5bQr5nX9G+n8y8I8XMMtADuS7m4QBmnAkXkWE=
X-Gm-Gg: AR+sD13u7JOvg6nhlUGshLo6kPKrNYy+fzAHiI8TsdyMz/U53pHdSLaLnGZ3X7yKo5y
 joNQoPQj02stQ4m/UxzWmZgQ0LEOZmKL08GJcl8/+lSmKLdGA61IrIRLLgw8kJlvl8kPJszgubF
 H4OCnG6FQ2Icr4FRjDIxRxWZ/2Jm/WyIYbhifxD/TZbd1GIDL7p4t3SL77jYO/HDCbNU7P021F5
 ddtfRRI41pNZe409In7TVqxnZmAUEmdhwNjeNR/7i5KqZKV98nGKkglEHq2G3xgMrV3oQGFuN88
 jgBdnBVeGs44qQmw10RHOxnUoUpTMFC9PvdUN4Lp0W/eag2w4p0UaIVDiWLza9KXARFmCMd5uI9
 lvEV9qC/WHoJ3W9Cf4NUBlIqmQjogSScgIcawKf29FlvNCCTfCVGwnK8kwYz/yxHv3PzybWczbn
 cxl+pky3qsdC2jC6nOCBBfxd90vt/NR2KxCGA9AFFNQNlHHqOW5T6N2T+jusCMjmY4mDp6CZX1G
 CSRuMjxUwQb9ut8gIp6DEnh1Q==
X-Received: by 2002:a05:6a20:a111:b0:3bf:7eb5:9459 with SMTP id
 adf61e73a8af0-3cb85ef9202mr8570160637.20.1785948233862; 
 Wed, 05 Aug 2026 09:43:53 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3158644a195sm16719065eec.13.2026.08.05.09.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 09:43:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 1/8] target/riscv: Add Zicclsm CPU option
Date: Thu,  6 Aug 2026 00:43:38 +0800
Message-ID: <20260805164345.698208-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805164345.698208-1-frank.chang@sifive.com>
References: <20260805164345.698208-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Add Zicclsm CPU option so that user can turn on/off misaligned loads
and stores support.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg_fields.h.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 9eb47af0a76..f8c27a574f8 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -139,6 +139,8 @@ BOOL_FIELD(has_priv_1_11)
 /* Always enabled for TCG if has_priv_1_11 */
 BOOL_FIELD(ext_ziccrse)
 
+BOOL_FIELD(ext_zicclsm)
+
 /* Vendor-specific custom extensions */
 BOOL_FIELD(ext_xtheadba)
 BOOL_FIELD(ext_xtheadbb)
-- 
2.43.0


