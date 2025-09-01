Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94559CA1002
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:40:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ut4lW-0007Ma-FY; Mon, 01 Sep 2025 09:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1ut4kc-0006rj-LX
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 09:39:20 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1ut4kM-0002xM-5A
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 09:38:59 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso3809064a12.3
 for <qemu-riscv@nongnu.org>; Mon, 01 Sep 2025 06:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756733936; x=1757338736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gr2/2lP39GAEsoDx7lhOVCWmhPO18jyHTS+4tMjNbdI=;
 b=T9frMbwFOUAkofdodIpEsbPma1Mxh5l9EICXCf8UutBFVYo1s7W6SAsFgs9LKHPsq4
 FND9lx/eLABPtAwJPQ8ItQPmEiVtExrsFe6km1A4Qki0+BiV86evb53c/j4S2Q9cW6bD
 /UY+aFl2gLz8P/uVp2VFJUkW4Z9G+u53YswTlIKKHFthUkjuhVhGWQELoRf2+WAMP7wM
 jQhe8v/shwfzwqQ0urdFWt9jAr5YMWbaX1FW9bGdBwLKrrwcxrqEs7sfjAYRlmrNWLyM
 U2iMExWC4uQacYPhAK23EZHEa+gZl85g2V5DbpWMB3jV8ARZG2igJggcf7Me/fp+6jyG
 +Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756733936; x=1757338736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gr2/2lP39GAEsoDx7lhOVCWmhPO18jyHTS+4tMjNbdI=;
 b=UktU2AJEBC/VJ39I1I7n8anRGbk1dD5BngMHT64qJftND2z1tqjyHQoF/hUDqLZG59
 N3b0fgQt5OQT96aX5kd/wvCp7XSddklRooMjJgusmUJ4ZuKFaDgZN/yJpRd6sEpY3syC
 +uH9crye1hpyshlfirCgVFFIjydHfZE0/JsgVpWyN0lLmsylX7eLN2GmWe2/LZx1tA+I
 XKI8DYh+EKG8JcWvbdNXMpipwNMDOYU2t8cYpfRWlRK87TLRO2oGiVyUaGvaoyPMB80/
 3fPbNdmq+AVQQa3iR06GLIX34gTd6Vx2ui02C0BdpMeO8GsifZLVIhc2fQPWMWsFkztX
 zspA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGWgibk3lzByoqbpr/H7PsQYrvh4/5BbujpW/seQzHwGajPkuDFO6ibgQCaSNAu0g4X2dCPv8tOg12@nongnu.org
X-Gm-Message-State: AOJu0YzITvyU+dvWSkv7+Gl7orQywydPANDcwNz4TXfuZ6t2aMjuUlRS
 7S7DM9tITenzIFPhZB7rwx33THjXMW/CSpPXDbxS1fbcQGejNhVdoVDzT706lCkk+Bk=
X-Gm-Gg: ASbGncsUY8QAJmaoK+3GfJ4A2HsK0KEzPHac0VAz8P/qG/ettMkxgJ9BgehvdWsB+N8
 DSCjR5meBnQLZYa+d4OpwY4njWKOr3ucyJpNaNt5aJUDaFV2WedFgTd49v2Ph9nkU0YSfHJ6PWt
 JbSt6Wrsn9+eEetqmOcjtfQTR/W/iajMdP3OipNoFdj3391JdNg4AzECuwMcKbcWN+THMbpeiYS
 e3AmdQjAuaWzpJIgJ7fGsOV4CvHBaHeV3gIT7pkTha/ALlgcmY7dFRSqYA65j6/Evb1pBiZDVNc
 IGTVHZIvvb+8CJz7D3eAqHoFWoBYhunXHB4c0SJDVF7e03OubiQpNKjHHZQBUe0tgtWxBmwi1/e
 IlUB65qHmLeqbILf6UjcPnN/zv99Jj2hCUiSFdEHR3m2hcIH9mMrVA+hvS5JIVM01cu9H8rzAOl
 Kuqw==
X-Google-Smtp-Source: AGHT+IFYnKHFeHe3jm/3xpu55jKc0Sfq9m4J3pEgTIyk6ABwQX/Pjp86xCCnP6lPIipmZ99wb6sPDA==
X-Received: by 2002:a17:902:c406:b0:244:55b5:7cfc with SMTP id
 d9443c01a7336-24944b19430mr97784755ad.37.1756733936207; 
 Mon, 01 Sep 2025 06:38:56 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da3bbfsm103106375ad.70.2025.09.01.06.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 06:38:55 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 3/3] target/riscv: Expose Zvqdotq extension as a cpu
 property
Date: Mon,  1 Sep 2025 21:38:15 +0800
Message-ID: <20250901133815.1693077-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901133815.1693077-1-max.chou@sifive.com>
References: <20250901133815.1693077-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52f.google.com
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 95edd02e683..ed486113ba1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1373,6 +1373,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
+    MULTI_EXT_CFG_BOOL("x-zvqdotq", ext_zvqdotq, false),
 
     { },
 };
-- 
2.43.0


