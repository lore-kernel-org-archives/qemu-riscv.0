Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUsCN-0008MI-PN
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 10:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUsCL-0008Js-KZ; Fri, 09 Apr 2021 10:33:25 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUsCK-0002La-4i; Fri, 09 Apr 2021 10:33:25 -0400
Received: by mail-yb1-xb29.google.com with SMTP id z1so6807017ybf.6;
 Fri, 09 Apr 2021 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B0n6LANtvak/N9owEyHwdtcMow+1UzXHdOQV8K8iTSU=;
 b=No1EkXJma183GA3zjjeJUJWnXBu8sC1YTxbyly1S+q7/NX54GcdhmnRtMp86U+DHq8
 55IMjTthC0FgaHCmS4ONEMF/RR9tb8KAjbkanjxFkx3b9y8sPrDDsupCzGBVP6/FQyUu
 hYi7WRXiBpXgA6c2eEycWv1ocTFOVw9MbUVTsLtGlvt2UsfZdJHtQOjYy+3xZEaSOAa9
 uDM7kkdzB3+kpnShUJ/WeoFR58lYUjrtk1LKR+tOhV/9VrsCwk9l1+LTxfwElA8nzDiK
 YONpz1wcSqS2SxgQDpGIIyhX5yebvFp3gq+mtLrd1uXkQimRMhgzawpjmTnx0IuQ0ss0
 44GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0n6LANtvak/N9owEyHwdtcMow+1UzXHdOQV8K8iTSU=;
 b=OuZ9NV43ZzSQ7J7L0O4buh9aM5PWm8aIk++KXJTg2fNonVDmiac9Pc38HQ0ZvJP0k7
 ejuU28k/TE5YG06FYc3Ed+V+OAZA5k0HTg4NO5Zy5+itxVMnvZRRmpiU1bz410dFqoHc
 Z3c8+i9Tq8nOjXIwi8oeJiraaKluHAvmIQyBgrLcT3bPkMcwNb4oiGg7UcFYunkjKasH
 OYH6InFzWrHx1GrrZQknzPRjHtG8V3+HOhBZIYND8BTb9mliVoUB0qTpH0VmCvvQi2Vl
 akFP3k6ymp6Rp4JVWTOZawOxLQ9+c5rB9/be0A/rTPrXlr1Yky+UVOMvZ2fXx1ZzwYOC
 x8bA==
X-Gm-Message-State: AOAM532NqgXMqdbgQZDhgZb9ORJIMcv6BShBeUrxfjAzHMGpIh+4c4NO
 GJS7wnuEu12odqmN8ek7F+RH8A0NK6MmfJBRkYI=
X-Google-Smtp-Source: ABdhPJwySw9i9O28LFW0es/gWVxKfoI/huneP0koRy4T2kLBBK+46efrYnoGGfIHkZJgoGVdTJBX2HSDI2vSmtgD0tU=
X-Received: by 2002:a25:e04c:: with SMTP id x73mr20680924ybg.387.1617978802246; 
 Fri, 09 Apr 2021 07:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617970729.git.alistair.francis@wdc.com>
 <3f4a8b1fa0cd5deed00beb585010d6b1cc59efb6.1617970729.git.alistair.francis@wdc.com>
In-Reply-To: <3f4a8b1fa0cd5deed00beb585010d6b1cc59efb6.1617970729.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Apr 2021 22:33:11 +0800
Message-ID: <CAEUhbmWgOcma-uHBU0Zb8BhDpvt6D06Qg1_ACNzGGzXV_L=MBw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Fri, 09 Apr 2021 14:33:26 -0000

Hi Alistair,

On Fri, Apr 9, 2021 at 8:23 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> This commit adds support for ePMP v0.9.1.
>
> The ePMP spec can be found in:
> https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Message-Id: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> [ Changes by AF:
>  - Rebase on master
>  - Update to latest spec
>  - Use a switch case to handle ePMP MML permissions
>  - Fix a few bugs
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 165 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 153 insertions(+), 12 deletions(-)
>

It looks like the v1 comments are not addressed?

Regards,
Bin

