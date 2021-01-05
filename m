Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwt1u-0000Fg-Ta
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 15:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwt1t-0000DO-Ah; Tue, 05 Jan 2021 15:34:09 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:43964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwt1r-0008W3-RZ; Tue, 05 Jan 2021 15:34:09 -0500
Received: by mail-io1-xd2a.google.com with SMTP id o6so578339iob.10;
 Tue, 05 Jan 2021 12:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3hqRWX3mrpBcmId7bMLNt8C7iWnbpDNTj38Zk6UN60=;
 b=lf399kkCKlbvQ9EILHf/3NqQFfL9+jTaaIMfizMc+v06yAEjkcCRzOHx7Rai2CIWtA
 g6eMqk5/TGqmBzlwHVs7hiexm/2XRg7S+ZQSwMocflFGOd2pV5GaAhc9+pQBNislFQ6K
 KmVIrAga1sk1aWoAuO/sGAzdpi9UV//qxjWREXgs/pR9N3BYhSA1ThieszmIZEKF/Iva
 JHuaL6m9Bko6cLiaxBPs+OdhwomIhgJHzmecQU2iuKhUqSOKbv2uVznpg59Buby4ZMQc
 fFux3KE7B8EJDd6CH6sCXSHy2MiOOn7sq6bXs73PWJSl7N+gpab4s76GRuKuiNDHR3JS
 URDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3hqRWX3mrpBcmId7bMLNt8C7iWnbpDNTj38Zk6UN60=;
 b=I2yoFe5FSKeLLKhbY+1uTpOKqHo2JiWlLFWyHhy3aPOqlU032TN3A33FNrDc7xvkU1
 3Ga8TFEJGJ+A0E4EbFGxH2nknKWxSt6cjMD8003LDb+GQWfcmNikHl7DU8+bf+89NrM/
 orUe3LZmbZd4WNMaH3rQO4VH/50cooTW931y399bNy/ii51yiu/sgTLx7yGotKmlnAkV
 8WLqdClggUNxscxPvUM77YY6sW32t2OEi345kHm9XHMToM+YQi9byrrGuZ1WABvcSBzU
 EwvVleQfW3KLssZxo0QFZvypnkY5Yy8J15qEnTsGJ4wnht7KkuA39oceXvIS6Pn7E4h1
 06VA==
X-Gm-Message-State: AOAM5324FNrtpHFVDe00jwyg7cBQMHYJRnvx4qD/eCXVkw7TwD/I3jPY
 HhKXvxUpaDr0fG4cAAFrZ2bOwGW22FuXa0YEzwM=
X-Google-Smtp-Source: ABdhPJx8cTaaeck6y1YO9Yye/0t7cAdmdLd59nPpcigBuzRkiaYJvy/WS5ooxA6SBea0PgrOG+JZhJVL4BU0Pa11Hp0=
X-Received: by 2002:a02:ca09:: with SMTP id i9mr1044363jak.135.1609878846545; 
 Tue, 05 Jan 2021 12:34:06 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
In-Reply-To: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 12:33:40 -0800
Message-ID: <CAKmqyKNj_s0+GE8Mj9=B6HSuAwFDQupr=QsqfzLoW=oSPvSFPg@mail.gmail.com>
Subject: Re: [PATCH v2] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Tue, 05 Jan 2021 20:34:09 -0000

On Wed, Dec 30, 2020 at 12:26 AM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.
>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 254cd83f8b..ed4971978b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static gchar *riscv_gdb_arch_name(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        return g_strdup("riscv:rv32");
> +    } else {
> +        return g_strdup("riscv:rv64");
> +    }
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      /* For now, mark unmigratable: */
>      cc->vmsd = &vmstate_riscv_cpu;
>  #endif
> +    cc->gdb_arch_name = riscv_gdb_arch_name;
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize = riscv_translate_init;
>      cc->tlb_fill = riscv_cpu_tlb_fill;
> --
> 2.25.1

