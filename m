Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoIO-0007F1-DJ
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIN-0007ES-H4
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:08:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIL-0004US-Ew
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:08:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bx12so108386wrb.11
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+nP4isH1Rrpm6PqB1T+HNbs6D4vVCidZRr16ayiLa8=;
 b=C8aZU5/+SOu04bkd57XceuBmV7tZOD+f1/mF7iOMVtDvuDNscWG36vSMh9/QEXfPid
 /IY3FeU3A5JOhNMGE0wMEbdjydW1l82q/Sa4HYhjfbBlOxjY7t1KKnPZwr6aksBFlnvs
 luzv4y4KuE/Ldlt+ZSpgu7eRI9RiWJWQhA5UoogKN8ZMfYG6DaG3tdC0m7df+U96SdET
 ywPwEa1b7fvO41l9nOFINl8fAq9jlyaWai3/n8okkGmfi9G3B33cqzPDXwVsh/N/Post
 xv/NFiTil6yZPXCWn1+YvSRmNLaaCG2li3J1WX2FF05ooIezAcbgstJzstRMSawW/jQW
 Y0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+nP4isH1Rrpm6PqB1T+HNbs6D4vVCidZRr16ayiLa8=;
 b=NuKtIFb90ynjkY/4MArYdaIykcNPMoXhUz7o9h9sat0CflF4jAVG/JN4EV4CUtMs7+
 RsZfBLeELLt43ciLXNolM2fk3llnLOv+EWALy3fakQDz+DiDS5kK9LRdzyiNESUx2m+O
 G8Fu2aDRIGHPcs8mp7/IdU2clvBC6GS1RLUxCdMZkqfTzobyZX6oBMSDXbmeBIWWm1em
 OsIr3Or/4nsvzLDypSoNSIni2gbHsGXHCfM+PxbfHYudQTIAEwiVf1KU45WnIcCw0qaa
 I8HHUP4q4nOaZaKfgkvBImPbg7EXmvjFJM/lF2TufZs9MTVZcpEoq3UoaECRKIwZiO00
 +iug==
X-Gm-Message-State: AO0yUKXrXg2t4ePpa31T2ncl016T3FhDke8Xx3nvEq9a78j8cqBStLVC
 ivZTg2P1lgjtI3MFwOBw+jSBtQ==
X-Google-Smtp-Source: AK7set+ta6+3ud/gF0jnyTLJkaZ5IY9mbR9X5ZMEfl1uB1UaNOrlAHGNvqkoHumDtiNkldmP643lkg==
X-Received: by 2002:a5d:4d52:0:b0:2ca:8ae5:ea2 with SMTP id
 a18-20020a5d4d52000000b002ca8ae50ea2mr8364567wru.40.1677784127722; 
 Thu, 02 Mar 2023 11:08:47 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600001d000b002c558869934sm132379wrx.81.2023.03.02.11.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:08:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADBDB1FFB8;
 Thu,  2 Mar 2023 19:08:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 nicolas.eder@lauterbach.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Marek Vasut <marex@denx.de>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mads@ynddal.dk, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 01/26] gdbstub/internals.h: clean up include guard
Date: Thu,  2 Mar 2023 19:08:21 +0000
Message-Id: <20230302190846.2593720-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 19:08:51 -0000

Use something more specific to avoid name clashes.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index b23999f951..7df0e11c47 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 #include "exec/cpu-common.h"
 
@@ -16,4 +16,4 @@ int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.39.2


