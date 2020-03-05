Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9tiE-0002aP-Nx
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 11:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j9tiB-0002Tr-Px
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 11:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j9tiA-00066D-Lt
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 11:51:03 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:32772)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j9tiA-00065X-EV
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 11:51:02 -0500
Received: by mail-pl1-x643.google.com with SMTP id ay11so2884721plb.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=1MaaEtwKMFY1TpAkMmcdOhFvki73sjGjSM2t7iCfOEQ=;
 b=sWATFSgaSug5/N3mEcHrbK+PoJ7a6Gv9Y3fIJGJlfGQCcjjcRvXO0Xcb83LNmgUx+2
 kgoGQp1p6EPWCpNIN8GKAwQ9hGkVNfEAYWBWTZQsrVRINeIFcOVl4BKi7trLtHfG7d9G
 taxlKpls4W2zP9q00R7ZL6a2YSbfl4QLsJqn72LC9ibWV2xIh/qmDwVk/Om9PnYEM62u
 91gxzGnMlMa9czWzOKRAkZUT3OgSHz+h/WL8uqceY5cmIkj/MFXlmQvB0HUH6Z7ySbNO
 +XCZDyGulGt22Ha4ZrWjjzIxHqD4Jdab9ufc3rzEr4kJ1N+vYMemPEAgz+iqP1nII3u9
 cN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=1MaaEtwKMFY1TpAkMmcdOhFvki73sjGjSM2t7iCfOEQ=;
 b=r3L1+DjehlwLnLWYfr1d+lx8kBN07FCmkxKsvAZ/seQjsiaNI4cv4mqqAtOdewLrx3
 rrrVjElWDx51H6//0XgqzF4nNg6awlB2cZ7KQuEnsSGszPeuBKFIpc6kX31qBt8rl7Gs
 NUYA1LkGh7zUp/sgiz+uHE8L6UAd+okqDFEryXt7Uv0WDhB+09gG5DUdNj34pUJPj5p0
 IQYvvEoO49AKccU5ebscEZiguUmQKMxbbM/TE139TFtGoxLcpNPYjB+FhLMcGJNoY6Yv
 7ToDUa7q33WhAwmAEXHqoA9XtzIS4PyUP60U7lNY9XkZ56wCr90T1hFqS+pTMqngQ4B1
 hiJQ==
X-Gm-Message-State: ANhLgQ0LgGksw9r4mp7MZGzN8qIl43yr/UGIb6qISckBDmzvvpum6QXf
 6p2UzRhtZw30U21dV009xJgAwQ==
X-Google-Smtp-Source: ADFU+vuH7aN0Tp6YM5B0ZXPmtUMMM96PDTWdg6dNPVpFnC5hEoMDrRMOVcPRYpu+tR8djvHmm50E+Q==
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr382084plp.16.1583427060673; 
 Thu, 05 Mar 2020 08:51:00 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id n9sm29033303pfq.160.2020.03.05.08.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:51:00 -0800 (PST)
Subject: [PATCH] RISC-V: Add a missing "," in riscv_excp_names
Date: Thu,  5 Mar 2020 08:48:39 -0800
Message-Id: <20200305164839.201311-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>,          qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Thu, 05 Mar 2020 16:51:05 -0000

THis would almost certainly cause the exception names to be reported
incorrectly.  Covarity found the issue (CID 1420223).  As per Peter's
suggestion, I've also added a comma at the end of the list to avoid the issue
reappearing in the future.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c47d10b739..c0b7023100 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -66,7 +66,7 @@ const char * const riscv_excp_names[] = {
     "exec_page_fault",
     "load_page_fault",
     "reserved",
-    "store_page_fault"
+    "store_page_fault",
     "reserved",
     "reserved",
     "reserved",
@@ -74,7 +74,7 @@ const char * const riscv_excp_names[] = {
     "guest_exec_page_fault",
     "guest_load_page_fault",
     "reserved",
-    "guest_store_page_fault"
+    "guest_store_page_fault",
 };
 
 const char * const riscv_intr_names[] = {
-- 
2.25.0.265.gbab2e86ba0-goog


