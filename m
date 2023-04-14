Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnCCt-0003Dx-6x
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 01:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCCr-0003Cz-6O
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 01:42:45 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCCo-0006LX-Ss
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 01:42:44 -0400
Received: by mail-qt1-x82f.google.com with SMTP id gb12so15376704qtb.6
 for <qemu-riscv@nongnu.org>; Thu, 13 Apr 2023 22:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681450962; x=1684042962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IfptujO1LGXVBYlQSYvzLW9qC2T6m4kGNwATCmv4K8o=;
 b=k4VUUKDVQVYvVYekjhcs0Z/lMzU13TkqtEkc0S123hpUcvGYxB4WJQoM6TTsVORSG5
 aPN6/Pi1+35Tbobb+NQ+p59Fxrx0dF8iAJdeMRDgXwLxUaN8dW7IQH2evrdeeuxgd+wY
 W9IwZRkqlZjMPeaU/BZmqSFMLPkhjxOovKzHbbBdnI/MtqXHXqZbW6ofzphB7A+C2iha
 45b7TH+BIxC3UyhzcndMqKkEm8RfqfCS3sXpnfLNVJMd7puvvOR7BHSu9LoM/XEX/ekL
 0nLLXaqTqFJLJxraXEQInv/F0GfuYBU0e7Wk8viIP9ZQIdTQUWicwHisa4uW8pROb0yJ
 bRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681450962; x=1684042962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IfptujO1LGXVBYlQSYvzLW9qC2T6m4kGNwATCmv4K8o=;
 b=UeJNu1eJv+bboSnEamvvfuSJ/3hXZGD0UP/9UtugFvBEQaykX1yYAPIHRHXWoKMCah
 ohhixV7f2reGOodfFgwAwrVqKEaDVK+SjQ7XCJImZ7BW5rXPbf71d5RjSCq/BHBNDHdk
 lcc1Vaa3v8lc73Rw0eMWU2XTMdR+do2sjb1e/WF1hokC4gV5eRhjOrdt5YBD8J71epfY
 CK33uBhGXrr8tMho4JCh/tJQkk4JMjJ0vLLQ5Tj18xSoJACbwJoghZGnO0uHZYaVOcyj
 U1R1dqqyiwauEG+QFnLifHzhHtZYFZbyoRbdWqpKTlS9s7VrfiVo+UgO//jN4I+TeyTd
 0CbQ==
X-Gm-Message-State: AAQBX9e5iKCVrdQiUovx8EhwHk/FwYfWhlsUh0JZN/fa5N5UVPTfVDqU
 b6XyY7w3R0sbWZHMdPwrqllRZG4anqpO1mSUBBtEpw==
X-Google-Smtp-Source: AKy350Y0ydJ9YG8AXaXNgG2PKqI0O3zh1lHe1qRRLTsOYJdGhSzf40j0gET0bQyWK5HK0XvUgnMxnVZdvZBJtDcY0zE=
X-Received: by 2002:a05:622a:281:b0:3e0:c4ac:1620 with SMTP id
 z1-20020a05622a028100b003e0c4ac1620mr1533661qtw.13.1681450961728; Thu, 13 Apr
 2023 22:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-4-mchitale@ventanamicro.com>
 <8077963d-2c08-35de-06c1-9cef9d361651@iscas.ac.cn>
In-Reply-To: <8077963d-2c08-35de-06c1-9cef9d361651@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 14 Apr 2023 11:12:05 +0530
Message-ID: <CAN37VV4vvHKGguUsgceHNpW3s89+OqetwKFKpp-5BGNqZuO2TQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] target/riscv: check smstateen fcsr flag
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 14 Apr 2023 05:42:45 -0000

On Mon, Apr 10, 2023 at 8:00=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/4/10 22:13, Mayuresh Chitale wrote:
> > If misa.F and smstateen_fcsr_ok flag are clear then all the floating
> > point instructions must generate an appropriate exception.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++++++++--=
-
> >   target/riscv/insn_trans/trans_rvzfh.c.inc |  4 ++++
> >   2 files changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/ins=
n_trans/trans_rvf.c.inc
> > index 052408f45c..6173dace46 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,9 +24,27 @@
> >               return false; \
> >   } while (0)
> >
> > -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > +#ifndef CONFIG_USER_ONLY
> > +#define smstateen_fcsr_check(ctx) do { \
> > +    if (!ctx->smstateen_fcsr_ok) { \
> > +        if (ctx->virt_enabled) { \
> > +            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)=
; \
> > +        } else { \
> > +            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST); \
> > +        } \
>
> We can setctx->virt_inst_excp =3D ctx->virt_enabledand return false here.
Ok.
>
> Or we need store current opcode to bins before generate_exception.
>
> >
> > +        return true; \
> > +    } \
> > +} while (0)
> > +#else
> > +#define smstateen_fcsr_check(ctx)
> > +#endif
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> > +        smstateen_fcsr_check(ctx); \
> >       } \
> >   } while (0)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/i=
nsn_trans/trans_rvzfh.c.inc
> > index 74dde37ff7..304bee1002 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -20,24 +20,28 @@
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> >           return false;         \
> >       }                         \
> > +    smstateen_fcsr_check(ctx); \
> >   } while (0)
> >
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> > +    smstateen_fcsr_check(ctx); \
>
> It's better to remain "\" alignment here.
Ok.

>
> Similar to following cases.
>
> Regards,
>
> Weiwei Li
>
> >   } while (0)
> >
> >   #define REQUIRE_ZFHMIN(ctx) do {              \
> >       if (!ctx->cfg_ptr->ext_zfhmin) {          \
> >           return false;                         \
> >       }                                         \
> > +    smstateen_fcsr_check(ctx); \
> >   } while (0)
> >
> >   #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
> >       if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { =
\
> >           return false;                                        \
> >       }                                                        \
> > +    smstateen_fcsr_check(ctx); \
> >   } while (0)
> >
> >   static bool trans_flh(DisasContext *ctx, arg_flh *a)
>

