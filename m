Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZG4U-00029K-JX
	for mharc-qemu-riscv@gnu.org; Thu, 14 May 2020 11:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZG4N-00028f-SF; Thu, 14 May 2020 11:46:48 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZG4N-0006xe-2U; Thu, 14 May 2020 11:46:47 -0400
Received: by mail-yb1-xb42.google.com with SMTP id x18so1764009ybq.8;
 Thu, 14 May 2020 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLHRkNqpw1EYCPIpYlukUY4lBeLv6CGAzFcRbbAODf8=;
 b=VGjpF17rzlespmFTvwOJa1kTDKEdzFTvgK3jgsNGJ5TatMhE4DFz3H9ofdoUNIhK0k
 3N99pGKMohzSrzmEemljRp0A+WXTx3dSTlMyi4iecEcxgMw/cmxNlQnTYQbK0VoMv5WM
 sWvHBVqLSA3famVDCxejiMc7H6YjMf9FIZawTsSahchClE+R0X0KXBBnQvkXHUE+tM1n
 UvtBhW09qm6iTROOebQvIi6MF8yHQf3UYUxpUZV0tu2//hF9k6EdWXNsxmq6mMX1liL9
 P0skgNzdhCyopHqut57RY85qcazJH7OXAZ/cV5eTFo3jPrQjg/f4qdohQ2/AYOoWXSv+
 x5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLHRkNqpw1EYCPIpYlukUY4lBeLv6CGAzFcRbbAODf8=;
 b=DhTCD3Bn5WmWOohWMPiERxQ1CSwl5gDlYBt1DRQiln7CkbIkldJT3B+1sr6kjLXz0X
 Xt9k6ZQaT6QQ8uNyCuO/Aug+k/tlSOwcTKM52ytPNVu66jS0nulIhLLD16i0GRcX4AiK
 5LjD0c7BU/0gggWerfgm1eagst48g8CnCQRg4W5UTxFyS9DpXRRN+GDKSJ4jwfVX77Pj
 80NZC0e3KcAAfk3/IUAUu2RbDEVbwMHUl3aB+iBt/GeBAjK+A+eMDHVYsbzOx+2j2q8z
 WeU0HyiU78m6nFbdOJRG+7sTm7Qc2QS+xx2WdsxWfwnC3cvQe/rMn8vr4vu3+pnPaled
 MkZw==
X-Gm-Message-State: AOAM532vJSOJOwAIInhf7YL8O+j1zJkyF002pmeIq3i7ATo1NDmn86EE
 Sq3t3txlvoCgQAZ2rMjz9+fnFaLjtV/Dafj4vlY=
X-Google-Smtp-Source: ABdhPJwHG64gCmXIsonSaft1EoZxJOZfLM71H/dgLxRR9HqtLH7h2aoJwp3vHraE6gtPWsYkhrs58Nnv+K0ATkeG8SY=
X-Received: by 2002:a25:1045:: with SMTP id 66mr8798143ybq.314.1589471205658; 
 Thu, 14 May 2020 08:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <dc10c6b220154fd448630ef7a790e5d7e59ab45a.1588878756.git.alistair.francis@wdc.com>
 <CAEUhbmVMu4hov1WxafL9+8kET_Q_Q2hMi8JTnbKE78EhU4kaHQ@mail.gmail.com>
 <CAKmqyKP6khvkjPbYuth3cXgyS6Zed8S29tfwW1Yv_x1MmxG4sw@mail.gmail.com>
In-Reply-To: <CAKmqyKP6khvkjPbYuth3cXgyS6Zed8S29tfwW1Yv_x1MmxG4sw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 14 May 2020 23:46:35 +0800
Message-ID: <CAEUhbmWoT0oBszNsY7mPHD+nkY0pOXwN-M0q-AZS45_6p5vG4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] riscv/boot: Add a missing header include
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 14 May 2020 15:46:50 -0000

On Thu, May 14, 2020 at 11:38 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 14, 2020 at 8:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, May 8, 2020 at 3:24 AM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  include/hw/riscv/boot.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> > > index 474a940ad5..9daa98da08 100644
> > > --- a/include/hw/riscv/boot.h
> > > +++ b/include/hw/riscv/boot.h
> > > @@ -21,6 +21,7 @@
> > >  #define RISCV_BOOT_H
> > >
> > >  #include "exec/cpu-defs.h"
> > > +#include "hw/loader.h"
> >
> > Why is this needed? Currently this does not break build.
>
> Currently every c file that includes boot.h also includes loader.h
> before it. Which is why the build works fine. We should be able to
> include just boot.h though so this is a small fixup to allow that.
>

I wonder if this is a required convention to make the header file
self-contained? The only thing that is offending seems to be the
symbol_fn_t typedef.

Regards,
Bin

