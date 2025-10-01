Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEFACCA472
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:08:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQz-0001s2-Pg; Wed, 01 Oct 2025 11:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQb-0001WT-58
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:37 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPV-0000iI-Mr
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so6338955e9.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331173; x=1759935973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlF0EsBCoNK14XGfky/iWN9CIlAKTNYjEeycOlfIXIg=;
 b=dXr/95V0xfA5Vn28niOQYMma0oQ4EVePsCqhH+dKWk8Zx7RuuTllI1VS/eIK5fVu9d
 UQF1R+P8P4MMwD9yVxxYMmuCh05J7gLJoMes+hYf7LeMH1XwL+8u5CtMlyaRbtAWDfq9
 /vS+gdYYQ/k2lz0cQMNt6rxXZnSoFHlJWDkDWMQEthAa9r4+9H/UEM/UwxMVELFQguVH
 8fQVtJrTNXke53Tsys9ZeLjRXPA8Ho5bmOpmbNnktDUbPZa9k5bfgDTNh2Czf/ygKXXa
 VYMLHZvxlRUro5d4FiejwsKg2SPYDDiob3ploSKN+qmc/Ahj3YrncL0k9Y2fzw6Q1X4B
 ka+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331173; x=1759935973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlF0EsBCoNK14XGfky/iWN9CIlAKTNYjEeycOlfIXIg=;
 b=Bw2Bp9ivnCItSxYcWUrU+8sGfQgwwhcW2IBWy+AAjlbyLKzz+QsGprsKx797xP2AQd
 sLos7ovjWDdJqircYHyJnTqwiar0Lv1SrUqXLfbTayESn763JhWbDNg/U1yIu6xFhqX2
 7BuxqKn/s7gqBdkrrLGQdizIVk6u791JdxXWK1WMg3d5PDGAdZ7EwjbAdcY4UCBB9b9s
 3++0SUxnFoSaPEp8WKtAN/U0yuCcDxQ/S/4hgAYsUSFzA2MW0FOPhKjo1WPtbx/t6Xf7
 ERGmtSgEVxFkVBgjluYDQ3adsYK4GxsrVAHXdSliFdBzTzFpaqJXAB6GlFvV/iO3ecvX
 trBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeCqZQNNhhb8io+4oG2mttCEDHQT0rmO2mibS84r86jIeYH3sbvtOV55o2P4duT8JPD9Q4COuCXrgZ@nongnu.org
X-Gm-Message-State: AOJu0YzLMm4HZem6uBq3yrGTvN5H+piEBRUjPfziikoaOtaV9CC97Pbf
 jWGnkbpn6LNJiI1ZEu9ACPH9zhw92BZuKW6aqpw1nWDmco63GWnb6yhJmatUz2kertA=
X-Gm-Gg: ASbGncs4WmM2+YnobJBFM+1h6nKbdCJWXETmZRPLJ8v5f2//QwDeOjPvohiiWlyqIIL
 hGG2qLO4sjl2QK839+90D+QR03xY7Ueb73/GjCD9X2+jekvkGhWWZ/PzVN0MXUaXD8ci0PGhMJH
 m7Wti5F2j3Grumv56XU9z5K4vO4Nbh+NRCB8ssfopVD/42UidaoRHNApYSxNEkxGa9KfgkEYOGa
 X2oqo2LmTxLr2D4kpFsXBiPbdzQG+DmXnA4W0nKdNfeb9MdXUVWG8mSbvvllRiHsaSeI/fBg0AJ
 K2yFNYTu0Qsgn+u28X/f+BKZC6tQM/meB4qpWlF/ijqwc+W+klla1MIyXpa8YvD57Y4F75YMeqX
 95rSdaRJhWYzy+tt/L4ucxUAGb53B1WO67aqDQG7WIl5dGVS0KCabpdsvNtHOVM/FbIy2lCWrlN
 4uZ6xs7cglbtjki25oy3Gq
X-Google-Smtp-Source: AGHT+IFTNHfjgnNa+RWfDs8UzIIDSSUm0wBbmygGptOGYKsRpIMIBY+62JNxNRiOmnEMBtsmysqGsA==
X-Received: by 2002:a05:600c:c117:b0:46e:6339:79c5 with SMTP id
 5b1f17b1804b1-46e63397a8bmr19297135e9.5.1759331172869; 
 Wed, 01 Oct 2025 08:06:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6199f589sm43899835e9.10.2025.10.01.08.06.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 08/22] target/riscv: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:13 +0200
Message-ID: <20251001150529.14122-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/riscv/cpu_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3479a62cc7f..d28230d12ea 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1282,6 +1282,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
     int va_bits = PGSHIFT + levels * ptidxbits + widened;
     int sxlen = 16 << riscv_cpu_sxl(env);
     int sxlen_bytes = sxlen / 8;
@@ -1365,9 +1366,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
 
         if (riscv_cpu_mxl(env) == MXL_RV32) {
-            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+            pte = address_space_ldl(as, pte_addr, attrs, &res);
         } else {
-            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+            pte = address_space_ldq(as, pte_addr, attrs, &res);
         }
 
         if (res != MEMTX_OK) {
@@ -1561,7 +1562,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
          */
         MemoryRegion *mr;
         hwaddr l = sxlen_bytes, addr1;
-        mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
+        mr = address_space_translate(as, pte_addr, &addr1, &l,
                                      false, MEMTXATTRS_UNSPECIFIED);
         if (memory_region_is_ram(mr)) {
             target_ulong *pte_pa = qemu_map_ram_ptr(mr->ram_block, addr1);
-- 
2.51.0


