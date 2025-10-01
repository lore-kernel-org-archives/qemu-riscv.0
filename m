Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75BCCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:15:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3ySC-00041u-Pi; Wed, 01 Oct 2025 11:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRx-0003dX-Tw
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQA-0000nl-Nf
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso982221f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331213; x=1759936013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2utxhkX+sqm/78vx0PLpcnsUSPgNTq+5sqtMIdFotg=;
 b=gmTigabxhSUEiqAxFF041PIODyZBMpAZkqZ5qoF/N/9xO8f+7B3trs98mGZ2cVe8Dc
 pQiaavG7YzIf4edTIvC8Q14Q8pin1bu3tol64yLfr0L0nXS9DpqIfj2h2hmUK9HxBXZl
 fKviHNLALeoC1Xif2ZTEBVBzvga2B/4l9VluPb5vGHPQ04X31622XgEOjX4/NAjJc1h5
 Qae5aRnPSne2xAYzncDFNY/CTU8tTiRNFpiS0jqLgiT5gp/TU7jFqtDg8i24TO+1Mt9O
 cVv6RPqhIYN/+zyzmW2hj2YVNwtredrkbkPrVLJvt0YyP0aHm90Hm6C4GvCWGixiZ4Lu
 tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331213; x=1759936013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2utxhkX+sqm/78vx0PLpcnsUSPgNTq+5sqtMIdFotg=;
 b=iO0mWeuc6qGviq1EF25ewzrfk0TUUrw2n6ok0dTGfdVzvNC0ARlFYMADGEQvuamiWq
 EVhUQb46ftC+UT/tfbFfeqQg3PMEZwXtyx5DyeTJUZSZe/QAK/h7l6YPBiIMFyqpuyVt
 2gU0+nEiImtf7PjFH1wQOwJgVE2MOeOYcLng2p4gNO5ohKJ1E9kMXZClseoJnhBMkYU+
 rRcFBcSCIXqPlpkHBjbuFcI1F6u0OidP8zuD4sHROGeZju72AO7CYDzapGKB+hjg8GkA
 wHDQT+NJHjCGkyQO7ohT93VjMWApGjyUWVzIk+dQfqRmr2IGaogHQiUL3GD5WQd9lArO
 KQVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwCpXkTIIJ6h64+AtLqP5dIEE4iHWgacgFNg7OWbllsSJ4kkLo/kUyKAA6gXaJ2ncW5sw9GdjkR6eI@nongnu.org
X-Gm-Message-State: AOJu0Yxlg60LhxjRQZ3kaTKh1/ThwXVlhE57ybZP1N5s07v5hsMbzWkO
 mJUlIcVX6ZiD12wA5a5fDSaPFTPxUUXyS2uIjHGkMnaojsbpKDwCz17gXoWU7kyf9H0=
X-Gm-Gg: ASbGncuq9RwPpd22LNlW9XAtxGAbFBD74qk25ygjGbf7PcCDCrkm/pHEpYwD6xzb5nt
 yU1dqZBIjMtk4BAck9x61d2A3BWJUFShHTEWb77d5QZa8vczFXApEc9pZmqy47Srl8x8NgWIWfm
 xllc6iPivxdHesS9qMuNfEN29cLsTFudm/ghj4Ys2fmtY4jmVd1b9PAqQ0deVxXXdWYXle6tSj0
 V3Hg7qdAqVuU0fBRn/aj2Eve4ahgh5JhbRI0geXl19KWuV44d9nSZVmkNWTbPxODNVklXf6PeFI
 9Yh+Krq5lq/Ar+LrJGGP6W6BTMLP2oPFtlOYTLI+R9Y8byBVYxg5EKGSJjwhaddm+m1grqE+E+m
 VlzfmoUeAHh/khq84nL2dacXan6aYJSf1B1usu0I2hoObvpjz6e0jxzQt2mYsnQjzcyCjNwNMph
 DlVuhqy4gf0HN1BPPFikML
X-Google-Smtp-Source: AGHT+IHQlTiEIstk+7CUIQ9ughVxQI2O9HjYcxri7FE/tcqSvLzS7IOVOzvkQ6bzZxQnQnC8KmW1Tg==
X-Received: by 2002:a05:6000:2282:b0:415:15eb:216f with SMTP id
 ffacd0b85a97d-425577761d4mr3497423f8f.2.1759331213296; 
 Wed, 01 Oct 2025 08:06:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb017sm27360874f8f.3.2025.10.01.08.06.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 16/22] target/microblaze: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:21 +0200
Message-ID: <20251001150529.14122-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/microblaze/op_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index b8365b3b1d2..f07d795bdf3 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -448,8 +448,9 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
 uint32_t HELPER(NAME)(CPUMBState *env, uint64_t ea)                     \
 {                                                                       \
     CPUState *cs = env_cpu(env);                                        \
+    AddressSpace *as = cpu_get_address_space(cs, 0);                    \
     MemTxResult txres;                                                  \
-    TYPE ret = FUNC(cs->as, ea, MEMTXATTRS_UNSPECIFIED, &txres);        \
+    TYPE ret = FUNC(as, ea, MEMTXATTRS_UNSPECIFIED, &txres);            \
     if (unlikely(txres != MEMTX_OK)) {                                  \
         mb_transaction_failed_internal(cs, ea, ea, sizeof(TYPE),        \
                                        MMU_DATA_LOAD, GETPC());         \
@@ -467,8 +468,9 @@ LD_EA(lwea_le, uint32_t, address_space_ldl_le)
 void HELPER(NAME)(CPUMBState *env, uint32_t data, uint64_t ea)          \
 {                                                                       \
     CPUState *cs = env_cpu(env);                                        \
+    AddressSpace *as = cpu_get_address_space(cs, 0);                    \
     MemTxResult txres;                                                  \
-    FUNC(cs->as, ea, data, MEMTXATTRS_UNSPECIFIED, &txres);             \
+    FUNC(as, ea, data, MEMTXATTRS_UNSPECIFIED, &txres);                 \
     if (unlikely(txres != MEMTX_OK)) {                                  \
         mb_transaction_failed_internal(cs, ea, ea, sizeof(TYPE),        \
                                        MMU_DATA_STORE, GETPC());        \
-- 
2.51.0


