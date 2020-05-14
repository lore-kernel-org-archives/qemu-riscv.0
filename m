Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZFwl-0000p8-OS
	for mharc-qemu-riscv@gnu.org; Thu, 14 May 2020 11:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jZFwk-0000lr-3v; Thu, 14 May 2020 11:38:54 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:44937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jZFwj-0004Th-4v; Thu, 14 May 2020 11:38:53 -0400
Received: by mail-il1-x144.google.com with SMTP id j3so3694106ilk.11;
 Thu, 14 May 2020 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fRkLzUuK1FZmLm45b8Vqv/xhaBJhqQ2j7GRNauOGDLc=;
 b=JSI6FTnnOlMmVjImQjbg4V3BhAD/bCR8Q9csVARXnM2U9Y7gFRYG0ltzQ1FpQQa7Tl
 9A9WgVxwxeGJ50BAh3WpY5Dt9GTNErLX2BQDDGAnaENDNs1NSrDvASGJD20iFpPW+Zj1
 paTRyDo+w28uFxkUvSIhxIolt60OlGboUw7A3JDEXBcJcm5HAN/z9HhC47tTsFvcxlXW
 L26q7qZUTJ+pr+V/4s8wEygFHjkUOWu9I3dXlaqt96tUOOHPsz9CYuBLx9mUChCybFFi
 oOwvAamWvDEYC+e+xw7Ij4qsLyKWjwUEuviiS9gtKQ3aCkoSVy3GtYDLJVr6K9bh7kQs
 Q9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRkLzUuK1FZmLm45b8Vqv/xhaBJhqQ2j7GRNauOGDLc=;
 b=dlkcUAWB0vrP3tIim06VnyPoYAwtJRWUzmR64P8coB/inDlwWUCimE19yYMfDPy93t
 TU/it3j316CANZBclVVyy7ADUu7HfytP86WXtvWiSyUN/ugjb3V3L0/1bL57KYNajf89
 E43TF/sCXf7gBRERX7FPy8Nb4OZ0aUKgJ4VgibH7kg2dwGREtPNta7//b3/KQ6oA3FWG
 SrWVT9dZoXhKJA3phEPr8VKoPFVfK34xZ/Mn6Wjj9dEA2jlpMrZPxQ2+NCgLvEyfnvSv
 ooDAu3+gPg1SYvqC3JX4pHxJSkEV9YkV58y4WU3kj2DDKzdOjTlfivnLwWLJyz0l9I6e
 8FZQ==
X-Gm-Message-State: AOAM533fx8Hub0tlMJQ209oB0UiVu4OMlE9n0PC6t+/PuNGjuUd1cDHp
 AC5xwBdlSgzu+RoYMNszH8sB4qGld52IWgk1e2g=
X-Google-Smtp-Source: ABdhPJxN7STwDFxKs+jSjglMVTl/5Wa6iH940lmBMESctDwOPAD3eijEz2QvTGfRi5IyPYR+S3ThDd2rpRGNdZcQT28=
X-Received: by 2002:a92:de02:: with SMTP id x2mr5368257ilm.267.1589470731239; 
 Thu, 14 May 2020 08:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <dc10c6b220154fd448630ef7a790e5d7e59ab45a.1588878756.git.alistair.francis@wdc.com>
 <CAEUhbmVMu4hov1WxafL9+8kET_Q_Q2hMi8JTnbKE78EhU4kaHQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVMu4hov1WxafL9+8kET_Q_Q2hMi8JTnbKE78EhU4kaHQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 May 2020 08:30:03 -0700
Message-ID: <CAKmqyKP6khvkjPbYuth3cXgyS6Zed8S29tfwW1Yv_x1MmxG4sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] riscv/boot: Add a missing header include
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 14 May 2020 15:38:54 -0000

On Thu, May 14, 2020 at 8:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, May 8, 2020 at 3:24 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/boot.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> > index 474a940ad5..9daa98da08 100644
> > --- a/include/hw/riscv/boot.h
> > +++ b/include/hw/riscv/boot.h
> > @@ -21,6 +21,7 @@
> >  #define RISCV_BOOT_H
> >
> >  #include "exec/cpu-defs.h"
> > +#include "hw/loader.h"
>
> Why is this needed? Currently this does not break build.

Currently every c file that includes boot.h also includes loader.h
before it. Which is why the build works fine. We should be able to
include just boot.h though so this is a small fixup to allow that.

Alistair

>
> >
> >  void riscv_find_and_load_firmware(MachineState *machine,
> >                                    const char *default_machine_firmware,
>
> Regards,
> Bin

