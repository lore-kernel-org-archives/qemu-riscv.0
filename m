Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1218C282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:01:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVEP-0002wv-FG; Mon, 10 Mar 2025 00:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEF-0002ky-MS
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVED-0008DE-PR
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22403cbb47fso69139775ad.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582739; x=1742187539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnRQREfY8a8hSo7O5I1BTgAG3l8eG/Rc3wUh1Oiddgs=;
 b=pBB0yIIQMjqXPtIPw2JtEsxFF1ibdordyOWSb/+W6GImQNLIqe5h79mYRQEpbVhIYM
 mNNC26cnt0PCnR7gz9/+ZWY53IXd/3L/g7p6fCXWvTqSkNYfCkqdqFyTPlUdJw4Okj+p
 jMmosXMlFB8tvRa6piN8OlGJ9O6MoLov//rcZef6zMq9lsB1IgZWAcxbYTvVmuDiR98J
 WEooH5ZHxi6E5IcipvtISeBCkd8UW5wEMJHS6Emg+H2yKnIHORX/0k7UJiG4Xi87wa4L
 2YE3M+Py/jtbDM6xqTZ+TBk7hkHB4wH5yxy6GEEI3Js0d7qbDmNwA6iLM+4wUSoh5J42
 mbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582739; x=1742187539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nnRQREfY8a8hSo7O5I1BTgAG3l8eG/Rc3wUh1Oiddgs=;
 b=O4rbJzsSfi8zkQNYVnQgAwZKOpqnz9HbniA7bIbkIJMLB/89eIHEwuyaEhwm5gzIkn
 Ex4w0HrVMLMbf2cD3JX2/Y8T2vf2gj6dkM4T09bjSM7F3YnYsWwCMVS5BoJ75w7Sf3HQ
 J/OsGuc2SoAgkJF9bijJQPqT3lvHds2MiXBRUXBS+PALF1MWXTRNZYjP6Usve0UB+AdL
 q5QqmBJLGeRpfASlDCX4Z7XEL97QbIucxM2js1uFai8DidUzLp+LSWVKRacRsUIzcZsD
 EnJRGK5W2q7fam8+AUdl6Js/DyFnFiH2RVIaSra00p9nsZN8oUJqrU4UeDsIIuOvRDLy
 opEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMinYMXMmDX7ywBXi8pMM70/VVpU3d1vzEoLK+9GE/Vbl5dTRGspqzsdS+0QuZyKxWNxknWR9P8XgR@nongnu.org
X-Gm-Message-State: AOJu0Yw4DQDKqL49bEo6vQPgKd5DOEAPOfNBdKZr3YjI+gn5aqDoPJ5H
 bkYCtNkHDVfgfRYylnTbkqrDKeH/VMTpdNjZpAu7wzAx1NKxfbnmzQ3bE8XewCo=
X-Gm-Gg: ASbGncth8LnICjtrCEQU4fJi1HsvjKvQvj5un58Y/2lDaFIsmJAnsowPpIvDE3a0zUH
 f2GZQmgTLpJr0rN1HARRWxVyBqrbpY4pJDQaG7CglPDLeUdsc/oMBT0IXz3qhvpqCEYMfSqMtk5
 55PtxzH2pL2wsuHqOeyoKsLqV04Tl1zPL9R/xGfXnFZ2E1rpRGSkrdP7tjZH+OAX03+1ghE1MI3
 /GItc2L0zgftSzznWKVW5O0JsSUHc9GF+RKcqJrvGlalqRN/p1AKTyRTy6POPYHHpAsC+TSL3BZ
 AKAE5NMxPnDq2rA4Gypz4LFPRuFkxWpdruAEIWc+5i7S
X-Google-Smtp-Source: AGHT+IHAsq4Y63EYcwwuW/i7zg2X2liiOFC3cUgAGGWfi3nL4Ogmzyt5TH8VxxgwmAwHkd5TSMj4Zg==
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id
 d2e1a72fcca58-736aaaed79amr16963023b3a.23.1741582739550; 
 Sun, 09 Mar 2025 21:58:59 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/16] exec/exec-all: remove dependency on cpu.h
Date: Sun,  9 Mar 2025 21:58:34 -0700
Message-Id: <20250310045842.2650784-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


