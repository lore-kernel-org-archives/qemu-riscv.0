Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbV4-0007L3-2A
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUy-0007Gf-9D
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:37 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUt-00043r-03
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so4771591wms.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29XZCpatPnv2hafi9sQMWtgwFvfVl0TspyF9LkIV1PI=;
 b=pdAvV8pIe4mMoET5PY7y+tuP8JuuBavDZhz2ikb3NgL12fH9+ksCLUzYjK5MZTm8nE
 4C8s9UT+Nn9F3nrpMZE/7zFI0kTdFoI6xEwb/oKsN4zY/TuhM8NBf95NnbxMjCHehTze
 DVwV5B6T4Q9Rj7FQMs9DNArHmyFi1qJg5tVmUEz2qwpU07h1ZcsykgkSzMt87gsNxLmr
 zLbnDbglcDyVI82J+aOT0ekkGv66ct12BnFRftoSpe1XJU6LoXZgQcGQvioaJcybgu+T
 GVKESpUw8C+8CXDtKsu7JvlR8O3luQ8p4Y65VFgFpzwTDS8iFiHI/Xu652jUE4+RMKlC
 /E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29XZCpatPnv2hafi9sQMWtgwFvfVl0TspyF9LkIV1PI=;
 b=bsiuB4lhrCJd27Fejdu+1HNDSY2zq23nGK8YHrQEt60s7yBR0goGNWIrp6xAiWls03
 UyBgAwzrRQt9J0McJO9FcgraYcc+VCVDvtnVEGuacET8arTSgkMXwgBFaupb1nA8i4G/
 tEwsQ7SOk2DRPsPBqdCLtJxi0MzfH2QLtKsJZygj5n83NbCcdOpuhePUmTkR9hPWR/JT
 GU2tEpB5eNE53QMSYK1mAa1g3BIjE5Y4bvnGE7fW+rS9YFXdO9R3wkIZpdGUWNnnBvy4
 eUoqvD5UQ71mPNhbWV3HGrxeFh4Hy+q/IzhLGGR93EVDcQLx42xA5/qx2Ge8eCEHE6dH
 6uIg==
X-Gm-Message-State: AO0yUKVsHYMN0qLWj6hujvm6jty1+z8GObWdj3eWolq43G7z7/OYFY0U
 H/osafSakRGjOPE3LCcJDrBQ+g==
X-Google-Smtp-Source: AK7set8TsdKkovrlYuy0bg1SEUTK9UqjKhueb1YsBegKyihy0bMWYdWqRSawlCrWGRlZyBq2LM2A7Q==
X-Received: by 2002:a05:600c:2ad6:b0:3dd:dd46:1274 with SMTP id
 t22-20020a05600c2ad600b003dddd461274mr4435998wme.4.1677019949253; 
 Tue, 21 Feb 2023 14:52:29 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003daf7721bb3sm5827379wmj.12.2023.02.21.14.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C1B31FFBA;
 Tue, 21 Feb 2023 22:52:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 02/24] gdbstub: fix-up copyright and license files
Date: Tue, 21 Feb 2023 22:52:05 +0000
Message-Id: <20230221225227.3735319-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:38 -0000

When I started splitting gdbstub apart I was a little too boilerplate
with my file headers. Fix up to carry over Fabrice's copyright and the
LGPL license header.

Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.39.1


