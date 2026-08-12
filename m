Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37375C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:32:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUk-0007YF-70; Wed, 12 Aug 2026 18:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUd-0007PI-D2
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:15 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUZ-00013q-Mj
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:15 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c9ef3e1337fso1232060a12.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573930; x=1787178730; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xZTZ3SMGGtAhA08SxsP6xVgL8SbI8jjqGJtj9PFCoGY=;
 b=kJWFwluexyHNQx4FRParQBJE95z2t6TXXb+taBYdS1pcjaadE5kh7a5Kfxoojv7FBV
 /PoeGVtqVlzjz6Wm+DRuvw6vxyQF2gmh6/BTd6qBEixFRCi47Cud4xcuad1yHnPJyvSA
 JylgmiisfQBIgtSR54hrTaS8lOJFiY312aJmYc3cQpy7GvldxSMXZHZM/ogKK1KHxNuj
 bNSCodI0mPxG0MWrDkUzewj+hV+xzR7s7DZRLYqRuNBUNntH7DWqSt7YJ57/FqQM0AlM
 cBTkuZVjzhTd9+X0YYI8LIziLK3ts9bmYJrIWouF754cEL2hSv+6IR5pzxXLNrq/5WuC
 MTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573930; x=1787178730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xZTZ3SMGGtAhA08SxsP6xVgL8SbI8jjqGJtj9PFCoGY=;
 b=a3eHipZBuf8rOmP8s6cj0qSQr1u4WP+cIswUQ2q5CSfu0tGD6UTdlxA0KN3OWLdoiD
 tzIonYjUy7sGZXm0Nub/up3b1LUT5oJdr5KOpeGX+Lwzo0MZbyY4GPQJw7zkWpM+QTkF
 AvHQAblyx94FUKunOPtr+/ROjUrQYEJKo/MzNUUsblkSj1OP+0Jy1KhcpKBHhfklkVz4
 L+ZrIGcpsAxs1u9HgoDW79LgsauMfLtpNH8X6zcK1FpVBIx35QDrSgwuEq+SDFfFM7Rs
 3G6n/86Y+F/YaiPYvjd9yP7N0nooZ4/HXVPfZN/Rr8nabMMQ7qQi5nXNVa4cFjZM6FtO
 eSHA==
X-Gm-Message-State: AOJu0YxTXZQzn4nmSPIjC4z5MLn1y0GDV6mhcd8TtOnxfGdSppvfFocc
 JLgy93dF37A2Z35lR1ijKpJfaAyYy33mU44JxX4MHDyA9XcsWhAN+mrszVy9yLZnz+4=
X-Gm-Gg: AR+sD12AzyQSA/t/kVPz4E0Um0/2IuOsVOICDwfEDzz2OWk8whDRKCelP26c6ufTj3Z
 keBlkqlwgyRyaQe264tsqcCgachgIRSce5R9lm2ccH4uGcwYdKoEkZrN4fNRUrCUJNp5V/6KXe4
 4gTWIrrDdwu9wMVvI4Vu2LDBLRQ9o9t+TselkZBGkNGbU8qgxasoFlT+aocwGAOjSj6Nrpn5rBl
 Uk2aPpCG9JLdR9k/UuiITv7XwBVPawKMez1ZT6WhQKNr5BTZZ0u2kuGUS3aAuCuMHloxtk+sepb
 EWaRBALUi5+RxBQaGNJSRtg+nXXA1J/aMfDK7hGg4WVwREdjTKSDIrycN9ZYNn3j2DBPghw1j/6
 LPgt1VXCSrAKIDiduVbOCivduE1W7Ya23CzTWLmlXFPf8Wa5TwtavV4JCOgdrMI+8Dytm3zj1sk
 HmwIq+zPdIzMDRM9Go+l0tLSQ5simfhmtffjE8Uf+nRDPJUMmpQrSQo9V8iwCJry1F0UHqjZ5ZR
 yA9NcbzBfHETkdOJzAY
X-Received: by 2002:a05:6a21:1f81:b0:3c3:704d:57c4 with SMTP id
 adf61e73a8af0-3cc55100aa6mr2362797637.12.1786573930229; 
 Wed, 12 Aug 2026 15:32:10 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 26/52] disas/riscv: Allow decode_inst_lift_pseudo to loop
Date: Wed, 12 Aug 2026 15:31:16 -0700
Message-ID: <20260812223142.349142-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Allow pseudo expansion to proceed in multiple steps.
Assert that we don't have simple loops.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index fe503b6cae..b8e5b124a5 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5259,9 +5259,9 @@ static const rv_opcode_data *decode_inst_lift_pseudo(rv_decode *dec,
     if (comp_data) {
         while (comp_data->constraints) {
             if (check_constraints(dec, comp_data->constraints)) {
-                dec->op = comp_data->op;
-                op = &dec->opcode_data[dec->op];
-                break;
+                const rv_opcode_data *new_op = &dec->opcode_data[comp_data->op];
+                assert(new_op != op);
+                return decode_inst_lift_pseudo(dec, new_op);
             }
             comp_data++;
         }
-- 
2.43.0


