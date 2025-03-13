Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3435EC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslb1-0003es-UH; Thu, 13 Mar 2025 12:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslac-0003Ld-TW
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaZ-0005ca-99
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso2501466a91.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883957; x=1742488757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
 b=I+btRbSOhbOMqUegHG4u04V1Ri+EsE9yosfXL59KyAcmvqz5ns7Nw5c7fpK8HxdZ5d
 Gu2gtgagPk+Cv9a4xbtxKAnhGae3Ei/R3tdjWgY4HZt94Nw0178ZXDJKLwkdCkxK30Pb
 xmRROKJ6uW3AvN6n2gJDwmwed5WdP/TsqCmbz/xEJX1sWBBPvD4m1aAGlYbukFShaEOG
 zboW8j3TSI4QmaA8qHSgV7ApEVrozRVxSzLGhqcJr1i35QDqYaPY83KgkJzsi89thGCD
 uLX6EGtga8f2yhfvTdHD8EM8awBCSWo5k5IdhPkIinZbj4RtEC4Gmm42HWWlwqiuWzZi
 4tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883957; x=1742488757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
 b=HOB+XsbbCgBi/ssR5FDNl7PAgftStS35z9NZf7OuR3FImK8soPCgmV6Mo4Rh7UwSGP
 YaRhoGDRWCjCrw7kpGl+hr5Z4/zCnqAgKhicNtBm8aXw6PrFTAXq6GPJnfCgCv2I1i5O
 k5PLvL1F6+aZ7CoB9PDlyVxpvq4ir8QEWIWAHHhN2D88tcmB5dBEQP5+twDT4NqiFfsB
 5wh8IugOLsB5XW3T3VL841kR0AGaULdpL+/hQOcHjb7JCACkrHKLsY0toFTq+RPN8Z3B
 q0Lh0Ay//mrm7KiXysT9BxSZXz2ZMkBTDstB8byl87VAf6bajsitzsPW6GfifoMZGaT+
 T2wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVODTKBTRFEhJES+Xb4D03plerODLBAWHw5/ElQJ6Kqm7K6xXiTYda/m2S45gkJc6+GhFovyzdDs1UH@nongnu.org
X-Gm-Message-State: AOJu0YyGED3uySIm7iM/0h4DXi1brP3Xf7mGxs2mzWjAxkYcxl3NsqrN
 uvJbQrj0WUebqvVJH7uLkGU8KnVleMvop6h8DgajGoIQKurZ6F1YQSx+3vR2SGM=
X-Gm-Gg: ASbGnct6CwIQuWQ0C+eptYKAYzQm2F5WAQwP+5ZiSdQ42DohPL1Vey8MEchgHaM8lAe
 lUIyrI9adKM3RoeNpa6PARldXKrXuj2VF/IMPnn5DIy76qZwWydi0Sus7JQB6caLO1HgluEv0lF
 VqRL5/txYjkR77opze+yKrI6oCB1wZXt3rCz05by8ulcEHZR0JgKAhIL054oN5TQBsQR2qrUa0K
 4hh+MetaGPdjih8u64IgZybnYRglEdu2yosX2UBeYAZQr2ew0M4+6ITVKGClFGT3ienW3/AaTvc
 jkhGKIZsgpn0ZCQ2Hul6XRxToHBTOUYuu9m4sFY3O2Da
X-Google-Smtp-Source: AGHT+IGT0TQa6IzxQKmV0c+iT9Ap/Go2mov47rFQ/lft0hbXJmOXflaiO0g7vmiNGPWVgJAiRn5xgQ==
X-Received: by 2002:a17:90b:2710:b0:2ff:6fc3:79c3 with SMTP id
 98e67ed59e1d1-3014e8435admr275040a91.9.1741883957269; 
 Thu, 13 Mar 2025 09:39:17 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 05/17] exec/memory.h: make devend_memop "target defines"
 agnostic
Date: Thu, 13 Mar 2025 09:38:51 -0700
Message-Id: <20250313163903.1738581-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102f.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Will allow to make system/memory.c common later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index da21e9150b5..069021ac3ff 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,25 +3138,17 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-#ifdef COMPILING_PER_TARGET
 /* enum device_endian to MemOp.  */
 static inline MemOp devend_memop(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-    /* Swap if non-host endianness or native (target) endianness */
-    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
-#else
-    const int non_host_endianness =
-        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
-
-    /* In this case, native (target) endianness needs no swap.  */
-    return (end == non_host_endianness) ? MO_BSWAP : 0;
-#endif
+    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
+                       ? target_words_bigendian()
+                       : end == DEVICE_BIG_ENDIAN);
+    return big_endian ? MO_BE : MO_LE;
 }
-#endif /* COMPILING_PER_TARGET */
 
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
-- 
2.39.5


