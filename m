Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbUx-0007Ga-Uh
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUw-0007F4-DF
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:34 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUs-00043F-Bk
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so2209942wmq.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLGg403RjaWovushz/70Glwd971m6FnAr6QdPSjBFnQ=;
 b=SaS/eGa7SOZ2SrhDwCg5tCS0eUXDTh0LMjI9WnA8kbwFK/UQxlkO/NBM50GyLwo8id
 vySatOOXan7M2V3DALOt1EQOrPadosxizfeBswapooy4x3bO18wwe1Oyxkrbg5W79SXF
 B7ThSwIXHkZ/vcW3SjdhqnfJ9r2e9ECkNU7lw6N5D2WOpS7aS9FrHWgAq1NuCDo3At6Y
 UVv7+FExoKs8rrES0GWpocfyKA+NDYu6N+FwXqAMg9/u2SZ+k0sS3OlCZfu1Cge7lFHg
 uaQQxeMhnErLQPJX3nGLfhVs2lnllmVM0JmAQF8r7p5iclqNU9NPbG6nPii/Uv9NTasn
 YKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aLGg403RjaWovushz/70Glwd971m6FnAr6QdPSjBFnQ=;
 b=OFrD5Gn5gr5/4bf6kc5QxOJ4l6/RRZKcOtWFGYCDbuxuFvwqG7lsvnZUxCzu1cgB6M
 CkU74Eniytfm1rhJ30qLy+TT5pmlwItnUAWhZtf7waT00i6b4oOG09Kv6w5ozTZSXMon
 D0J+TOPQSyNNMWX0rd9xoBdmgiaw2yARgaV9Zr9zEx2qFAMI/uo/5CgXlJ8QimbisSEg
 EkSWI/HAoCe2VJwQk9bCQur0lVnjj8A5pXRNbu+9fVsRaq9oczuRf8Vx3gQwP1MIT4/Z
 5vhrZP/2WRkgel0XAa9licIlkLhuGi6TxdfXQOBkFWSpsMkRqbuZxDVKYLubjti9haMX
 ch7g==
X-Gm-Message-State: AO0yUKWg4e6ToaVlSLCE7Lb/A97OzmutPH7ItZrC6MH3jMfOxY1lPRyj
 vBbQ/FZ1q4/9hcoBWWl0zPxJHg==
X-Google-Smtp-Source: AK7set9Wbob1K0zMF7c8LJqOpDfRs1fkdaaYG5NZcJUoN9MghVdfkIaJtu3hfRyab6Yl8ogV8UCbpA==
X-Received: by 2002:a05:600c:46d2:b0:3dd:37a5:dc90 with SMTP id
 q18-20020a05600c46d200b003dd37a5dc90mr10500022wmo.32.1677019948379; 
 Tue, 21 Feb 2023 14:52:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 hn29-20020a05600ca39d00b003db03725e86sm5952326wmb.8.2023.02.21.14.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 608D01FFB8;
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 01/24] gdbstub/internals.h: clean up include guard
Date: Tue, 21 Feb 2023 22:52:04 +0000
Message-Id: <20230221225227.3735319-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:34 -0000

Use something more specific to avoid name clashes.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b444f24ef5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,12 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.39.1


