Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbFSM-0006FW-SO
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 01:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFSK-0006FF-VF; Fri, 15 Oct 2021 01:08:32 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:39467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFSJ-0002wJ-6j; Fri, 15 Oct 2021 01:08:32 -0400
Received: by mail-il1-x12b.google.com with SMTP id w11so5900859ilv.6;
 Thu, 14 Oct 2021 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fzy1Jc9xkO5i39pX6c/QcBBhDBFMmdCD4ecxTrPPhqw=;
 b=AKpjFuPJ/cXQ0x9O/qWeRP3qAtKnGxg8Fb5v6Pj6ATc3kGxgxjWflFhVHKRKtvZ1lo
 6b0Ntaq3b+q6hIMP9Te6aeOubbp7/BoS+YcqnOQN0MoCMFd6s6XGL63+V3l2VdYwuLRh
 0YDU8W4loZ3sv4N2u4q9lzHe4/ToUDSGISbsesXxwuX/GqzQVFO0vtlMsGfeY1SJkxCC
 d00zx1QVrtclwijgER4fqS8RNtPZf6dvKDR+r6t7phNvRUidfBXUJz7910NUPNvLoAKU
 75FgL5w+1+Y3KLiuHQwS8Ee4EbQjNrxVPUqCE1wzsj4Cn1qPGFoezl6kydIJnqHS6Az/
 iBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fzy1Jc9xkO5i39pX6c/QcBBhDBFMmdCD4ecxTrPPhqw=;
 b=GeT/1NjBPbmdwaufHFutrhz+SkQISybORKWXEmfVXn6pOEAPQlpSwPis1kqCykWSIc
 +n//+Pk/nfJH2VR+xZiAODNbvGvDDMKzucl3NFHg+wsHsx68ogRTMa+ZT3GkVuLwRqmt
 pxjlTQZph1UZVzVQNtQbojUUtR3fheEPiXxt6jSqXSBFl5Dw11fLk8nnbSc/Fci/uGT8
 x6QFCGeWE8ssreH2xMWBtRAln3YLjSs8ceT/8yPnx9xQsCig9pOmXtnKCIwpx8DkOrzg
 4vvmnSH72v+l3Nanc6SwhIE0EM1T7Sbuurw/4PdmZiuCEuwSwk6El2m6uKpUS0sH0Ers
 F3SA==
X-Gm-Message-State: AOAM533MOBWBTFHrrhasglcMR/AncuKb6DkRj9tInQ+yvibeTcNl82qL
 ItP6JMl67plQmPqaalDpT8vhFpVlikk0dLUC1m8=
X-Google-Smtp-Source: ABdhPJwTeGjbuBKyAuucqttowwPUFjL8ltzr2RzTC8osgz0HWUPGeAmL0ivjB9bdcOG5/FpDrPCnae+6A5ZbbNXgEwg=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr2392580ill.46.1634274509816;
 Thu, 14 Oct 2021 22:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-7-richard.henderson@linaro.org>
In-Reply-To: <20211013205104.1031679-7-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 15:08:03 +1000
Message-ID: <CAKmqyKOHxKtwvAqPGnQ1Q2Z+2YWUk-N6t3Cb4hSyA2uLH9-dkw@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] target/riscv: Use REQUIRE_64BIT in amo_check64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 05:08:33 -0000

On Thu, Oct 14, 2021 at 6:57 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the same REQUIRE_64BIT check that we use elsewhere,
> rather than open-coding the use of is_32bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index fa451938f1..bbc5c93ef1 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
>
>  static bool amo_check64(DisasContext *s, arg_rwdvm* a)
>  {
> -    return !is_32bit(s) && amo_check(s, a);
> +    REQUIRE_64BIT(s);
> +    return amo_check(s, a);
>  }
>
>  GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
> --
> 2.25.1
>
>

