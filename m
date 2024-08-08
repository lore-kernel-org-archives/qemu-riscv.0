Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D9AC52D73
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 08:20:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbyOA-0000fG-By; Thu, 08 Aug 2024 04:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1sbyO1-0000Tx-0y
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2024 04:20:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1sbyNy-0003RN-Cp
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2024 04:20:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70d2b921cdfso643944b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2024 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1723105235; x=1723710035; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDwrixA2VZsf0eAm49U3iTnA1xs631kK+Kr8s2nrlQk=;
 b=UuiaBZKezt3w2Z7ByZSIaCN8vQl57ro9Nf5VWRalPcq83TiEh+pLGBzQ0l0yYs0g+O
 FdhxeSa5VpY4Ofb7wgIl0INnJDOH+96rS6HI+0SQlJszTQ0VZF2GcVKGbaeNyvUFG7ci
 DC/WBhzK75CZxfKrjzpVK7nLvIaPUp4ie7la+3lPvJyKcUqYHjy8tRQRRpqquD9wD6ms
 xYx4cES5Gj4e87tQ/RS/IxHQFVgAG73WEZz4b3jJACDUXsD3pra4Kd8D2TN/fMqEGqjM
 Et7dQ0DRCibF5/RDKbhrT7I8kvAcRxHRXw9+BEHF1pu1VvtUN25gscoMX56WbqU9aGWe
 qgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723105235; x=1723710035;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aDwrixA2VZsf0eAm49U3iTnA1xs631kK+Kr8s2nrlQk=;
 b=amTe+RnIlkuu6TKUMYPDqQBSiDzcLRWy6NuOHSElX50BskdXjmjNoeNkAdho8pr+jq
 UfHpKG/U93z6vB8U9+zV6VCIBj2PckSN7X4ZYxde+uczbXILiKI7WHlyydBqo4D1BVsm
 t43GpmCIkC/DALAtaSUJVlwf6Uura16i7TlwcoSx+0KHMU0qbiuNBtOpBL3JBEf83/Q6
 xglhMhO3ehKnn3JB83F0/ZkeLSS4Nt1xLyGiIQQwiJhxCwjPUt59mH6h50yyEtD/jArG
 LZuxUW2kMVHz9cqgpvSOMOGISkRO4tEQAnF+Jmh7tWNtSU7RbkxtK6koYuKNoviibVT5
 hLCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzuwz/2HfX2l0PkDSgS1rFMnDOZoMe5JzAFg9bBInQ6jgw2zr9Ww9OPPvSCXujBWRmdJzfiuEKWO4vjXZylEAmIhfmfL8=
X-Gm-Message-State: AOJu0YzdVaGtUUJ4FhY3C0bpDEyt6cOOYZag2SqLic63kBstLGlr8lxx
 0/lOszKvQNF2XfAESHe8mOmV0C5k7FlV1btVVzD9Xy/F/0MeVr544Lss15lm0Mw=
X-Google-Smtp-Source: AGHT+IFpf4nUBJEceX4L66/eE6lNdxjUXB2lYRo4dcHvZfHTuqcnt5vt+cPnXgxY5JrbYq5kG+PLeQ==
X-Received: by 2002:a05:6a00:390c:b0:710:4d08:e094 with SMTP id
 d2e1a72fcca58-710cad31263mr1572156b3a.2.1723105234605; 
 Thu, 08 Aug 2024 01:20:34 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb084cd4sm680144b3a.0.2024.08.08.01.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 01:20:34 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/1] hw/intc/riscv_aplic: Fix APLIC in clrip and clripnum
 write emulation
Date: Thu,  8 Aug 2024 16:20:28 +0800
Message-Id: <20240808082030.25940-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x433.google.com
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

In the section "4.7 Precise effects on interrupt-pending bits"
of the RISC-V AIA specification defines that:

If the source mode is Level1 or Level0 and the interrupt domain
is configured in MSI delivery mode (domaincfg.DM = 1):
The pending bit is cleared whenever the rectified input value is
low, when the interrupt is forwarded by MSI, or by a relevant
write to an in clrip register or to clripnum.

Update the riscv_aplic_set_pending() to match the spec.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 hw/intc/riscv_aplic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index c1748c2d17d1..45d8b4089229 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -247,7 +247,7 @@ static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
 
     if ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
         (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)) {
-        if (!aplic->msimode || (aplic->msimode && !pending)) {
+        if (!aplic->msimode) {
             return;
         }
         if ((aplic->state[irq] & APLIC_ISTATE_INPUT) &&
-- 
2.17.1


