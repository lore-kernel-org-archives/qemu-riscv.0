Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BC4C282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 04:59:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVEF-0002kM-EU; Mon, 10 Mar 2025 00:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVE9-0002gQ-VJ
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:58:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVE8-0008An-1C
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:58:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-219f8263ae0so68330705ad.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582734; x=1742187534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S8ktbxqhQcYI9crAlIF4CNR4KDCM1LZDZwDTggcCVc4=;
 b=XqfG/WawNVMKLNTOePVoEkkyUACJ8hHblHL3f6oFS5TCmnQOOK0UQ8dIgksKjrSJae
 GIHQPN+TtteVEzDhOBdP6vfBydY4EOo6ANP9a3CNB4ytUy575jU2aLuNu6p4H+Um841m
 ORPmqIiE99kikX6CPCje18WIKuYmv9CPh1t5lYjXFvnF2MAeZ65eYqAMiG4lM7kCNzPl
 bLY2BD7hbnl1MYsr6PAV320UltbfjQcH5UuqMIKrdJ6wEaRRzesn7GJWi5WSJmVsKu02
 vhTRD/RhvsVnTuw6+UzWB7/w6SDPzdxfYvoaaj/FWdTrWkqbUWu6QCj4X/ibcnGp+x/s
 caWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582734; x=1742187534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S8ktbxqhQcYI9crAlIF4CNR4KDCM1LZDZwDTggcCVc4=;
 b=o0jVl/F8RyMXU5EhZtHCEtzAsLWHMFEFA2oIhkrJndekeCLm34EuiO1qXGrCqHTquE
 HWJl6wo4aM88FH7QoznM4H3wiOrjJ/dSkNJP//dDyrPZ1L9gSVhoB4oTUlM8KDk28n17
 RmEaF9p13RY2R8q9J2bHqGv+Hp4c1AC70mrXc3FsMf4vpAelAm2G/cNYRCp3JSKechQ5
 mm4khMGSt0KF5SyLYF6krJcOGOTrXDDj/wTPrjjtNGvh7nIKDUoM9ASERv+VahZLgC1B
 DZZY0sx/1HSmaJVhNAFUx6Ix/cvr6zZK0kmskSM1EeeCxKv0mNxtopCwKcGTzC3ZTQHi
 pRpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR7kdGcj6KPfpdG/HO7/JAWwI4Z8IMuOCaGsaG3gy0B3uUj2GboHavqqMCLVXZlEgnmrTG0GC3asLi@nongnu.org
X-Gm-Message-State: AOJu0YyitTHdYnD62PwN3TQklt0vL0utaVFwLKyxzw6WYUqqxfYLEHNw
 q4az6vzLWINY+x+OgVyg/hWRY8/ZnXNW61Dbr80dMbVjd7bjk48LXt2RA0Wyl48=
X-Gm-Gg: ASbGncsWN5z7NWR4u/y5gcb2J4F5FRH/Hfd6tNnaPDkAbL5yhyaqKIsCemu0R05AoIT
 sqa+/DQhBngpx1cbfUmuXy2oPWHNj4G9zDrj16tqlmuKWSIhOWydxhXerMdziuGYQ7H8zyC8cH1
 yopcCcIa/omMJeKvk6AbjphGwWRZ/X/yumxFj45Lm49uONwUF7ijhA2z2OFdijRZMDmgb4PUyTp
 EquCgjgUV3o4VktvCVEXqv7O9Oovn7BpJn4izhPbCWYA/f7NQvNDrtXRcVHDG4WG83M6SNYvuOI
 XiyyeeSR97Gi4O1fpfDwjTW8WkwEN56ph4lLWSIYs4yP
X-Google-Smtp-Source: AGHT+IHkXXNzkEnz2BccPlbhHJNUY3LGOIbmL0i4gzfHTIIx3yoWhp8OGUsmgyQKBXK356JOEhoSQw==
X-Received: by 2002:a05:6a00:2493:b0:736:ab48:5b0 with SMTP id
 d2e1a72fcca58-736ab48061fmr14740098b3a.2.1741582734610; 
 Sun, 09 Mar 2025 21:58:54 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/16] exec/memory.h: make devend_memop target agnostic
Date: Sun,  9 Mar 2025 21:58:30 -0700
Message-Id: <20250310045842.2650784-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

Will allow to make system/memory.c common later.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7c20f36a312..698179b26d2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3164,25 +3164,23 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
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
+    if (HOST_BIG_ENDIAN != target_words_bigendian()) {
+        /* Swap if non-host endianness or native (target) endianness */
+        return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
+    }
+
     const int non_host_endianness =
         DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
 
     /* In this case, native (target) endianness needs no swap.  */
     return (end == non_host_endianness) ? MO_BSWAP : 0;
-#endif
 }
-#endif /* COMPILING_PER_TARGET */
 
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
-- 
2.39.5


