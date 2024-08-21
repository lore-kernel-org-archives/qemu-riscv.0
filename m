Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED1C52D7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 21:51:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgtE1-00063K-N4; Wed, 21 Aug 2024 17:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgtE0-0005y4-AB
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 17:50:40 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgtDy-00089N-IJ
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 17:50:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-201f2b7fe0dso1374535ad.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2024 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724277037; x=1724881837;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmHRx8s/W32kMwfWaFprt4Qicp4zWaDvYB7fNr0JPCQ=;
 b=ZaOQ+7sF6c3++T9tZhHk9y2qggLHFQ0iRxZ0KGcMe6hgox6ANg7Xnw0IEQrfjKDUj+
 uNp9p/p66PIJ8V7UpLGdOwhTmYvyuktQwreu2UpOo7Qc0Hdz/Ag0E8holgoQe6LtoVYZ
 G/I3uCKeKW6TpJCsH/X87RVq9K01Uy1l1Rue2tG3ePQVJ3R+DofGh83ias3sEXMVSyV6
 60nw6UOS4WxdYOxhXK8++8ngAvzZVWMEk6moj+fekKc80W83Sj0emYszJC56H2F/OrUn
 MoHo5aipOGiz5jNFKPa0W0POYiuAcQiT86J72eNGaK5966L2yVJW7j7EoXuuJa5I2G6N
 tt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724277037; x=1724881837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmHRx8s/W32kMwfWaFprt4Qicp4zWaDvYB7fNr0JPCQ=;
 b=X2vg1tsh5sNShldboDZfYz7Jf8byefRq4/i2oHGT+pc67HiJ3lwCVT/OETnl+rQKOo
 7xiG5IqtvOYLmWdcTNAe2dCHiZyllb9RJu8reilVOgdevIgDBoaFxteB3tIfODa2rHIl
 mjYoyr/G2mFOrfG9O3PoKVPhd0eNSrLC/DXjt2xy3VXIed8mIRGPxjXoWAGIC4QCytbM
 YY+7trP2PS0nKJqX8h2eyaHK6lSkx2DQ90cJhmzuReXhWWQ0QM1JxC+YlMdh6jJlBTGJ
 BYjoTSqIUrSv0GjT6/QXswREVY5JpYCB03v8BNmRbGdy6XH8NWd5ns31KGOWr9qLFcMM
 S+GA==
X-Gm-Message-State: AOJu0Yw37oNJGWUTkggbGbeD3jqwtvPMDt1lnaeVzqojWc/fWVPCbmq2
 /pzA6IOKJf4IH6x9wL9r5SbaIkskfgeAb1REf/ybHFMSp+vYck2ni4xgjFJlE83egqmVhrkg4lY
 t
X-Google-Smtp-Source: AGHT+IFWhjuNZaWbfv4X8Tqlgl5jnlu728pFahqpqkuR3K2ZHW2AZzY/ENX9v5wundRxSxg99aZx4Q==
X-Received: by 2002:a17:903:1c6:b0:202:47d3:c48b with SMTP id
 d9443c01a7336-20367c08ea6mr38383665ad.15.1724277037042; 
 Wed, 21 Aug 2024 14:50:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203859ef0fdsm586345ad.248.2024.08.21.14.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 14:50:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 14/16] target/riscv: compressed encodings for sspush and
 sspopchk
Date: Wed, 21 Aug 2024 14:50:12 -0700
Message-ID: <20240821215014.3859190-15-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240821215014.3859190-1-debug@rivosinc.com>
References: <20240821215014.3859190-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

sspush/sspopchk have compressed encodings carved out of zcmops.
compressed sspush is designated as c.mop.1 while compressed sspopchk
is designated as c.mop.5.

Note that c.sspush x1 exists while c.sspush x5 doesn't. Similarly
c.sspopchk x5 exists while c.sspopchk x1 doesn't.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
---
 target/riscv/insn16.decode | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 3953bcf82d..bf893d1c2e 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -140,6 +140,10 @@ sw                110  ... ... .. ... 00 @cs_w
 addi              000 .  .....  ..... 01 @ci
 addi              010 .  .....  ..... 01 @c_li
 {
+  # c.sspush x1 carving out of zcmops
+  sspush          011 0  00001  00000 01 &r2_s rs2=1 rs1=0
+  # c.sspopchk x5 carving out of zcmops
+  sspopchk        011 0  00101  00000 01 &r2 rs1=5 rd=0
   c_mop_n         011 0 0 n:3 1 00000 01
   illegal         011 0  -----  00000 01 # c.addi16sp and c.lui, RES nzimm=0
   addi            011 .  00010  ..... 01 @c_addi16sp
-- 
2.44.0


