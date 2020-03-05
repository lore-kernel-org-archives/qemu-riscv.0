Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9wlZ-0001x1-PZ
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 15:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j9wlF-0001ap-B7
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 15:06:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j9wlE-0000PW-Cv
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 15:06:25 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55428)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j9wlE-0000Or-7v
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 15:06:24 -0500
Received: by mail-pj1-x1031.google.com with SMTP id a18so43389pjs.5
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=b63i01lsSfJx7hLAgSRmKetc+8kJVR1BV3dRy9ZDD/M=;
 b=I209DxEjoQUE/FsCcOD1BKvPwiq27ntLeqSCSKiXP9UFemQCPZaiSxNUjwfDarSinZ
 udjxSGaintD9P1Z0/QfIJhA0eYUhQtsZobVl8sC5yhIviolU0m0Qs7WU1+8MZkkfRGzl
 gQ9g3Ca5x64Od6Drq6cNaaUs4RjYAp/zi27Rm/p0fBGUhR06DrzVeP/JYz50daL2bbk1
 2w+ErsARypoOhaawzQCs0wdreleNvQ0Iy/417cDHocdukvNkw9Qv/mOy1cSouiuOjSo1
 l8pnyCIJWMo7/5+/NdsheNGykkKH3zv3XzXWdu0+zsJ/LkzXCyMp1YtF5PZ6CJsQShzi
 NBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=b63i01lsSfJx7hLAgSRmKetc+8kJVR1BV3dRy9ZDD/M=;
 b=cujQWqsuSxA7XofnVYkmgFXCkDFg/aJpEDq7Ucu/534CIS8eYtMyZQp5xKyBgqVU+7
 uTL+SSn0CbytQF3oWlZwBFS9KvpLqMqPdDzh4OSSkYz+osfcXKXeup3KUMRxWNFM8LPr
 HRGpv1qWz8rFQV504GSyabLi+yk1DSmNIOwxN70NkwRm4VL0qNq/50UPtHHnmey1iCuC
 3ad0vl76mcTS6VGe1oYbkwr5bPOhHcX5r/a6hsfhVHlGnWHTdf+45jkB59njCPy3FZcB
 vQh4jTJcMW3IX397ye0GRtCXGP3cbltri5qUHYR7SHnNJmiOpq3XmmB2wbGn7WRPsGlU
 dPTA==
X-Gm-Message-State: ANhLgQ38ILoeYKRkcDvfHS8LCKZvfvaMjYvzjk+kNwx22NgCscpzvr0t
 iDfYPHg9pgNniw1IomHFfNHTEgfhmksX4A==
X-Google-Smtp-Source: ADFU+vsPippyY3Nu2KwbDC+8ysPr6KXyNijNGebG4nkVJrKrUv0ktWRusvpCpuibKSa7I2l/npMyNA==
X-Received: by 2002:a17:902:6bcb:: with SMTP id
 m11mr567459plt.10.1583438782876; 
 Thu, 05 Mar 2020 12:06:22 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id a31sm17720146pgl.58.2020.03.05.12.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:06:22 -0800 (PST)
Subject: [PULL] RISC-V: Add a missing "," in riscv_excp_names
Date: Thu,  5 Mar 2020 12:05:58 -0800
Message-Id: <20200305200558.71104-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200305200558.71104-1-palmerdabbelt@google.com>
References: <20200305200558.71104-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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
X-List-Received-Date: Thu, 05 Mar 2020 20:06:26 -0000

This would almost certainly cause the exception names to be reported
incorrectly.  Coverity found the issue (CID 1420223).  As per Peter's
suggestion, I've also added a comma at the end of the list to avoid the issue
reappearing in the future.

Fixes: ab67a1d07a ("target/riscv: Add support for the new execption numbers")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


