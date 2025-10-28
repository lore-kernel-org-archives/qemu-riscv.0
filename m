Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F39CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoMC-0007Q1-Rq; Tue, 28 Oct 2025 14:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoMB-0007Ns-A3
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:23:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoM2-0002tW-MS
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:23:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so4000655f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675808; x=1762280608; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoHwNhtMDor8o+FjGbtvuP7x4iyOcb67+1ndjCl6FPs=;
 b=yL3dPBqlxVHcRk8gQDSD2o7Goafp2GwUkDcIllWjk6hgmj4jQbOWDmAqABGvYhpsgk
 noMGdyGjAfQEgqsh/xgpFUOTdRM7Nbyz2LnCV6mcZVAULhwoSvzNHJn/g3O02N+qzoeI
 bgqI4yJer31l1QzkRBV79GeEhkjyDK8WVDA2ttM58ljiGn9nyAtboysscWajLgVFnH5a
 0U4bB/c0QLGXKqmA2FoP7PtbMJZWxcIJM8PDuL6MQxYM16g3nVG+fSYMs7WHw8DZD6Oi
 OvApPqgVgMy6kZM8zdI0ucB8g650k0ls3lZHPV5ezP+hRZMjIlqOfMSBcqKVu24WLWqJ
 uV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675808; x=1762280608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WoHwNhtMDor8o+FjGbtvuP7x4iyOcb67+1ndjCl6FPs=;
 b=GKOwWH9LCZux58tkb5vpKQi90ZEBwQFjBCaNPMtkr+qUbw01/r6EFPjP/Dkv1t5Fpo
 gKFZ2QpjTbZBgpajdP4+ZJkEhbszMiRVpUPxJA9VPQKf0RRAGFduhTPUiNSrGPxvTZ1K
 ZDpkum+bRC8mVwwLN7ZCGSJ8JRjdclDzgGsUM+HhVKw7Fy8iTAnpA3y/nKiSTlYdhmUw
 BqYFgVyjauBUy7sSrE8E/awizyw6Pk5Q+f+E5rG8mPJzdJi7NnYwbWO5qCN3C/ziow6h
 MgIqlckFiJzj2j2fZIr+EqTRlnakDYjduf3rSoZREfkB0JqUjrfUX/Cylkr5IRLigKMJ
 nCXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Hnu6YA5Yczm4XP8W2or5S54DycLGljZxefsjtGJcCJM2rctaMkPI6xkyKqFVK9ry5w2b1Di+Z2l/@nongnu.org
X-Gm-Message-State: AOJu0YxaOVHPi5RcK1iZES3klPU0nyeC27xnRLq4V96ZNaWdsQXYzOox
 Zldoljr+4zhMhyXgO5hZTAvooXCe6LklUEyH3kY6U/afID9YDiTCoTjX2uo+oY8j6P8=
X-Gm-Gg: ASbGncvhpT5ucgKgTq2ZvXxwTJ2wjLR6LIEFUHJ+QDFLymeo+bY668TxNaudrvNAMrR
 srxmj2bvv8yR8AWnZy1f6QIZQIVvu0jeKKOXzZmG/KykAN9vp7/9EyjucsVDhRi93alH+ON+IUn
 90VODYDx/wciGCTk9Mo5t4Bqc88qORzzqAZrR3fpCcXacLWhvLyIKQEt+1JE5osOtZUqZA54lBK
 KDjAQzfDNb2LmthgpNryJBj0Z2WADsJR3bY3cQrDEr+1aXR30f5kWZArF6tCr5di+F4WpT7M+TY
 EEP9tkYQwATb7N4sS+1SvnbfjZ7b7BCNwJgVIlFARWOjCZSNrOQqLrVispjztkQUj94zharNJsb
 42n9ClSpT5Lj2G1BTfnig8Pq1c4YNhycDsl+aoYitRPoDA0ObDDyjmcNL4QKq2S7RDA9IU9DcQN
 M28y1RNAaW6J1USJy2n5gdRQ3vtCcK6GBzrsfXWLsb4N2VahE0Sw==
X-Google-Smtp-Source: AGHT+IGri986WtJrSWRuJcZKJ1SgsvgYMCfKaC5tw5REdmYqAIJDfJN/fbTOMrDLAUOSMV8GEimzLg==
X-Received: by 2002:adf:e18b:0:b0:428:3ee0:6953 with SMTP id
 ffacd0b85a97d-429aef7898amr36378f8f.3.1761675807789; 
 Tue, 28 Oct 2025 11:23:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm21385316f8f.39.2025.10.28.11.23.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:23:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 10/25] system/memory: Have memory_region_size() take a
 const argument
Date: Tue, 28 Oct 2025 19:12:44 +0100
Message-ID: <20251028181300.41475-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Since the @mr argument is not modified, it can be const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h | 2 +-
 system/memory.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index 3bd5ffa5e0d..45de6946812 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -1776,7 +1776,7 @@ Object *memory_region_owner(MemoryRegion *mr);
  *
  * @mr: the memory region being queried.
  */
-uint64_t memory_region_size(MemoryRegion *mr);
+uint64_t memory_region_size(const MemoryRegion *mr);
 
 /**
  * memory_region_is_ram: check whether a memory region is random access
diff --git a/system/memory.c b/system/memory.c
index 8b84661ae36..d1c060b2b50 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1870,7 +1870,7 @@ void memory_region_unref(MemoryRegion *mr)
     }
 }
 
-uint64_t memory_region_size(MemoryRegion *mr)
+uint64_t memory_region_size(const MemoryRegion *mr)
 {
     if (int128_eq(mr->size, int128_2_64())) {
         return UINT64_MAX;
-- 
2.51.0


