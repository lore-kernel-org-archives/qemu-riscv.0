Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTLU-0007db-Kd
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTLQ-0007OV-2A
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:56 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL0-00073E-Os
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:55 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1778436wmp.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NcS4hNAbvjNn/XqrZsftJnuUUOYptsSXutjGWOmXxwg=;
 b=eeHobIq0oBfhjiOKBmm6NvI8P4yo6+bjI5J8A7uuJXpPvFzDmjud2skPw9j0wsJD5h
 ZQHrQpl1Zy4Phn2wjGJFyN1hrLv3937t77xLUi/9aM0En3AGRVS/6ws1mWrMAd45BjOo
 2y8JEuxUByimIZMtTQLikH7nPtlLODRW7m/QyzBQ3KODjqeFLcC+esSkn2Il0vzDdCYz
 G651qKWEuAamMAnZngBh03Cd7IKHCQUH+ANAIMkiHeaDqCh2VbqNacHPswHlLddviPD4
 Nlv2TDmzcWxeGncz9Rj4HJy7IuIZ6J1SJgWjBIs4xFvwj0TpyRZ4Ja/m3y12zvh0O7lI
 egUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NcS4hNAbvjNn/XqrZsftJnuUUOYptsSXutjGWOmXxwg=;
 b=ekuz44DFxJqbbFyEhP5VPh+mKvZeYANAlBLtWcDUpjkCj65107ldiGbEXDh+LBF+w+
 aKwz5qmAVo32ZUIOnU+ya0wQTXkeRvAMZwWEyDBp/WoQhQQoJhBDkbsTxFIgxDvXMn54
 tN1cGuwSsxk/lhHE/V/KbDp2pRBm1wcP3h9+HYUTPLO+3tOXaRdH7Q85CTbZzFFnvhd7
 Dy1491QhGKOjyp4BxyYSz/hy7q4dfFuxjSu8YY1D0ZDI++hl4oZZ0ghY1zsV4icdwJjY
 2Nq93JKYJVUmkSwJ2DH4KwNBl3zkN1c8SQsFQURI6p/X0wAU1M6niLbZwocsX7661pXk
 frRg==
X-Gm-Message-State: AFqh2ko4Rk6if2pBUkDC1MSEKaLorHW4E/+ZBWujRHjJH9VomrWapa+k
 zBoxiMTAwDQHnuDIx2v0N2UX7w==
X-Google-Smtp-Source: AMrXdXu3zEan8JPHmic5mJS8RxNaM04oZU87zXmuv8VyOtllSFdiX2lw6e3m/SkYDQSJ91ojVbvE3A==
X-Received: by 2002:a05:600c:4e08:b0:3d2:139e:f64f with SMTP id
 b8-20020a05600c4e0800b003d2139ef64fmr39086784wmq.40.1672937009248; 
 Thu, 05 Jan 2023 08:43:29 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003d973d4fb28sm3071619wms.4.2023.01.05.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7CBF1FFCB;
 Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
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
Subject: [PATCH v2 21/21] gdbstub: only compile gdbstub twice for whole build
Date: Thu,  5 Jan 2023 16:43:20 +0000
Message-Id: <20230105164320.2164095-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:56 -0000

Now we have removed any target specific bits from the core gdbstub
code we only need to build it twice. We have to jump a few meson hoops
to manually define the CONFIG_USER_ONLY symbol but it seems to work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c     |  3 +--
 gdbstub/user-target.c |  2 +-
 gdbstub/meson.build   | 32 ++++++++++++++++++++++++++++----
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 57bbda3505..0dbb9f5338 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -39,7 +39,6 @@
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
 #include "sysemu/replay.h"
@@ -1611,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     {
         .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
index 83e04e1c23..46f5729999 100644
--- a/gdbstub/user-target.c
+++ b/gdbstub/user-target.c
@@ -235,7 +235,7 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
 }
 
 
-#if defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_LINUX)
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx)
 {
     TaskState *ts;
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index 56c40c25ef..193c20203d 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -4,13 +4,37 @@
 # types such as hwaddr.
 #
 
-specific_ss.add(files('gdbstub.c'))
+# We need to build the core gdb code via a library to be able to tweak
+# cflags so:
 
-# These have to built to the target ABI
-specific_ss.add(files('syscalls.c'))
+gdb_user_ss = ss.source_set()
+gdb_softmmu_ss = ss.source_set()
 
-softmmu_ss.add(files('softmmu.c'))
+# We build two versions of gdbstub, one for each mode
+gdb_user_ss.add(files('gdbstub.c'))
+gdb_softmmu_ss.add(files('gdbstub.c'))
+
+gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
+gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
+
+libgdb_user = static_library('gdb_user', gdb_user_ss.sources(),
+                             name_suffix: 'fa',
+                             c_args: '-DCONFIG_USER_ONLY')
+
+libgdb_softmmu = static_library('gdb_softmmu', gdb_softmmu_ss.sources(),
+                                name_suffix: 'fa')
+
+gdb_user = declare_dependency(link_whole: libgdb_user)
+user_ss.add(gdb_user)
+gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
+softmmu_ss.add(gdb_softmmu)
+
+# The rest of the mode specific code can be added directly
 user_ss.add(files('user.c'))
+softmmu_ss.add(files('softmmu.c'))
+
+# These have to built to the target ABI
+specific_ss.add(files('syscalls.c'))
 
 # and BSD?
 specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))
-- 
2.34.1


