Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo377-0005pI-8C
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:35:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo371-0005lT-2P; Fri, 19 Nov 2021 07:35:29 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=39617
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo36z-0002Uq-Bp; Fri, 19 Nov 2021 07:35:26 -0500
Received: by mail-io1-xd2d.google.com with SMTP id c3so12567290iob.6;
 Fri, 19 Nov 2021 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xnp4vrtS40K43uYSA+X6rQd207dJb2t6Qf1FHmYhF1M=;
 b=R55fxZOGAWDKhOJDHXu/UhnMkp/fPjYNDaUABHhJ5IMStyUtFUC/c6++3hBH5FJ4cj
 XY/sbH9NYDm/nebkk60UjBJXLH/zdv/AE8c9SfiXxCb0OvKfmnksN2QNFKJzmj17DrtX
 1BmXtt2IoNN2oxhbI0RczPsp6iXu+GfHoydhRTuXRxS7QHQF9uzvIqvAWmjTgEA3uYXz
 YfwbdtoWROmo3xdKkgtHsEvHr1Cob4j+94hgRKndN7YEyYWYKTufp7kyPZpraWVeNEq5
 UeXU9ILHrotOo2Ew178xHPypS/C28jizcDw2SfazldlAbtNLn0d/QC1KaS+SCIQi6dNE
 lE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xnp4vrtS40K43uYSA+X6rQd207dJb2t6Qf1FHmYhF1M=;
 b=PWlf0FVYxhR8n0r6FkCzuTVXldD6TW9O8BTdhfg1uTrXIKI7n2v45cfZJFdMaEUiEI
 LKwXRon92KU7PpYf/fyg+2BoZ9r2MyEvagxtkU+qjbo2wxVpO6X+VpRtMdPhTGa/JCJr
 66dd9dJWOSl4VpIbhsN/yktmykgoouQdwt07912aZhist+46IR6iN4bSLLZzsaCokr+l
 kgvYoo6qg9T9IJjC9ZcGqCcaXHoYX8iR4HL4nXGhjBG7zBHhzwEkf8EX0DEI1CNSwXLb
 xqlduzQW0AAjGNdNBuP9oNgxCqJKvGvH1ARB6Fxnv58zcXpz+GGUzXqyQ7aefcuc/a9v
 NzEQ==
X-Gm-Message-State: AOAM5313+MGM+UZy4RVILjKhlT0hcZ1/MtqoAiI8PdIWCgxeDOtiDrWs
 tZ6NzvgsyKMX/XuEJo1OTav8J/dvchFUkxyrIR3jxnxgE8//urMZ
X-Google-Smtp-Source: ABdhPJwX9v3rV9Q5hAnbVS1C8Vs7LABZZuCaUG5HVg1FVTsZhVyrG9ikHJMzh9MOUf+DlVZekZ83WIQHMp5JWkmxTV8=
X-Received: by 2002:a02:a601:: with SMTP id c1mr26971196jam.114.1637325324030; 
 Fri, 19 Nov 2021 04:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-17-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-17-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:34:58 +1000
Message-ID: <CAKmqyKMAiuKHXhhGizeywWptoWM4nv=5UZ0Uh14+Nc==A1vT_g@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] target/riscv: Ajdust vector atomic check with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 12:35:30 -0000

On Fri, Nov 12, 2021 at 2:11 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6fa673f4b2..6cc83356d9 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -739,7 +739,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
>              (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
>              vext_check_reg(s, a->rd, false) &&
>              vext_check_reg(s, a->rs2, false) &&
> -            ((1 << s->sew) <= sizeof(target_ulong)) &&
> +            /* TODO: RV128 could allow 128-bit atomics */
> +            ((1 << s->sew) <=  (get_xl(s) == MXL_RV32 ? 4 : 8)) &&
>              ((1 << s->sew) >= 4));
>  }
>
> --
> 2.25.1
>
>

