Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTL2-0006xd-FQ
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL1-0006ve-Be
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKu-0006x8-Id
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so1883191wrv.7
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhrjSnT/Glu7TWodfXcdSK1T68Co48MWYkYtDcwjWjE=;
 b=tw/tzPRytrFd9P9aNQxxANnY2ZUNQpS57qd2q7FfDVS68TbvgFOB7RCKnDBGud06+V
 Twb4E+hbMFK/gAIZGp1FxwFpAfT34yy4Q95dD4ai8ClBfOJPLxiM5ug0X2AUhY8HvPZt
 1OSLMM3sSq9dvHthIY6c3+mw+3CaduCqOhy7DUtB083+BaRpsRhHZXlo5ju+8ngX2Yrq
 /swPVQoux0/UTi8RiJctIrhHXAOEdVNSTN/bw6Re2VH9gbeicjL+6bH0W9ZeC7Oi3I+0
 RElcCtiS0ASiJBKROUmBMFCm5oFsotMb920dHflbr//Og7/iYTM1JQHzNbGQtnrzt9l5
 sZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhrjSnT/Glu7TWodfXcdSK1T68Co48MWYkYtDcwjWjE=;
 b=pTIBeNo3xlFzYg4AnoowornZvKVmxo1jxzH8HVbXzForkYvCNEuGyk8BqsBuuBEeI0
 NWMsdjJ1S1x/Z4szdZAyFGwz3U7mz9IcVaHINSSlqWd91kz4nHdEvwl+NWotYBlFQeJR
 5HKAa467Z85H9wiX31p3ZCaQ2V6VzNEgYl4CEe67RGwOjuVr8EzXaex6gDmlfdXKfWse
 89jzx/bXASiBD+etUHfNDGBbBF9Kth+ksI+iS/LdqhmJD+kjqjUK4VfThkbHt/oNyZo8
 j3wcmXB+aobtfve0kmZlqExgDIckQyzba8QcWO6tJomtLmyLtL0LWrFLmlCtcNxa+gS9
 yrpQ==
X-Gm-Message-State: AFqh2kpH1/HCXSAty3Px+51fISn+DwrRJDxgi+AYbSbLW8u2IhF6pZqA
 1MJ/YqGOpiLSkGrzmUH1J+/YUw==
X-Google-Smtp-Source: AMrXdXtitbB7iGD0ocqh7YTWzYcAQjem3wgDmBT0gZDTD4uCosEEUXNOHl/iSd/SEKVsAlJWhyi/Ng==
X-Received: by 2002:a5d:6b4f:0:b0:242:1ad2:15e1 with SMTP id
 x15-20020a5d6b4f000000b002421ad215e1mr31778863wrw.2.1672937003085; 
 Thu, 05 Jan 2023 08:43:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b00286ad197346sm23886826wrw.70.2023.01.05.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B29A1FFBB;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 03/21] gdbstub: fix-up copyright and license files
Date: Thu,  5 Jan 2023 16:43:02 +0000
Message-Id: <20230105164320.2164095-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:31 -0000

When I started splitting gdbstub apart I was a little too boilerplate
with my file headers. Fix up to carry over Fabrice's copyright and the
LGPL license header.

Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 3 ++-
 gdbstub/user.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f208c6cf15..183dfb40e4 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -4,9 +4,10 @@
  * Debug integration depends on support from the individual
  * accelerators so most of this involves calling the ops helpers.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 033e5fdd71..a5f370bcf9 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -3,9 +3,10 @@
  *
  * We know for user-mode we are using TCG so we can call stuff directly.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
-- 
2.34.1


