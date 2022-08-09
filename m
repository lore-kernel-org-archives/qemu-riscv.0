Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLWBP-0006CU-JP
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLWBO-0006BA-7I
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 16:50:34 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLWBM-0003nS-Ph
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 16:50:33 -0400
Received: by mail-yb1-xb36.google.com with SMTP id 204so20279412yba.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Aug 2022 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
 b=vRqZ/tK59tKc6IglnjQxk5v6h5Of/r7H+fUxbJ93cwBYXkeL3MWRvQHScZPqLLaxrl
 rqz1jvUDZ5jx8slEDRYYKuFQ2B+XT5bVjdw7nPswOLUgqaIhDwf5zLkU16JsG8CYt3lz
 YGT+eu1f3I0Nj15SdH5v8bgGOa155z24QajNT7u0+GN9EJMQze5mbkk9naq2MppPibfR
 j+Vi6DSAafhAB4fG7HVlWULeJyyqmvhHj7RrzggU3ZrqXmQ/lXujlYN4YoEehrOKsrbX
 cupIUI9hmAlo4Am9J1WFvaWXUAZdLJ9VEGNOALg3HLnpJhyCMYfTsIZ0pI8hWEB+Ztgj
 I4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
 b=s1QDXSp3k3WR3T79niOX635qjx5rRF4gXnJIoXbmClOgejwfSaca3PF9xa99ks0+wL
 P9Ds0qnJ3L1pWhVYHTVYRO9aHXxGkAHFusqrtDTy7T0Nf92GomNycL7gohTIgtV+cfOx
 tAtypA00riuerdKWzzQY7Ix+I/Xoix9yOztaSUvFNMXE6Fnrh7Gt5+mQf2EpUnDhbHVW
 Sg0k4uqKqMd4Ccsoyc2g2TcmaUbWdVyg7vBMMX+GDpuWPh6lLPwuO64HADXfJ+la8kU2
 lfphGzj9IMDfoudXmRmFMVMTLIv9S/miYL5ejdkTSFbfjKJl8QJ2UZQd5VhaVHeqBK6O
 PO0w==
X-Gm-Message-State: ACgBeo3aY11PlE1kPRRmHVlF/duzppJJyXSvK45sFo+92kdfh4DZUBrJ
 cp3reZ06X1FT8pPTIVlqIlj8T0zJFgQpOjHYdIpcEQ==
X-Google-Smtp-Source: AA6agR6Zzj1eNDQCL7YjTX5VfAxqGymAVjZIcuWrF7St2179EVh0mJAogcN/6S3ufizvxGUIXbatUrpqSazH91+r7Ek=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr23237480ybn.479.1660078231664; Tue, 09
 Aug 2022 13:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-4-qemu@ben.fluff.org>
 <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
 <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
In-Reply-To: <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Aug 2022 21:49:50 +0100
Message-ID: <CAFEAcA_HAnE9-YqUXA17G30ZHUWY5VqDt6dP+uKciyebofkcHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
To: Ben Dooks <ben@fluff.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Tue, 09 Aug 2022 20:50:34 -0000

On Tue, 9 Aug 2022 at 19:50, Ben Dooks <ben@fluff.org> wrote:
>
> On Mon, Aug 01, 2022 at 12:30:22PM +0100, Peter Maydell wrote:
> > On Wed, 27 Jul 2022 at 23:39, Ben Dooks <qemu@ben.fluff.org> wrote:
> > >
> > > Change to using the qemu_fdt_setprop_strings() helper in
> > > hw/core code.
> > >
> > > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > > ---
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I've had to make a second version, so assuming it'll need
> reviewing again

If you didn't change the specific patch that I gave a reviewed-by
tag for, then you should put that tag into the commit message
next to your signed-off-by line in the patch you send in the v2
series, to indicate it's already been reviewed and doesn't need
re-doing in v2.

thanks
-- PMM

