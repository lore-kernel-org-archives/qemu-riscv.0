Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C9AC282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:35:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJN-0004tn-8H; Mon, 17 Mar 2025 14:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIm-0004Uu-2d
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIR-0006Bz-Vu
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225d66a4839so58052475ad.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236477; x=1742841277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
 b=LyrkipDVKnFVG8gmAPmA6kE0IUfpMrbKOfXTPtpyUVaGx+Xmd8iNQzSF71IxI29zYA
 nmXuG5THH2A8/fmHsGTpHfIt8l9DMCV4u5rZbBG6fSLmQ395aEv45giJ8+qYiSlFnLHz
 4tlOdPh1WsS0Iyg2DkikTBNEPUKLr/KR8N+GOpEicqpz1FiGUk//vKQnhhFRHusJVftC
 UkXGhywPPMnhcQ3iXdMWESSx51ho5W+LnrUDPWEN7CF/bWKzzEcVEWwY8VExCnFHvYnQ
 90qQiSCqXu3c7rsOfBKJxGjToniO04GL+8EIvM6/buyzup4o3MDH1xvcx75hMN4GHOEC
 MgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236477; x=1742841277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
 b=FXr6p+Dzz/YaCxECa1ZfVgiV6Nwy4U3OFGMsla9lM/3PJx9iBlSDSpQGF5XN6gKHHy
 Wi78NnjOPs1aNkOYitaBnP/UxPhXzQWUDer6WYksGEhWm1Q/fXQQ8J1/WxHUlZ4beN9p
 ORTHRtXiZBbnjQHBKelgQaoiG+TvA/B0Dq2/qOifLgSmj9w2eN1xY61dg0CXZ+1e7kPK
 D6huJrwsevUKcNR5tYhvuGhAw7F3gj9dQI1GwQMlylhT9ZLBxKFxwwETpiPoiK7cKHFX
 JPupSB1tEHuOarV5lgQn8CYLvHhiDJWmqA+L1mT1QbO+OILsgPv2g7i6ZBn0R4U2CmZZ
 fPZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEYnXRUxcsJZypq0eQBmcTe35Hi5TTMYrlvly1F4rb1R+Co4F5FEtUafYoVh6pRpqJaO4eAg4+pWID@nongnu.org
X-Gm-Message-State: AOJu0YxHzSkayhzBj9oOaBa8bwYN7qDK35Z0vFlmYNWO8nR/MdFqrX4b
 Fz7CYko96cS5bydEVHc5bouJPJjOcFI5go2I3hTI9clzN1Pw4mnvpUON0f/LOAw=
X-Gm-Gg: ASbGncvqXnIPJOUxvtIOYrt0ATlxdOre2MsZBN3cBol7oqWALh1sYF9nAerJ2M2HPRR
 bt80/cEDONI41mpOz2kVOa37gMKoNchnp5egnZOm8Gfn+JrgXeI2syxKKsPU87s95bvj+VBAEtx
 CnOpKQD8UeYhaaxhjr6JGtQDZyt2te1YwDA0enqqOseXZ5TzK8zuKUsyBUFTTnjPgfWjqgbPHcg
 kGSmByOgNkWUIPhnRJdRCXTvS9XBpPEuhY6PP+YyUsU9SO5K0/7HXG3IQFyNZCEVMa+lgyYYWfa
 o0WD1jZXFaDQ/SQ04F3t14k0tDke/8uTNVrZhCl/2AOL
X-Google-Smtp-Source: AGHT+IG3g1g1/S4GhLMViIQmdttYJlPvvQDr2HFvFncsoI+sX7+pFPl4do/KG0rupNOCudw5OLu0nA==
X-Received: by 2002:a05:6a00:2d8a:b0:732:5875:eb95 with SMTP id
 d2e1a72fcca58-7375778c1femr704383b3a.4.1742236477316; 
 Mon, 17 Mar 2025 11:34:37 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:36 -0700 (PDT)
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
Subject: [PATCH v6 11/18] exec/ram_addr: call xen_hvm_modified_memory only if
 xen is enabled
Date: Mon, 17 Mar 2025 11:34:10 -0700
Message-Id: <20250317183417.285700-12-pierrick.bouvier@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f5d574261a3..92e8708af76 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -339,7 +339,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -415,7 +417,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
 
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-- 
2.39.5


