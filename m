Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3A1C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfb4-0005hI-R6; Wed, 25 Oct 2023 11:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfb1-0005g1-GK
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfaz-0003jn-Ua
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:59 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b1e46ca282so5804035b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246896; x=1698851696; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhhXgiA9ijhkCgdvzjre6qvwHLpR2uYfFwrcGxeZDYQ=;
 b=VWiGMRY30NpX/hpUYkjmdKHSVLs1RPQicPWVqRiXi9hfK+fGEcsbD9x4WRE7b9Rq8k
 0UOEIetR1h1xIDDGlTOvCLwClUKu9tGCxFZ4qQu1p6uMEx8uy7RSdFhOtBCCOhnXweFP
 wXojnWMyFqp/KdghI8BJvqa7IxZWJ1dmGMPk/wtX6RSJ/rcGtMARsh19xEf8Mxye0I+U
 OeMXI/PqKFJgCOAXnP3OkXdFaW+q1ov+e6gawjT6HPUZJkqtqMcc6yhA6EdY5+AO+31H
 NXD2nYeJH9EAxJJrQUOZNWQ1jOr5ugHOUv4S0FmgO0YRfuUsLSrSMFkv4xBjcZdkmkaZ
 dVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246896; x=1698851696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhhXgiA9ijhkCgdvzjre6qvwHLpR2uYfFwrcGxeZDYQ=;
 b=IPMt/1jNMTZu6bXsXrtPuI8dSpClanrOdfGZVrOIZeho30z2Et2coDERLFyGAEeQrI
 DP6xXQq7ZEIXjaQOq2haItU7D7D4N0U7Enhehx+A6uzSIgbxzUWg630KoM6l15LZLgpX
 xUoZ7AuMiL3Dt1bhrtBiGy79oNLvqSuGrsNdjZKd7m822xHY3HmsDFA2ggIXEIn3ze0D
 wCZfzwSX47fDiMZM+FkJ/cFGDVwXo+DHwLoyzSyUL0zB8XoYpAxgMNwYxctqxVT35EpO
 595nifDcrKsIsIjvNCmrmwulOUfoT8rfVLKad/yZFv9wdJL/nr8QjpikMbhAJsm39456
 +OeA==
X-Gm-Message-State: AOJu0Ywd/GJQCAVAEUmb9RIzyBswYdz2/2X2kkmyuPGnpoqaIC+TcKqB
 k5OUp6i0CxYD+L8fk5y2VYRAPg==
X-Google-Smtp-Source: AGHT+IHiNV7l5886K5RJyRZEx4y7KbRDZ5rGOL52oOvaLUaI2tL1RGQ9R2mahd0i/u63Orc5IXa8IA==
X-Received: by 2002:a05:6a00:2e97:b0:692:a727:1fdd with SMTP id
 fd23-20020a056a002e9700b00692a7271fddmr18972961pfb.4.1698246896595; 
 Wed, 25 Oct 2023 08:14:56 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:56 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 12/14] disas/riscv: Add rv_codec_vror_vi for vror.vi
Date: Wed, 25 Oct 2023 23:13:36 +0800
Message-Id: <20231025151341.725477-13-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x431.google.com
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

Add rv_codec_vror_vi for the vector crypto instruction - vror.vi.
The rotate amount of vror.vi is defined by combining seperated bits.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv.c | 11 +++++++++++
 disas/riscv.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index 8e89e1d1157..6d60033abab 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4011,6 +4011,12 @@ static uint32_t operand_vzimm10(rv_inst inst)
     return (inst << 34) >> 54;
 }
 
+static uint32_t operand_vzimm6(rv_inst inst)
+{
+    return ((inst << 37) >> 63) << 5 |
+        ((inst << 44) >> 59);
+}
+
 static uint32_t operand_bs(rv_inst inst)
 {
     return (inst << 32) >> 62;
@@ -4393,6 +4399,11 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         dec->imm = operand_vimm(inst);
         dec->vm = operand_vm(inst);
         break;
+    case rv_codec_vror_vi:
+        dec->rd = operand_rd(inst);
+        dec->rs2 = operand_rs2(inst);
+        dec->imm = operand_vzimm6(inst);
+        break;
     case rv_codec_vsetvli:
         dec->rd = operand_rd(inst);
         dec->rs1 = operand_rs1(inst);
diff --git a/disas/riscv.h b/disas/riscv.h
index b242d73b25e..19e5ed2ce63 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -152,6 +152,7 @@ typedef enum {
     rv_codec_v_i,
     rv_codec_vsetvli,
     rv_codec_vsetivli,
+    rv_codec_vror_vi,
     rv_codec_zcb_ext,
     rv_codec_zcb_mul,
     rv_codec_zcb_lb,
-- 
2.34.1


