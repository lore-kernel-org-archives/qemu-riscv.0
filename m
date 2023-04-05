Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvPb-0001DZ-Sj
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvPX-0001Cw-1v; Wed, 05 Apr 2023 01:10:20 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvPT-0008Ob-0p; Wed, 05 Apr 2023 01:10:18 -0400
Received: by mail-vs1-xe29.google.com with SMTP id df34so30398473vsb.8;
 Tue, 04 Apr 2023 22:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680671410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72kN9BlG3PEbZHWwE6kiJqhzMkkc6hjjs6UOp+QedQg=;
 b=FLCoNMdaPaJmYfNmQLBazgqlMHJBu1dBJiHd+6njGxVRcDTcNCOOQuZKHjmodFkl/p
 F1jiJDyC/QIssWnY4ecUAtHjvjbRIvBdYnykMIBro60SuY+UxvYgzTa+/HRg+G5jtELf
 Ak5fBvAp3MDBzYM3LFdPpfsRNy7vWKGyBzMe2bwQpIY9qESL+W8DSHhK155nfyHYzUXB
 bUcvozcokeDOY/6bSv/ku5uxARMeAaUUYvycSWcO9P1mkQba3g13ineXchJBV99CwbqF
 Kl2zAUlNXNoamCxpOh3c+YPCEn9AYlY08IivpzVPEIGhUncBVGLiUkl1MuigC8FYV6LJ
 Bqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680671410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72kN9BlG3PEbZHWwE6kiJqhzMkkc6hjjs6UOp+QedQg=;
 b=vK8yZRWpkm9FP1Pl769zBukrjLbKpnBNzda0ydlSZ+HnVbsFg6rXfQiNqmxb3ZS+GW
 nGrGHGkWbv4btyZi7qGclG6U+r6sJiqfaxPy8YtTNNT6cqQGEPdRTiYFLOYzTryTy81p
 CF715v41YMxwm2X6Is56AbeoWeA/bNliHQ0H425Kwk52logI6S8J7+VzVFMGmoEGtvXw
 I9vfwWNRzB//+G45cuW7pyFm5mWL2mZ/3GkSSuAEyvsSG3ZO6hR9Uf0iWiqUA0wAH8cP
 G9nuBzlLqbGexY28KiB+Og3vB37ER96PJwBjklNVfwy+7goDYHA3trp2DWVR+RekwvMZ
 BI7g==
X-Gm-Message-State: AAQBX9fUfPRWe412wUdJc0vZxKdsxEL94bt0uqQr04LRon6qPRIs8ip2
 UJdMFbaCu9eT7IoPVbdnvc6mOpGgMYKrRueKXUM=
X-Google-Smtp-Source: AKy350YD0KVvaP/aKhZM7BDw/bOJ4cdPTpxFv6l+SvA9VgQdd1+hWZQGeuCRC+grQvE06gvsGjzq7VcO6UYrGV5ZCCY=
X-Received: by 2002:a67:c29e:0:b0:425:d39f:3882 with SMTP id
 k30-20020a67c29e000000b00425d39f3882mr4004120vsj.3.1680671410583; Tue, 04 Apr
 2023 22:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:09:44 +1000
Message-ID: <CAKmqyKP2twN5tisvKOR2BfRZH8cMkozN2KBWdLE3Wrgp++xWHg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix itrigger when icount is used
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:10:21 -0000

On Sat, Mar 25, 2023 at 2:04=E2=80=AFAM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
> When I boot a ubuntu image, QEMU output a "Bad icount read" message and e=
xit.
> The reason is that when execute helper_mret or helper_sret, it will
> cause a call to icount_get_raw_locked (), which needs set can_do_io flag
> on cpustate.
>
> Thus we setting this flag when execute these two instructions.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_privileged.c.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
> index 59501b2780..e3bee971c6 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -77,6 +77,9 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  #ifndef CONFIG_USER_ONLY
>      if (has_ext(ctx, RVS)) {
>          decode_save_opc(ctx);
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }
>          gen_helper_sret(cpu_pc, cpu_env);
>          exit_tb(ctx); /* no chaining */
>          ctx->base.is_jmp =3D DISAS_NORETURN;
> @@ -93,6 +96,9 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  {
>  #ifndef CONFIG_USER_ONLY
>      decode_save_opc(ctx);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
>      gen_helper_mret(cpu_pc, cpu_env);
>      exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp =3D DISAS_NORETURN;
> --
> 2.17.1
>
>

