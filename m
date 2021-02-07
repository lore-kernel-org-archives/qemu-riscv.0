Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8t0E-0002Dk-Bo
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 17:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0C-00029p-Pe; Sun, 07 Feb 2021 17:58:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0B-00016I-9u; Sun, 07 Feb 2021 17:58:00 -0500
Received: by mail-wr1-x430.google.com with SMTP id n6so2267274wrv.8;
 Sun, 07 Feb 2021 14:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NB0PxeiyUnyh7a2jT9hNZ8p231d4tVFomh4sbxGsRA8=;
 b=slRltlSuqvMFAGDBp3viXRI6JthnwFNxMwx6RyJ4j3hm6GV/kR9+8aqbOR6+A3BzxM
 0gtAC2rKPePsftfbo2XRRqavnfHOHTTxZenueD1DBEgcyFvQOWS+b1CAFlPgNuIcf2S6
 Ub1CbWlMaUNAY2o2E745DxA/eCYW2hPoYn2eeziOfZuk1dKP+bavqtGruhPoSODD1Li7
 HcHGRTZPvnMhyio06yyhs0bIZiJJTDHJ0OiqQ4Wqq+hYWmXbiFlQbr59xigi+VYUCHS8
 J6++DG236usVcnz+B7fXf4m4ssOQcjrHqq5+b5KzQETJUVxdEL6UiXPvpSV2R6qrDNyC
 Hf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NB0PxeiyUnyh7a2jT9hNZ8p231d4tVFomh4sbxGsRA8=;
 b=D80Qj1vx6Y1njZNmQg72xAhhCtEezWtd2H0UnlgJkRYQpSPqL8Vqcr8EgjAQA/jYXZ
 frQIqAMESKy7JXIMZG2Nu/TKs1874fkrxR5LNHyODmxIK+TISK2CLJqIK/igzMcWN3ul
 cagiE6bpQIR6LZ5bQclxkeozrAKIgdttTZ1WLVHVH2YslY9DzOqcWPwzz9epthJHZT8z
 ZPGkSh/svn74n3miWKXYxSLLNyC0HHrOxKJWwTVYx15GgoyRh4+WGDjUa4u9m1zPuoKw
 Y60gNujVPcNPk5n+2UgVsS8BcYM0y5R9IeFbdBJAx25wIo8LAWH4k9frKAxcXVdptRxL
 yVqg==
X-Gm-Message-State: AOAM531Fuod802BwpLMxoLSGCrv9utZOJh4xgeTVKMatiPUZ+qMGlmXh
 oEwDWbfbWFCb+25hIoFnU2bXZ5vqfso=
X-Google-Smtp-Source: ABdhPJwLDjFqLd5L/mM0ElOOSdXdRjOEnmrWm2sULZ8NwEYj/DXiJdrswdakwvI4ZhxHWX0b3IF7MA==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr17052829wrs.38.1612738677165; 
 Sun, 07 Feb 2021 14:57:57 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x22sm11914204wmc.25.2021.02.07.14.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 14:57:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/6] target/mips: Include missing "tcg/tcg.h" header
Date: Sun,  7 Feb 2021 23:57:35 +0100
Message-Id: <20210207225738.2482987-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207225738.2482987-1-f4bug@amsat.org>
References: <20210207225738.2482987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Sun, 07 Feb 2021 22:58:01 -0000

Commit 83be6b54123 ("Fix MSA instructions LD.<B|H|W|D> on big endian
host") introduced use of typedef/prototypes declared in "tcg/tcg.h"
without including it. This was not a problem because "tcg/tcg.h" is
pulled in by "exec/cpu_ldst.h". To be able to remove this header
there, we first need to include it here in op_helper.c, else we get:

  [222/337] Compiling C object libqemu-mips-softmmu.fa.p/target_mips_msa_helper.c.o
  target/mips/msa_helper.c: In function ‘helper_msa_ld_b’:
  target/mips/msa_helper.c:8214:9: error: unknown type name ‘TCGMemOpIdx’
   8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
        |         ^~~~~~~~~~~
  target/mips/msa_helper.c:8224:5: note: in expansion of macro ‘MEMOP_IDX’
   8224 |     MEMOP_IDX(DF_BYTE)
        |     ^~~~~~~~~
  target/mips/msa_helper.c:8214:26: error: implicit declaration of function ‘make_memop_idx’ [-Werror=implicit-function-declaration]
   8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
        |                          ^~~~~~~~~~~~~~
  target/mips/msa_helper.c:8227:18: error: implicit declaration of function ‘helper_ret_ldub_mmu’ [-Werror=implicit-function-declaration]
   8227 |     pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
        |                  ^~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/msa_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 1298a1917ce..4caefe29ad7 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
+#include "tcg/tcg.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
-- 
2.26.2


