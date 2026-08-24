Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEACC5DF9B
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 15:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyWWw-0003m9-GQ; Mon, 24 Aug 2026 11:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wyWWl-0003dc-Op
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 11:23:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wyWWk-0006sR-2w
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 11:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787585035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mq0VL5IOt0OWrfZWdj1Tq3ZXi0CqelrWqpmzxUIR4s0=;
 b=NHHu4RFKHC5zn586WeZCNrMEceEoWUS5j1n7VjE8A2KcB+EsgAvWI8qFT8ypmhFzrMuptv
 6kGVJDs0sLQY7KUUtxf5jszZOxtJG8BMEiAYBnxSryKL0+g0igHvnxQjRuVxQG2OvtEPiE
 ZCtj3V5EExKb6JDNMa7R4Y286LBgmVc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-z4SkuwWdOSOJJmJXaqo05w-1; Mon, 24 Aug 2026 11:23:54 -0400
X-MC-Unique: z4SkuwWdOSOJJmJXaqo05w-1
X-Mimecast-MFC-AGG-ID: z4SkuwWdOSOJJmJXaqo05w_1787585034
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5174a236220so47508111cf.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 08:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585034; x=1788189834;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mq0VL5IOt0OWrfZWdj1Tq3ZXi0CqelrWqpmzxUIR4s0=;
 b=MYYWUipFFMlQT7dHbK3QialI7fhx/irEF0TLstOy+MJIjYhjA9Q16D/1ZLU6qNEm4U
 iUmJXLr88eFyZ1NYRuPPnfgKnbEvwj13jG5JXAFMcRW7Fge1pLGpol2pgTYg7zAQEIrX
 nlPsC5vy/6RanO9B2fElpHh/PikvPdD3fsTAcX9OubsEngsY2O7m3ZM4lTGUn6eC80ZD
 l+xMZLBy8iqAYIDcLbIS7aZP7zhhWwc27t00n0C7zeUPwecqnBkE5p1d5lN4oEafkJ+m
 SSIBkSOEcq/AP2g1DSeBRuLbvarw409Z5RCbuMMoTrMJ/DAdv4KSb3kJXTwp1KMT8uBy
 tGJQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrrMx6WP13hUi3bpmnbAw1c4wWaK7fBXL+k6XaHhEU5l7NVJSBTLJtAOv9LNmAAX/ee4xKmdcUornjW@nongnu.org
X-Gm-Message-State: AFuF++lvf89SA6v3gG4SSk25TviWQHzatsaW7TbHyLiBUte0SiinNZaT
 yjirYjklbzk6VAH4moGcmG5y9+iqSNl375bia6heeWjsWKdzXKzZowDmJBJc2LJxXWk5gs7PZ7G
 SWwjBVALEaFEfDP48zBW44duw1NSzLQhrpyDYMcG3lB5ZHriTcRKLmsD8
X-Gm-Gg: AR+sD11QGpcWqtyzJTrhmlV9aCM2DWTKrif06zrT9m8K7xrrPXOg28BlvFHNuwj2Kl1
 SYhz7yA8RUOprz0I0vZPTOiiq+D97lbeiQd9xZQV42WePW5BR5jFIKjgcQZFpFUIP/8cMq/7WJH
 LBkfuUb9KSYnoYg/d/ceBmcPk48BXQii2J1jpPzkYbLIkycZPAkXyWLC+RQKWWgMkOAXzaNlS93
 +WqSedOlJ58dw+mGWVteBLs2ew66jAiU/ykIq8XcPzXO3OSaWMsxI9/zOJE21bv8/y85jlzajYW
 V3xt5xeYNYQ6GfQALHPnycojBWLJ74yf4tiV8jDI4Ee6nlVtVFmh74/Idle3OKhfjwGt
X-Received: by 2002:a05:622a:a12:b0:52d:f12c:59ba with SMTP id
 d75a77b69052e-52df5a3d5b1mr261870651cf.33.1787585033701; 
 Mon, 24 Aug 2026 08:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a12:b0:52d:f12c:59ba with SMTP id
 d75a77b69052e-52df5a3d5b1mr261869541cf.33.1787585032987; 
 Mon, 24 Aug 2026 08:23:52 -0700 (PDT)
Received: from x1.local ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e09975f5asm50691141cf.2.2026.08.24.08.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:23:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:48 -0400
From: Peter Xu <peterx@redhat.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 pbonzini@redhat.com, philmd@mailo.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] virtio: Add aligned ld/st accessors for vring
Message-ID: <aoxiBB2Wn8NiL5s6@x1.local>
References: <20260821100856.1794011-1-xiangwencheng@lanxincomputing.com>
 <CAFEAcA_kLpaz0UQi3Q315kLVqvDtxKh77kU2meN9G1_evfKBeQ@mail.gmail.com>
 <bad5c8b3-668f-4893-974f-9dbca8dc6893@linaro.org>
 <02da9676-febf-4389-b09b-5e5d41c1084e@lanxincomputing.com>
MIME-Version: 1.0
In-Reply-To: <02da9676-febf-4389-b09b-5e5d41c1084e@lanxincomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H8BiYH_xsZNJMRVLYPG1eByR0hzGF-VvVw4Mbz7Ly1c_1787585034
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On Mon, Aug 24, 2026 at 12:19:15PM +0800, BillXiang wrote:
> Hi Richard, I've read your code in accel/tcg/ldst_atomicity.c.inc. Do 
> you think it would be better to make the load/store_atomic* public?

They do not fit by default, as we need to still process unaligned cases?

I wished we can use qemu_mem_move() directly that just got introduced.. but
it does slightly more than wanted.  Maybe something like this?  Below diff
dropped ldsw_he_p() alone the way as it's never used.

Thanks,

===8<===

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 387d65c0b0..04a0f63612 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,6 +1,7 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
+#include "qemu/atomic.h"
 #include "qemu/target-info.h"
 #include "exec/memop.h"
 
@@ -238,62 +239,52 @@ static inline void stb_p(void *ptr, uint8_t v)
     *(uint8_t *)ptr = v;
 }
 
-/*
- * Any compiler worth its salt will turn these memcpy into native unaligned
- * operations.  Thus we don't need to play games with packed attributes, or
- * inline byte-by-byte stores.
- * Some compilation environments (eg some fortify-source implementations)
- * may intercept memcpy() in a way that defeats the compiler optimization,
- * though, so we use __builtin_memcpy() to give ourselves the best chance
- * of good performance.
- */
-
-static inline int lduw_he_p(const void *ptr)
-{
-    uint16_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
-
-static inline int ldsw_he_p(const void *ptr)
-{
-    int16_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
+#define  LD_HE_P(type, size)                                \
+    static inline type                                      \
+    glue(glue(ld, size), _he_p)(const void *ptr)            \
+    {                                                       \
+        type v;                                             \
+        if (unlikely((uintptr_t)ptr & (sizeof(v) - 1))) {   \
+            __builtin_memcpy(&v, ptr, sizeof(v));           \
+        } else {                                            \
+            v = qatomic_read((type *)ptr);                  \
+        }                                                   \
+        return v;                                           \
+    }
 
-static inline void stw_he_p(void *ptr, uint16_t v)
-{
-    __builtin_memcpy(ptr, &v, sizeof(v));
-}
+#define  ST_HE_P(type, size)                                \
+    static inline void                                      \
+    glue(glue(st, size), _he_p)(void *ptr, type v)          \
+    {                                                       \
+        if (unlikely((uintptr_t)ptr & (sizeof(v) - 1))) {   \
+            __builtin_memcpy(ptr, &v, sizeof(v));           \
+        } else {                                            \
+            qatomic_set((type *)ptr, v);                    \
+        }                                                   \
+    }
 
-static inline void st24_he_p(void *ptr, uint32_t v)
-{
-    __builtin_memcpy(ptr, &v, 3);
-}
+LD_HE_P(uint16_t, 16)
+LD_HE_P(uint32_t, 32)
+LD_HE_P(uint64_t, 64)
+ST_HE_P(uint16_t, 16)
+ST_HE_P(uint32_t, 32)
+ST_HE_P(uint64_t, 64)
 
-static inline int ldl_he_p(const void *ptr)
-{
-    int32_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
+#undef LD_HE_P
+#undef ST_HE_P
+#undef ADDR_ALIGNED
 
-static inline void stl_he_p(void *ptr, uint32_t v)
-{
-    __builtin_memcpy(ptr, &v, sizeof(v));
-}
+#define  lduw_he_p  ld16_he_p
+#define  ldl_he_p  ld32_he_p
+#define  ldq_he_p  ld64_he_p
 
-static inline uint64_t ldq_he_p(const void *ptr)
-{
-    uint64_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
+#define  stw_he_p  st16_he_p
+#define  stl_he_p  st32_he_p
+#define  stq_he_p  st64_he_p
 
-static inline void stq_he_p(void *ptr, uint64_t v)
+static inline void st24_he_p(void *ptr, uint32_t v)
 {
-    __builtin_memcpy(ptr, &v, sizeof(v));
+    __builtin_memcpy(ptr, &v, 3);
 }
 
 static inline int lduw_le_p(const void *ptr)
-- 
2.54.0

-- 
Peter Xu


