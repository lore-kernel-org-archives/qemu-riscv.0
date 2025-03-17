Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACA2C28B28
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJZ-00053a-MK; Mon, 17 Mar 2025 14:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJA-0004ir-KK
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIW-0006CZ-94
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:28 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224191d92e4so91700745ad.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236479; x=1742841279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL1NPApLGPlk4f7q724/4D7b3IECBRPwWShMeYRIDxA=;
 b=VX45PaRBKrM5bPwLpkies1jMXFghyrgBtIsEnV27lD49ME4rjhBYaCSMYb9yfOS0RC
 atESC1ErR6X2WWeIa1grC5c4q5hNjeS7RPvrJ0cIz5crpnmnkt35EwuvmWcEMqKbkfnu
 0j+iQQZ8jm0NjK34nMQQ03gukXQWJnvFVBMYZC0Rsn5WD0ekv+ULNNP5dyOeIKt8wHIm
 50UwO3eCoyXm7H+Z1ybjwjIegowMg8KZMpXlqHPKc2ereTYVU3/wYEAeb7v/pS+MwrFS
 Tk0jCm4gSAS7MWTjwYxXeHRI8VC9Q7h0SJP20SJOUCfsuSmftAkML7A/2h9H9m6rXYry
 in2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236480; x=1742841280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RL1NPApLGPlk4f7q724/4D7b3IECBRPwWShMeYRIDxA=;
 b=jcIYTqrIPCMRbiRM7tJ/dwDc2tD1n5PP2U8tQBftLA9EI7VRBidbSFbmDv+7CHvTh1
 knBWOx6IK0DxkRt/h4WBaR/hW6NdHKUokqQs+VIA+aqyC1H6rhcHmD06BXYidwaLbZp9
 gvzgk3fEyCS+kZOSxbg+lnveX93Y0/qhnIqnCMYfIWrl6fzyCZvl5DHw4TR2DZUvKtkF
 Gy8JOQzOYzyyPxcmkQAIVUpErvP9ZXliqq3Ke8+hnAMyOG7jFf7qWGa5Kd6VgdBqjpR3
 AFRB74m6h0DrmI0jzIt4/8zCaPukYU6NqHLixzfWjksXD5HkioMHBrfXcEhRRvbRdrhB
 2b/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTZvgjrTasApuvDjm3vD3QNMJCmtdmiGrmcMd4VPuQauXj7xEXF+/kBwcOUyrG0kQ5VMu2EBWpnmlT@nongnu.org
X-Gm-Message-State: AOJu0YzLE3vdCtGHgcuC0w3vTGj0ih+w0Klz3EyMApMtWQJoK/Q9CUj2
 rR4qYd/VkufxOcxWyJPB7AFpzErR2KPE2edUgngwLJPiNgfmlj2uPPC4IhKaHF8=
X-Gm-Gg: ASbGncuga+S6uGVNW9X7b2BK1oVSOE2XPpoM7/vYYMILH8PtlW7hbaFfneA0kXF5ZEP
 u0GkvN6ll0pMlfyTVla26Pjd5nzmzJ7fwv+y37esvJgjD4ocjuAhwzpyrFH6LpNcEhAWsdabMtJ
 2V8fgweexFlhl/hR/MmHlb2wvVPmvJzZD9Ikbzl13eNxeLQ0nz/xNrby/GFs7YxH6+qFIkrDVYK
 lvT+AOn5yv0ErtLsdrOmVIpyqHCeW1f5L0+z+mWUbROQrBodWip4ZUTZkBtezxkvRBhItjdvXJ5
 jrFb/3BRO+Gv+Tziup85w0hbQ33Yv+YuOOePKHUoLOhr
X-Google-Smtp-Source: AGHT+IFOOeyV31jwF+pNrENhCRDzbP+OAMMjvkw2JiLIZfPvEZk2AdzmBDyPiAzaxdBUCsyNl+0UJg==
X-Received: by 2002:a05:6a00:1c83:b0:736:54c9:df2c with SMTP id
 d2e1a72fcca58-7372240f41dmr13708249b3a.15.1742236479639; 
 Mon, 17 Mar 2025 11:34:39 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:39 -0700 (PDT)
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
Subject: [PATCH v6 13/18] system/xen: remove inline stubs
Date: Mon, 17 Mar 2025 11:34:12 -0700
Message-Id: <20250317183417.285700-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/xen-mapcache.h | 41 -----------------------------------
 include/system/xen.h          | 21 +++---------------
 2 files changed, 3 insertions(+), 59 deletions(-)

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
index 990c19a8ef0..5f41915732b 100644
--- a/include/system/xen.h
+++ b/include/system/xen.h
@@ -25,30 +25,15 @@
 #endif /* COMPILING_PER_TARGET */
 
 #ifdef CONFIG_XEN_IS_POSSIBLE
-
 extern bool xen_allowed;
-
 #define xen_enabled()           (xen_allowed)
-
-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp);
-
 #else /* !CONFIG_XEN_IS_POSSIBLE */
-
 #define xen_enabled() 0
-static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
-{
-    /* nothing */
-}
-static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                                 MemoryRegion *mr, Error **errp)
-{
-    g_assert_not_reached();
-}
-
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   struct MemoryRegion *mr, Error **errp);
 bool xen_mr_is_memory(MemoryRegion *mr);
 bool xen_mr_is_grants(MemoryRegion *mr);
 #endif
-- 
2.39.5


