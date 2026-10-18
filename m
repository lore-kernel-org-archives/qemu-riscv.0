Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE5CCF2C9
	for <qemu-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 14:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIRam-0005ln-Cr; Sun, 18 Oct 2026 10:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRal-0005lT-0Z
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:27 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRah-0004z6-Tt
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cc751eddf25so696172a12.3
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792332622; x=1792937422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K0UGJW5Rv06EbtkyisWOX7L9CvnlmTwxonH0Dbtr3Pk=;
 b=EW0pKmN1iaL3/j3Eqrii+++eAn6tojJr5XbM50n3njxnv3vef0U7difU4DMUtSARAR
 KV9TB9AUmCiH3ttFisxm1Umo6o+3OcLcWM0ectYVwPiivMhlvH7GLbWyVJf36NX7ZhwA
 iG6YI0ZOxkoIPMCgAtTrWYSrtDz39d5n+3KqQVtWxYa6C9Yg/qsnS9Ofkyl12mq83o9u
 HQRSWwK8R5lKi8L0FF7sbhnVaC1U/XkcDE1RlWSLuXwSttn0Rk5TCHpATHCisG9oGxC+
 1KuXMqasM+vZRqIcWVj9uhQ8WurkcgKaPGLNjgiIcD90//ybXMRBwnJjZtV6Fy76NKgJ
 98zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792332622; x=1792937422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K0UGJW5Rv06EbtkyisWOX7L9CvnlmTwxonH0Dbtr3Pk=;
 b=UnX3scklg++BpaCpusx6jE5pA7H8dv9TitpTTWqqNz7Bg8XquCcwl8MQCOkypIok+4
 AyE1jmQOtnlAro+W1d+NWONHiQ7GbGYZCNaeHfkQ2iL9UmLbHFvfq1MsTi00Kljf0KZo
 VF0m0V+kYupWOY8ItrlS4jyEFG374VEoZrdDVKO50qwOChTe/7Bpu2gL5E7hlp7IfkaU
 dr/lyAYfhIFKm5/8CIowEfUSSwzC3pqpW7yBON/V7sBcwJ7FO5vh2aLJzGVpn26rsP0s
 9OKFAWijrzUXmIpVVn+4u+YYbV9Q7SQrfx0TYwpplq+e+GjQbs8a3Q3IAJMmCSzIqmxh
 Ui+Q==
X-Gm-Message-State: AFq9FYI4N3BDtlpTSQS/hc2KLwQmmmRuAsT1hrBG7SwemK4HGgyaWQAV
 7Gqc+sdMcH6tQrDPEz/v2z1osfxLRbf9Xobl0tQ/gTSOzF8XMeHIZ7tR
X-Gm-Gg: AYBFou0Dp42FDDqcX2LdEUg8MXH+dps9rqMeR48jo7tI+yiWPYuCk8Pvdc+mUObaYmo
 kLtrTIrSqu9vwT8v8JKaS7pR0DOHW35IFaH6FI2mxE2+z1b0hgeQg07tnMHgjZWwitCivFeEN4x
 OIlmbzMUeQiuwS/Lm4o9rjetL39QVksR7aCJsegb3mu94WxwMWiLlGHkOnCD1GCeGphfS6CvL0X
 RV5IoodIn9VMHqC31Qa8hthXNmV3FYCdaWEGElEBKyCK/3v68LleWo0x5j26h8FTKPPJIoacYly
 UXwqM1REGzBVO2jQbZCZrtD2Vm49fayikIOvyO55lqk/OU88rY9n05r8v8Y2tx0dRPjNHCUKB10
 nT7eD0ATsXVGhMJferwRGmlBLADpnGbAIDwD6PHPgmgqXSxwH5JdZLqPMvAawule/0+mJNdOrJJ
 ozwaa3qdL6mfZjmirUgU2a4VD/l9M1CXWd3gDMRKqXkLiO8JQWTjU1um9qosrGw/8vW43L/zomQ
 cpEM3jQRrs83oTReQ==
X-Received: by 2002:a05:6a21:4683:b0:3dd:a196:53a7 with SMTP id
 adf61e73a8af0-3e22614121emr3900144637.73.1792332622184; 
 Sun, 18 Oct 2026 07:10:22 -0700 (PDT)
Received: from dt-VM.localdomain ([101.204.150.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-89f57653ea9sm2949430b3a.32.2026.10.18.07.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 07:10:21 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 1/5] hw/misc: fix calculating output address overflow in
 k230_decomp_gzip
Date: Sun, 18 Oct 2026 22:10:02 +0800
Message-ID: <20261018141006.16398-2-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018141006.16398-1-dingtao0430@163.com>
References: <20261018141006.16398-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use hwaddr for address calculations to avoid 32-bit overflow.

Resolves: Coverity CID 1685515

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/misc/k230_decomp_gzip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
index 0d8a3b2d2e..ac06cc1571 100644
--- a/hw/misc/k230_decomp_gzip.c
+++ b/hw/misc/k230_decomp_gzip.c
@@ -53,7 +53,7 @@ static bool k230_decomp_gzip_write_mem(K230DecompGzipState *s, hwaddr addr,
 static hwaddr k230_decomp_gzip_output_addr(K230DecompGzipState *s)
 {
     return K230_DECOMP_GZIP_SRAM_OUT_BASE +
-           s->output.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
+           (hwaddr) s->output.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
            s->output.current_offset;
 }
 
-- 
2.43.0


