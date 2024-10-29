Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADCED5B16F
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 08:54:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t5hzF-0005Ma-4t; Tue, 29 Oct 2024 04:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1t5hzC-0005LS-0k
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2024 04:53:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1t5hzA-0000ZA-FY
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2024 04:53:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20cbcd71012so54889575ad.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Oct 2024 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1730192034; x=1730796834; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QleYexr9+tm5N5SA4HTO2UkzwktUaJf0v24qt9fMIW8=;
 b=fJRalSfX1UZ87iydapoZly7xBTYy1M1Dtpv92O11TD2qGsdWfNWLWztzWsuwHDF7Dx
 zdktlJs+vZB1UUMQs0ccF8BRF9dhcQ+GnuwaX/QLOdomxGe4YECYuWuHfRYHBOvDEwUG
 DPtyY1M2SzCulIs+2eFNbM8yyie+VCu4f7YWXOyghUl6UF2rYJZ5ymJpAv3FOdIWTv7A
 2K5OrG6iJ6jJB3pt8Ll/o5inAXE0oBM4A0PtlUZAAgQ00Sw4KiHHGxrYSuF8aIYjiSBb
 Foo67/sNtwb/TRhAgDerrRA9MXtfAuyOmKxOjQrq+ahPfd5oGdL4BNDW0PC2J+S9G9RZ
 +aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730192034; x=1730796834;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QleYexr9+tm5N5SA4HTO2UkzwktUaJf0v24qt9fMIW8=;
 b=LQkaQVHOxyVYbpTxNkMn7bfbwWNQxNpeR51x+tnFlvWKBcaQABGTSCijFrW2SdcyPx
 1E/EcaG1+e4DDAdsoV9fsE0yQjcHVwoRiVQVtMZNKvJPq4+DayK8X41fSDpiMP8lDuyy
 e3jqw40r4+qmFJTygL1yNX3I2odoSmQ/DbQr/4KQciYtlb8nGg0yBeIyXaGXVETiouXG
 jga4YpMUh52Rhq2RGR1CGVzBRief3j0sVEEcmPfGqNb1YMk5MZzIjldHt0k3eWah/CTC
 aLka7Z+RBx0T5cm8V5LM56jgHgNLPWnc+k15Sca51xzwxVUzmxIl9Szq14MPMqk04y5w
 lKzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeAvYR56FJ8Zmro4qr5eatiJ1uG4EMoQXho28H8FYQBa+2y2ZKEDeINQozF1YjzyNdAWcEW7Y+tIAH@nongnu.org
X-Gm-Message-State: AOJu0YxGM4cDhNidk5jZZIXUTUB+FlnPqUSZ1JdTh+kQdG4757ilwyf9
 cPq9tqH7Zx8rsbV6lM33OxhYd7acviurXuDCpXccY76QYQBtzCBNi1thA+16yJrrjvAiihDMDdG
 2YrM=
X-Google-Smtp-Source: AGHT+IH3EicZQRzCcIvKA0rU2PmLB+if3q4tB9zgSXXKMlnEHz5yb8hMSoP+Mrtoemgt6vyTKzKF0Q==
X-Received: by 2002:a05:6a20:5512:b0:1d9:c5de:9089 with SMTP id
 adf61e73a8af0-1d9c5de9213mr6907544637.5.1730192034410; 
 Tue, 29 Oct 2024 01:53:54 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a3cf5asm7070760b3a.201.2024.10.29.01.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 01:53:54 -0700 (PDT)
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
Subject: [PATCH v2 1/1] hw/intc/riscv_aplic: Fix APLIC in_clrip and clripnum
 write emulation
Date: Tue, 29 Oct 2024 16:53:47 +0800
Message-Id: <20241029085349.30412-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62f.google.com
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

"If the source mode is Level1 or Level0 and the interrupt domain
is configured in MSI delivery mode (domaincfg.DM = 1):
The pending bit is cleared whenever the rectified input value is
low, when the interrupt is forwarded by MSI, or by a relevant
write to an in_clrip register or to clripnum."

Update the riscv_aplic_set_pending() to match the spec.

Fixes: bf31cf06eb ("hw/intc/riscv_aplic: Fix setipnum_le write emulation for APLIC MSI-mode")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
v2:
- add fixes tag (Daniel)
- follow the suggestion from https://lore.kernel.org/kvm/CAAhSdy3NmwbHY9Qef9LUeXfr0iE7wC-u0d_fHzC47PXk-MzmRg@mail.gmail.com/
  (Anup)
---
 hw/intc/riscv_aplic.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 4a262c82f078..74c82a841101 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -248,9 +248,12 @@ static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
 
     if ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
         (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)) {
-        if (!aplic->msimode || (aplic->msimode && !pending)) {
+        if (!aplic->msimode) {
             return;
         }
+        if (aplic->msimode && !pending) {
+            goto noskip_write_pending;
+        }
         if ((aplic->state[irq] & APLIC_ISTATE_INPUT) &&
             (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)) {
             return;
@@ -261,6 +264,7 @@ static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
         }
     }
 
+noskip_write_pending:
     riscv_aplic_set_pending_raw(aplic, irq, pending);
 }
 
-- 
2.17.1


