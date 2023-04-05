Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvQl-0001nj-53
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvQj-0001n7-A0; Wed, 05 Apr 2023 01:11:33 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvQW-0000if-3e; Wed, 05 Apr 2023 01:11:28 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id d18so30438783vsv.11;
 Tue, 04 Apr 2023 22:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680671478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nz48m4lNjoGztjUMamLD2jkKSwVWxhUedJxzDSJq5l8=;
 b=QVaE9AeTrJQRJ9AeORyGoHABJdS7NdPH3GYL273aNRE1GfK4jhDwqfWepxh3UNlhrq
 S1mNRkPw/nSy598dYEA/CPOYAr7Jhrp+sSDa7YTCQ+ayjyydusHmad/U7Q1fSFuGSP/1
 5GAOgqZkI208p4+eu8Abhrqflo+md6gMS6N7Tfr9qIaELIqkPvkRzgEIYXrBB6ovUi/h
 t8nrThFewdD6jZoVr988s5d/zbhivkuIQ8sBSnaos3R626lRr4fkm/Cf5fHtQR/iSWVW
 /o+P282+w0Y4mpvd1ZP2dKDi/ms2shQmo5ivD6ex++Y3iYYjRG2+p6cArr7IsbaHuu1x
 XPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680671478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nz48m4lNjoGztjUMamLD2jkKSwVWxhUedJxzDSJq5l8=;
 b=dw1qRSbibS3/AOtRdx0fTWhKVjIBB1Cmws9mYiGGVydAXYx/3AEXl3tmiYC1f/lCsX
 4FLirqCSehXlNI+Kx7yOQI2vSxbYPFVEPy/v/zEvm0L9YYdI0wjoIeMyKkPAwMdJhpdR
 Tv2xrdvb9wbQvZzpXXrLbqKUByJ3x/9fGhoIqR8g4m/edY/3Bi4+nKOF+Gii/iAPFRbc
 89Qt7QRqRmh3Bo7Lr6FtzMYf+drdfg3vk4pt0oVGIqjAojhyfSTltn2dADi2UOAvRLiF
 WfVBiVI7d6f1rychwZJlUmdfab5PtW3XwQX6CIG1GyvkAFB1RnxYI/F0yqXz3FhOajtQ
 Ur7g==
X-Gm-Message-State: AAQBX9e/YkFw4hqiK7BansAdPG6EN57yZixU+TIgcirhON3nAsGnjUi7
 WlQsMUujTNjD4Z63JvH4QriqdQ9sqRbo71qr99M=
X-Google-Smtp-Source: AKy350aG78ovBxomByAWlfpVKsvm3IgNTt9yZgatpxY7bHI67iD4nWQdqtJMPeOgfkaFv6I7UmSBts/R2vvH65H7Igc=
X-Received: by 2002:a67:d390:0:b0:412:5424:e58e with SMTP id
 b16-20020a67d390000000b004125424e58emr1317726vsj.0.1680671478592; Tue, 04 Apr
 2023 22:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:10:52 +1000
Message-ID: <CAKmqyKPZF9B5B9JR0+mD-Kcbj8mSSOG0_aeCz=vh8t-5AO4E3g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix itrigger when icount is used
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:11:33 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

