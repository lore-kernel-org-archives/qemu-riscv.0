Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5DCCCFA18
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:31:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIt8H-0006Lc-Cm; Tue, 11 Nov 2025 13:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIt88-0006FB-Jl
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 13:30:17 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIt81-0007s8-CC
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 13:30:11 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-343dd5aa6e7so63302a91.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 10:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762885803; x=1763490603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37LBuNVcSSxT+XwzTMnXNk0k/jIZHkJqgpAuXQd/xeQ=;
 b=RnlpFUflfGiYNxALDI3KalO9VYPzzV0l+R1Le4ncyTDL5O9wo7Ljj6y16+DxYV3FOd
 9j85D9toE6EHnmGcLGy0nJ5nneIAiYlf2YTFtZEyQ79wTVBvvmQqE56WAtv8zaoafiIF
 J4s9EM37+TefmgBdtrOwNmJLm8HYfdKjALxe3rM2WuAJEZvmidjz8BXHPX5t1lgrAyq7
 56ObVnWSA+T1WsO3fxvEB4OYw64Tcrwphv+KqYP3vlVjo2h3TXN+qX28rnqAdGQV3/Zi
 1lBFSsZMDNY1r0Ok2NGr/lsvZV2TQFFHXaXaHVKq1HKsFfJ+HKCcHHm8pB2r0OAbe5ag
 cfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762885803; x=1763490603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=37LBuNVcSSxT+XwzTMnXNk0k/jIZHkJqgpAuXQd/xeQ=;
 b=UGU8WWo2T0VmQnmAx2ujOwAoj1gTdCGW7EOXMhpczhixgWPX9K9JbNZWVpGpiMxUaE
 0BTeX0/ZOJsQF1VhsaiRRB9sECZsvRStwAIiLliYbw+eWLHdUFr60sXjArpwbELhWwut
 FU7jw+zuP93NXvMbAcDpw9kpDHqqpDwKcCy+5bnUb59gy7vvvb/tQqYwgngaPHCJyWla
 aCeW1ShJIMZKrASvRrQ5CNBbHq19XCAdy1XZDIWWC1fNZ4v3jHmBoAFmLwC6Emt9kOYQ
 3PpF9ioblbnIeYQbe6Vo2VF0RcOvhpRV+pV3mrNb8KZalPh8YIq5U37PGwh0KlAOaajU
 NcUg==
X-Gm-Message-State: AOJu0Yy00JxNMXNapJklKeRt4pRkHnKV9fQZS88CVayE2Rwp6Wep2GJ5
 MOjtm5o6ZMesJqlmbcPb+0tbjFV41uzfFuORoymnT5RgaL5WFV3cEhfi04STsIeohTo=
X-Gm-Gg: ASbGnctv26FmW1WTqvxDeitMmROCaLUERJv9f0YgyPKNDpJs6r/98tUvOZLxuj0tNwF
 VHE88YfIpkTTfNnO1s2QtM809Pm4PZjUJ1TpIWH98skN+thWEZ+gM/ieMQmBMdb8kl0vrEPqoX5
 lb4YVokya74+1I7NwDL3qh9sZE5ORTsXAyX8IbwCbpRYGYiXf8dmawMUSFlzH29RLJb5PGZFdxm
 nek8UmxjEsZhWnbY2VkQnsfJSDPgbTSx2SsWhqPMu6Ah2Xge0pKxLHvDdPEuVAbPZKX9FAwEuva
 7P5OUoxMEsUGXV97tD9utXQyF33IkmeeBCImZppe7OveSW8fdbfcELe3PrU+Oxdr4ObWRTQIXHc
 rT7IpR5DXroz3BJmihurT9U3bgrqRkyJ3z9A8VfmUM7uZrU5hkAT5TZ7O+ByqtuaVxy4qo+Y7kW
 VYtJ10K+hZhdCCrJU/1oWJEplsbZ+pAV5jdUHyZw==
X-Google-Smtp-Source: AGHT+IEO+JGjQE1MALLrRUvHhC4VHb6h9kR8T+y50WwBN4+KoEjg7gYN5+FXCGeODp+niOnCiwaVrw==
X-Received: by 2002:a17:90b:5101:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-343ddebef9amr272903a91.27.1762885803419; 
 Tue, 11 Nov 2025 10:30:03 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c2ffdecsm15207419a91.2.2025.11.11.10.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 10:30:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 1/5] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Tue, 11 Nov 2025 15:29:40 -0300
Message-ID: <20251111182944.2895892-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
References: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1035.google.com
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

We want to configure other CPU types to use profiles as an alternative
to adding every profile extension explicitly, i.e. a profile is nothing
more than an extension bundle.

This means that a vendor CPU can set .profile=rva23s64 while having the
same handling as any other vendor CPU. Same thing with all other CPU
types.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 73d4280d7c..975f7953e1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2792,7 +2792,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.51.1


