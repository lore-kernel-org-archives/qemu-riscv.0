Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqmTV-0007OE-4e
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 21:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqmTT-0007Nd-FB; Mon, 16 May 2022 21:58:11 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqmTR-0005w3-OG; Mon, 16 May 2022 21:58:11 -0400
Received: by mail-il1-x12f.google.com with SMTP id t2so8655515ilm.13;
 Mon, 16 May 2022 18:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/g2TXVPDRYmRpvBauzYGvH2w25vpgaaS81H+rqF2E9I=;
 b=LmjEucmhsER3HnX0GXmSJoNS9JqyzmhPdbDQIxyOgMVKX5pFP+xjWGu1x5OtQ7ZGc7
 Dym78h58QIMZ0L9CmxdR40jUwDKF5n1BWfRus7Wi+q7YnEsbq2xAgzBNLUwkKeUAh34z
 thc7MM5kcmWOebdS5e+IT5TXaGtK5LgIX09/12eL6l3FbXsimdPOd62hF8L1FxSVM47v
 o0NxLXNyKxlNI+zsqeMQ/3Q6Hiw1GVnteCVRTz8otaQptLHv1Pbf0tUMbd8McDAJtucx
 pDdyhy3KYO/xC8ulp0dQif/jt/J3Z2rrs/YOzLKINmsYY5HXixbwa0/ikH8y5WAkn+yh
 P7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/g2TXVPDRYmRpvBauzYGvH2w25vpgaaS81H+rqF2E9I=;
 b=Okq51rFPR/e/uC31HNxu8A7JkBiWmwKhYr+YhBGD4srnGeTWNUhqVJ76MS6odT5avW
 7Fn/68ZYtMdXBQ3Y68Rj06FOCZ/DnpFpO6iOV8pt0bDjCoRwrgM92tFdpKIFxsOib/Pp
 T9+4QbxfXJFrYNTPg/6vBL/2Vu/BJhNSGK7wxqXMfkMa5t4hslJcznzCz14rUIpWmeTt
 p1loEqGMLUQCLqax4lpd4Uig4xjRH0YJBehkHID/0IseoUrnPp0DvT5ZOjVsqiwIbO/N
 29tfgj2yPzt5EKWAoK/phO5Leyd8RjukFsA22pq/nMEs7YzLOcPwusdnCxVRuVA1dF0j
 XVmg==
X-Gm-Message-State: AOAM531AO9j0mntT5I9OjpL93e35vWuBQozSkEmDS5ZGIVELWQ7tGa0B
 9/EbOZOXkh55Ct3csSUFEc0y6UY+dSY9d/9qInc=
X-Google-Smtp-Source: ABdhPJxjzXqM/z2Esz5ml2BBtm2lwDSOlCOcuzn+xI6Ne4nNNlLVern5QrDJHPkJB3HyDxQPp50f0bBJmyK46eGPJbo=
X-Received: by 2002:a05:6e02:2146:b0:2d1:261a:6578 with SMTP id
 d6-20020a056e02214600b002d1261a6578mr3166186ilv.55.1652752688087; Mon, 16 May
 2022 18:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435235.git.research_trasio@irq.a4lg.com>
 <cover.1652509778.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652509778.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 11:57:42 +1000
Message-ID: <CAKmqyKMuj4VjiC0rcrsPB05CoA-3gCjkKjWRmowKN2nYjv0HEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/riscv: Make CPU config error handling generous
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 17 May 2022 01:58:11 -0000

On Sat, May 14, 2022 at 4:29 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> c.f.
> <https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00229.html>
>
> This patchset is functionally equivalent to v1 but fixes commit titles.
>
>
>
>
> Tsukasa OI (2):
>   hw/riscv: Make CPU config error handling generous (virt/spike)
>   hw/riscv: Make CPU config error handling generous
>     (sifive_e/u/opentitan)
>
>  hw/riscv/opentitan.c | 2 +-
>  hw/riscv/sifive_e.c  | 2 +-
>  hw/riscv/sifive_u.c  | 4 ++--
>  hw/riscv/spike.c     | 2 +-
>  hw/riscv/virt.c      | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>
> base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
> --
> 2.34.1
>

