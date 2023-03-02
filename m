Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoNu-0006ju-6o
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNs-0006fV-6H
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:32 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNj-0000kn-Lj
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:31 -0500
Received: by mail-wr1-x432.google.com with SMTP id h14so155775wru.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nGJS3TcjePwhHIbOnspKgR49rDlBrdUVNx8YN4xopU=;
 b=c2dzS+/vMLVsojBfKJnEcMJI5C2OOz7g80CJOtOK2sGwGB9UfyRI7b66Zc3u8JAhr7
 tIZZPqcIjCZvniFrH7r32uHBud/Fiy3m+p3k1gSDIc7mNt4vR2EtGC98sXXRCyQ9/eFf
 dbKQSelNgujobyuQ0AWo8bW92pn2l31Rwwal9LQSpNcak4fTZ5REKqUQucip7T1sFwkn
 jp1BWroal/WWkMEdYmfJTGtzy/UaYpvygzL9MStYCAe3AOAXLZWIH9ffXLWwdttZ24cE
 Q6nwksCyebBOzkoFpUPoUagwvZJGbH9Xd+gPS4Xv75+1OqDBCDSY7vfRTF7oUfXm3m3B
 qgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nGJS3TcjePwhHIbOnspKgR49rDlBrdUVNx8YN4xopU=;
 b=Qe/B1hy44I3d1U3UxWV2fqrsfkijn7MzwV0YqP9qWrGKIyvww+VttdcY0CP6NboY2n
 jCC3qmBqDvH5GvEc5qw3JJ8CEIwgNLV8x36riS7iwxuqFtdiq7DC342T2Heq8iLX7wKc
 46RHvbMx/QUyRJNt9NXXUBcv2OusTYMKJYcNcpp+oJKet2DUqVqcwQkAqTP3PuKm/A2J
 SDpL6jpMT6FNriXwslvf8h3XAAfq1vCc17OpJVYo+y8j6Niad3F+BMrxslU4tAblLJ61
 xwp4pr29TW6obRqlFMXphM2oGkj19Sco0xYRTgNQLEGEi8v8eRCEm6yXaFqDc8gaGq5U
 76Cw==
X-Gm-Message-State: AO0yUKVdGmsALe/dVxgW2Wq7nBy1q2dBLdrz3HvJNkqH6dSC5/GMvC/M
 tmHzUC2gvsYOPBnpIXsD5sDLVA==
X-Google-Smtp-Source: AK7set+Q70UxKdpfAWTcqp8rXJI6MlAyYRt6imddI390dRCuIlRX5/AkaY1nmZEit+fxPIc10A9txA==
X-Received: by 2002:a05:6000:108c:b0:242:1809:7e17 with SMTP id
 y12-20020a056000108c00b0024218097e17mr8349240wrw.6.1677784462023; 
 Thu, 02 Mar 2023 11:14:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d4581000000b002c55551e6e9sm132841wrq.108.2023.03.02.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:14:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 169191FFBF;
 Thu,  2 Mar 2023 19:08:50 +0000 (GMT)
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 22/26] gdbstub: only compile gdbstub twice for whole build
Date: Thu,  2 Mar 2023 19:08:42 +0000
Message-Id: <20230302190846.2593720-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 19:14:32 -0000

Now we have removed any target specific bits from the core gdbstub
code we only need to build it twice. We have to jump a few meson hoops
to manually define the CONFIG_USER_ONLY symbol but it seems to work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - also include user and softmmu bits in the library
v4
  - include genh for config-poison.h
---
 gdbstub/gdbstub.c   |  4 +---
 gdbstub/meson.build | 30 ++++++++++++++++++++++++++----
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e264ed04e7..d9e9bf9294 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -39,9 +39,7 @@
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "exec/exec-all.h"
 #include "exec/replay-core.h"
-#include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
 
 #include "internals.h"
@@ -1612,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     {
         .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index c876222b9c..d679c7ab86 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -4,13 +4,35 @@
 # types such as hwaddr.
 #
 
-specific_ss.add(files('gdbstub.c'))
+# We need to build the core gdb code via a library to be able to tweak
+# cflags so:
+
+gdb_user_ss = ss.source_set()
+gdb_softmmu_ss = ss.source_set()
+
+# We build two versions of gdbstub, one for each mode
+gdb_user_ss.add(files('gdbstub.c', 'user.c'))
+gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))
+
+gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
+gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
+
+libgdb_user = static_library('gdb_user',
+                             gdb_user_ss.sources() + genh,
+                             name_suffix: 'fa',
+                             c_args: '-DCONFIG_USER_ONLY')
+
+libgdb_softmmu = static_library('gdb_softmmu',
+                                gdb_softmmu_ss.sources() + genh,
+                                name_suffix: 'fa')
+
+gdb_user = declare_dependency(link_whole: libgdb_user)
+user_ss.add(gdb_user)
+gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
+softmmu_ss.add(gdb_softmmu)
 
 # These have to built to the target ABI
 specific_ss.add(files('syscalls.c'))
 
-softmmu_ss.add(files('softmmu.c'))
-user_ss.add(files('user.c'))
-
 # The user-target is specialised by the guest
 specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
-- 
2.39.2


