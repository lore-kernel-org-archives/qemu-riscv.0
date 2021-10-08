Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYgkZ-0005AP-3z
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 23:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYgkS-00057u-0O; Thu, 07 Oct 2021 23:40:41 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYgkQ-00008h-D2; Thu, 07 Oct 2021 23:40:39 -0400
Received: by mail-il1-x131.google.com with SMTP id r9so8570790ile.5;
 Thu, 07 Oct 2021 20:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SYqCTgYUj5Jocl7tBlzk43HAc7x3CqTQ0czuC3Szp0Y=;
 b=gMcKOEIe3HqVP2XRpjDjuoh27KPxx9o+UAJkL91ydK6rZaNhnoSEM5gXnUc3cdG1rJ
 478cYrGXzq0WL5r72W2BN9p2azPsWJYIMONsc+Kijy63EAYHUhzU/eCoy/fzVRY4jxlM
 Km/hQMuPYdpVWFdM/DsfnMTHGxCNg193QV77hQ6+K0evx12YgMcSOdBh2TzfCXOCZ5uV
 KkWv2aHq5TbtSps5sf9lXaVcdMWFK+CTYRQmNWwyHXraSGb/Q55zPhNuHwPLZfIObbtu
 KLrgb7tOiS3nAgwREZlgeCz0LIountPVlP2RQxHlkY8vb6WCabAPwlpTnFIVePK0Fqlo
 fTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SYqCTgYUj5Jocl7tBlzk43HAc7x3CqTQ0czuC3Szp0Y=;
 b=BaM+YhRXyUTefw1gH0jfW0kguBkzf8le0vgzFLVm4jD0+oauBlwI+9JrIXKSJqYRqR
 +RNwrPSjF9F0FbzBxEKEk7Cudsfkxgpc5G+2aCy4OorpxH1Ekq7bLas4JwWbsYGyygmY
 glD3J+xvRYiDH5zvmqNos9LdsDiBuK5JftY7dw3WGHh2ps+v0dI8Rgmp8zjHsCHUtqqa
 PylmmDUwXOhk0mpJoyUWI2pXnUuwpkZ8zZBLeCEV6PBzjzfkRaBrkBOlZBSEQwJMJ+cV
 JkL8U59KPI+1I8InahGXdfD4tkGer1pSMqyWPzStviLsMK33AxsuRWKgvWCap6OvWLSo
 ff+Q==
X-Gm-Message-State: AOAM533XHbeWAC0YTmeYwXdW6evJXvgLGzziXjXa9xh9lIRYrbbkMMoK
 pf+tVP5If+UbBRnBtrQuR7Y21YF50jvXTlqg1CM=
X-Google-Smtp-Source: ABdhPJzUG16Kk/u9pCqYd/ieYQSjlMLKsYuHHp4k0VcFgRmXepcM47jn+sajgf5/PjE5g0tglkcmG1LtpKbc8OvAyc0=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr5975229ilo.208.1633664436550; 
 Thu, 07 Oct 2021 20:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211007081803.1705656-1-frank.chang@sifive.com>
In-Reply-To: <20211007081803.1705656-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Oct 2021 13:40:10 +1000
Message-ID: <CAKmqyKPYJMg=e46xrF81EgeD=38M50gzAPdux8q=gnRU6Qt8dw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Pass the same value to oprsz and maxsz for
 vmv.v.v
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Fri, 08 Oct 2021 03:40:41 -0000

On Thu, Oct 7, 2021 at 6:18 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> oprsz and maxsz are passed with the same value in commit: eee2d61e202.
> However, vmv.v.v was missed in that commit and should pass the same
> value as well in its tcg_gen_gvec_2_ptr() call.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index fa451938f1e..f730bd68d18 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1619,7 +1619,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> -                               cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
> +                               cpu_env, s->vlen / 8, s->vlen / 8, data,
> +                               fns[s->sew]);
>              gen_set_label(over);
>          }
>          return true;
> --
> 2.25.1
>
>

