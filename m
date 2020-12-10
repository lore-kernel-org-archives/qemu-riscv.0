Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knCnt-000870-8f
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 22:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npickito@gmail.com>)
 id 1knCnm-000837-Iq; Wed, 09 Dec 2020 22:39:34 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npickito@gmail.com>)
 id 1knCnk-00042l-TQ; Wed, 09 Dec 2020 22:39:34 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so3829941wmb.5;
 Wed, 09 Dec 2020 19:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5d9TBTvx+BrjDrYNZfyHcLW2iP9KNHH88askXsDz00=;
 b=CGSkPkaMNtXyAxAMo8w81C07vDV9Mz59tSefQT/Qm2FsCeetPYLREb1+pR5eh0SV3S
 EeLmJEo8ZCDYCIkrWqFqvy7SwnQQkFZqfUzpnzsA50fkymghyWTNOCjqMAsTQojojxj9
 ecKXqTerOBZZBjUYE1k3eCNhe+7ZWZgN0bYTJwhwNt+h51SouI8RyBP8owJteCIPjgV4
 w15Y/akQxX1QPZzeevPA/HpxS2xefQ3R6DvHZsav+Vn+MhqbcMVY5lpKGZ5AR6so/BZd
 fqpuPCFmdgBa2wOWQOdPw8pxa3S8oU8+xwBaR7eAmLZlBMkNXI5dMa2kXXdtrlJ93TC6
 ifkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5d9TBTvx+BrjDrYNZfyHcLW2iP9KNHH88askXsDz00=;
 b=F63PNTnnmvuRH8624/quzi5v5LgBQ7qpTqu/BKFBO71KtJTy1GzT6C23wnkGO/44Q9
 1Pzg2JMbKZo3ACZI/KaQVpO8YbkCym5ikFXG7dARecFxxOvszlPfdDtbKo3CWx0mUyAx
 0Z5KNGChgB/7/Qyz8Goxydgi9HlPqvEY5v+1dxGLhbZ1vPGFaKasgkWY/UEVicqm1zit
 zDaYmBhn+Zmv5GrFycDNP/pmgTM6k09EHPgpOuwv/2I1LEfjFm6HVi1Y6vCkyrPt2aCw
 GRVuaadMQp2X3gIvzpTMolNka5BjlrFlh/TG9tu8uyCR9ZfAfUiCNtk8uOzk5DSwDyPb
 AhTw==
X-Gm-Message-State: AOAM531uoAaxVElHz3Fp36RdLBSrb8tD179niOC6KiY9H/o3zBSrWM6i
 bY5OHc/yjNzXGDORHJ3utKVvokk+oJCS65dheC0=
X-Google-Smtp-Source: ABdhPJy3t0yqduZbqTK+CWFHcIMePNKlf1S6Sr/0F768Pq8MCEoOcfn5f+G2IJ9cxtu9Vjh1QAwSw3KojQAvffc7cnE=
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr5885750wmh.154.1607571570716; 
 Wed, 09 Dec 2020 19:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
 <87r1nz6iz4.fsf@keithp.com>
In-Reply-To: <87r1nz6iz4.fsf@keithp.com>
From: Kito Cheng <kito.cheng@gmail.com>
Date: Thu, 10 Dec 2020 11:39:19 +0800
Message-ID: <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=npickito@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Dec 2020 03:39:38 -0000

Hi Keith:

Thanks for your reply, but it seems like we need some more modification in
 linux-user/riscv/cpu_loop.c to enable that, I guess I should post that in mail
rather than attachment :)

Patch here:

From 2f1eb5825a6dda177d3289106970eab05cb08445 Mon Sep 17 00:00:00 2001
From: Kito Cheng <kito.cheng@sifive.com>
Date: Wed, 9 Dec 2020 14:24:51 +0800
Subject: [PATCH] riscv: Add semihosting support for user mode

This could make testing easier and ARM/AArch64 has support on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index aa9e437875..9665dabb09 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
+#include "hw/semihosting/common-semi.h"

 void cpu_loop(CPURISCVState *env)
 {
@@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_SEMIHOST:
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            break;
         case EXCP_DEBUG:
         gdbstep:
             signum = TARGET_SIGTRAP;
-- 
2.29.2

On Thu, Dec 10, 2020 at 12:30 AM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> Kito Cheng <kito.cheng@gmail.com> writes:
>
> > Hi Keith:
> >
> > Thanks for the patch, I've verified with newlib semihosting support
> > which is contributed by Craig Blackmore from embecosm,
> > and I would like to add semihosting to user mode, do you mind add this
> > patch into this patch series?
>
> I tried to add that already, but I admit that I haven't tested it in a
> while. You should find that there are patches to linux-user/semihost.c
> and linux-user/qemu.h to enable it.
>
> --
> -keith

