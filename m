Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2867AC282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:42:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFKa-0005mN-24; Mon, 17 Mar 2025 14:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJL-0004sB-9s
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:39 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIZ-0006E6-Hx
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:38 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso83029755ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236485; x=1742841285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
 b=bv2EfyrDbwpspLWOAJosLQNUVAJiyDbDctswELIXN3fPdiN+2ZrM4Whx6Qh70uvltq
 Bt8+ff8uZaF/6z/yWSmVux8m8eIGgMjb4I9Dy8XFvceK2awta9NpekLW6uFhRo/tvxMr
 8Rek45fNzRgTG72ehlePFgxFQIJ+3CkSgxQomDyouQ2X8w9O8VbjOBWsYmqPCoFB7HUF
 5lUV+YpUhU8GZAVhE2UblhKaesohNXKUiwYvDTErr7FuAJgU9vT3mXw5ZBOGjNH8aKzp
 THIlgIoXojLP9xgomr5BvLK+QX5VNDQwDBt3LaLA5MkjvOPw4mHYTSSR8ZxLzCOe/DfL
 EXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236485; x=1742841285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
 b=OzRR96vtQ5cZA7Tz93jjAnsKZlyE12jQHqzBIFxbRfzmpfzWtD+m9AtVK1CQoWQEcW
 3ULYv6G8F/S2e+iUCD7k/Wa5x5VagDfU6Hllq3Gai0L1VcVVa0VvQ25irJLk6HnivuCK
 P5Yxs3+4Kef/0nCArBYHJHsTttJoAnAslZoXMoW9dX0XtA+8fMCxMt/FJS1XcT0NfmN9
 9qYJPueyJmgF11NFPynNWopwHuYaWWdb4y3jjTfWDlNBNrBAufsDVMJtAh2cYXXSiJg/
 IFpGnglOMtaBCwIkBvdgOVnODy6mer7I4AzZ9ovoqx2fD9BRTQJxlRIY+BCkmYYmMyZB
 fo8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPQCXkKsR2SyffIMU4wcji9dZPo3kpr1u0U3L94/Ym6UnlLDirPcSpM/7ZTBtcZcsfzvtXGotC9ggU@nongnu.org
X-Gm-Message-State: AOJu0Yytg6QvmcH/vTQNA/Q+zcZ0DmY3b2uoOQ0/JKtSLof0cAF5Lqa3
 LO4c6D4BxP89Psr37hVGqBctFmoezf2wBNm5ixWbB1d8XoK+H9T753fH5odcCCI=
X-Gm-Gg: ASbGnctKqktW6/Kynh9jQExSt1zAPiLVsZx+35tkuah+7+tk6ZquNms5XvmcMM9DeoK
 JncqwhrhXyzj1CTJnQovoLRGkM37hUs0P2HmyOLDdX4T3TBdlS+x5uBnmlu30ya+0+79IFPvIRa
 rngumlCdXVOYUYkgA8HSwffo6pf2Hq1M++nwWgfBG+TUMr50bl7zsRyzFgH0mVlj4Wc5k+s07lj
 ercyiymG861SoXo4qIKGZEs5ja2sbr/WK+TwJ8j+krwNXR/tcGNRzOe8uAXVT6vlvzGoAfSWj9b
 ViIqXtjCoVrrKCURbcKy/UurFvPou7wKHnfMmgThg61C
X-Google-Smtp-Source: AGHT+IHzNNUW3sLQt1T364FsCohrjLgSsBCXmjd/XRyR5B72Si2GIa2LUJ+5Zkf6gr6cDVKPRd/CWg==
X-Received: by 2002:a05:6a00:b95:b0:736:3d7c:2368 with SMTP id
 d2e1a72fcca58-73722353269mr15820164b3a.7.1742236485130; 
 Mon, 17 Mar 2025 11:34:45 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 18/18] system/ioport: make compilation unit common
Date: Mon, 17 Mar 2025 11:34:17 -0700
Message-Id: <20250317183417.285700-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


