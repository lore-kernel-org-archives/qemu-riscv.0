Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAP-0002NN-H1
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAL-0002HF-Ng
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAA-0000hi-3Q
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1821059wmq.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2lqvTUuUPDyKzIrsP16s/eYBb9PuaeW9Nb5YqUgavw=;
 b=LIp+fyzYsr1PkYiEm7gbcx1B1sBzNXTJuwtFxRcoiSddXx0bTYiRbX5j+lLUqWIw8W
 H5qZNkdj4kR1dxg1fK+bR8TohBNHv/pzMkREtdrLCcP7nnNvAFB25jIYVWSPQKpxBs+8
 /hJNOp5krYGHqxbJvCnpZTg1b9cU2Ht0PdKKRFGW4YOGUvFgQB+ub8wT/ZrfOdMIDplI
 136lgdbi2SGphMeZM4ZCYjrF8VxJvTdIo3jxhSP1sxi71i4dhKnkQcjVVbovbNVjDtkO
 W9WQwK8+mH1g8kCYmffpLkDG+ltccljeA81ickL8VInlRPDrhxqr8uWMh/66t6V/GQUZ
 MmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2lqvTUuUPDyKzIrsP16s/eYBb9PuaeW9Nb5YqUgavw=;
 b=K+6Gva6EO5SE17s9XltwIJwTu410H0ORn9rp7yJ/zAL7Ap8pgT6BF2x3v91RsStJT5
 IXOkK2KG3YBKCFJugLtONwgvi2V8KjSbSJFAWG0qIxK8Q4dAFnnuc33cV9/FHq7qdyOf
 EHDLMX64PwU7/L+WM898h/ZPtnZWEVp6aUscNn3LF/sPaoGxEl3w9vGwm7+Yn98z2WVr
 4VZW5GupqQvsmuTx7Q3Q3hX7AT9KE4VUncI0C9BCaGzPyizcVMI304P6ckqXlmlKlcHa
 sabmlgcXh1wmDt9r/EayLE5m1KVrwHR6kvoNW7JeCggbiU95lGiYl81D3gbke7lvBX0I
 uZWA==
X-Gm-Message-State: AO0yUKU2GoAYcTOAWGGJoZ/ympfFgammPsVtmUlQ0bo8x3QNiwt0tca4
 MBEPeWFfgae7c+yCGCew0CVdVA==
X-Google-Smtp-Source: AK7set+VEIp9YLgiI3Cpdu6e7JCQ8r1eVep/251vrve7cVl4OJ4VJb1JPYrTAC5fq/kv1CdVuinqsw==
X-Received: by 2002:a05:600c:154d:b0:3ed:23d5:4c4c with SMTP id
 f13-20020a05600c154d00b003ed23d54c4cmr13594524wmg.12.1678902224268; 
 Wed, 15 Mar 2023 10:43:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003ebff290a52sm2854958wmo.28.2023.03.15.10.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 484EF1FFBE;
 Wed, 15 Mar 2023 17:43:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 15/32] *: Add missing includes of qemu/plugin.h
Date: Wed, 15 Mar 2023 17:43:14 +0000
Message-Id: <20230315174331.2959-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:43:58 -0000

From: Richard Henderson <richard.henderson@linaro.org>

This had been pulled in from hw/core/cpu.h,
but that will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230310195252.210956-6-richard.henderson@linaro.org>
[AJB: also syscall-trace.h]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/user/syscall-trace.h | 1 +
 accel/tcg/cpu-exec-common.c  | 1 +
 cpu.c                        | 1 +
 linux-user/exit.c            | 1 +
 linux-user/syscall.c         | 1 +
 5 files changed, 5 insertions(+)

diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index c5a220da34..90bda7631c 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -11,6 +11,7 @@
 #define SYSCALL_TRACE_H
 
 #include "exec/user/abitypes.h"
+#include "qemu/plugin.h"
 #include "trace/trace-root.h"
 
 /*
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 176ea57281..e7962c9348 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "qemu/plugin.h"
 
 bool tcg_allowed;
 
diff --git a/cpu.c b/cpu.c
index 567b23af46..849bac062c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -42,6 +42,7 @@
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
+#include "qemu/plugin.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
diff --git a/linux-user/exit.c b/linux-user/exit.c
index fd49d76f45..3017d28a3c 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -21,6 +21,7 @@
 #include "gdbstub/syscalls.h"
 #include "qemu.h"
 #include "user-internals.h"
+#include "qemu/plugin.h"
 #ifdef CONFIG_GPROF
 #include <sys/gmon.h>
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24cea6fb6a..27871641f4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -22,6 +22,7 @@
 #include "qemu/path.h"
 #include "qemu/memfd.h"
 #include "qemu/queue.h"
+#include "qemu/plugin.h"
 #include "target_mman.h"
 #include <elf.h>
 #include <endian.h>
-- 
2.39.2


