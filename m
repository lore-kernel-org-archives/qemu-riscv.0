Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B02CA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 13:55:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upSDk-0006Gq-Vw; Fri, 22 Aug 2025 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1v-00061c-FS
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 05:25:51 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1s-0007H9-VN
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 05:25:51 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2461864f7f8so12490395ad.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854746; x=1756459546;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh5PW27wq4M7UAgJQHpY8LHqZa1HVp12yT5xQoyQ7OE=;
 b=DE2oWXZ2aGdAGKT9Je46/ChaN2UK301u/Fg2GH9etR1f1kbpIXdQiauuwHTp7nXeiG
 AFMSCKpEJC0ELUQV6kfG0oFEcW34txbkT67WlZ/07Rf62rV8CghV4WiytBdH81lTHs2m
 LOzwZFuZ7+lAP6w6Jx2POBYb9YyhX/79T63Vgs1+hYbrhuW9Giw6C3RF5JtxLJjh2YrO
 XDToyH7O2Wbr5X8i8KLR9mgO9CV9LOYj2exkI80/sCYDm/rdwBKFDYiQKA4D9iLrJJIO
 GBrg+ijM6ByFdO7cFTMTB8b/RyhLSHTt6BzylfRabKZsz4FlxIKKY+IhYd07bmHddV7a
 1THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854746; x=1756459546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vh5PW27wq4M7UAgJQHpY8LHqZa1HVp12yT5xQoyQ7OE=;
 b=LceHYSZ0sXfNxZ9lVnLyFcM7EEdAS2cfFGYtv5mQ8wV7KPhk/5GHkmb2yU5rtZf1Ou
 GSEpQ9aB0yawOJPHEEV56kC22E8woijEx9H/+eZE/S2KbNEYMdIJmiC7TIARFpoPZVnP
 ctDxLWDnwShLo4odXsTFJWZzqrL2kZqGA7aZUmIwUtYSNYiLjdots4wrfOsnzD1ZUgbx
 BsXSPRqmLA9K+0SVIT9ALFhIdjjI8PHDIwncU7vkIiPvDP9BH/hGhmmY2+vk1Ck1VLvC
 WmY0qG4ZLcUoYlqlcXJ/MsexPZgL/uE9V4kvhlmgVJLECzP/pT6xvhLqJp1fDCLyciaN
 uzSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK71up755UCfn4ApRfgQok5ubnFk1VpaOeCqNgyWg3nruF7zGZ7GNIf/wP/35GpxiDeRWpzKotDFig@nongnu.org
X-Gm-Message-State: AOJu0Yx+bSPKkbwGg/t/Zzt+aZBX2RQeCO6yLVq0qR60ZU35jTHlRFwL
 ZWvxz5nmbEANbQpeF1L1J2TYrDmRQ0V6sdDiBmYMAs4qXOSg6n1PrYcyqkX9bUB3m7o=
X-Gm-Gg: ASbGncuSCt1hS7WweVywJzlkJI/hy3hFk/QSxx4artc6YTTGqBiR5yrux4Qm7Rws/sU
 crMb430L8aNtUptkMN/HG3rrHFKi/sKuvaqg76Ca4XB4gLeiJmUKUqS3H4TshqgumIlYKUySzzo
 IvdQIOjhXdLkkLImdPCmWTBVJJAm+NBhklzb/vt01Z4tQ3ZWNhAztkm7Si7EdR6CAnRUUS/Th0T
 LGBJK95keOjRVMwyyqODev/LOaD5nM9aGyzUf+27on1PtxORt/WwacAmE89mLAb8DidnWW6r5sc
 dDYlP56gPBSgy3d9aksO/KP2mNXmuZrKer0J95OcxEnF3q2bE7jWKptEc1IQDk3+MtGin9AGstJ
 wCjrDWALurBCcSCk5UOmFiVI6fqPbfOC9uwld2JrQgw==
X-Google-Smtp-Source: AGHT+IFqrkDmltRg7rBvuIoosHiBNJHGiYIXbN8rlbL3FhYZHp7oXOt3yH4etsE7arp7mbrFo0zW5g==
X-Received: by 2002:a17:902:f68e:b0:243:7cf:9bcf with SMTP id
 d9443c01a7336-2462ee0be0bmr37041655ad.2.1755854746463; 
 Fri, 22 Aug 2025 02:25:46 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:46 -0700 (PDT)
From: CJ Chen <cjchen@igel.co.jp>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, CJ Chen <cjchen@igel.co.jp>
Subject: [RFC PATCH v2 7/9] system/memory: assert on invalid unaligned combo
Date: Fri, 22 Aug 2025 18:24:08 +0900
Message-Id: <20250822092410.25833-8-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=cjchen@igel.co.jp; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Aug 2025 09:54:10 -0400
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

When it comes to this pattern: .valid.unaligned = false and
impl.unaligned = true, is effectlvely contradictory. The .valid
structure indicates that unaligned access should be rejected at
the access validation phase, yet .impl suggests the underlying
device implementation can handle unaligned operations. As a result,
the upper-layer code will never even reach the .impl logic, leading
to confusion.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Tested-by: CJ Chen <cjchen@igel.co.jp>
Suggested-by: Peter Xu <peterx@redhat.com>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
---
 system/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/memory.c b/system/memory.c
index d6071b4414..b536a62ce9 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1654,6 +1654,7 @@ void memory_region_init_io(MemoryRegion *mr,
                            const char *name,
                            uint64_t size)
 {
+    g_assert(!ops || !(ops->impl.unaligned && !ops->valid.unaligned));
     memory_region_init(mr, owner, name, size);
     mr->ops = ops ? ops : &unassigned_mem_ops;
     mr->opaque = opaque;
-- 
2.25.1


