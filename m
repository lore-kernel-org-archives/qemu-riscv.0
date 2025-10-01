Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6471BCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQK-0001CL-Ml; Wed, 01 Oct 2025 11:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPS-0000sz-FV
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:06:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yOy-0000e3-Ci
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:06:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e3ea0445fso32341535e9.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331147; x=1759935947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLGQVBAj1rcgUspN9zx226A8KWyP7OIjQQo0oxF48cU=;
 b=xjSGLFp0nFTZwfMteRih/6OdBfiSGkQ7W8LnftadynpMQ8H7LgvnFGkFwQFizg/070
 s1EmKcWkrgNgRlpnmpzFff+VuEJWgX+LKz94b75veoj6sVspuEYB9wj/7Jr9iiCmwzzZ
 1SSXuJbx3HvZzawGsfvQb77FTZrqehGoJaPZHd8qk53q2gGGZSGSgmY/CarrIt7NzIxl
 ulo7LAyi1AKchVIPfjutaWvkjWSvJVeA6bUOJ0HRy8WMSGM6fvPRgklibv09jUbLcFQq
 weABXPNGK/ceEJgqy7bq0G3xDWYEVrhn/0av9n6I1Vue+Le6MWGyNrQ6BTHM3kRcY2at
 BD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331147; x=1759935947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLGQVBAj1rcgUspN9zx226A8KWyP7OIjQQo0oxF48cU=;
 b=qOsgouyD0thf5KlSDvwcPXXe5kUpQyUvqq/NOUUIWOLU62Z1+QXmT5OgIkTei6VfIe
 upS4KRzQGZflcji+oVdxMck/3i9qsVG+k+a1uDAKlWw+bc98CVmcBaCXN/cCG+rmDvci
 rAdPZRNxmmKLi5k1jJ1dYQtA05+GtxW4fUx3zW0OIIoszxyrN5otEb2+BDjaI5EbVdqg
 zHeKzSrr49yQ2j8rTAUNCn5ECdwcmKIAJjp7o8CymZIg+eK5ScKQ16CRJwYK43+x2ZC9
 t6f7EsciTg7fZQA38askyG+H2iPnIL15g+hOHyu2ZPVH+gm3fMdyra1WUwW5ksINC4hK
 HzwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqRCrkCNS/dPI0fBHtclbB7gks3gP8sdsaJXp+Hr8OrxcXWGdvvFHTwW9xyCoE8KEwdCN+4Y3LfyYN@nongnu.org
X-Gm-Message-State: AOJu0Yzl84AqYrCt+e7D5avzsoVPwpKxdKYvSkgYUUo8rW6MZnW9oIH0
 IVWP/6oEJOSy6LBBQG6lU2x/xGcHaYVhTm89b5WpcfToAp6ra3VuDENtK8rh++IlNmM=
X-Gm-Gg: ASbGncsOLa3Z7cA1FzDpSuDVv239SynRJYzvzz4zy+4KxhcFfL0XFRB4N7IQyledn8c
 mjHkddLCu6eoT5blrfwdHMi87ySZL2r7epdGG4+v5S60BCLgGVfZFjD4622aQ2BH6ZUr98cBKtY
 K+jRbmnFECN6B+8CyGy1BgJkrWyA/bNYcA5S7YGkal4rEGolwOnBuU4Pu8a2TUdo/capFWKwyr4
 8OlyNPHigh7aC43CvnKPUuWBHQHW/8OuWUgwqCD7Vf9jw05ksO+bjf2e9aMiAN7OQua2lrpMKJ+
 CnOSsTI+5lIIHBDD9GRDSEcZ29gpUOnwjuv761bmvWadpHQBWdZ9LxKNw05Iv8Z++RxfognJUzk
 ev7cHDcNdF9ETiUNxo0OTzqztivpqxQ9molOBQmLZcHOeo2N4C7ej0avijg34fgLOcPwKynS7Y9
 Ki8nkS4+jWZp6wIiR43aMw
X-Google-Smtp-Source: AGHT+IEw/I3t/hR+beu96KQ4fixPA/nLDOj6cWuw5ZTikLMncMzZdCbTPA0H/HICehs2+NTOrJVv1g==
X-Received: by 2002:a05:6000:1842:b0:3ee:1586:6c85 with SMTP id
 ffacd0b85a97d-42557a1be4emr2862405f8f.57.1759331146611; 
 Wed, 01 Oct 2025 08:05:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603365sm28488541f8f.37.2025.10.01.08.05.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:05:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: [PATCH 03/22] monitor/hmp-cmds: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:08 +0200
Message-ID: <20251001150529.14122-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 monitor/hmp-cmds-target.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
index e9820611466..602af851328 100644
--- a/monitor/hmp-cmds-target.c
+++ b/monitor/hmp-cmds-target.c
@@ -128,6 +128,8 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     uint8_t buf[16];
     uint64_t v;
     CPUState *cs = mon_get_cpu(mon);
+    AddressSpace *as = cs ? cpu_get_address_space(cs, 0)
+                          : &address_space_memory;
 
     if (!cs && (format == 'i' || !is_physical)) {
         monitor_printf(mon, "Can not dump without CPU\n");
@@ -174,7 +176,6 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         if (l > line_size)
             l = line_size;
         if (is_physical) {
-            AddressSpace *as = cs ? cs->as : &address_space_memory;
             MemTxResult r = address_space_read(as, addr,
                                                MEMTXATTRS_UNSPECIFIED, buf, l);
             if (r != MEMTX_OK) {
-- 
2.51.0


