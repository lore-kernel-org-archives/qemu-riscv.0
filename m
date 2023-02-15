Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyT-0007v3-VY
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyO-0007lX-Tg
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:45 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyK-0007wH-9L
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:44 -0500
Received: by mail-oi1-x232.google.com with SMTP id bj22so16652192oib.11
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ogl+RmsTuQKGbHwWL7YbtcFc2a1h5NOUKob+9lW4sA=;
 b=jQ07UfJNwJQi5B+O+HiP6ewYT/fSCOu79nfT3G8yaztn3ZQWBBo72psVIMPZQISBW0
 TLewFyR5NiXFi4ACeXfqxGNqRZgj0yQ3ErzqGjNxXezBY2Q6UTku/pSVE6ThqeuSqF4J
 +zRAHjf85fUQeBijEINdOlD1XqUJrOVQmbfHOHHgMif+TgTHagSlmMRPY3LOXjcLkMzr
 s6MLWDEb9WKs3EVW8kOmkF6ZWdR7JVrKTYRE6XxtOLK74Za9q3o9rrO7XmhVMDnT8j2L
 wXA6Bkgl5FvhAiTtEBdon8HdNeKskg5/KWQtLyOMWXb/eMW2yBR5k7AzB2bAAGaApEWf
 GgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ogl+RmsTuQKGbHwWL7YbtcFc2a1h5NOUKob+9lW4sA=;
 b=Vivo/xKR+0tN/Axo6nWilncjRcRRVYWgDfrZoFO87qPh3lS00337nvR5e6wtqd8buN
 sWzhcW2MM4MrZ5PXIR7F/2sNgsJLP0knw74tgAKjv47WDCWpJi9egiUxPKz0QCDSW9g1
 6lT8mKWgyDAsjE00E1Da5JhwrmkSeDteLMFzQCocPhTCwYb1AXIle/PYHr4oryGdwcru
 K1uB5yg6WFaFdDayTkbNkvmyYFfiWRjjZimaRgy4rkLiCNa0hSHqY9yukhzt9TFUdWww
 6Cg1+ysNmi581vyKihPtuqwXJhQ0FUhJNF071GJqC1L+vPVuoVm8NtH2zf2xKqZlHsFm
 9GTg==
X-Gm-Message-State: AO0yUKXD2EQP+vmC65iUyMkLXxOi48kDOg3C1REfg4Tida+mdWoBnTDr
 kGX3TnnNpPbZAogW6YIgo0DMGQ==
X-Google-Smtp-Source: AK7set+tLP3B9PXez80z08GAQtqgo6BLcJHzVLBiJh7tHb+2otHPNI2wQuuZH6ufYEDAAsAkDsFMMA==
X-Received: by 2002:a05:6808:1185:b0:37a:2bf0:502a with SMTP id
 j5-20020a056808118500b0037a2bf0502amr2615611oil.24.1676487457908; 
 Wed, 15 Feb 2023 10:57:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 02/10] target/riscv: always allow write_misa() to write MISA
Date: Wed, 15 Feb 2023 15:57:18 -0300
Message-Id: <20230215185726.691759-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:45 -0000

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to properly write this CSR, has
always been a no-op as well because write_misa() will always exit
earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

Regardless, the spec says that MISA is a WARL read-write CSR, and gating
the writes in the register doesn't make sense. OS and applications
should be wary of the consequences when writing it, but the write itself
must always be allowed.

Remove the RISCV_FEATURE_MISA verification at the start of write_misa(),
removing RISCV_FEATURE_MISA altogether since there will be no more
callers of this enum.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 target/riscv/csr.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..01803a020d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e149b453da..5bd4cdbef5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,11 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
-        /* drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
     /* 'I' or 'E' must be present */
     if (!(val & (RVI | RVE))) {
         /* It is not, drop write to misa */
-- 
2.39.1


