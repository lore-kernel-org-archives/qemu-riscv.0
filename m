Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pd-0005KW-DL
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7PY-0005Co-Os
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7PX-0003ps-KT
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:28 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36048)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7PX-0003pK-E9
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:27 -0400
Received: by mail-pf1-x444.google.com with SMTP id v19so7165050pfm.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=HIR+c06Wfqq3ZkFGxgsdg0iHWKtF3xHcneoz3/psN0Y=;
 b=YJh3uCNo2S9W9t3kF+BKtmjUFPIDp/7/zMEDIJY6puZ37YfFLh+y7dEiHV7coE2BMP
 Zi+9DxvkuxBVzzaIopYEYELn6kkx8WZbC7iJwRrC6Gz6+It4fnsbQEeX5Zd80Kfb/ceW
 tsTwX+b8CsC2XPfWuJrliGJBbUEhUkMuKm1CXIwD+BfSnuGhYxHkxJZ8rTJrNtpHdNvf
 cBTM/iRi2d3gR9z1jCW//2uGutTO7gtf4KxqpuQ8KUTrco+GsX2iKTQTZlGiDXbPW5V9
 UPo1G1R/B/iqo1D/YQtUaL4dInTc/oGqjxA+MAfn+X1APEQD5V4BYFVVZfPWi6DW9Igg
 VuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=HIR+c06Wfqq3ZkFGxgsdg0iHWKtF3xHcneoz3/psN0Y=;
 b=CFJPL9/GjrwUvHKjIMAcUIJyKlbzSHpSlPFsXVJRGkN7+dWKAvLbqmpoi2Xo+jGjPA
 qskMoRA3QJcv2jxSPEBhHnfWgZu68kXdn3y+JVKu1L8DSQqbtlaAbLjpuq1+9/R+/teM
 YUJlKPnRJBGCz/D47QDUx7f8+wCC5wUoXk/pXjyYHL0lYWFzr+rJAcXS+AthaD8m78pk
 IDC8YMjnzo/BvxLK3FFm3xtTxM8jGzYIA/YYrWmhlV+Rw0ZJEIBTTqcxH6Fo+Bg5BFJ4
 v64rijdAcITrydmjDKVlok77WGtXtis5DLAsFu0qmSvdSJ0UL9GBbqaLyOyz7rg+rfN+
 8aBg==
X-Gm-Message-State: APjAAAWUsy443tw2bwBe5HsiWmqiYkYVQ9e6QJ9uut4IbKplcpJhszlw
 isEdCTvvr04AIxhEVJRt+bGu0Q==
X-Google-Smtp-Source: APXvYqy/cnTueqbJqpZmDFmGsbVAM6uHUE0dlQQ+8TE2OKciOXXgJe1NKCMiqE+2LhqCrkKCP/G0ZQ==
X-Received: by 2002:a17:90a:5288:: with SMTP id w8mr846179pjh.97.1572278306521; 
 Mon, 28 Oct 2019 08:58:26 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 66sm3855027pgi.49.2019.10.28.08.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:25 -0700 (PDT)
Subject: [PULL 06/18] linux-user/riscv: Propagate fault address
Date: Mon, 28 Oct 2019 08:48:50 -0700
Message-Id: <20191028154902.32491-7-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Giuseppe Musacchio <thatlemon@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:31 -0000

From: Giuseppe Musacchio <thatlemon@gmail.com>

The CPU loop tagged all the queued signals as QEMU_SI_KILL while it was
filling the `_sigfault` part of `siginfo`: this caused QEMU to copy the
wrong fields over to the userspace program.

Make sure the fault address recorded by the MMU is is stored in the CPU
environment structure.

In case of memory faults store the exception address into `siginfo`.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 linux-user/riscv/cpu_loop.c | 3 ++-
 target/riscv/cpu_helper.c   | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 12aa3c0f16..aa9e437875 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -89,6 +89,7 @@ void cpu_loop(CPURISCVState *env)
         case RISCV_EXCP_STORE_PAGE_FAULT:
             signum = TARGET_SIGSEGV;
             sigcode = TARGET_SEGV_MAPERR;
+            sigaddr = env->badaddr;
             break;
         case EXCP_DEBUG:
         gdbstep:
@@ -108,7 +109,7 @@ void cpu_loop(CPURISCVState *env)
                 .si_code = sigcode,
                 ._sifields._sigfault._addr = sigaddr
             };
-            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
         }
 
         process_pending_signals(env);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 917252f71b..f13131a51b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -455,9 +455,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
 {
-#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+#ifndef CONFIG_USER_ONLY
     hwaddr pa = 0;
     int prot;
     bool pmp_violation = false;
@@ -508,7 +508,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     case MMU_DATA_STORE:
         cs->exception_index = RISCV_EXCP_STORE_PAGE_FAULT;
         break;
+    default:
+        g_assert_not_reached();
     }
+    env->badaddr = address;
     cpu_loop_exit_restore(cs, retaddr);
 #endif
 }
-- 
2.21.0


