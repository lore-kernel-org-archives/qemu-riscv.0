Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoIV-0007Mn-JJ
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIT-0007KL-Rc
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:08:57 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIM-0004VJ-Bq
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:08:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id h14so142021wru.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpN9HZmBiUU2swb5foi3aRB2Xz7IiTbLS73Qjjs5Gno=;
 b=X6ZpukbXB7ZQFc1ZKHqIcOrN4oUK5G/8vtg+7hvGOx4U57/FqhUHa5xkh0ATKgmuAz
 bVpNTe20/S+d5VqJiweBYfKEYdadM1ook/Q194p9EbRxNm5CXT+Y9eGQ5qzxY5MSDCFV
 QBYYyfW/1y6yV5SjCj3PGhaiWVrru80L5WWqRcyfyIbWfZW8cjCZdoEpy3ZUFrXAr5J0
 Nq8sm2b6TPMo4q8nuUZ7v/o+QGqmDNn6C/dThABzyzE6qr5dE/WPmq9xUdGb99Uv35QL
 /44TeseRvDIZWTOQ/hCTTRPI0HCC/CaNYOPAK9iJcnmLlyz+TU/GwELecI8eQwqAosOF
 PAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpN9HZmBiUU2swb5foi3aRB2Xz7IiTbLS73Qjjs5Gno=;
 b=Zel0RGEYilGKHfZWPDb0Ul5d+NK8RkiosmyQscpMhrlR5I4P/6GpazrdIcdD428Zoe
 U4oHkJlJqkt99unP+NfFclIZ4ttlY+PBZQ7BJQ9+P8PiJl6znbhKhhb4jpqyVgX6B+4C
 TkB1rX8LKdPI6qnoSj003z/k4KFR99UNgbi8g/VLHmK9d7Gwk7mIe8eDMAOkoaNC44ZU
 7PmEtJw18rzRbLU37tjsblGtiZrQCiALkIK3+aFBhtJGK4YWUENmobstwoGWYD+U8KIO
 OdkJlKd+JvjdgbNxrymwtnpnWqYNgQVQXwzRBwMXG6qpEuJqI0s0mf6K5nH9v32bSe0V
 w+kA==
X-Gm-Message-State: AO0yUKWg1i0tMIG7tM8BNOcmnhgWeo5KXmlf4xr1BoeBO5fKVT0Zox5D
 mVshL5X3vedWXqkD8CWuYAaJAQ==
X-Google-Smtp-Source: AK7set/v7x1LqejxyJQY3tLZfGvFHQz1CzgOGP8zxK8uPbd5BSOymIpa0zLlvGeYomEwHDqsj8k0Jg==
X-Received: by 2002:a5d:4e86:0:b0:2c7:fc61:1676 with SMTP id
 e6-20020a5d4e86000000b002c7fc611676mr8634371wru.7.1677784128871; 
 Thu, 02 Mar 2023 11:08:48 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003eb2e33f327sm6700116wmc.2.2023.03.02.11.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:08:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E33201FFBB;
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 03/26] gdbstub: Make syscall_complete/[gs]et_reg
 target-agnostic typedefs
Date: Thu,  2 Mar 2023 19:08:23 +0000
Message-Id: <20230302190846.2593720-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 19:08:58 -0000

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
don't depend on "cpu.h", thus are not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221214143659.62133-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index f667014888..1636fb3841 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -71,9 +71,6 @@ struct gdb_timeval {
   uint64_t tv_usec;   /* microsecond */
 } QEMU_PACKED;
 
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
 
 /**
@@ -126,6 +123,7 @@ int gdb_handlesig(CPUState *, int);
 void gdb_signalled(CPUArchState *, int);
 void gdbserver_fork(CPUState *);
 #endif
+
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
 typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
@@ -133,6 +131,9 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
 
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
 /*
  * The GDB remote protocol transfers values in target byte order. As
  * the gdbstub may be batching up several register values we always
-- 
2.39.2


