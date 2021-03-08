Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJG7d-0006aA-5K
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 08:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJG7T-0006Sp-1e; Mon, 08 Mar 2021 08:40:24 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJG7J-0004Qd-CE; Mon, 08 Mar 2021 08:40:22 -0500
Received: by mail-io1-xd33.google.com with SMTP id n132so9947689iod.0;
 Mon, 08 Mar 2021 05:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9/Pe/r1bYX2VQnMDE60ZZYO+MFVd1XHt25pp1baZRLM=;
 b=bHdwVL0YAiqqkoFqTDc7jN4ZmPeXWsGXQjsDxumnqU2qCOdH1pBr9HxxeM/wH7wQs8
 rhAPsGSXlUzmCjqALzlqAgyagqw80WXbxZX2CHLolPBd/hEm7tIa3Eu8kzqLMJmq9FOS
 jqSfDmPUOODrpVmnfuP1YpOynIEK0mMgQ3C0gOaEvSVBgv9VyhvkuQC40ay9OUQ2BqVD
 BMyXEG1jFXw1uijpnAF7BsRWbhoe9BSl2EyubkKZSfVQs5nkO3zQ+WbXSSR5R7yQuMtU
 7/UrJrfTbpyRE92oVoS7oYPkH3yOaSAjwrpb8Omx8yidNARwRHUS0uj8wau8P468g5Qm
 wdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9/Pe/r1bYX2VQnMDE60ZZYO+MFVd1XHt25pp1baZRLM=;
 b=qmAWtKVV2lYAM/Xi/8iZWAs01z22ViWhT7m/Q8Os/dIVDsIp15xc5JOJjpnIBYOzls
 9Bz5kGHItVtOhvyadghRwLEX2jH6LY4ma2RWubZc4FFY3cu7CCP9u+7xvwpF3708JweG
 SS96X64b2WVBranmA0fcF1UiIfbIx9gAAKC3xCXRK68gCToEUFv0kLu0tbJR5948jIws
 snuWOAkGgEJqSW0419X1rw4sKQeBggYWUZzBR2EPjLS/oD+QeXbTPhAyChKiAAqPaDDl
 W9vFX0FbQ4V0fyZ9GPdB2dFEO9zl6Jp+xZKX5O1PqsmH/1RCWxdn4ppqTeo3JZM7c52N
 q7jw==
X-Gm-Message-State: AOAM532FTrE8YSYfVSLUonsDD/b4LueqljUzVjEJCQToo9a2TFWI5i42
 K1YVeJOuCOxQzXWpKT/Yhgt3LClj2iV5CyCvgco=
X-Google-Smtp-Source: ABdhPJwNh2pG8HhxsCtHgNG4uU7LBUz6Ip4zyUilTdhJRL+98LJbv/71lJM09Yp3fWEzBSVv1iJWE43Hux8pCPPdi/M=
X-Received: by 2002:a02:ec6:: with SMTP id 189mr18826832jae.91.1615210811348; 
 Mon, 08 Mar 2021 05:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20210223065935.20208-1-frank.chang@sifive.com>
 <86510657-883a-f49e-c9da-d7a3d31d3de2@linaro.org>
In-Reply-To: <86510657-883a-f49e-c9da-d7a3d31d3de2@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Mar 2021 08:38:52 -0500
Message-ID: <CAKmqyKMYULAb6daKKgWepWdJiQZhSmXGqK3mKcq7930g=yQ=pQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix vs() to return proper error code
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 08 Mar 2021 13:40:29 -0000

On Tue, Feb 23, 2021 at 1:46 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/21 10:59 PM, frank.chang@sifive.com wrote:
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > vs() should return -RISCV_EXCP_ILLEGAL_INST instead of -1 if rvv feature
> > is not enabled.
> >
> > If -1 is returned, exception will be raised and cs->exception_index will
> > be set to the negative return value. The exception will then be treated
> > as an instruction access fault instead of illegal instruction fault.
>
> It does seem an unfortunate interface; -1 seems so tempting, but does not by
> itself mean anything.
>
> I wonder if we should dispense with the whole "negative number" thing and
> simply return an exception value.  Then for bonus points put all of the
> RISCV_EXCP_* values in an enumeration, and return that type from these
> functions so that it's perfectly clear what the interface really is.

Good idea!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> That said,
>
> > @@ -54,7 +54,7 @@ static int vs(CPURISCVState *env, int csrno)
> >      if (env->misa & RVV) {
> >          return 0;
> >      }
> > -    return -1;
> > +    return -RISCV_EXCP_ILLEGAL_INST;
>
> this fixes the immediate bug, so
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>

