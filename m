Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8tP7-0007xK-KR
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 18:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tP4-0007uY-CO; Sun, 07 Feb 2021 18:23:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOz-0001Ce-Ra; Sun, 07 Feb 2021 18:23:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i5so3098340wmq.2;
 Sun, 07 Feb 2021 15:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gknr3qlLHrPVofS5zv6p1SYehluW78knvLtOubYhBs=;
 b=K1AaafdYfn0sBrm+KdYQJAGu13yoJyk/44KneP29aXMPf/9RL7wbXwv7enDMeXR8tG
 /XuGjf+uAIKFmqwYv7PpvhzNyH4LmfOlux/5XFu6+tDrz1e7uvByNMY4StPMoRM6yC7+
 0evGxHJPAXFHJdP0jUM3wtH9MvFFUulsPJFi5AsAaUe3q2xEcYVtcqXbU/c/nS/sG3HY
 x5hGdI4HSEtrBnwHNAvHwVPQAa80SRIKMwLDxuaWfIk/of/Z25GE5ExlWUaf/jGIy89j
 TE2M2PqdEWRCWK8lqc5fmIWpB/Mcy9MKv1QtHsZlClyoziZspXHVZ5f9QUgCkYrvKJr7
 r2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9gknr3qlLHrPVofS5zv6p1SYehluW78knvLtOubYhBs=;
 b=QsXk9CNm1ov1dl40ICsXfQr7s9MYuZYmUYgkfiYtHWhVBD40KAtaxgrfAcnl7C9x0X
 vJmLjywAbJqnX+ezml9HheejCAIhg/oZ6pq4gxM/L9cL/nmZT2SmH3HbIMobBbPs67Un
 Ee2RbucOUhA3xDSjUq10SIohSlrR/Hubuu2klolODNqpWkqgHuXtO1EMFw4nyf+Rmb6O
 xPrsTGppb7qZEC5JemS6DptTBYQ8dxEGu38i5u5U2y0A9QGU/yuJXTEABJhdsT2Jz8Iq
 9nv5cNQ6XqZM/1YKemcxnUpayRH8ufztsTduY0U8KGxuzswYdvimDqRsiLOEYUEFqCiE
 DM0A==
X-Gm-Message-State: AOAM531se0NGysmQbz3n1t7cJxASjbh9i5LUMZa0OI6jOabLniajCLqq
 kJvfkQIGEDuy38461I2UWh7GWRL+Wss=
X-Google-Smtp-Source: ABdhPJxC60ACe0vE/X8upoWTKt/bY8N5fxgL8wrEih7fHr44FtHzW3qjMJzC63oI76VmJSIKv+s0fQ==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr12528249wmb.78.1612740214536; 
 Sun, 07 Feb 2021 15:23:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e10sm24315162wro.65.2021.02.07.15.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:33 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 4/6] accel/tcg: Include missing "tcg/tcg.h" header
Date: Mon,  8 Feb 2021 00:23:08 +0100
Message-Id: <20210207232310.2505283-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207232310.2505283-1-f4bug@amsat.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Feb 2021 23:23:43 -0000

Commit 3468b59e18b ("tcg: enable multiple TCG contexts in softmmu")
introduced use of typedef/prototypes declared in "tcg/tcg.h" without
including it. This was not a problem because "tcg/tcg.h" is pulled
in by "exec/cpu_ldst.h". To be able to remove this header there, we
first need to include it here in op_helper.c, else we get:

  accel/tcg/tcg-accel-ops-mttcg.c: In function ‘mttcg_cpu_thread_fn’:
  accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: implicit declaration of function ‘tcg_register_thread’; did you mean ‘rcu_register_thread’? [-Werror=implicit-function-declaration]
     52 |     tcg_register_thread();
        |     ^~~~~~~~~~~~~~~~~~~
        |     rcu_register_thread
  accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: nested extern declaration of ‘tcg_register_thread’ [-Werror=nested-externs]
  cc1: all warnings being treated as errors

  accel/tcg/tcg-accel-ops-rr.c: In function ‘rr_cpu_thread_fn’:
  accel/tcg/tcg-accel-ops-rr.c:153:5: error: implicit declaration of function ‘tcg_register_thread’; did you mean ‘rcu_register_thread’? [-Werror=implicit-function-declaration]
    153 |     tcg_register_thread();
        |     ^~~~~~~~~~~~~~~~~~~
        |     rcu_register_thread
  accel/tcg/tcg-accel-ops-rr.c:153:5: error: nested extern declaration of ‘tcg_register_thread’ [-Werror=nested-externs]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 1 +
 accel/tcg/tcg-accel-ops-rr.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 42973fb062b..ddbca6c5b8c 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -32,6 +32,7 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
+#include "tcg/tcg.h"
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 4a66055e0d7..1bb1d0f8f1c 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -32,6 +32,7 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
+#include "tcg/tcg.h"
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-rr.h"
 #include "tcg-accel-ops-icount.h"
-- 
2.26.2


