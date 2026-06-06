Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1F5CD8C8E
	for <qemu-riscv@archiver.kernel.org>; Sat,  6 Jun 2026 15:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVt07-0002Vi-NG; Sat, 06 Jun 2026 11:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imaginos32@gmail.com>)
 id 1wVsQy-0006i4-6I
 for qemu-riscv@nongnu.org; Sat, 06 Jun 2026 10:55:36 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imaginos32@gmail.com>)
 id 1wVsQw-0006GD-IJ
 for qemu-riscv@nongnu.org; Sat, 06 Jun 2026 10:55:35 -0400
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so1555473f8f.1
 for <qemu-riscv@nongnu.org>; Sat, 06 Jun 2026 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780757732; x=1781362532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t+vh47h2j5TUhdoXhtY9T38Sxkplcpxvt5wmDbF7qkM=;
 b=RgJ2+y4sjZ/MCOOcHNNuYkfYrf8qV5d9wCzDO4A4KQ3pZAWAOeyAWmBSoHjr8CPZeh
 YOz27rPp4w+Ls1YHALvULZNbSzu7h0rGw25N6kyEBrkiTFB3IILi4hI/yUklEy9uvOwG
 UrESyyH9PHOa0E8FxY4Ya4lnFZkcc+Y1aUfJXB3S6OPpFATGv889HDNYvc6bCGshYNWS
 CUlkCCRVWxMTy+b/gNwAnL53oYvYwxE4LyLreQZnDk9OG4KO69OtzdMvqhy59dUObLWa
 JPhnxn8RbGHGl3NEClHM8NfZayc2wq6GaAwYw+7JilvDEl2KwaiYaq+EIazbblabiKHv
 5nTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780757732; x=1781362532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+vh47h2j5TUhdoXhtY9T38Sxkplcpxvt5wmDbF7qkM=;
 b=XYppi0vwX0LS4s5PEALC8RehQNLjf5JR+kiiM+n6Q/hiyF1Uo48Y7xkhvTjMgP3Noc
 R2E4XH/LIEo+a2sT6OHhkGBfNJLvegqkvpxPTzgG0++M1P26HVy8r1NUUDI3qFR7AQN9
 GDw0+Jf37J9Px+w02KZaU1MQMuXthtztb/I7+w3sp7OMQEBXQ6zG4h/l3EFPl785lHRG
 R0QIW4vS66MJTGc5towJBhUEPjHa1ejpVmDR/debNo4kI9IGYyTnGGqyWNdfGeZw2AxK
 DkO+l6ogzJvdkPd8HbS5l9uz65CjThghXzwFHjBnKsj3wihftg/U9g3Rp1+9gAV0oPJx
 dXVQ==
X-Gm-Message-State: AOJu0YwTAJLrH6hiwId3nD6cH8u1g4OLGdBGfN15N3In/plqRo4aTOCw
 gpFbBzHVoydYu8Ij5JuZqGCCIV+B1rKTDKRssj/XsK9xuRc1oKjblDyN
X-Gm-Gg: Acq92OGQU5Krf0m9OtN8EoBOqPxVLtwxSJq7jhf/BtXU1qXrKDBMcy/gtG7m5y11wwB
 P/B9x6XJrGRTARg/49b7jQF//j2gkWBScFAK1Wmv80S4z8wjFaveTPN9ZBHHkmif2vQZetkxHnt
 ZXcnJ+94uwMgrI8io4SfTFPVhAXfnPG6tJXlzuf2B2exKKA2j1SHHVmQMEtEirqr6NmajKoXsbw
 5fTBAL9SUdDTKA1FQxk/miNaS5oot3Js7mCvWhDTFqVzAX1sb6Wgl2IpBzqLFMPHTTjmZeOyZml
 jcFqA5q++NHamJ1ytYbPevYJYD53ZzF0AJnxXhQLZKd9dAqPwlJn6ma7L6mvm9Sk1QLFoCecb49
 XGHx4Xe5HAs5RDup3gmcKNZ/qiWZk2r9NNf0TAArtb3wb2Z26z+VXBRo5bhFTZ22QHzzrNg5RoI
 Fldqmh1Gx11iXipJ75F2KM8pwDvVPB4PLqHlJ6y2waiTK6Xhmj+AUvqNCP5dxRU8+c/Z/0j0XU9
 hIuUg==
X-Received: by 2002:a05:6000:1288:b0:45e:ed7e:f8f8 with SMTP id
 ffacd0b85a97d-460304f07b8mr9544113f8f.8.1780757731835; 
 Sat, 06 Jun 2026 07:55:31 -0700 (PDT)
Received: from user-Legion-Pro-5-16ARX8..
 (cable-94-189-161-174.dynamic.sbb.rs. [94.189.161.174])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344148sm34437871f8f.19.2026.06.06.07.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 07:55:31 -0700 (PDT)
From: imaginos <imaginos32@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 imaginos <imaginos32@gmail.com>
Subject: [PATCH] disas/riscv: enable `mnret` disassembly
Date: Sat,  6 Jun 2026 16:55:20 +0200
Message-ID: <20260606145520.34152-1-imaginos32@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=imaginos32@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 06 Jun 2026 11:31:46 -0400
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

The translator has supported mnret since commit 3157a553ec6b9a
("target/riscv: Add Smrnmi mnret instruction"), but the
disassembler still renders it as illegal. Add it unguarded,
since the encoding does not overlap any other extension.

Signed-off-by: imaginos <imaginos32@gmail.com>
---
 disas/riscv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index d416a4d6b3..065985992b 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -985,6 +985,7 @@ typedef enum {
     rv_op_ssamoswap_d = 953,
     rv_op_c_sspush = 954,
     rv_op_c_sspopchk = 955,
+    rv_op_mnret = 956,
 } rv_op;
 
 /* register names */
@@ -2255,6 +2256,7 @@ const rv_opcode_data rvi_opcode_data[] = {
       rv_op_sspush, 0 },
     { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, NULL, rv_op_sspopchk,
       rv_op_sspopchk, 0 },
+    { "mnret", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -4050,6 +4052,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 64: op = rv_op_mret; break;
                     }
                     break;
+                case 1792:
+                    switch ((inst >> 15) & 0b1111111111) {
+                    case 64: op = rv_op_mnret; break;
+                    }
+                    break;
                 case 1952:
                     switch ((inst >> 15) & 0b1111111111) {
                     case 576: op = rv_op_dret; break;
-- 
2.43.0


