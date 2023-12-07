Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4BFC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:40:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rBGSp-0005zR-3i; Thu, 07 Dec 2023 10:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rBGSn-0005yh-Df
 for qemu-riscv@nongnu.org; Thu, 07 Dec 2023 10:38:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rBGSh-00087v-NO
 for qemu-riscv@nongnu.org; Thu, 07 Dec 2023 10:38:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-333536432e0so989562f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Dec 2023 07:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701963530; x=1702568330;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZw+JUiGsn+h8Ah0eCoapNTG4nn0tiSq/PIPn2r1QhI=;
 b=eNxKexhAaD61RhpV5iX/XKY3+lvwnjsJefRzXZT3QQOD9piw5NcWbuwum5TCP7xT0b
 AMOkKYU8yQcB+cJw+OAvyrwy5+KIBFQyWybqWo613L7+eD7nSmctpxti+FV3QGfXWplC
 6svxbeURx4KT9i4bo475d/xTRUavRxG+qFRxhbq4ZIPiRgeimvTMeFp1Iu5hT/9YJXQJ
 Al7dvQ1QVsCK6apecbzRzUYAJUEJY0xeLP7gQ6KFTowH0pRUUMPWWhr0LdFTeGHqOrsi
 OWOhSrpkNBfaHgOR38chXq1FB6X0hXVmDXmW/zlUcQg4nPiYvbSthbu7I0ZuUJbmHdTg
 df5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701963530; x=1702568330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZw+JUiGsn+h8Ah0eCoapNTG4nn0tiSq/PIPn2r1QhI=;
 b=BTvOwfYyA22Fsxe4eTenCNqEgSFGO+TYFjglYsfU7+0cAkzigffyFpBbgEguLAC15A
 /RxdwycgYp/lEziTg1O79aDNa9QNtuq0f2EQXDTxw+UTgGHi0CZqE6W5UkmKnd8RYJPe
 wY5jUBvfu5/KhhkC/KaGwXg0KU4qKxk7skH3AcnlZCUjopXVwm5rffaWQyQWsAR1iah/
 OtY4yNMDMpNSZcMRDEDPcIBWlqv+QHgOnIAKnr4pki33KNE9vjAlFH69MsCdpfLu9cv5
 TfgjxdVJKgtHnNT+wkjIWXtOY6KxbsmMYsRiX66i7iEUDyEXwUzwmy4BUM8ApNGvHgw7
 CCcA==
X-Gm-Message-State: AOJu0YzltSesLSBbYAhLmD2Zu7PzYpC7nVkwV0wmsqHBkpP6+Ieu7VTd
 td3sryeK3Zn2ZWwWBnRzMtinhw==
X-Google-Smtp-Source: AGHT+IEcWRDde5CeNOytCjA1B141772By2Dy/wAdEiAkT1pYlQr+PtIHoswvHU96QQc/kZI8LqT1ag==
X-Received: by 2002:adf:f10f:0:b0:333:2fd2:6f74 with SMTP id
 r15-20020adff10f000000b003332fd26f74mr1549114wro.126.1701963530345; 
 Thu, 07 Dec 2023 07:38:50 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 b16-20020a5d4b90000000b0033339e03a60sm1711399wrt.59.2023.12.07.07.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 07:38:49 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 2/2] disas/riscv: Add amocas.[w,d,q] instructions
Date: Thu,  7 Dec 2023 15:32:31 +0000
Message-ID: <20231207153842.32401-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207153842.32401-1-rbradford@rivosinc.com>
References: <20231207153842.32401-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 disas/riscv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index e9458e574b..8a546d5ea5 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -903,6 +903,9 @@ typedef enum {
     rv_op_vwsll_vv = 872,
     rv_op_vwsll_vx = 873,
     rv_op_vwsll_vi = 874,
+    rv_op_amocas_w = 875,
+    rv_op_amocas_d = 876,
+    rv_op_amocas_q = 877,
 } rv_op;
 
 /* register names */
@@ -2090,6 +2093,9 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "vwsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
     { "vwsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
     { "vwsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
+    { "amocas.w", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
+    { "amocas.d", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
+    { "amocas.q", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -2841,6 +2847,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 34: op = rv_op_amoxor_w; break;
             case 35: op = rv_op_amoxor_d; break;
             case 36: op = rv_op_amoxor_q; break;
+            case 42: op = rv_op_amocas_w; break;
+            case 43: op = rv_op_amocas_d; break;
+            case 44: op = rv_op_amocas_q; break;
             case 66: op = rv_op_amoor_w; break;
             case 67: op = rv_op_amoor_d; break;
             case 68: op = rv_op_amoor_q; break;
-- 
2.43.0


