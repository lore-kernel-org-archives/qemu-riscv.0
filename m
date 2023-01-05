Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTL4-00070p-UF
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL2-0006y8-JG
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:32 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKu-0006xM-Sc
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:32 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so23489700wrb.11
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gy0/zYZetKWbyUE6WFREVjvsOrbcepCm3I2qjMJQWPs=;
 b=bWGIh4n5W0WXN1S+Duq3L8i3fjlHKGKmzaM11j5lC326ME8APPMaCO2+WYAbfMCv/p
 C6hPzerTl0i1D8oaDV8hYRpUMzolCt8X2JWmnx8FXif1Wxt48j0HwrJKEFpyRZQiFnUm
 m4YKa5D9Z5cCHSk4LyE/QDQ2Vsrv/vUf11TW7+5ssPiY4a7mPuI5J8GDyhbET9gKNEKw
 QsPWrYPHXUAogHu1uaX8oQkx1/DNifGffQbYFyx5uWxVcBYZDXijJD4OzoZBR/yjVCbO
 /TJEgw6RTZtc3VX+tPN+eXbIlISa3bUpMHWoNy32TEkOlv0E71CXFH1kSnabb59LyULf
 f6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gy0/zYZetKWbyUE6WFREVjvsOrbcepCm3I2qjMJQWPs=;
 b=JIX5VINLcqX3mfRzU8oDYD4d/ZJzqvUSJtaxpZ6MtlUVkBfDTUFljJ9h/4KPr09fRI
 1G8rwDCPX6UH2rBjwp9SaRbeRRx64aL1oW/pKlDsEY71D3EHn3zlxg14/mHYNMY40V5/
 9GlylCZTl7PQmBo6OFu8EYyhSOfRGPRQhYZToSO90RSiat+FIaKPTPNWuFn9osw8oe0p
 9+zwGeLXyNgCAO88/quCmzrlsXmVY6IRM8PSWzeTC9ZwCtHcxEe27OVkiFlBFLrj6jKe
 9Ej+B9f56naQdWttGLVg3dFLcphDq2YtXvAkA/RRjIPNMqg86iL7wb3SwPCgkVKO8jhQ
 knQQ==
X-Gm-Message-State: AFqh2krm/9FGCawjxE8nSzs5Bfjore6+TVBHiwmMFYJHBSFbngn2XKty
 DC7c2BgfB5RpVj2TdLa49RM/tg==
X-Google-Smtp-Source: AMrXdXu7qU9YBK4/mrQHdpveZw8jkJM/B4BWs89GyVnrPAUqTIKKWOVKeqLyd/KpK36Rh55TN84fag==
X-Received: by 2002:a5d:5b18:0:b0:28d:f043:490f with SMTP id
 bx24-20020a5d5b18000000b0028df043490fmr18704223wrb.71.1672937003380; 
 Thu, 05 Jan 2023 08:43:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b00286ad197346sm23886829wrw.70.2023.01.05.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A9361FFBC;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
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
Subject: [PATCH v2 04/21] gdbstub: Make syscall_complete/[gs]et_reg
 target-agnostic typedefs
Date: Thu,  5 Jan 2023 16:43:03 +0000
Message-Id: <20230105164320.2164095-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:32 -0000

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
2.34.1


