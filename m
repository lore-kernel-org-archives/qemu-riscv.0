Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32054C36010
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2LXj-0000to-QH; Tue, 08 Apr 2025 22:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXi-0000tP-NW
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:58 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXh-00019o-6w
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-223fd89d036so76174285ad.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 19:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744167116; x=1744771916; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RnrAzFeyhhVN5kCbVsK0iZFX3OvBg6SXh0USMwim+O0=;
 b=d9N1b0AgY+5F1dC8PCFIB+G/fLe9Bmh0NWGzbCRipHjbgy520vrUKmOetjNNN9Q7le
 OSO+cLhBVaEt3F3R546STP8e/HMuiiuU89DEYb+MHI7EjTWv7Sm2ZbxroTr3TUfPpHUX
 1Yne+jCKk3cDNzc3kj7onfDdU/0vgb1wpjvC4yuCd67BBkmh1GyzJ1ROtHH0WdyRy7y5
 ikxLvlgtNxRTM4fo12+8h7dLm2Rjks09aKAkABeBZ/e6JnEpalfkQV4VzCvAePmJ2htK
 ng5H/rHy8Hadw0xicKamxxq2ozIegGdg9wzEw7rBanbB/l/DE8FIUkrvywYzJHs/knLC
 ap0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744167116; x=1744771916;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RnrAzFeyhhVN5kCbVsK0iZFX3OvBg6SXh0USMwim+O0=;
 b=N5Gu1I017dFap+sBJ4XmeJXoT3x36VVJb0pPCkeuka02d7OF5eZOoiD2xKRIYaWLpn
 b426Pjjf0wbuesfvdruWdQiJHdeMA7+rzH8fSWjTdUGC6yd6U6E+kvtF5JkRenpQTCxS
 iIwBKrVHbHBVmwrV0smg/TOCa9rFx7J+/tTM6g5CrB/rHxiPvdQj1eV6khfcyBBvrJr5
 pr+6vtzQ2UNtcKSy7+1UwpVNsmm8h6B/UCqRvLosvBQYMhX8QJaXNMO/80ZwsPObeFjD
 GGx4vqGmgco0vHUQHA7V1XQ3RsAzIxyEQI/b6n8UfOhySh6VoK8EUL41lHzRF7siYCG0
 ukIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUffK7sD+Es8jYZKhk7FSnyzB6BbuEdDI1Rz9N2pgtF8CsJenuOerdeM0T1qlnxPLI7kfTDZr2tYZNe@nongnu.org
X-Gm-Message-State: AOJu0YxkXOSrohlImmRI3N/Ejb5jiPgvyOhkebTfYG4Memm6RiJGcbJG
 rmpB0RhdaSGws7nCpy7TNZFI3RuhVocVG6InZgSbVhU5ubkgQI6CzVEIY0f/jO8=
X-Gm-Gg: ASbGncvmPcKNEdI+PnIqOzxlJ982AJaMyWiMCh+YO1ELs3913ugEKEFotRiMgmQD+Am
 XQUrvZrH9d1MNg/9CRG/KSwFAJTKi9AwJV8DdlbYnJZRrwoQj7qTwDQCxTGiqz3MZimyVfwpr1w
 eaptDO1yPhFsGejkCUmDfZ2U3Fs41rACkdjuhYp3Rj6/klp9g4nq4wbFgeU3ctYj8qqIi2bCmz9
 V4VYYyjfscwwZRaC4raWNs4fClrw3o+24vHEhBrzuQpVgWrTWu2Bp/tJo+IDFjyrwWzka+Qby8F
 on62yXk7+pUgWUmJRtajFCojbEHi8W4XlA63E/0zWQYu0+00XnYvT1y+YiVpaHSTF0E=
X-Google-Smtp-Source: AGHT+IGGslaLVHdpyphTNDAohz50hEJQ7oHY0FFaQInvSilIa5TeeVkxwn7/ot1LzImsN4zpjqYVvg==
X-Received: by 2002:a17:903:3b4e:b0:229:1717:882a with SMTP id
 d9443c01a7336-22ac3f321e2mr12042385ad.4.1744167115812; 
 Tue, 08 Apr 2025 19:51:55 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb5463sm665725ad.195.2025.04.08.19.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 19:51:55 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 3/4] target/riscv: Fix VSTIP bit in sstc extension.
Date: Wed,  9 Apr 2025 10:51:30 +0800
Message-Id: <20250409025131.3670-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250409025131.3670-1-jim.shu@sifive.com>
References: <20250409025131.3670-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

VSTIP is only writable when both [mh]envcfg.STCE is enabled, or it will
revert it's defined behavior as if sstc extension is not implemented.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7948188356..e86808fd98 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3635,7 +3635,14 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (riscv_cpu_cfg(env)->ext_sstc && (env->priv == PRV_M) &&
         get_field(env->menvcfg, MENVCFG_STCE)) {
         /* sstc extension forbids STIP & VSTIP to be writeable in mip */
-        mask = mask & ~(MIP_STIP | MIP_VSTIP);
+
+        /* STIP is not writable when menvcfg.STCE is enabled. */
+        mask = mask & ~MIP_STIP;
+
+        /* VSTIP is not writable when both [mh]envcfg.STCE are enabled. */
+        if (get_field(env->henvcfg, HENVCFG_STCE)) {
+            mask = mask & ~MIP_VSTIP;
+        }
     }
 
     if (mask) {
-- 
2.17.1


