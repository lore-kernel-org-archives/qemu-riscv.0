Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7600EC35FF9
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuDEZ-0000IS-GK; Mon, 17 Mar 2025 12:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuDER-0000DR-7Z
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 12:22:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuDEN-0005Hk-Jp
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 12:22:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43948021a45so24673305e9.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 09:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742228541; x=1742833341; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WBWphq/OPjakrsPO4SntQfTseOUfZZyLOvc4sgW9R8E=;
 b=SlPo+u7cy6zkKYkP2Jkj+wBcXPNwXg+34VDEzE9SwdjfuUKpfCw1otuSYeJzclmTII
 RhKlkXB5xctOrrS5L1ss8f0ko9XtC2RbbS0BQNf0hwixTuT8PePvSK9gzuTbyjhJolhN
 JzkaYEmfBGhRiN6lpCubNOzvMgtsqDoKhGWh18esl2jiQo1gnJJpnvx8qKcm5GfIUh8i
 ZnenDdZJP1BJ4WdIpbBf+xq5Cb+7m7/PlbYesP9/CIWE2YCrffvyxBZYy7iiYfb81KlD
 9S6zfZWMxym1lh4gO1IFrhSLaHZEcyI0qmxW6zjqq9rZTJXzI3WNaRd3ssQ/rSxxMeP0
 kFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742228541; x=1742833341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WBWphq/OPjakrsPO4SntQfTseOUfZZyLOvc4sgW9R8E=;
 b=o/4NrrCHkuHntGxDZTgHirFvXCMXdP17gMFRId68Z26xkPbFkDbWPJaebL39vT9O3Q
 Ks7pO1H+hrn7cuj8S0ARuPIatlpiq669p3i66jpZebfZn0mZkLcblXleZy8fHImdKyIx
 poSgdg0e3PnLmoJWzL976D6TsjQeGwCNS+9sfWGQfiYm039D6H+wdbW1ZLM0aEGfi0nK
 U523sbl0cy9/FLyHzqmZsuJok1qFLWQSD6x1VCdhQgscbGLxBFXvjv6Jyr8OHllyCONu
 LGWVYh5p5xxwThiLSZ+8swj3uWgr+ftzmd8z2bQujHVhihxYKJYMOf6MyfIBG/rblc74
 fGdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqiUgAIzVf16eeh9LdXNFTT/rkL/YUo2/5cN+9zw/Ll2kHRboU8Xq28+gDD7H7V9/lUUSx8pgv2bTE@nongnu.org
X-Gm-Message-State: AOJu0Yy9KdcKMVehZGWXQr5Zq8iMekTURL/0/OwmVyywzXpwhcIXkQ2v
 eH46NCTmnJjoFa7JgRNqaENcdxIRJwLueEA37ADyCMqbks7BUrg0HrIcuxiTfH0=
X-Gm-Gg: ASbGncsDPC7ynz4Mw4AuaA3hMXkS+xZ3QYCpBbxMQyqX+yC0hlctpN/hI51nvvKfw2A
 xVuAtR/epXQ0fczkJaycHXekvRl1fdB0HZOhq7xOtSeMnnrag27PDU84iSD5zOpqJ+rsMl/zvZr
 uosGHBKPZmYPSU2L/xpkGrv4dE23zcaJvojNkwzi645mj+JOlvGfkApbMWy/4fBP5RJUW6UAY1G
 HEWddNp0wa13gAGirQEjTzkO9b5kSoGhfsNGbAYOrTmcmdTvd2gC9lgEtWHAC64w6ncHZFuRT+3
 bhpiMJxnPZEiq7xBmC/nrOzQQpMVxK0imYrmwESan5rZYjo4cITJSn3vOR36H6ud8Dr0WJij6EV
 ELVsu16E9pw==
X-Google-Smtp-Source: AGHT+IFVNxcAnyCyAJ8pmBaH3OaDkbaFSIvHPQaBVVLvnxipFVeLkYJbNl97a+qtcZml3R72Eig+Jw==
X-Received: by 2002:a05:600c:46c8:b0:43c:ebc4:36a5 with SMTP id
 5b1f17b1804b1-43d1ec6946cmr141436605e9.7.1742228541177; 
 Mon, 17 Mar 2025 09:22:21 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdbc36dsm69896975e9.0.2025.03.17.09.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:22:20 -0700 (PDT)
Message-ID: <9c55662e-0c45-4bb6-83bf-54b131e30f48@linaro.org>
Date: Mon, 17 Mar 2025 17:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
 <ad7cdcaf-46d6-460f-8593-a9b74c600784@linaro.org>
 <edc3bc03-b34f-4bed-be0d-b0fb776a115b@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <edc3bc03-b34f-4bed-be0d-b0fb776a115b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 17/3/25 17:07, Pierrick Bouvier wrote:
> On 3/17/25 08:50, Philippe Mathieu-Daudé wrote:
>> On 14/3/25 18:31, Pierrick Bouvier wrote:
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    include/exec/ram_addr.h | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
>>> index f5d574261a3..92e8708af76 100644
>>> --- a/include/exec/ram_addr.h
>>> +++ b/include/exec/ram_addr.h
>>> @@ -339,7 +339,9 @@ static inline void 
>>> cpu_physical_memory_set_dirty_range(ram_addr_t start,
>>>            }
>>>        }
>>> -    xen_hvm_modified_memory(start, length);
>>> +    if (xen_enabled()) {
>>> +        xen_hvm_modified_memory(start, length);
>>
>> Please remove the stub altogether.
>>
> 
> We can eventually ifdef this code under CONFIG_XEN, but it may still be 
> available or not. The matching stub for xen_hvm_modified_memory() will 
> assert in case it is reached.
> 
> Which change would you expect precisely?

-- >8 --
diff --git a/include/system/xen-mapcache.h b/include/system/xen-mapcache.h
index b68f196ddd5..bb454a7c96c 100644
--- a/include/system/xen-mapcache.h
+++ b/include/system/xen-mapcache.h
@@ -14,8 +14,6 @@

  typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                           ram_addr_t size);
-#ifdef CONFIG_XEN_IS_POSSIBLE
-
  void xen_map_cache_init(phys_offset_to_gaddr_t f,
                          void *opaque);
  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
@@ -28,44 +26,5 @@ void xen_invalidate_map_cache(void);
  uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
                                   hwaddr new_phys_addr,
                                   hwaddr size);
-#else
-
-static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
-                                      void *opaque)
-{
-}
-
-static inline uint8_t *xen_map_cache(MemoryRegion *mr,
-                                     hwaddr phys_addr,
-                                     hwaddr size,
-                                     ram_addr_t ram_addr_offset,
-                                     uint8_t lock,
-                                     bool dma,
-                                     bool is_write)
-{
-    abort();
-}
-
-static inline ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
-{
-    abort();
-}
-
-static inline void xen_invalidate_map_cache_entry(uint8_t *buffer)
-{
-}
-
-static inline void xen_invalidate_map_cache(void)
-{
-}
-
-static inline uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
-                                               hwaddr new_phys_addr,
-                                               hwaddr size)
-{
-    abort();
-}
-
-#endif

  #endif /* XEN_MAPCACHE_H */
diff --git a/include/system/xen.h b/include/system/xen.h
index 990c19a8ef0..04fe30cca50 100644
--- a/include/system/xen.h
+++ b/include/system/xen.h
@@ -30,25 +30,16 @@ extern bool xen_allowed;

  #define xen_enabled()           (xen_allowed)

-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp);
-
  #else /* !CONFIG_XEN_IS_POSSIBLE */

  #define xen_enabled() 0
-static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t 
length)
-{
-    /* nothing */
-}
-static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                                 MemoryRegion *mr, Error **errp)
-{
-    g_assert_not_reached();
-}

  #endif /* CONFIG_XEN_IS_POSSIBLE */

+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   MemoryRegion *mr, Error **errp);
+
  bool xen_mr_is_memory(MemoryRegion *mr);
  bool xen_mr_is_grants(MemoryRegion *mr);
  #endif
---

