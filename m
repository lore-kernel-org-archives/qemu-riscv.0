Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90680C4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 21:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOPEx-0004JA-GP; Fri, 12 Jan 2024 16:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEu-0004Ah-E7
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:56 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEr-0001q4-Hg
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:55 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3ed1ca402so63673505ad.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 13:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705095531; x=1705700331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0p3SmsHLRvN+LTqEvYhjCEbpwCqcN1V5pH+zewlQ+oo=;
 b=Arj0JU5uhvGgcIwY/AFeBvCE91l+rWBi0SCppKmxLnWpU2Ryp6dhLaS11re4yiGTux
 OnsohjHwezp4am258n/Xp0FfYg3j8NApq50TvVO6Ym2GsDgqGj8xXA0/NVd/2NT+IaBk
 iAmZ9lHg3/EVbXfpq+mjd7KmbGDlB3EjvBes3EM25RHnIgJi60cRyRyJ0KKG5Cwbgp0P
 kPua2ZMI5H18PWzzYWZ4YNUh7EKOJtJde1EgznSmOMZWJV8d0qk/iMix9OVgUZJi0Ypj
 XvXrsIBPp0bNxMvsvA1TC86EYlQsoaT+pEWO5GYg2vQwM5FkWPGwUSEt3TVQSYPEfStg
 GV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095531; x=1705700331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0p3SmsHLRvN+LTqEvYhjCEbpwCqcN1V5pH+zewlQ+oo=;
 b=oefTGjUH08WBgA0eT6rjMR+2M4G97CABz7/Tk26slHIqWBTC0ZL+3Mbt5j0Yq+GXXJ
 rNEVuOtskfxA0BcEYI0g7uiB+R1Gm5De2ZXXQa2kTtlRwXJbQObzi5B7c/kNlkod71I7
 6cmxJxNTrA94VZVHhG+oQo4wSFkpSAkC+y8Mq6MOhM6NBBfLftZpHH8JsyG7llTWj4h1
 LX9Thh5sGn4Hz7H/KausmzXurfkofKLEAQL+oXF0ByTwOtUuv66QlpFL/wBhJvRq16uY
 /cCWUAUZgd6Vhp5ifjPMSQimCUpbEMVRLUU6a9S/KPqYZaGMYNXarey3onkuDKr4ug3w
 4VWQ==
X-Gm-Message-State: AOJu0Yw6AAZGuA+dpL0Jd9o7fFrMJxA+1PyVHABqcueyLp5P4diUZ3W4
 DY0r54zixM7Uc6ewH8A4ze5IyeYHcaiV979CZTTZUsBmQLmf4w==
X-Google-Smtp-Source: AGHT+IEjwCibi56KRq8hGoVnSC8MY+nvZ6GiT8K143oncAaCxTkb9iUYFy9yt0/eMBqj/VbIN2B6IQ==
X-Received: by 2002:a17:902:9a4c:b0:1d4:638f:4005 with SMTP id
 x12-20020a1709029a4c00b001d4638f4005mr1672779plv.12.1705095531276; 
 Fri, 12 Jan 2024 13:38:51 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 lf8-20020a170902fb4800b001d5b2967d00sm364727plb.290.2024.01.12.13.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:38:50 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 10/13] target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb' in
 MAXSZ()
Date: Fri, 12 Jan 2024 18:38:09 -0300
Message-ID: <20240112213812.173521-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112213812.173521-1-dbarboza@ventanamicro.com>
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

MAXSZ() returns the value in bytes. Now that we have access to vlenb
we don't need to compensate with a '-3' in the scale to use 'vlen'.

MAXSZ() now works as follows:

LMUL  lmul=scale  MAXSZ (vlenb >> -scale)
  1       0       vlenb
  2       1       vlenb << 1
  4       2       vlenb << 2
  8       3       vlenb << 3
1/8      -3       vlenb >> 3
1/4      -2       vlenb >> 2
1/2      -1       vlenb >> 1

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d743675262..804cfd6c7f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1160,12 +1160,11 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, 1, true)
 /*
  * MAXSZ returns the maximum vector size can be operated in bytes,
  * which is used in GVEC IR when vl_eq_vlmax flag is set to true
- * to accerlate vector operation.
+ * to accelerate vector operation.
  */
 static inline uint32_t MAXSZ(DisasContext *s)
 {
-    int scale = s->lmul - 3;
-    return s->cfg_ptr->vlen >> -scale;
+    return s->cfg_ptr->vlenb >> -s->lmul;
 }
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
-- 
2.43.0


