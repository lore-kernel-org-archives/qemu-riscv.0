Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F4CC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:43:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsldc-0008Rh-QB; Thu, 13 Mar 2025 12:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslar-0003WU-Es
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslam-0005k6-An
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:35 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3012a0c8496so1977592a91.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883971; x=1742488771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
 b=p139Bke7sozzX75IqzKh+3PrCA+y66INP9uZXPnX6Xg1V4YEv8bbIOkZ+PZKmxic2b
 kbxsGSgn7H4CwFIHQqXlgDJbLgGqcGQuikAoyXKaR7po3VKCp++gojqeuJGqjO9RFPTB
 b21TMEJofmKaJhNws7j7sOwYumpGIMnLFTeP89mhWZnaS0u0GK3gX60VAvEG8guvZ9hp
 bGzZchng7OQq+iq9jn83NZixXtaRpYPKgKiUiiCTEBr/ATwCqGdC+/1xjCgdQvhvFmQn
 NvQwdBQS3tg3ByYeFJCAUgpOzdsHFp7kRYkdwho99qgwW70QRm8LSmTvHe76v4A4tyW7
 aviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883971; x=1742488771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
 b=sP4eIxPaMDnVqfhA1oQvpYn/abHDO4D3fKAI5onW8JXO/+A0UGmKaljPlOtsZZndYm
 9twgqomSAQhxo1bKZLpMfFVcIb4p3eBpmfAiNvUy6ZSPSeVMw7H2D3ruhb95oHZTcboF
 fzDSTTi1gltKDU5vCf/yWDlpKvHPTHiKXpUWW/zbUOXOBdvThdnk4WvFtEu0h6VPUIEV
 fXrWw7WiPsy7GmzgzSJyRwdLHcs0lvtmtmhTz1e/GxfUim1b2w3gfWGE/hbxCGKfhKa+
 OsvasDXdtxwbwJDPARzkG1r8QwezQ2izFtsigIo5DTEOPCT+YOBeMIfEC6Q0tUAE1mfc
 ajoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyKqsitmng6E+ZhPvf3XymKluKEZC30ZgFRNvQMTt5XXuQLSY1tFuB5a1bbXnw7knemH+PPQ4MvxMJ@nongnu.org
X-Gm-Message-State: AOJu0YxY0i99wGnmQrGPUtUaMNWXGqws86dWv9St6erGNNS/u+CErh8o
 fDGfn5bz2JwImmqXb3fn1qv+jnsVe7zU7HFXFt4oMLFK4r9in9BLZZUPl34PTWk=
X-Gm-Gg: ASbGncsZ3p1wtv0g5swmEuXrPbPMeMjrK00V1kJ+H5NdmwnUmQJeIG0CjJkp0onrE/f
 MwZPLQcGpThUdpUp3bxrB4akqOTF8DzGkAg1A1i2ffKDPyuZjQREnZDuTH46flwo7AvqoXk34nv
 USLpHhwng7kPHh6BiohaJTtG3p8kszJLSEe7HCJuohZLZNUnoYmfYZcg0jJho6DH8dVYGlXmgBW
 m/RiglESt/1GHMDjz2Exoe64E+z8RE1sDHyCie1aLBy6h/Z3T6P2PLbh6W4Fialkrt32nwmlctc
 pzBtanD5ARMccVb42Vpg/M4edOseEoDIGBAwT1YR140F
X-Google-Smtp-Source: AGHT+IGwkoEmUkadWWuwDPp5K+cQQMib7Zg2jJHfpZBwTIoZ4S09vzdl8DeRv7aJJJyLYJnLE9fiwQ==
X-Received: by 2002:a17:90a:d604:b0:2f9:cf97:56ac with SMTP id
 98e67ed59e1d1-3014e735345mr385635a91.0.1741883970945; 
 Thu, 13 Mar 2025 09:39:30 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 17/17] system/ioport: make compilation unit common
Date: Thu, 13 Mar 2025 09:39:03 -0700
Message-Id: <20250313163903.1738581-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/ioport.c    | 1 -
 system/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/system/ioport.c b/system/ioport.c
index 55c2a752396..89daae9d602 100644
--- a/system/ioport.c
+++ b/system/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
diff --git a/system/meson.build b/system/meson.build
index 4f44b78df31..063301c3ad0 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
   'globals-target.c',
 )])
 
@@ -13,6 +12,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


