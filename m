Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4460D187F
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HCVfw/nA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgu3-000658-2C; Wed, 04 Nov 2026 14:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgu0-0005uj-IX
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:09 -0500
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgty-0002gB-Gt
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:08 -0500
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-36dbde64409so518200eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821445; x=1794426245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WLBndAX9Hk/SEvKvgjaacaz2TqGp7WomTMiVSCK67EI=;
 b=HCVfw/nAAu7qLqVghq10PWODDbp05vewOwp1FgJJ0M6b491iPydtgmQY7JY1ImYEXV
 +3inggOkw0n+zjvWxlfPczUvmw6CnFW2V/RzLCQvZT2C4amHzKLPk8MBQjnI/F5+Scp+
 Bt/4PE0T1lNuucycr/3GJLNZaJQuILQT/jYFp6hTlZIFllGn2yr7DPzMV/N6bUV0lIxJ
 h8gprQDytdVVOewCWPpqkkYYv8RiI9ymAVGa7wcn54AR2IT8WScBrTvA84rBQ90vnJT3
 PCzmqy0HsH+kpen4qOxBVoJ/vE4TBMv9sehCn1EHHdc0yBuDpXAb59By2TTxGunKkgZG
 XzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821445; x=1794426245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WLBndAX9Hk/SEvKvgjaacaz2TqGp7WomTMiVSCK67EI=;
 b=oxSFx+8Ubhwxwf5YabztI9Pm07otLJdkacUxj4ZAPDdYTIPVEPlOrjkoTot5hd/XjI
 qhVq//cdak0RaIN35tnUnhE4GfijicRa899blQmjXNLmZ1mt3GkMoP8pPaqXQuVGiKib
 jtCwZYR4Fe2KST+RxQ2y9AFdNAHxEk1aM6BQOSf49CHr05o9Lxbz9KNV30SqQRTlBycq
 4ilxm2dsgtkcQz05OKZnlb0Mot/v7enkvtJK7QB3w/6zkB3p8Q8qITr2j2iTzXPk340m
 9yPmKEpuo5cct2eIWuCwZR1Q10pdu097e1Bz9BrqzL1O3GOlFvrKnYYJ8NRpiRpeMhjM
 OWBw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwNf39qi4h0Wx9nnDfui3VONtgiSgfa7XBuZqLF4l6p9JyaZY4CG+w6w1kEPGFTFQhxC1ZVZcZzjsWK@nongnu.org
X-Gm-Message-State: APuU4Z8wtXrGb9qMMF/2NOYpVtTHJF71GtKXx0CTNBMwB2EUGx56/mpN
 Sr7+J2HLd1LfbBVpD4Z2+HwUYydCy7CPa96veDfP/SC5aOyejQnHTtymmkbdFBghR7g=
X-Gm-Gg: AYBFou2eHB/9onrTli7+Vscoy252ExfC6cTSMaV519IpeV4qMynkcNWOwnbWQ2m1mV9
 6wOgcqsCVkaadXEmzt9PwAuhuHtHSBSyEwEf4Wq7uK7DQt9rFnpzdU3bwoHOIvLux27CtDPXUSv
 og4fvmDPwyxB8Bv5nNw26/DA93iwPECbEDBGKoS5FSaUPUBpVVJ6n/oiLFa0+3QBXPjY8lzYoui
 4mRPMDThAY/oXO0vdcwKTUVo1xLMxjegwVwxAKez2JPkSB4M1+Je0l1T7u3gqW3c/SbEYgG9miz
 1gaYPTXRHM2ooGBNvvc1M+l8A7QCl+spnJ3MtYgEJoa7HjOzclgxGWdEMqQMRndGBvSKpCklmpo
 XF4wLlWume+TWjzxQ5gXhwApemQPQkjOFa+ioiEVB2kTPGVF1B3pomBkqRwpw+DEaPx5uTUc5IE
 wgtki1+5JBHrt8jyEkQVCbuBlUxfuiVnYW4bFf3dvSbBfVs+qw+liBXYsxOYZWzH61Wn2jhdQZ7
 LR1e/98Mfh+7Gf+NJ+lHQFhOMPP4DcBPKlirRCB0aN6IF8LC/VEKOfzoFH7ont+3uFfIridyuHn
 2/fn9+Ct20jhDdSWWyUJGhwyxV0JXYaXgZMAo7Pr4nZBbMd2LqmmL8R0SU4bbZllAGwWo04fMMY
 dd4dHLq+eRiNKve8ziME7MISMstLmMey+7/k4ou/G2orvVusn5A==
X-Received: by 2002:a05:693c:65d2:b0:36a:18d2:8c79 with SMTP id
 5a478bee46e88-36a423c0bbbmr23338554eec.19.1793821444930; 
 Wed, 04 Nov 2026 11:44:04 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:44:04 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 35/38] target/riscv: Add implied rules for Zvfbdota32f
 extension
Date: Thu,  5 Nov 2026 03:41:50 +0800
Message-ID: <20261104194155.679241-36-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add implied rules to enable the implied extensions of Zvfbdota32f
extension recursively.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ed0f5ed976a..ff09bafe667 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2903,6 +2903,15 @@ static RISCVCPUImpliedExtsRule ZVFQWBDOTA8F_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVFBDOTA32F_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvfbdota32f),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32f),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVFWBDOTA16BF_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvfwbdota16bf),
     .implied_multi_exts = {
@@ -3131,6 +3140,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVE64D_IMPLIED,
     &ZVE64F_IMPLIED,
     &ZVE64X_IMPLIED,
+    &ZVFBDOTA32F_IMPLIED,
     &ZVFBFA_IMPLIED,
     &ZVFBFMIN_IMPLIED,
     &ZVFBFWMA_IMPLIED,
-- 
2.56.0


