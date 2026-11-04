Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA75C60D184E
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=EnOYD/EO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtr-00057R-3S; Wed, 04 Nov 2026 14:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtn-0004sf-PW
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:56 -0500
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtm-0002dt-4W
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:55 -0500
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so1925421c88.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821432; x=1794426232; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QHU/ErwXhFD9iHEqjLD0nNSzi8owSO0EBtC8BboF+1s=;
 b=EnOYD/EO3YdrmN3Yq4xJ5GpMKOoLQhuBXkdkOceJDMHK6sjRo7E3PqKYidqZ19uoJ7
 nNVDAR8tJ8zCUkSYPNYc4DRnqMPx9rn+G89Pei0iv7x17RxBCu6daj7Tj8S0V0MZBHGy
 C8QvAfqcASqyDidtcX8uK5AMbXVLVJ/m/mZfX70jjUILit6luiq6+8/TKjYA5fcIZ8jx
 TGDwt0bAhqnwNw+vA3quDAZwFdX2TBqS5fM/5esoWE3C2OcRzETof0eI+g8PcoLq3MKY
 Yz5sfSoMuNg3HtQ5ahnFeNiaxqZkOHGhTFk6vGxpDxzlLK7tabAE+8d8F6fWSo9wVj3l
 WMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821432; x=1794426232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QHU/ErwXhFD9iHEqjLD0nNSzi8owSO0EBtC8BboF+1s=;
 b=jILf6nNafFhsTi5g9agyHoOtIaXkZzi44HpCPEwjPeM1fRYkk1NA8Rmsp55zM9+/u0
 2FsORg/JSBxJeI1RJsfMgVdwoKc2ZINJbO1uwVqCnCkHHZDFvztpV+7AGx5NLlmcrWul
 FdzILRO2BvbwSxZkLwJNlm2eIW9P+99WbLLQjMymcnktLdwUlnaTmuHUITRJaauwGx/8
 SDq4PAPF+XiORm2Q5YcKTKgIrFpeEfANaqwb4109pdHpWhEIZsKM3+3YM51jMIKMHL82
 /AltKXMtauc8KoXx5mMfO2KK6Yyw3ITeo3QP10xQi/ukeIhCAYKF191Si4IQvZYn4LgW
 qnsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpdkxkjHIpAOmxA6adKg23Y0JKtaqtxbM7jFHxnAx+y6aSvvX2L9CUthw+culBTdRm7npmViIGlM2c@nongnu.org
X-Gm-Message-State: APuU4Z8h+LotquxCegEnPDL0NjPGKQvpck0xAC/ewlDqYhEQ7HW5tt5p
 tVis7VzeFbd3oYQXmbSjKNZLpzuWWFO0KjLUuM+sSOLgD/7XXgYXfnYUxoMOsv3zm70=
X-Gm-Gg: AYBFou2VrGxZkL3WEMzG5riEIzN2z1QqaJHMlWwPt66Ow1q/5xP1LcddZiMjmTTUK40
 MulSOnFqwbhWwNia2KwIo2BBrrxpiKcQHiPjWgKIN3LngOOO1lDtWMi839xX738Zgdpk4uB5Wnf
 0Wke3PVZpcF8WfWJJXTeefZwpTJwWqlyl4H31W6XaaTVMmgAnGKpeJruqKlWdAAX74s3F10bJ+F
 HobwHgUbs43f+Dx+eULIwkfq3LMZilJ9g+sy5MXI6ZuAEPmDnAB2Jw7AsLyHJAReUxjOdYiDMaH
 UDwljvrHF4DJbnq3uxImewjDc1s5nRh1QDfqD/+2ngTBcqKaYSTs2KmKFYeIZxJ+EiJ5Qn2qP8y
 +ZbjyHTrHj4HBz7BOAKHIKOtfjjHKO5qhIob2jEwsf7ZSalt3stZwvboDW8V5JfiEZKo/D4MW71
 24PMgh1X+LFooto+vDaY56Y3X+orwObuSDd43w9rdsIbO2oNRcW+pm7WAi5WdmyUD6YcVRHOJ4K
 rvEfjAMX+sp5HH7G06Lk4Z2wcIptwbNtZyW3CK7jKODDacMCYeWZAWtX38DbyS8rCDHyrbYtY4F
 pVUy5HZgRZOl92z1xRQ/CdKgr0OdNaHqV048LVBSZ5qeVkf05ff0QHipgFsVcRz9Y0KJYdABMOt
 dUJijTZTzwjIpmD3oBULCg6ZoVtvrfUMUxjWQWzSDzEIjy1Zc2g==
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id
 a92af1059eb24-1ac5cb186e4mr25908875c88.39.1793821432421; 
 Wed, 04 Nov 2026 11:43:52 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:52 -0800 (PST)
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
Subject: [RFC PATCH 31/38] target/riscv: Add implied rules for Zvfqwbdota8f
 extension
Date: Thu,  5 Nov 2026 03:41:46 +0800
Message-ID: <20261104194155.679241-32-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=max.chou@sifive.com; helo=mail-dl1-x122f.google.com
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add implied rules to enable the implied extensions of Zvfqwbdota8f
extension recursively.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b4a9f2c3e30..0a35bc7c416 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2892,6 +2892,15 @@ static RISCVCPUImpliedExtsRule ZVFQWDOTA8F_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVFQWBDOTA8F_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvfqwbdota8f),
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
@@ -3125,6 +3134,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVFBFWMA_IMPLIED,
     &ZVFH_IMPLIED,
     &ZVFHMIN_IMPLIED,
+    &ZVFQWBDOTA8F_IMPLIED,
     &ZVFQWDOTA8F_IMPLIED,
     &ZVFWBDOTA16BF_IMPLIED,
     &ZVFWDOTA16BF_IMPLIED,
-- 
2.56.0


