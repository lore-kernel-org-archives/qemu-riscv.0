Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04235CCF9EB
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoLc-0006NT-3S; Tue, 28 Oct 2025 14:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoL7-0005ss-6d
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:22:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoKy-0002m5-QK
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:22:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so1011055e9.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675745; x=1762280545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W84UIv/lTOoO7nPMc2XCHCkjsy4aJN+uqWbkHrcZ9FM=;
 b=caaGyTTpavepaS7GhXnulPvqJuDaMyYkgV5A43NAj5A44HJFsF9LC2W6MzOZyx1cAh
 5dRfusbJkIRP47a7ECBfbrySRcKJ8ptyuL2W3YVP31fMgazfEpcG/KPcDzCvoP1yc+bc
 ruDbS2XYBtcC3LhKfL7HnHXIzsIcs7XhXP+0PLn5xOARNYc6tum8Y7AGLwtJBCyrA57c
 BnPiuo3KYGZwLO5RFHLregi8EluDaF5/KBRYQdMsqGx95GWJOZqpv9MnDCm8vsaJX8cv
 nN5MahEKEC00Utl3QJ8lTk9R7wfr4+kRTX0Guqrlzp5EA+Nh9qZC7mBQpky7ZGsYaerr
 nY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675745; x=1762280545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W84UIv/lTOoO7nPMc2XCHCkjsy4aJN+uqWbkHrcZ9FM=;
 b=AvBqhoNiFEJpmKNWOJrBPA5A2zZ04G4Q/xJl1FXYGNYL2riBPGnt12wqvVSylpn2cr
 EJDwq9cuf7PsloNf6EiYpgr/q9LYDzNfRvzKKopk73SEv0STmeAynOVx8Yylbne6mts1
 ZKu5b8STFWOL4CnyUthCbJ5bS5KtD6ywi4mABpLFVN+4rKu+hGylzjtDThvoEX0jnfvE
 8citovB8XX/yaCc0trgq4rwolhIdjgYTM8oDpC8Rc38e2oQsVe5+AWogPuSJIY9RgtnC
 D/7NBEtCUPLVTjBssBauCfh0gBvnE60bx7TzH0NkU9ZhDaw9aFgxeMpweHV+kZKxHN1m
 jR1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXscREZOKkuqNUwo3kh5IhEGZgnNt94Bdv8CpI3KStHrG/o52857Uj5No0EJrjJ37VXMSLDCPEIoioh@nongnu.org
X-Gm-Message-State: AOJu0YwSUYgIxhJ9uCyhRHT3YQ1nRCvQhcmvOxG5TN6Q5FpDY8JfcYad
 qUdUEehPGze1SCJ1rpxevBZssfNFAMdiud67FJLZ7lMwywkhFr3JAgLA1ZnF/HDKzqU=
X-Gm-Gg: ASbGncsjETZH+y5K1l6lNW2JhNxaDrHzdHD6e5fCDjvnAJvkDhwEB6XRzL8tYl1GGon
 x4n3yGtwvGgxazYFEp+Po9adGKJljgRYNpXhb7CWcvTC4pwTzjptiJgjObgJpG0Gu0aEVS2TvE4
 7SNUcDs4X2EILEy6yemNXQdl7b6oxYtrkjo+XEQ5d+5ovM9TJueP8qWgDzxjlFNefKL8oJRKZWR
 +Yz1483E8REx5KzuyZaRUlvvGrHlL62bJxROvagsem/fberg5c2Npma6k8VkxDDRl8p50jM1vGu
 GsxTIDN6brB2dkHgmA83R9KajUHQv4dDiYSrwxdnpsNrwj9/cAGGGafWlIQmSB4w9VwQJZhgxYO
 /Xj9KST+jRfKOvM5vnt+qgmZ1LbeKwbTPr5A/Ix9XJaaZATlPP1gGK7K6Xf9bdVHiZKU+2hfjLN
 3ut5+zOqJAf5VRdMnTW4poCoKqNXCNphJf6+4gRE9hzN2BhZ1IOQ==
X-Google-Smtp-Source: AGHT+IHoIWA9q0RB9bwHfvDWf20UMqmMOg5jqKWauXSldNNnghGNAT3/AIE9q0U5PgZ4q/ePm3Vq2A==
X-Received: by 2002:a05:600c:8595:b0:475:d278:1ab8 with SMTP id
 5b1f17b1804b1-477180f3b38mr27235385e9.2.1761675745118; 
 Tue, 28 Oct 2025 11:22:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e196a4bsm6202165e9.6.2025.10.28.11.22.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:22:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 09/25] hw/s390x: Use memory_region_size()
Date: Tue, 28 Oct 2025 19:12:43 +0100
Message-ID: <20251028181300.41475-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

MemoryRegion::size is private data of MemoryRegion,
use the proper memory_region_size() getter to get it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-pci-inst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index a3bb5aa2216..5841dfc4fec 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -396,7 +396,7 @@ static MemoryRegion *s390_get_subregion(MemoryRegion *mr, uint64_t offset,
     uint64_t subregion_size;
 
     QTAILQ_FOREACH(subregion, &mr->subregions, subregions_link) {
-        subregion_size = int128_get64(subregion->size);
+        subregion_size = memory_region_size(subregion);
         if ((offset >= subregion->addr) &&
             (offset + len) <= (subregion->addr + subregion_size)) {
             mr = subregion;
-- 
2.51.0


