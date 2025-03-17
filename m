Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA24C35FF8
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:39:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJX-00053D-Te; Mon, 17 Mar 2025 14:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJB-0004kd-1z
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIV-0006A8-4z
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:25 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2255003f4c6so82567195ad.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236470; x=1742841270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
 b=mMxRwKruY5z7V/XDapsbBm3uimBKs+VaKDFV5vgMOCrDNgAQIh138Bh3STmsUNgwaW
 +7lflS7MsI17sNBZ1VLuJMEePYrmOqj6eupWL/LH1382Rhpf8W4+frp3ivWnGlet7J0M
 oSkeYsT+SoQyqFvejHO5ugUzadfSBCsn4bLksf2qUDHSVp0PplDKw+NmIPaqf3n2zMuE
 2e7EsXFVrC4Q4wZrtZbEV/O1YcVqH/AGv7U74mCxjQwW1XMwAFLnDgK7JOOtXm0Cw2VQ
 j+Zu8pG74kDXQFiYF/WrKcvPq/KE0ePk+44EwTKvp3sj6IpKdh9xT73schu0UayVzW5A
 Rfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236470; x=1742841270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
 b=vBem4eucmGJZY6N378JzMhA3Jgq6XA3wOgPO9YTEqLuAOB/lKoXPnkhwTU+hSz8zq7
 ULG+YltRsurOpEy7Vcblqid3hG0CgaoU77pmw72ld1SvMzybOtzNiVch7+eXkxRlrom/
 +tPfO5+xnqWBfePz49aWnBySmqREtf87NSyuGFWEBRl8+SXx5L5Ad45ZoaeVN1T+AQh+
 v8YCSy9RnJIesjDq4bJrdIVrXnzb3maS5EmZC463T3nDCDZhBApdrPOwFWD6zz0JUvTv
 CHt2RckYTTEH4We3oOCmmkiF2HwUUdgFw8B/ZBWn4dlzokMKtFbo/ThuvzHXnlcOGBLV
 /9mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy6+0wlZvJgwUFEjFwZs0YLmo7fz5xtSBTRvDn46m/R6t/+GBfy/ghthErx13Uqi8pRvPANkLc81us@nongnu.org
X-Gm-Message-State: AOJu0YyNIzYgE1QjceEOTMuYIMAFbI17qwXedj2rKbtpDyvb0YNzliYg
 od9F9mCYUPYE+nHk8A1LD7n87eEexdc+ogX+Lx62gYXtKfibSN/Gk1rSStVIU8o=
X-Gm-Gg: ASbGncsAPHXFFS9kWwkMyPUOtCsmmUQ/SrlGoe0FeBYFzYA3U0OBvojlYyliyB9XkGR
 sCrLi8j2ruYhn5XGgSdbBP9LnUx+SOnQrN5LteBJewvKguta0MDDB66ngaq0a44kq6NDJXDIGkU
 ykNrRccpi/r6oRslVKCgmnMxq1TJh7REYQvOrjVt5tWaWW5ze9aCCaAUrvdeZp5uQ82ooFhnSuQ
 K/u9+Ah8OZbGauDGTC1H823e7o4WNpAxsvValDUC+XGBQDI2gRxL232nc14P0eW8PC9Mr7m2ixy
 yGkNifunJXLvRcpo0Egf5sSo8ImAuw9kI7HwAxSBnn5J
X-Google-Smtp-Source: AGHT+IHwzlIJ6LxZBvPsjg5l1kKbXhEFWIu9N9qHSrE9Y+TBbc5aw9FWPh64Zl9aShUUkawUwyHzSA==
X-Received: by 2002:a17:903:22c8:b0:223:517c:bfa1 with SMTP id
 d9443c01a7336-225e0af0323mr191813145ad.38.1742236470577; 
 Mon, 17 Mar 2025 11:34:30 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 05/18] exec/memory.h: make devend_memop "target defines"
 agnostic
Date: Mon, 17 Mar 2025 11:34:04 -0700
Message-Id: <20250317183417.285700-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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


