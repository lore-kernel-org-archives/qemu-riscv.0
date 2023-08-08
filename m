Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8187C04A94
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 18:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTRGo-0007jg-Oo; Tue, 08 Aug 2023 14:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTRGl-0007ik-K0
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:17:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTRGj-0005fi-1K
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:17:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bba04b9df3so52330625ad.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 11:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691518639; x=1692123439; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1ezyGpTPwogAIyEYf04Cvy1wGMxvwq/DdGKXUwa+sQ=;
 b=BnDw/IwFZTiO7PAP/DXqWKYdTm187cw1+j4cbr9IZJdkc8PzrKmM2iF80TJSmAmQfc
 8tpMBVnIrV0jumUESWv0h5XKgsLN8XRbZDb2Dp3Y/AKwviY8l9UiOhnIDfTKXcOiX3YR
 3NrRjVz7k8nMyy4JMkYWyFKcQV4AoY4dLW5kKF2y0VWHSauUc9FbvXmWq9Sps7RbHwhC
 Zwit5k47dmSjH/iJhzc5+/KrxuryvWcuZ3gk+xief1akn2HcFDT4hlr9c5Q4YRCdr70J
 9sUEdAdlXg4krqtq2MqEz58BNg6Y/NWyA1hWYqymy8lEYKMcxPQaoMP2VvHhR3wBWJZS
 Y8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691518639; x=1692123439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1ezyGpTPwogAIyEYf04Cvy1wGMxvwq/DdGKXUwa+sQ=;
 b=SRh8ICrhWH3uwCXcYMuCgNwsYwE2FFM2mafqDpFJV41+1U3QKuqbsjRtUJUkw3Z8wC
 8tXNpLvYFWozr4G38w5p45zK2J1jdeIWmK551z105cp6ev2HeRqfi1qfN7F0GORBRr6C
 IutQIhtNAREsqbE5KMpKXD8kfr9zJmeTUeiCbOmd7BqPmNMkIxp6TfF5cxtHdT+G68q2
 1jHNJxznNopXlocks9o7RjnAnzx7auQ8wkbebJP/ujm8l7N+Rswdn0yUk/S1p5fZR/+/
 0tziB2B8CcldOleS6tEPGAsNZP6Xx/iSeYF+DNj2hojhayBoohuDdhPhdX0Qx1pKGjC+
 3ghg==
X-Gm-Message-State: AOJu0YzyB/0GwUPgxS323U/eBAEOk8Uakvu5lChyTxNwts4u+HiHC2Su
 mgd7DmS5VCU6L0LxtXd7Mfvdqw==
X-Google-Smtp-Source: AGHT+IEfHMob4e3+gLfJC1z27OKPjlyViu8Vx5ZVaPGpCZXAmQCN7T9kBE6YxIydZma6CG2+Jg1TWQ==
X-Received: by 2002:a17:903:120b:b0:1bb:7f71:df43 with SMTP id
 l11-20020a170903120b00b001bb7f71df43mr662012plh.34.1691518639481; 
 Tue, 08 Aug 2023 11:17:19 -0700 (PDT)
Received: from vineet-framework.hq.rivosinc.com ([50.221.140.188])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902b78500b001a5fccab02dsm9337248pls.177.2023.08.08.11.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 11:17:19 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH 2/2] riscv: zicond: make default
Date: Tue,  8 Aug 2023 11:17:15 -0700
Message-Id: <20230808181715.436395-2-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808181715.436395-1-vineetg@rivosinc.com>
References: <20230808181715.436395-1-vineetg@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=vineetg@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Again this helps with better testing and something qemu has been doing
with newer features anyways.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 target/riscv/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 022bd9d01223..e6e28414b223 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -438,6 +438,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     cpu->cfg.ext_xtheadbs = true;
     cpu->cfg.ext_xtheadcmo = true;
     cpu->cfg.ext_xtheadcondmov = true;
+    cpu->cfg.ext_zicond = false;
     cpu->cfg.ext_xtheadfmemidx = true;
     cpu->cfg.ext_xtheadmac = true;
     cpu->cfg.ext_xtheadmemidx = true;
@@ -483,6 +484,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     cpu->cfg.ext_zbc = true;
     cpu->cfg.ext_zbs = true;
     cpu->cfg.ext_XVentanaCondOps = true;
+    cpu->cfg.ext_zicond = false;
 
     cpu->cfg.mvendorid = VEYRON_V1_MVENDORID;
     cpu->cfg.marchid = VEYRON_V1_MARCHID;
@@ -1816,7 +1818,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
-    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, false),
+    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, true),
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
-- 
2.34.1


