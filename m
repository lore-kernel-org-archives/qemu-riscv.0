Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6N7L-0004cB-IB
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 22:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o6N7J-0004be-RX
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 22:07:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o6N7I-0001jW-4J
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 22:07:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id b2so5711044plx.7
 for <qemu-riscv@nongnu.org>; Tue, 28 Jun 2022 19:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=prIrCZDIefUd+vKzCfkz5pkx+9dyzfNv3AiJDi4IQJs=;
 b=mdZYNLmfSGnDuOhzQVCxAibnSYOVxHzsHBXyzxfx/AAOsdNe2l/Ef4af/o7UUfAkm5
 WcgxmQXvogc0/2mjJaqzPnS+4obVthFVaMMwv3a9/8kWe1RI7iWWBnZhBK6EgxYRbmx2
 F8rLDwOrLVcEjTs0BjXGPTyhnxWL56pELvBfjNU81kVox5j0JHNUfWPzEwFafE4VGUYJ
 MW4ZCxnMUzo6eQVkQ9IhE+Uvb9jdZpbihrDTZggJSpFBZhz13Mgg38MTn/sSpvcbC2Ek
 WmJd1N76pZfBFhrj/pUyztZXcJigTDIfcpbVywK4MWeGRTOBiX19jWdiQ8cCDjpk23C+
 ULQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prIrCZDIefUd+vKzCfkz5pkx+9dyzfNv3AiJDi4IQJs=;
 b=7O2Y0PvCNolCULGjIK/2vsMcTCCAwcJOPTx9xTOsdCQ4vf96afYlrhR1yCTPLnvILI
 g9M7CXfLNTPT55xeAW0A7AcxVoMhNp2eSokazBuAhhOnIhiXV/vkBXj6UoFeKs+NkCpn
 Optwxz6leKuASDbjlwSAB7FuSS5teUWlTE58ohcWxcjMdQ3y8txml3+0dSevXKBqhTQl
 zPY1CO/kFxFUp4JBXL+zj9NO5dmWOzGiavXzpRLtVJoBsW/q1QkSZSARlyhx7bT8HUnY
 FY0oNMUiKs1W/xdFv/mZFqozuNGbUF49ZOK1Yg88xljr9CNs47FSLI/aAwGkRv0mhDB2
 FA7g==
X-Gm-Message-State: AJIora8BBE46MF8W2OkKJ2zFW2FUlg+gx/Q2GjFy1BmQeKnhZtcowAfd
 6FlubeQRAkqFJL6VR+xaCYUJesImLHkFXdLSY1VWqg==
X-Google-Smtp-Source: AGRyM1vjXA2DAgq68E3c6KoNewVnegyiZaTuKjMQNeNP6BDc+jzFuc0ds41j8LYP0RlQTpYS5Aqmqc5+ZRcLjZ+7QG8=
X-Received: by 2002:a17:90a:e7c1:b0:1ed:3b8c:7ced with SMTP id
 kb1-20020a17090ae7c100b001ed3b8c7cedmr3037334pjb.77.1656468462100; Tue, 28
 Jun 2022 19:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220627164044.1512862-1-rpathak@ventanamicro.com>
 <CAKmqyKPekJ0v6gXJZh=cptRE8TXVqpB_2XtG1X_-oSgcmcf58w@mail.gmail.com>
In-Reply-To: <CAKmqyKPekJ0v6gXJZh=cptRE8TXVqpB_2XtG1X_-oSgcmcf58w@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 29 Jun 2022 07:37:06 +0530
Message-ID: <CA+Oz1=Yi42RtJ6CphL0d8KYjeZhDu7H101JY59rL0fO+4oq9zQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <apatel@ventanamicro.com>, Rahul Pathak <rpathakmailbox@gmail.com>, 
 =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jun 2022 02:07:46 -0000

Hi Alistair

My fix patch needs to be dropped since Anup took care of this issue
in his yesterdays series update in this patch -
[PATCH v8 4/4] target/riscv: Force disable extensions if priv spec
version does not match

Thanks
Rahul

On Wed, Jun 29, 2022 at 7:32 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Jun 28, 2022 at 3:03 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
> >
> > mhartid csr is not available in user-mode code path and
> > user-mode build fails because of its reference in
> > riscv_cpu_realize function
> >
> > Commit causing the issue is currently in Alistair's
> > riscv-to-apply.next branch and need to be squashed there.
> >
> > Fixes: 7ecee770d40 ("target/riscv: Force disable extensions if priv spec version does not match")
>
> Can you please re-send the original patch with the fix? I have removed
> this patch from my tree
>
> Alistair
>
> >
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > ---
> >
> > Changes in V2:
> > - remove the stray format specifier
> > - add the Fixes tag and reference to external tree
> > ---
> >  target/riscv/cpu.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index e4ec05abf4..509923f15e 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -636,9 +636,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> >              (env->priv_ver < isa_edata_arr[i].min_version)) {
> >              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> > +#ifndef CONFIG_USER_ONLY
> >              warn_report("disabling %s extension for hart 0x%lx because "
> >                          "privilege spec version does not match",
> >                          isa_edata_arr[i].name, (unsigned long)env->mhartid);
> > +#else
> > +            warn_report("disabling %s extension for hart because "
> > +                        "privilege spec version does not match",
> > +                        isa_edata_arr[i].name);
> > +#endif
> >          }
> >      }
> >
> > --
> > 2.34.1
> >
> >



-- 

Thanks
Rahul Pathak

