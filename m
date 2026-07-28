Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7184C54F4C
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 04:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woZ9j-0003Wn-Uj; Tue, 28 Jul 2026 00:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1woZ9R-0003VI-Iv
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2026 00:10:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1woZ9P-0003hf-E0
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2026 00:10:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cf6d65d8a7so50268665ad.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 21:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785211839; x=1785816639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1ZNFzEPH0Jg7uKKvrJCqD8ThwFjBxj0u025SyTmCZm4=;
 b=dFT03hKwXjQDHfReYtK8ug0jKWAAkKS1w0ZWBMwoYoLz++qj9y5s02x2aykBkCJ0cq
 oaJ3xxWxIDvbQAwtdPnn0NPdzFF0bcBfqFmeHZEib2ZVXUq+w2k2Xs4HIHSGTH14mdoz
 HOah+1POp2loY7AFt4oMwWtjqBBFlL+xPwGXgIOzDDWyIcU9werKZf7yB+ZfPjyE1mHA
 hJPx8mcQJ7Ih2PRtGGpvpGq4YVZMJ3MPlNnNwXsw2Mib7hP3r4LWDFBHmWjgMQ5sdjmy
 DMaqLN+NITo3J3KuFxdezhyFvubR54wWBQyeFHMGK66RK/ymFOPkXAoxfLClMrBz7ton
 GyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785211839; x=1785816639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1ZNFzEPH0Jg7uKKvrJCqD8ThwFjBxj0u025SyTmCZm4=;
 b=Z8xF0x4M/PAiABwXECaHDKn4OjtFcQ6cqJvH5eE0XvkHAisr6w08ex9msCEGUIiXNh
 QpQerOqdWiF2x76OAFMAa1VQy5LRUYi2iBK4fETUU0tp17HGbkK//MwCdDl/0kUPDaBA
 4NLs5PmsPYkiYo0lF0HlyBQqXMth9y0ksCy48RvSrR+wbgqkqrCYu9ANyttpmVy9FWgd
 HWMxLq+EpWX96Gr7zfSR72dgrnMKjFI5nEjOfoLRbM0wOjdoflE7gPeWuL2IaON3pIK2
 b/lapycU9IrdZGtvISwyzUHFRD71KBZfapfTZXeom8zdfjgiZ+uqsfAjkX5lvwMVMRT8
 ML0g==
X-Gm-Message-State: AOJu0YwbKkmVPlczY1J+/RLOaUvVu7M0YVraA8rsowEoNZLR/26hGoa4
 EiXWW3WD8Z7h6HyOo0jYnUz6ZtefP7/2Ke+mTt3vi0BS6O/+fxtGdjik
X-Gm-Gg: AR+sD135fyhDX0FjBzUJqrfq9le1YXDzvtUcIqCcqJqVzFy2+q8QSqI115RdvXFFwnx
 bzl+UISYkVsxTOz4mwXY3Sb7o1K7NZHzP/fZc/JzXX3ZDOCYlK99aOU2A1LfqPnHfG2Ydf066HB
 algkviGmcClifujIo1hRQkC8059rfH403WeycoiffuT2V3Eo0k63jshnOnjmT4WHxCHaZYWyqDh
 Vp/zrcb3ZNMag+AaMwnAtmZLWyOP/Ghst9JeEjxcmKaHCIoRD92RqDl8Xb0BOUO3/cShyVOxbQZ
 0GGgXYMuPtZTVDzd9BZ8VesmST9T3okqtNsqUD0kYIVWtYJ+hdBwPJ2kBpJNjwYxHfzAUi1WpbM
 rv/2ga17bP4/KfQOXHD5RTgyVMZlkFFVEjXMj5KDjCD4RqEfn0pqWbZRurx0Q3EuAL7W5su1qo1
 tkYinw+zPTFevLUW5chDBYJLORHi++og==
X-Received: by 2002:a17:902:fd87:b0:2c9:e9c4:82c1 with SMTP id
 d9443c01a7336-2d015f02158mr8104815ad.26.1785211838668; 
 Mon, 27 Jul 2026 21:10:38 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([27.115.61.146])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde80ee56sm44378785ad.76.2026.07.27.21.10.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jul 2026 21:10:38 -0700 (PDT)
From: lanxiaoyun <dubdublan1987@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 lanxiaoyun1 <dubdublan1987@gmail.com>
Subject: [PATCH v2 1/1] hw/intc: resample level IRQ on PLIC completion
Date: Tue, 28 Jul 2026 12:09:22 +0800
Message-ID: <37c3604b0cf28f07f006aa40e7c20a5b12e34184.1785210445.git.dubdublan1987@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785210445.git.dubdublan1987@gmail.com>
References: <cover.1785210445.git.dubdublan1987@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dubdublan1987@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: lanxiaoyun1 <dubdublan1987@gmail.com>

When an interrupt completion message is received, if the interrupt is
level-triggered and still asserted, forward a new interrupt request to
the PLIC core.

This updates the SiFive PLIC IRQ handling so completion rechecks the
current source level and reasserts pending state when the input remains
high, matching the RISC-V PLIC specification.

Signed-off-by: lanxiaoyun1 <dubdublan1987@gmail.com>
---
 hw/intc/sifive_plic.c         | 5 ++++-
 include/hw/intc/sifive_plic.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9c84ff06a9..3927684bcf 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -246,6 +246,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
         } else if (contextid == 4) {
             if (value < plic->num_sources) {
                 sifive_plic_set_claimed(plic, value, false);
+                sifive_plic_set_pending(plic, value, !!plic->source[value]);
                 sifive_plic_update(plic);
             }
         } else {
@@ -276,6 +277,7 @@ static void sifive_plic_reset(DeviceState *dev)
     int i;
 
     memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
+    memset(s->source, 0, sizeof(uint32_t) * s->num_sources);
     memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
     memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
     memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
@@ -353,7 +355,7 @@ static void parse_hart_config(SiFivePLICState *plic)
 static void sifive_plic_irq_request(void *opaque, int irq, int level)
 {
     SiFivePLICState *s = opaque;
-
+    s->source[irq] = !!level;
     if (level > 0) {
         sifive_plic_set_pending(s, irq, true);
         sifive_plic_update(s);
@@ -379,6 +381,7 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     s->bitfield_words = (s->num_sources + 31) >> 5;
     s->num_enables = s->bitfield_words * s->num_addrs;
     s->source_priority = g_new0(uint32_t, s->num_sources);
+    s->source = g_new0(uint32_t, s->num_sources);
     s->target_priority = g_new(uint32_t, s->num_addrs);
     s->pending = g_new0(uint32_t, s->bitfield_words);
     s->claimed = g_new0(uint32_t, s->bitfield_words);
diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
index 32973dbf28..627a418ba1 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -54,6 +54,7 @@ struct SiFivePLICState {
     uint32_t num_enables;
     PLICAddr *addr_config;
     uint32_t *source_priority;
+    uint32_t *source;
     uint32_t *target_priority;
     uint32_t *pending;
     uint32_t *claimed;
-- 
2.43.0


