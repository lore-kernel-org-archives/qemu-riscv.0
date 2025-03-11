Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57162C282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:04:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts5ln-0004X7-Sh; Tue, 11 Mar 2025 16:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5kQ-00017s-IJ
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:43 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5kM-0000B4-4g
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:42 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22398e09e39so111122435ad.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741723110; x=1742327910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
 b=PgouqsR8viTpWlGxTGmzHQ3VC0Vq9uBIaFthQVLiMVgOLqSB5MhQnJu2C8EIFEQoFT
 UAhaVlBhOpd7ywUmCCrkRnaUaJ+egwgj8bFoJMHqvcscZFloxwtfiqtVSkG5jPvoMeUT
 1HU3/D3ZY4pRCprmsWN1a+L7o137Rl8YUKYa0SueMYFUFGzBEKgu4CcfOHyBxVYmADZW
 nygSX/cb3JvuOJjeFdCIF53xPNMatyUW39hj+jqh476dac3OWD0w+ZJXUuhC/rne17sZ
 uQlNkdJ240gZ9oosJAdpoRtripHqohm+0XGuruYOsF3KfHy3ugGXcf2ZVGnTE44jEHSl
 5Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723110; x=1742327910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
 b=lkd+sXOowMKHoIU02qQSCX1j4yi8185VyBY1TBcC5CSSjCCNOgATJL/QWPtPH7o5SS
 xEaytF6X3sRs49bXQgMBxtbqENX5G9zZBODxJqUhQ3RJyoqar+qO7wZkiMupzYdP6lCr
 ZC+XGoN+fFkI2AoQsQTpum31bEzsUiUqjwaIJL/lUxMbaHHWnlZC3VNntU1TXnm4M7c0
 K4v/Qs76UApF28J+fLTmZdO+mKJf7l9QXx42DnoWnMpXTcPd33+VtOpLKTO+KyTXgrtB
 Om1LZUeyHkNiP4jZYE7jXXOMagvZPbgrPJHim3zGcHATBHfU3ty5C8bJWnbhF1gZgGgG
 KHDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKcbkvnLxNHcTqM4bBpaO6QmwDf2wVa5nhPh3gavWA40h6qxKHiysC5HnuRFBS2fux8KKaOO2C1d+B@nongnu.org
X-Gm-Message-State: AOJu0Yy1rKXKEfeWp4FZZ/RnnBid88LQ/+S8vk5TdLbSpLYh0ifC694d
 lxasqi8pMKMFI+dkhpBQ4e1XJSuHoaifoWC54Ukg6Iqd7OzOs7vR77QWS6lpWy4=
X-Gm-Gg: ASbGnctZDiBLXDrzriftkDzonNC9cDHo11vUCSpMmC7ebD7VE4W99FxQHKuAwEXIj1j
 nWrcACTa5YSznAJ8FncrOqA9p3KsG+HDNSF3uHi7i1q2hjOn3Uq9nr1NB35s/eisbjqCPsSN2z2
 EGCsZlCs5mK+jZB63Wlyz/VlSboxzoe3sjyoV/VBsjxdvh+bcb8MzEKy9ujHHd8lxoRy3jT5PPk
 h8/f5Qzs0Pr15XHT01SP8pwekt9rOZEZxheqvcu7YFZhmSkuaae7U59v+MKWcaY1+Q/6z2ZgDFy
 LVl3U7ARry0u44m7IM4gs3N+CPIzq2RRf354jjuZMidw
X-Google-Smtp-Source: AGHT+IFWRSSWAAZ74eVr+KcVmFNEyBuYNdoBJPeRpIUKcbNy7sibb5A9vNOWSCrzmBmp9nxRDwlIAw==
X-Received: by 2002:a05:6a00:b86:b0:736:50c4:3e0f with SMTP id
 d2e1a72fcca58-736aaa373b8mr22374606b3a.10.1741723110296; 
 Tue, 11 Mar 2025 12:58:30 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 manos.pitsidianakis@linaro.org, Peter Xu <peterx@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 17/17] system/ioport: make compilation unit common
Date: Tue, 11 Mar 2025 12:58:03 -0700
Message-Id: <20250311195803.4115788-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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
index 881cb2736fe..3faec7e4dfb 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
 )])
 
 system_ss.add(files(
@@ -12,6 +11,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


