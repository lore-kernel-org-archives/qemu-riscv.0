Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A03C10DAA
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 17:37:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8NzD-00006o-7d; Wed, 29 Nov 2023 12:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1r8NzB-0008UF-6F
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 12:04:29 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1r8Nz2-0002xM-4x
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 12:04:28 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cfb83211b9so37238225ad.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Nov 2023 09:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1701277459; x=1701882259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJELkFuyfQDdSzTxppnb6dbBJrlb+WrSMBGUjwM60Kk=;
 b=BBjqnS1wOQLIg5ryETwt0TqyfjDLKgMzQfRwEMnauf+6o9yLKXvSl8UvsWDGuNtONC
 cG8HFbAJto53VRX5Nwh7VuO7JkFT+Nq3MAu7Z1vgFjiN/55IxsLxBfWVW9FtaAQc2Oan
 +tZ1oI5RfL2PwnrYAaBcGGey5h/iI/xuL32FyujCelkq9TCtxiw2rjnGrC+y3RTkGw3p
 ZTGkDgPonp/xuKyMFlFfpLcnb1X4nqGZZZc+Cj166GqRyIEVhhzRynR0KWzlJvtfT3D4
 oOJIqTno//hlsEiatamxa8JkkIWg2pGlFVvA2cmAz7youo8BJnGnzoGuxWQT5zJRXvgS
 vMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701277459; x=1701882259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJELkFuyfQDdSzTxppnb6dbBJrlb+WrSMBGUjwM60Kk=;
 b=swOEyxeLqI9be9hUEFL2taK/1DGFp9bs0Px1sok8yEJMOPsSvDyI/Ov+2dowD/3pjc
 +Mw+p/xWzN8jzbfToGaRJe/0EMgLlgkEtiO1voZNpSkQNG8G+Y19VDeByx9CZpyFA4iL
 o08nH7lWDZ5203ntAKThQ24Nwuz/6EiJsHtHCUcas9EcMOHfZDHEltp/4xdv2L98KNvH
 9V2rsHCqBw7oFkIO/HQTAy4O9JD5xI5ph77vHW9hLVCDFaWFBDUNCUD51XDYGkh2Uf0d
 1OfFPqBDsCgYjZ4Gkj2IboQRSX0kaETtz1sm2DK16/X2S1uZHwhpwA1Jo9t553nZhKq8
 +Kug==
X-Gm-Message-State: AOJu0YxlMUXuhz1spDaPj3Zcm7v9Akvo/fT8boU8TlnNpe825Iscj0OH
 OYBqmqHgMFbdkFW6RHO8NuXuPg==
X-Google-Smtp-Source: AGHT+IGtISLNSYYlQnB2orEKvH+favtu3lmmMQSVNmGmJS4HhYsduK6E2/cKOIBHJd9Xz0i1f9bKQg==
X-Received: by 2002:a17:902:db0d:b0:1cf:cc0d:9600 with SMTP id
 m13-20020a170902db0d00b001cfcc0d9600mr12603628plx.24.1701277458610; 
 Wed, 29 Nov 2023 09:04:18 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 p5-20020a170902eac500b001cfc6838e30sm6921383pld.308.2023.11.29.09.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:04:18 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH 1/2] target/riscv: Add vill check for whole vector register
 move instructions
Date: Thu, 30 Nov 2023 01:03:57 +0800
Message-Id: <20231129170400.21251-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129170400.21251-1-max.chou@sifive.com>
References: <20231129170400.21251-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The ratified version of RISC-V V spec section 16.6 says that
`The instructions operate as if EEW=SEW`.

So the whole vector register move instructions depend on the vtype
register that means the whole vector register move instructions should
raise an illegal-instruction exception when vtype.vill=1.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 78bd363310d..114ad87397f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3631,13 +3631,14 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
 }
 
 /*
- * Whole Vector Register Move Instructions ignore vtype and vl setting.
- * Thus, we don't need to check vill bit. (Section 16.6)
+ * Whole Vector Register Move Instructions depend on vtype register(vsew).
+ * Thus, we need to check vill bit. (Section 16.6)
  */
 #define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
 static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
 {                                                                       \
     if (require_rvv(s) &&                                               \
+        vext_check_isa_ill(s) &&                                        \
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
         uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
-- 
2.34.1


