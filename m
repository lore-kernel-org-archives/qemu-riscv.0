Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSMqk-0003rO-Nk
	for mharc-qemu-riscv@gnu.org; Tue, 13 Oct 2020 12:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSMqi-0003oc-Uh; Tue, 13 Oct 2020 12:08:28 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSMqh-0008Fm-D1; Tue, 13 Oct 2020 12:08:28 -0400
Received: by mail-io1-xd42.google.com with SMTP id m17so23334259ioo.1;
 Tue, 13 Oct 2020 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aZMdICbl3iEGIsjyKQ0WID5E+cOKAdofSZSZX3QlyK4=;
 b=SLvTxGM0NmIQpOyXJcTiS9cDoMCinJFHBklF1SDBAg33NRDRVoyvFQ7YQN2b237PnR
 0pidYaE3urNu7KVBJYEhtZVtIIEH+xLjhwuA1S7wFhigEAed08uov9+QqNJcfBXNVWE4
 p5ni4jeVuyVL3MOvdQhjn2HS6ItRWGa77aBoI0auay0xdJYjNTwFPKq9tzarhJ9XQYnQ
 vb31aYaBMlE/q4eAB0ZQ2vsX0qlfJYqJWZVN+5dJcGIQnzzhdRRKC+o/bqAV7SRk6+5j
 ncRpH+p6nIi+nOOtnUHj9ZpIXnM/SEAJHspjKAvdCpT06sUGXqBA9YFoiZkb9j8tx1O2
 qDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aZMdICbl3iEGIsjyKQ0WID5E+cOKAdofSZSZX3QlyK4=;
 b=JdF+ov21/GmttR7qAmx8CMQt9/jAkspml+KwsSBLFdonZMJhEyJvdPoS576OjUV5Kf
 RTMBtdXheVVX1wWA2NPbihIxcFZ2YiNTXq0vwFm9WJCgLbh+s8q/r5UOQ9j16+gQSC1u
 e+N8wajNImuc7ySPngm0QNZvc3LpoZRXwVNP8zD0eaNc3uhZxSGsqdbD9z24pcMKiwcE
 YfKTsXI7OaEkA3uIbgMVQT3zCzp+KV5zK/JWmVyiPuqnaKqJi/vpP4bEACz4lbuqCAFd
 YlUyOD3lqW9HwkRM3GomA8DeWhPbsVAnecPssO8ccxNl7NVnFhQ4uUschD0y4jD7cctx
 yrUg==
X-Gm-Message-State: AOAM532vbvNZn/MnU9m3BebvCiOjt2/kRQQBEGsz4noknu8Z/9Xo+rRS
 LanOS5px/GEsGpXh2USZ1tbBx3rOWRMznrLSXvU=
X-Google-Smtp-Source: ABdhPJwrj5r8lWTHweSaNO8g2Ty1DnR3DC5Svy3w3BKXOqqaCYhpUHm/oSBIgAyyUDsGl8TCg6KQrFjCMTss1CRGnuY=
X-Received: by 2002:a5e:9b11:: with SMTP id j17mr92377iok.176.1602605305750;
 Tue, 13 Oct 2020 09:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <29a8c766c7c4748d0f2711c3a0abb81208138c5e.1601652179.git.alistair.francis@wdc.com>
In-Reply-To: <29a8c766c7c4748d0f2711c3a0abb81208138c5e.1601652179.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Oct 2020 08:56:48 -0700
Message-ID: <CAKmqyKM9qvxaqL2L3Pj1VRptXHm5b=dFz+bCu=XmELNjGCB8bQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] riscv: Convert interrupt logs to use
 qemu_log_mask()
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 13 Oct 2020 16:08:29 -0000

On Fri, Oct 2, 2020 at 8:35 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Currently we log interrupts and exceptions using the trace backend in
> riscv_cpu_do_interrupt(). We also log exceptions using the interrupt log
> mask (-d int) in riscv_raise_exception().
>
> This patch converts riscv_cpu_do_interrupt() to log both interrupts and
> exceptions with the interrupt log mask, so that both are printed when a
> user runs QEMU with -d int.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 8 +++++++-
>  target/riscv/op_helper.c  | 1 -
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 904899054d..6c68239a46 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -895,7 +895,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      }
>
>      trace_riscv_trap(env->mhartid, async, cause, env->pc, tval,
> -        riscv_cpu_get_trap_name(cause, async));
> +                     riscv_cpu_get_trap_name(cause, async));
> +
> +    qemu_log_mask(CPU_LOG_INT,
> +                  "%s: hart:"TARGET_FMT_ld", async:%d, cause:"TARGET_FMT=
_lx", "
> +                  "epc:0x"TARGET_FMT_lx", tval:0x"TARGET_FMT_lx", desc=
=3D%s\n",
> +                  __func__, env->mhartid, async, cause, env->pc, tval,
> +                  riscv_cpu_get_trap_name(cause, async));
>
>      if (env->priv <=3D PRV_S &&
>              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 9b9ada45a9..e987bd262f 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -29,7 +29,6 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState =
*env,
>                                            uint32_t exception, uintptr_t =
pc)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
>      cs->exception_index =3D exception;
>      cpu_loop_exit_restore(cs, pc);
>  }
> --
> 2.28.0
>

