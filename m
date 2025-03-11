Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04DFC28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:13:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqy3-0005uz-Iw; Tue, 11 Mar 2025 00:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvh-0003Qy-KH
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:27 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvb-0006YV-5h
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:20 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-224341bbc1dso60932465ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666154; x=1742270954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3CzVNwffqVfXfk4NE2Z+/4EFEG8FprDV2OFnBt+VLQ=;
 b=gsZx0LaSkfehRQBaUSGoBk2kGCqDwoBmXlnZPgHqtGtI/36h3+larrt+Ab3zq0PDCT
 RG565/Nx0NJasSE8xe/Y/EYgtKDRmYOUvF3QNpfygcPqtsgc0u0p3L7ED4OKqsqCKBpX
 l3Ja2atNlRSrImZGiS4fLa95uGi4l7lhBYzVNMVRxa7dF1hhiVgv0zbcbdkP2sJjGMSw
 qOZIcdp+eQTNu0vqhorreLm9cEiifytoMk6PbyBSI5UndcPIaPlMiCUzz1J4SpQfP4pD
 T5QM758cNx16v0CvHjTYxeF7HCyWUXeU/N636rwNfa9ch+r6d+F0eBtkO9nwog5as01x
 DP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666154; x=1742270954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3CzVNwffqVfXfk4NE2Z+/4EFEG8FprDV2OFnBt+VLQ=;
 b=sfjLD2fdanuj3a8Imi/i48Axi5C3BHHE3jrDSmS3CB1UaQt+6ZH+pO4hPGeHFtCvlc
 PYRAKDBCcXTbAcq68IIn4AJNh9UjRjm9odqJ2sAUl45aATjF36ZzTjTBXBj5GiAAX+cn
 +XRk6HkKztmxdRVv8RG1GerXtG3p8Ppi6GU4tZW6QJDNwtUj+W3Dbs2477PCPboOCmIr
 S+i+cNiQYdcHzY/4DijDX4XUeWByW7sw91vZKtqA/qcWY4W5pToL2kiC+6Gidnpa2shm
 rjiIHMYERRfJb0vmyOkBPtTVw/9LxHE+wnibN8ElFHlLw66X7nWjjGD0U/Wetmi9Wl+s
 dYOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUufYE9U/ES9NvDojzVe/abBHb2G6y2ic5+asgNx7eUUU0r1Ay2xNOOKdYMAIFCHW3yPl99nUmBEtJ@nongnu.org
X-Gm-Message-State: AOJu0Yx2XVcf0Z8HVNrJoa+pdcge/vBQFG0oEoAtjGwE2on6fPudAnp+
 6pjwtJV0ewdFBLNtyn7ikm9tPXd4ucoDs3xfO8mVFACltOCMITmAcs/pHI3Lsxc=
X-Gm-Gg: ASbGncuKXDknauNa/8fgqdcJAKtXintwpZRIlNoKClT5/AtwsqzwmhIqVtpMUQ7oA2Y
 riEsQi4cAb+j/jE73AKCClwdyhxpVs0gIZhxJcrCnc1HTzLHA2PIkABueoBxRlxn6gkJn2Rwbh5
 tz5b3+p4omloJoblTDNaCq3sJbzWLrk4qqlgXK2hESRG3Zi8Pc5dyl+rvoOZPl4FtoaoC0mdeDV
 /cRYG+rYBKEyYGOahjO+Bxgfnfmip6aXYQ8/PNS+UK3pvQ5BUajak6br8lBx4QxcY3uSPgHv9L8
 QTlVR3Q7dt1qLzpeOalTCMADMoeOh5vjHy8881WthHww
X-Google-Smtp-Source: AGHT+IFvXFjaslvNGXJjltHn8NjSjDrKRDjnKt7uWKtRausP/KT3hgu5XPa6ctrl8hlKzv3rih4ocw==
X-Received: by 2002:a05:6a20:c6c1:b0:1f5:59e5:8ad2 with SMTP id
 adf61e73a8af0-1f58cb40fa8mr3753307637.24.1741666153903; 
 Mon, 10 Mar 2025 21:09:13 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 15/16] system/memory: make compilation unit common
Date: Mon, 10 Mar 2025 21:08:37 -0700
Message-Id: <20250311040838.3937136-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/memory.c    | 17 +++++------------
 system/meson.build |  2 +-
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 4c829793a0a..eddd21a6cdb 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -353,15 +353,6 @@ static void flatview_simplify(FlatView *view)
     }
 }
 
-static bool memory_region_big_endian(MemoryRegion *mr)
-{
-#if TARGET_BIG_ENDIAN
-    return mr->ops->endianness != DEVICE_LITTLE_ENDIAN;
-#else
-    return mr->ops->endianness == DEVICE_BIG_ENDIAN;
-#endif
-}
-
 static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
 {
     if ((op & MO_BSWAP) != devend_memop(mr->ops->endianness)) {
@@ -563,7 +554,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
-    if (memory_region_big_endian(mr)) {
+    if (devend_big_endian(mr->ops->endianness)) {
         for (i = 0; i < size; i += access_size) {
             r |= access_fn(mr, addr + i, value, access_size,
                         (size - access_size - i) * 8, access_mask, attrs);
@@ -2584,7 +2575,8 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     unsigned i;
 
     if (size) {
-        adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
+        MemOp mop = (target_words_bigendian() ? MO_BE : MO_LE) | size_memop(size);
+        adjust_endianness(mr, &mrfd.data, mop);
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
@@ -2619,7 +2611,8 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;
 
     if (size) {
-        adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
+        MemOp mop = (target_words_bigendian() ? MO_BE : MO_LE) | size_memop(size);
+        adjust_endianness(mr, &mrfd.data, mop);
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
diff --git a/system/meson.build b/system/meson.build
index 9d0b0122e54..881cb2736fe 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,7 +1,6 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
-  'memory.c',
 )])
 
 system_ss.add(files(
@@ -14,6 +13,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'memory.c',
   'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
-- 
2.39.5


