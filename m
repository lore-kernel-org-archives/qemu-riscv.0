Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41250C282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8tl-0005vs-Le; Fri, 14 Mar 2025 13:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8t5-0005aP-Td
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8sy-0008Du-KI
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:31:56 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22398e09e39so51803725ad.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973511; x=1742578311; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
 b=UY8r+XqqJ0T+7WafBnB6Te6YVvOPOshirmHpuTBIc6LmrM60rxwTcQJdfTBaIqMJWH
 4+5TKthTicQykCJLhzd/bG+9ZVPkFb71B9OTOiV6MmCnznu/4X/h71/jTX6FKkvRfiHZ
 zHPwPN3N/8JEeETISFBwmgqCfFlnPR89WMJ/oYXsrBFs6vPup1rMJbJR+qMo6YkSeFuT
 eiIUXwmDsf1vKmJWr8lrhNBByWSBYCxRYuU3f87X3QcZ4XM7sVaiR/TVCoDEMQVLRQZd
 GlznIGszVWf0IhQ85HurJT3ZwBPDRQNYbqtbjhyALTWTfL4PntFwOAXYTUVAuzxADzWV
 ZS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973511; x=1742578311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
 b=DKTttuoHhq0UfalOAXcxVmw9bgug85jNyiVaQ0WfFNfMi3LckukMrmiqc1sofdaQBF
 Bm0+72r2UhsHwMbLSU9gVoPg6f/i9jwIDfH6mAvq9q/NAvPXtcge9B3wnlDmDaNUQ8z9
 UaGPnmQBRXmrSoAAwLLE98Gc/TPeba1A5yPn1+cc6BdgKBm4g4gpkJMqWFj05zXyZCVO
 ybgelrjBiVbLI5oFZ35yMoTdTc5kxSr1fREAR5X21caL+K6Nlc0AOEYJ7hFZKcEM8CNm
 pEKIzmQ4GhQFdcXxcxMc+dfWES4mFvMZErj/AaEGDqgyLTkS/TxqMMjvxHAa55BzhV3n
 rE7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOf/s2d6hIMGQUZjci/zSvdxXwZbOqctvy4SyTDjLU7/juw36eFIC7mlTHucAaO8zJ0mHWGszg7esZ@nongnu.org
X-Gm-Message-State: AOJu0Yyn9TNhDiq8Rf2PD3FarcMhY1f5dEKjnMbWU8ev2zikz6M4zuae
 oyH+1eQgARqbITq1DwzBDRyUtD5n7zAbPfUexDbjUDHK20ifqZe81mDMBOCSyxE=
X-Gm-Gg: ASbGncuFaLermpQfm3wfc8ytgjg0V7wtJn9wJwH+YQWIICX1Wt78Y48D929zFqaSPXh
 uI+jJwtbsv2obkVc9wNa+SADBDjz1YompJ6ygzKMxgBRy44l5EPhUFUsgIJWN/PuGMJnAC/VdjK
 OfOZRUOa+WC0J99epdVhJoyOsj2m8BzuaywZWTTSfwpXNlIQd7Mc2iSL1HrtlUKA/ByGrDd3bxB
 nK7SGoM1TKthmVlDOGNg9OR7FPG4L48182Rr2PnfwPlHnb7qaJYnLEgY/2pwkqdDsWN9CWvvucU
 dgbBysPTinMh8Wy4kSFurK8rLIsd2JOyg6jOssznsXxM
X-Google-Smtp-Source: AGHT+IHrpliMNKDFJoDtMC4n7ul1BPKlqc8CVK3A1d9AQSWcUHjtbEMPub70Om5ILhqP0o6bsvQnoA==
X-Received: by 2002:a05:6a21:9005:b0:1f5:75a9:526c with SMTP id
 adf61e73a8af0-1f5c117e146mr4872005637.13.1741973510710; 
 Fri, 14 Mar 2025 10:31:50 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 05/17] exec/memory.h: make devend_memop "target defines"
 agnostic
Date: Fri, 14 Mar 2025 10:31:27 -0700
Message-Id: <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


