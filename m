Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9E2C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:01:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIKJ-0003R8-3F; Fri, 10 Jul 2026 17:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIT-0000yh-60
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:58:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIE-0001yq-PJ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:58:08 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-36b9d265355so1212639a91.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717073; x=1784321873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/dRLgHIpg9jU4QQ3fj8FRVxP7oOcs4Ea/cFITkJMzy0=;
 b=B0qj2qEo4JAtD+kE8gOMN8CsmaE97w5kIcqhutMXNvdupHEkQfOyv9ksqCv3vPXFLT
 My8XRSXB5yagF0ywJqp/6Ag3rS0bn8HbNQqjABeBw5lOmvsb7hiW6usMhaXiTxaaQBuu
 F5UuqBnsjbvk46ercB1pXUZ5SOFzgcFRb52mtm/S7s+JV4VZ1Iovqal31hBcdgMn2edY
 sOoV/8MY/Wx5CBVjXbCQdbM8aug1+4/APRrBnQX6mc6t5jHCJ6FNOwbDdMsPQ0DWYpnt
 8g4fKIV/cGSDedV11ZlRlXfoKwJLofMloAaCVF6HPbMETt3IJnB0BELBZ9bYrlTFnTZ1
 0QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717073; x=1784321873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/dRLgHIpg9jU4QQ3fj8FRVxP7oOcs4Ea/cFITkJMzy0=;
 b=W3bgH8FW1ia+DQQ8ciOt0L8Q5mCItUxxl7tPCzL2pSTE4gEMj5ilP6Mj5QDMs5fSKq
 aU6i7RxH1vKz8wZmXZMO6+oHoIZ9Egc4oZJGbfjHKwk0r4fisRoNL2X0WpHus3sQVH+R
 5ZT3eb0k3zk9AvCL05aLGQoNQ/1ZbynN9jRRam4CQ9J6blnrG4MiNuDVIuGe3HJAaei6
 9gEp5RxMLEZI9gaGqn9t6RI8FP4rLT3DUr7uO0ln7sFb4GDFWjlVuiZ2TqfY3MXwOq7N
 vqg0dnNkgHsgC5LIWZ/GX/0dnXj/LVIGr2UqtcIcJxF4XKbw6j1jtlF8qzx806XSIO12
 HY8A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpYvJWUmBJ/5EKHvbKsTCr+dpSxr9GhedBjVDJfZAYBR8fSICOcRvIVFfnis6rZZ1G00czIe3/ZFIj@nongnu.org
X-Gm-Message-State: AOJu0YxAuSPsr6rMTg3UcoTsdf4Ns76GskWeAwLhkUdQLp97chdkOsFI
 M7sU2jgxrRJ6lv6kp0/JW2Mr9ueWqI2T45KYggicbHj3o/ZJ3bElpobVz+wk1BrBK2M=
X-Gm-Gg: AfdE7cmMEJ6FV5Fb+GbmWzmTODcvM492XSJtO11UqFKayqLAnfRuyKoqNX3gMe9doVr
 7fv3jdILH3an3wYcNwFY7xLKZPIDwqoR7kl4a8LkXrvsLi3a8ANevpDrUEI3LU12EpGNJ3KmHcz
 +bF+Ldd/eP73uiShCu6p2L6b8yr01RfXBLaJKl2siKklIMFjbss6tFf5qIRHD2fPtv4tQ8UJJoY
 KiDi3uLwq9mHv2Fw4aWxjC9A84CNIlLjl+DaClcBnlldYNZBiKylOIMrX6G1aBhYewDFc+Mv46R
 LQ2Eqm+wqwd8oOVJkWVQqWTFoVvsDYDq1L8Gyu8UKOIHnbTKYIB0d60D+EbMwbz/GUlyKvwjxU7
 XJVxnms7vx7Wsj1uYy/lv8BjdiD4A9/qA/O72WpvACWashF1a6T0cSUD2j1DTR08HcMTdpEI+GQ
 fJ4zvqvxBTkCntX2Bk8TESwckqMyqP
X-Received: by 2002:a17:90b:2f0d:b0:37f:9ce1:7360 with SMTP id
 98e67ed59e1d1-38dc77aba5cmr457732a91.33.1783717073029; 
 Fri, 10 Jul 2026 13:57:53 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 50/51] system: Use tlb_flush_range_by_mmuidx in
 cpu_watchpoint_insert
Date: Fri, 10 Jul 2026 13:54:00 -0700
Message-ID: <20260710205401.836304-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Update to newer tlb_flush api and flush exactly what is required,
not single-page vs everything.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 system/watchpoint.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/system/watchpoint.c b/system/watchpoint.c
index 35cb3bdaec..fe7e0ac59f 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -29,7 +29,6 @@ CPUBreakpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 {
     CPUBreakpoint *wp;
     vaddr last = addr + len - 1;
-    vaddr in_page;
 
     assert(len != 0);
     assert(last >= addr);
@@ -45,12 +44,8 @@ CPUBreakpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 
     interval_tree_insert(&wp->itree, &cpu->watchpoints);
 
-    in_page = -(addr | TARGET_PAGE_MASK);
-    if (len <= in_page) {
-        tlb_flush_page(cpu, addr);
-    } else {
-        tlb_flush(cpu);
-    }
+    tlb_flush_range_by_mmuidx(cpu, addr, last, ALL_MMUIDX_BITS,
+                              target_long_bits());
     return wp;
 }
 
-- 
2.43.0


