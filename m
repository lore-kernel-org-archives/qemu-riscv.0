Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbFU8-0007qZ-Ft
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 01:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFU6-0007qB-5i; Fri, 15 Oct 2021 01:10:22 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFU4-0005BJ-If; Fri, 15 Oct 2021 01:10:21 -0400
Received: by mail-il1-x132.google.com with SMTP id w10so5875174ilc.13;
 Thu, 14 Oct 2021 22:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqlCTkcE8OtdEfF7MFb5WEJt5EBZEzOad/NhIZbm0oc=;
 b=Z6QCI62n5MosSe8DfI8/SQp8wjxPQCuC0C6wQdkrpUYo5c3cG4wj0IMx6Jxf8FtYU2
 2Ku+MQAL77WDxZ6I4JokNDO/OpqFtjSGPy/4XwII6+aYfTUmA16uZL/zp0qrXZp3/Git
 afXEEArkYtS9IdDjb61IzYhbVCmtTYMndSK750laEJpdgTb4cgpVY/lxcBMlRuMhkS3y
 +bCVuIFWfx2VeGM5zAWX8MsZgmhAVNjriXNdUcCJ9LBmhnEnXfuaTjBQHZlWZWXZEI1Q
 BEYgo2kVjZHzmIsPoyTvlHe1ogt1wST/AvqXYqp4MH2QGzjfWPCLV7sIR+RLGk6BE6wZ
 g2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqlCTkcE8OtdEfF7MFb5WEJt5EBZEzOad/NhIZbm0oc=;
 b=bNvXc0nbV38Y57vvTZX+bxu3xLZ74HZB1tJJC1AOcV8JEzm4TudzEVK2/DIhyybRVV
 J2NW4NF+hs9CPglwuBRQD279vxMAamr2pcpqW17IH33CWAFkXOsKMGptpMMrBRXrpTBQ
 VAKUuOe+E86BJXjLR+nx2dYxJLvacd5V5sMWXWG2/uUOIh8uW8uzViI/7q8Z0G4xgf4H
 CHmlV7b/N42VfJtaNN67vK73WXa9Nq4HxiKQB4cvo9TyCaakOe+v9DbKX/bRuBwEPFNe
 4OliJYJWj5RnskDGSnggSC89VhNTtVHeT8Yv3oDlNCI3b4MosaF3sdjcKGYZrgskAcfr
 3QYg==
X-Gm-Message-State: AOAM533yNye8qd24sFy+6nJ6hvQpW3Z+4b2pv+xqc/lOQopgTniW7pQs
 Q8EipCjvNL7J3NvCWm/rKOCfqbqd/pL+vjzzFszkZk4DtWE1nA==
X-Google-Smtp-Source: ABdhPJzsmlwZvRd5plZ17E9JpbC3qBjc/rSYxG7Sv7tmT2kC5O5DBHbkznF+MSLEy2OfvKDtGOMLKvgQ4VYJi4XzAUk=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr2399198ill.46.1634274619261;
 Thu, 14 Oct 2021 22:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-8-richard.henderson@linaro.org>
In-Reply-To: <20211013205104.1031679-8-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 15:09:53 +1000
Message-ID: <CAKmqyKP9C_ZQpt6Zdk6UM5aKA2BfxxjpSx6Q4C7=5qr-QV5Gow@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] target/riscv: Properly check SEW in amo_op
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 05:10:23 -0000

On Thu, Oct 14, 2021 at 6:55 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're currently assuming SEW <= 3, and the "else" from
> the SEW == 3 must be less.  Use a switch and explicitly
> bound both SEW and SEQ for all cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index bbc5c93ef1..91fca4a2d1 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -704,18 +704,20 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
>          gen_helper_exit_atomic(cpu_env);
>          s->base.is_jmp = DISAS_NORETURN;
>          return true;
> -    } else {
> -        if (s->sew == 3) {
> -            if (!is_32bit(s)) {
> -                fn = fnsd[seq];
> -            } else {
> -                /* Check done in amo_check(). */
> -                g_assert_not_reached();
> -            }
> -        } else {
> -            assert(seq < ARRAY_SIZE(fnsw));
> -            fn = fnsw[seq];
> -        }
> +    }
> +
> +    switch (s->sew) {
> +    case 0 ... 2:
> +        assert(seq < ARRAY_SIZE(fnsw));
> +        fn = fnsw[seq];
> +        break;
> +    case 3:
> +        /* XLEN check done in amo_check(). */
> +        assert(seq < ARRAY_SIZE(fnsd));
> +        fn = fnsd[seq];
> +        break;
> +    default:
> +        g_assert_not_reached();
>      }
>
>      data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
> --
> 2.25.1
>
>

