Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D4C52D7C
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 00:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgCKo-0002jM-QZ; Mon, 19 Aug 2024 20:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgCKT-00013B-HX
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2024 20:02:30 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgCK8-0001EG-Dk
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2024 20:02:15 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2020ac89cabso26361835ad.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2024 17:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724112111; x=1724716911;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmHRx8s/W32kMwfWaFprt4Qicp4zWaDvYB7fNr0JPCQ=;
 b=M5f3xievXWC9VH5z3IuDc+7cFlaKL/D52LJ+x0U88cvwAkk1so5abqfuvDVJzDZmZp
 rAut+tViCTONvNRSgv+7PrX7+UcluLiIsTlY5y1LTBnfKBPndEBY/1Re/X5pdUCGEqXK
 Jdq4EaydJb+fHj2CYutKycSaD/UmD/dapifcMGWnekKrqri15so2fZmgi+Qk2ZUJsDSq
 ZMVsI+45ys21ihLqoDlN/iHf/iK+1P1UXT6lDzs6odYgJ+oMnhB76Hon/CeJmnoC6VSX
 slkIGAlV0kgOaLyiCsJ9g7szgN1irsUxw75cr5ApgUXb+tSx0pUgjj0akMMxt+aI4Biq
 ryAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724112111; x=1724716911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmHRx8s/W32kMwfWaFprt4Qicp4zWaDvYB7fNr0JPCQ=;
 b=pI8HdQC/2oUAaCqk6Gb2EjzPXPPLOsN7dsoltSGpt7Oqvyu0j4NtPAxfgSZRUnXao0
 SMIBrXeyScXYAGG4nIFkfgfJqk8vpY+di23/wvtmjF0XioInkVVlUR9rQGSY57GIyq/V
 vRxbIqZDcjX1jqfXJlOMMUHD6ksffXfPbB9gpoPAMe6Vq38VyiWGpNPxi18LT96iwnai
 5yMFzb95724kFcNnBdOI+jZA1AEcGJKkPOAKV1rhmAlvTbq1jZIZwLkBDA7b4paRhxez
 PLGf9wvRBjTEUdpdR1lQO0a7Pgy9UI1Ieg/DkhISQNri8KouEW9abC2b0wgNYuY6ONt9
 burA==
X-Gm-Message-State: AOJu0YxYflp9LrLMnHUb42FiUNT/0b5U0am+X31nGr5F2R1dnYGJd47l
 6XLAqcT85UdMT1NdLYanuAkIDYSjGzD7pP6Mf6DKXx2iQ4XcnqWazVDILOYKlc2vY+sUdFNxWqD
 f
X-Google-Smtp-Source: AGHT+IG6lQM2sOdl3vgRqhTvEHzRaaPj1R1M+0OMFOrFtrUSzVVV3hId6tw9iDhX3bUNq4uzommx9w==
X-Received: by 2002:a17:902:eccc:b0:1fd:9b96:32d4 with SMTP id
 d9443c01a7336-20203f3151dmr105698235ad.51.1724112111151; 
 Mon, 19 Aug 2024 17:01:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038a779sm67477445ad.188.2024.08.19.17.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 17:01:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 13/15] target/riscv: compressed encodings for sspush and
 sspopchk
Date: Mon, 19 Aug 2024 17:01:27 -0700
Message-ID: <20240820000129.3522346-14-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240820000129.3522346-1-debug@rivosinc.com>
References: <20240820000129.3522346-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62b.google.com
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


