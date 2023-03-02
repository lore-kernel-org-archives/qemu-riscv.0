Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYcO-00063Z-IZ
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXYcK-00063C-8J; Wed, 01 Mar 2023 21:24:24 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXYcG-00007R-31; Wed, 01 Mar 2023 21:24:21 -0500
Received: by mail-ed1-x532.google.com with SMTP id da10so61995624edb.3;
 Wed, 01 Mar 2023 18:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCyrn6m+ZePTl/4odcTzCkGGKmhhwKz6XVQo1iM33kQ=;
 b=gWpVkypSzcar+FQg1qz7wV/4cDEclGATqZrse3qujSmcC3QnB57o3E3n6VU1A2DWoB
 yJfSa3GckeYYu9iubmh9cvBDOiFtnjt3KwaXnHlC/MSLzlt5FqHjRNTKL6drbfTUA3WQ
 id9b/M1X5U4/WcbMc1JN2s4IGS/BZyPqxSi4Ksn9DF2BQ/IHtVO9akHB1S7Zl4tBnUq7
 C9gSxsosgf4NF8edGJk7DoVSz3YiRfBMHqOYCdFV7Pr+1TO3ZhKWI/EsjPG+dplBZNja
 VM+876QpWuYgJ4/fKlMX8EuL1H4qnEd9WCUMLEyXCSRHgTDgJMXfSk4wFJ1MQkgDrioS
 LLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCyrn6m+ZePTl/4odcTzCkGGKmhhwKz6XVQo1iM33kQ=;
 b=kg1FCVZP4EiWoKavMN7j7WPUQsZjZwjcwLQu3u5+EBqXbzrvShUESdgfpvIpbWnbb5
 N8Y4TftSFWtudZoqdOu+s65kgasBJZHr0/tAycKxCpChaErz0ViR2Oj43KY+kRlAlkOz
 3/CxLixdjPlOjmauKYCYfXMa20bnGAqlf3NIppW5ERxZYYLB1kDAZ97oQL7lH5iVojMw
 OLRmyu8Op+dQf8IJ3DKCPryYcI/5l02L5zpOSl4/rhn9jxdDpctIJKPkuXx1nDVmqzzm
 /hPCdsdaO43LA9WpPKMLAMe26txOK1K762YraQ0sXsdyouu7erahgUbO/9Ds0289NaKT
 7v+w==
X-Gm-Message-State: AO0yUKWS+Tzl5zbhYNmlSUAZEF2ZnLRn4cL7KKz0YvibRjB9gMrmmSZm
 u01cl4JjpS3pZOpjfpgIR9kQjWlmBY82Qebx9uA=
X-Google-Smtp-Source: AK7set/d9c+bYdNKF858thaN9ivncSCdLHR+YO5PhSNYttNmoC0McyWOgUeiekySRdTn6zjN/TUUknicSb+P1teGxVs=
X-Received: by 2002:a50:a695:0:b0:4bc:2776:5b61 with SMTP id
 e21-20020a50a695000000b004bc27765b61mr2319430edc.6.1677723857112; Wed, 01 Mar
 2023 18:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
 <mhng-c59a4d9c-9a01-44ea-b5a9-b416390b6570@palmer-ri-x1c9a>
In-Reply-To: <mhng-c59a4d9c-9a01-44ea-b5a9-b416390b6570@palmer-ri-x1c9a>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Mar 2023 10:24:05 +0800
Message-ID: <CAEUhbmUtXVTC3-DFVTAaOaa3_OeP-d8sB-=PSQy4zcFXmC+xfg@mail.gmail.com>
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: dbarboza@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 02:24:25 -0000

Hi Palmer,

On Thu, Mar 2, 2023 at 10:08=E2=80=AFAM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
>
> On Fri, 24 Feb 2023 09:45:16 PST (-0800), dbarboza@ventanamicro.com wrote=
:
> > Hi,
> >
> > These cleanups were suggested by LIU Zhiwei during the review of the
> > RISCV_FEATURE_* cleanups, currently on version 7 [1].
> >
> > These are dependent on the patch "[PATCH v7 01/10] target/riscv: introd=
uce
> > riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.
> >
> >
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html
> >
> > Daniel Henrique Barboza (4):
> >   target/riscv/csr.c: use env_archcpu() in ctr()
> >   target/riscv/csr.c: simplify mctr()
> >   target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
> >   target/riscv/csr.c: avoid env_archcpu() usages when reading
> >     RISCVCPUConfig
> >
> >  target/riscv/csr.c | 90 +++++++++++++---------------------------------
> >  1 file changed, 24 insertions(+), 66 deletions(-)
>
> I just based these on that patch, which landed as d4ea711704
> ("target/riscv: introduce riscv_cpu_cfg()").  That resulted in a handful
> of merge conflicts, but everything looked pretty mechanical.  So it's
> queued up.
>

As Weiwei pointed out in
https://lore.kernel.org/qemu-devel/e40e75ff-37e0-94d3-e9e2-c159b0e2da68@isc=
as.ac.cn/,
patch#1 should be dropped.

But I see it was landed up in your tree @
https://github.com/palmer-dabbelt/qemu/commit/3c7d54f945f1b5b474ea35c0815a1=
618927c9384,
while my changes are already in tree @
https://github.com/palmer-dabbelt/qemu/commit/94e297071bc0a5965cc32c497a886=
f2cf9d32710.

Not sure why git doesn't figure that out ...

Regards,
Bin

