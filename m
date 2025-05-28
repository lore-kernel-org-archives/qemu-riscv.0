Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AD7C5AD49
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 May 2025 20:33:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKNSa-0002Ax-R8; Wed, 28 May 2025 16:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKNSS-00022S-Hb
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:33:04 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKNS2-0001vo-0R
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:32:49 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-476b4c9faa2so1965321cf.3
 for <qemu-riscv@nongnu.org>; Wed, 28 May 2025 13:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748464354; x=1749069154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YismayB4SIJR2QTxoRpMlz0MW7faH8SO3fEZ+tMWWY=;
 b=NCIEZGuJbIy/EGc+fm2pfG7sgjk15G4scCdHEioKkio+hF7Nh7e3ATygHc3S36Nl4H
 BRnSTB2vg7NpzxBdqKM6RGF2zfvxwwyjrcW0lIjfZKtU6JfuiDaIxgR5Ebod/h1FeGyK
 8HAYtjoYxnIHB5S3PDzffkWmLuYkYxVZeV59rfxt8iB9ts6mbU2w4U/qDFP/Jh1Gy1dH
 CKb3oYnr6SQY1/Fy15bBUJ8H8kKkl73qken81IRLvTm+8OchhP4ehsWy+ZELeMrLff+S
 urwXYUe+FpvNIKnUaMIrAhyXvEay/O9BkSdwosfGRaajIXLtWhe3NQqmej04cpH156IW
 VT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748464354; x=1749069154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1YismayB4SIJR2QTxoRpMlz0MW7faH8SO3fEZ+tMWWY=;
 b=R5DbgWRY6FQqTl5rxxFu1QYuoQmPhN53e6wIz2T6/toGfWHR5KWpX45K/X2GLwNVfV
 GPjGL8TfeApqwIaH1PFcVnoKLwyRyFk/fH43mE+lzsiDqAXUL1hKwAD0zkPNLGdloiZd
 6fijBoW1BrAyTue2w59Q5xWnvi/RWNCKn6gRUSAxK1mkUmRyM+P/NBJmbEkOToS0/Ym4
 EON7fRqHA4979uYGkrb0TWiCptH+QWDQcKYKda+egIvYzJ3LDDLqfOezB/L0RWTGktyr
 sM+m2qxKVMX3pjuRk6achFpAQVJzDaYCJeLH4ZJW+rqiZkhv7/j4fVLomFEPDXV0EiUB
 N+bg==
X-Gm-Message-State: AOJu0YygGIoROhyN5L1ZT76c1OBqsNndVjJ5nmDuBEXEhsRxJqRQUDfm
 WQ/1eWcMHfvlz5NSSEda3GHmtKeQIwUQG4RGKN3i7tgI9bPvWIOZDw9qdyTZg5J/teqFHSjeuav
 uTmWH
X-Gm-Gg: ASbGncvz2Z3LTHoWCXrYUUkl5CCl6JTTPyXny3Iw8N7SuwjUkbhZgRonBX8Ct59mlzN
 r4Mm709EzMmTiZ8hFXw8lhWZVK8sjgtSklnlI1T0L+MdZ4yswFmupS4lSAVBECBHDsTPKtxv2EY
 SwCdLlPryVgWHsCVo2MQ6B6hW8X5BDeaRpIoWxnOBQc7PJ4gdpjZTO3Rw2c3AyJWicQWfNeDQfO
 rKKDTlFHQFMLDvEdPwoRWK9v6mBKWdVre5h2j2OrrpAafnl5UPuZH2YfUarsd4pg/K1Dr7fjPqP
 b4YmtOqzdSjWFh1Isa6a+OCC+nw87t6xicQQ5PpWDIbJL5sJeGyjoOID/FHSh5iP7eOX55e/gLc
 +81c=
X-Google-Smtp-Source: AGHT+IEamB1HaY/n+6OTkUesbtkkbClAPzjOE5WGp30xeCumaYwhwWDMjhqeN7S0DtEZv5Rr1ffOxw==
X-Received: by 2002:a05:6102:2912:b0:4e5:a83a:3cee with SMTP id
 ada2fe7eead31-4e5a83a402dmr2679193137.14.1748462506598; 
 Wed, 28 May 2025 13:01:46 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e59fc11a95sm1393736137.3.2025.05.28.13.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 13:01:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/4] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Wed, 28 May 2025 17:01:26 -0300
Message-ID: <20250528200129.1548259-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We want to configure other CPU types to use profiles as an alternative
to adding every profile extension explicitly, i.e. a profile is nothing
more than an extension bundle.

This means that a vendor CPU can set .profile=rva23s64 while having the
same handling as any other vendor CPU. Same thing with all other CPU
types.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fe21e0fb44..4a30cf8444 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2713,7 +2713,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.49.0


