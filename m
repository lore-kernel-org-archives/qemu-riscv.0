Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBB96074FAB
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=O2wRVHmS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtC-0002pR-3i; Wed, 04 Nov 2026 14:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsq-0002Rq-Dd
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:57 -0500
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgso-0002Rf-8W
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:56 -0500
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-33fb4680717so1919907eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821373; x=1794426173; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=egO2OJef4ZNU2KrVZAHkDjhpGUTTfDSJpXL1CWafa5o=;
 b=O2wRVHmSK13bmF/ogfmYUjLD/Ju2xd2QtbwiHDU7a2uNWdqZKXeo3zTqIR1tde+BR1
 hEs4CFqdZhhuXOhyVH69NEM+x/JYs/PBmMnVlJ2wo6m/f6iaQR8q0ZkOcrMJCOJym9R+
 +QZ8jvhkP/kBM+GJ+tBVWj4KtprLHTbNvQ3gxkoVfMw8q0U+DfjdyfwBHa/XfpAtQZPH
 exg+2WUklogJbFdxMFAke6+6g6IpxICN3Kq21s7ZOQ+BbJKrOf+a9VkWZHPXEGI8xyYV
 IYyO12x6NnFwj8RJAezyLDmVProyN5R7hzdO6Az+cAx1NbWI6MnSeKnDJbiN4wxQqQDG
 5xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821373; x=1794426173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=egO2OJef4ZNU2KrVZAHkDjhpGUTTfDSJpXL1CWafa5o=;
 b=ctkctrKdK+mK2C/fw2tItDq+udqQSg22hhLee3s4RB5Wao+1ds4uaU1n2gW/1pYXND
 +tVTtO0GfSmH1YnV4NzyhzQx/DEhj4PZpsGJUHd6qcbBD2ADLYS1fSjIALAxRbxJsIIQ
 qqGePwxm0Gl69nIQXFshRkGTziEoL//ENR9JN0vHk7kHUkUq10QvZcWRd/xyaOVpJGFW
 xXKtORZMePV3+5/BwTzzz6uSP/zrqqYsziHj1hKEXDTJ1PJ4PXtE4ULohjKN95ZI/kbG
 SRJYxaoDwA5LDo/x3fKrQx/l6RrY1K9H6ISeivlaTMHCmJybdcRIm3WmYxyGPJy1NJLe
 2RXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBtD2YPk+6eeD7nHMEiFKXhySniqc3d0ynPLOtzsqmlqwNGSLBw+Bi3iCG2zelH3zvsHlO77Rw1+GL@nongnu.org
X-Gm-Message-State: APuU4Z/GJvBtp9DsxH1ikNN/Z9bo84CK6yeMF8a4vEAoXLlBMFDa/5gE
 aCGSVd1Mc2S3m/fTp/4rY+4LggtHsh1V4sHKNP7BkWv+cQ0/Z83fMd6k0sQuB1xO04g=
X-Gm-Gg: AYBFou2Y2u8w60tIC8TmaPJ3zwV6FUxEJ7OVfEojTGEQhvD/fnEYFLWa9P722xXsLLZ
 rRAyyVMWb54Hu06GXDsfQMld4pNPl7g3XKeWonik0QIu2C78icaQjniNt1QsvijiuJVe4KxRn8L
 XwwBCNn24437DLfhLomtp933vmo4fgW5vFQ9WCqk2Ml7U8QR4AL7aed6v2n8CA/ep1lvAEOImc9
 GhjIlsuvviMRT2hU82yOa2kAczhAKnOBSszmVJFfZHXphoqcg9xTClhsskDWldll1vPScESjDqW
 fsW9hSU1basGQnMFsX8+qUxXXcaQ0p3ol7AQgypa9zxubwo9mpOnIFsLwdqRoeEvmn589eQ+QWV
 u6jaazv8mhTDwhLtYsXMnXpujf0hy4N7hveO7koYLaBcTwX3l28//9gys5qlFRanVe7DuwaXEdR
 WMsEsfzb7v1IHNpfDeZTtSfnwprBCuzSDUSBquVwxWogzYL3nZek83Ohrs34cHkxzEgvVhELJdP
 /kNE0Waitp7CV2zEBUB7/ggc/53+5zttA5CiJghHyTNfMrf+pDKqwO7+smctMbuqLJd9HGdVS+4
 fzg4NUjXouujZd1FawqjSqz/YobK0L741ZppCji7ofKU26TZTqexnh50gnqyj6gI3fxxMHqT+Rs
 MHTr42NtfnesoJDZb87PD1HPRLODT1Q==
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id
 5a478bee46e88-36a42434630mr36437488eec.39.1793821372727; 
 Wed, 04 Nov 2026 11:42:52 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:52 -0800 (PST)
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
Subject: [RFC PATCH 12/38] target/riscv: Add implied rules for Zvfwdota16bf
 extension
Date: Thu,  5 Nov 2026 03:41:27 +0800
Message-ID: <20261104194155.679241-13-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132b.google.com
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

Add implied rules to enable the implied extensions of Zvfwdota16bf
extension recursively.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d6e2b07c401..2d905a99d68 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2873,6 +2873,15 @@ static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVFWDOTA16BF_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvfwdota16bf),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32f),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvkn),
     .implied_multi_exts = {
@@ -3070,6 +3079,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVFBFWMA_IMPLIED,
     &ZVFH_IMPLIED,
     &ZVFHMIN_IMPLIED,
+    &ZVFWDOTA16BF_IMPLIED,
     &ZVKN_IMPLIED,
     &ZVKNC_IMPLIED,
     &ZVKNG_IMPLIED,
-- 
2.56.0


