Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prinF-00010Z-9u
	for mharc-qemu-riscv@gnu.org; Wed, 26 Apr 2023 13:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1prinB-0000zv-Oy
 for qemu-riscv@nongnu.org; Wed, 26 Apr 2023 13:18:58 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1prin9-0007O0-LX
 for qemu-riscv@nongnu.org; Wed, 26 Apr 2023 13:18:57 -0400
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-5ef4885bc39so33342356d6.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Apr 2023 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682529534; x=1685121534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=velD/8N57+KaNkUlqpC/z3kXjcyQwWCyApj3xKHSL40=;
 b=idqP//lno8HXiTq3oV0Y/o+HpZ+fUXP9wb2jWoRpAoKQaVXYv+Cx9pobeBuB167dwM
 57ZW4l7sQaWhYLT9WnxiXR3VTN0Wfwqn0iH6rVax04Mksp4elgt2l3oTS0aImqwK4cA+
 klRQ9BLXX3bshJEkibYtTwQ0ONP8FbpfEElphj9zR0vNT8RHzZzKkQIQWKQTBtSFfNUy
 CdrjOwS3ZLvuHRA+lMZCaxIv6xqHxOgEuBi/8bLvLDJFQVHbjdYqch3+OACZ0ksDottl
 /kpqy6EOFm5wgQoj0qrBjxv8VB3+03uPoHIoVAvcs+6tL7gs8CYpvh+/GqKvvB0nXuFr
 d2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682529534; x=1685121534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=velD/8N57+KaNkUlqpC/z3kXjcyQwWCyApj3xKHSL40=;
 b=Us0shfWJSCUuAy8o9aLtjJG8e2jbQEdfGRLQSqEN2OEsAnLRotltPeK4XyQHMP8yLA
 kpWsY1KrJ7eZ3wo0ARpl8dOayeV79FwiLEUE86tlcLLk2S0A36oatQzOVZBRYFImMa1M
 Hgz133ZaNR8LeAgAoJgOV0pnD2URczRMUgtGk6fhLI//7GO8ythiK9BTFXqp6qkyiIB+
 xfjnNYwGBtZJR/aGN0saKfUtR2S2yeVBSOs3s8q2YAT8QPv9ElllpDEB/Os0UtSPUM9e
 c+SUxt42k8S3GtWDOTXulHWw+xNT7Drd9gitoteL6LOJ2NFv4QHi+ZJkemaTM2JZgwaO
 TKzg==
X-Gm-Message-State: AC+VfDxfYDlE9YhLOQdLez7fuV+9xJPhGAuJPImcoE9lT8x5GNApEIhz
 osHlI9yV7TGQ9hA8BuwRPZie65wyVyeQgA06k4qvZg==
X-Google-Smtp-Source: ACHHUZ60sMElC11CqqBsdDe8p3IgWB9WtnUJa3ZXMSrK7UQDB++Cjtm5Zc14wZ1v5xJr0Q5kzGv2gvVwvIGZZH4X3MY=
X-Received: by 2002:ad4:5941:0:b0:616:6311:a284 with SMTP id
 eo1-20020ad45941000000b006166311a284mr2468834qvb.39.1682529534498; Wed, 26
 Apr 2023 10:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
 <20230414160202.1298242-4-mchitale@ventanamicro.com>
 <615227a7-0406-8c52-d08c-e5d225909d6f@iscas.ac.cn>
In-Reply-To: <615227a7-0406-8c52-d08c-e5d225909d6f@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 26 Apr 2023 22:48:18 +0530
Message-ID: <CAN37VV5yCOx6P2No33_pyhuKEma9RoE95gV07kQ2g98mQf14JQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] target/riscv: check smstateen fcsr flag
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 26 Apr 2023 17:18:58 -0000

On Sat, Apr 15, 2023 at 6:55=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
>
> On 2023/4/15 00:02, Mayuresh Chitale wrote:
> > If misa.F and smstateen_fcsr_ok flag are clear then all the floating
> > point instructions must generate an appropriate exception.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++++----
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 24 +++++++++++++++++++---=
-
> >   target/riscv/insn_trans/trans_rvzfh.c.inc | 18 ++++++++++++++---
> >   3 files changed, 44 insertions(+), 11 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/ins=
n_trans/trans_rvd.c.inc
> > index 2c51e01c40..d9e0cf116f 100644
> > --- a/target/riscv/insn_trans/trans_rvd.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> > @@ -18,10 +18,15 @@
> >    * this program.  If not, see <http://www.gnu.org/licenses/>.
> >    */
> >
> > -#define REQUIRE_ZDINX_OR_D(ctx) do { \
> > -    if (!ctx->cfg_ptr->ext_zdinx) { \
> > -        REQUIRE_EXT(ctx, RVD); \
> > -    } \
> > +#define REQUIRE_ZDINX_OR_D(ctx) do {           \
> > +    if (!has_ext(ctx, RVD)) {                  \
> > +        if (!ctx->cfg_ptr->ext_zdinx) {        \
> > +            return false;                      \
> > +        }                                      \
> > +        if (!smstateen_fcsr_check(ctx)) {      \
> > +            return false;                      \
> > +        }                                      \
> > +    }                                          \
> >   } while (0)
> >
> >   #define REQUIRE_EVEN(ctx, reg) do { \
> > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/ins=
n_trans/trans_rvf.c.inc
> > index 9e9fa2087a..6bf6fe16be 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,10 +24,26 @@
> >               return false; \
> >   } while (0)
> >
> > -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > -    } \
> > +static inline bool smstateen_fcsr_check(DisasContext *ctx)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    if (!has_ext(ctx, RVF) && !ctx->smstateen_fcsr_ok) {
>
> We needn't check RVF here. Two reasons:
>
> 1. This check only be done when RVF is diabled.
>
> 2. ctx->smstateen_fcsr_ok is always be true (set in last patch) when RVF
> is enabled

Ok.
>
> > +        ctx->virt_inst_excp =3D ctx->virt_enabled;
> > +        return false;
> > +    }
> > +#endif
> > +    return true;
> > +}
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do {           \
> > +    if (!has_ext(ctx, RVF)) {                  \
> > +        if (!ctx->cfg_ptr->ext_zfinx) {        \
> > +            return false;                      \
> > +        }                                      \
> > +        if (!smstateen_fcsr_check(ctx)) {      \
> > +            return false;                      \
> > +        }                                      \
> > +    }                                          \
> >   } while (0)
> >
> >   #define REQUIRE_ZCF(ctx) do {                  \
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/i=
nsn_trans/trans_rvzfh.c.inc
> > index 74dde37ff7..74a125e4c0 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -16,28 +16,40 @@
> >    * this program.  If not, see <http://www.gnu.org/licenses/>.
> >    */
> >
> > -#define REQUIRE_ZFH(ctx) do { \
> > +#define REQUIRE_ZFH(ctx) do {          \
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> > -        return false;         \
> > -    }                         \
> > +        return false;                  \
> > +    }                                  \
> > +    if (!smstateen_fcsr_check(ctx)) {  \
> > +        return false;                  \
> > +    }                                  \
>
> This is unnecessary here. This check is only for Zhinx.
>
> Similar to REQUIRE_ZFHMIN.
>
> >   } while (0)
> >
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> > +    if (!smstateen_fcsr_check(ctx)) {  \
> > +        return false;                  \
> > +    }                                  \
>
> This check is only for Zhinx here. So it's better to take the similar
> way as REQUIRE_ZFINX_OR_F.
>
> Similar to REQUIRE_ZFHMIN_OR_ZHINXMIN.

I am not sure I follow the comments above.
The FCSR check is applicable to all the extensions ie zfinx, zdinx,
zhinx and zhinxmin.
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
> > +    if (!smstateen_fcsr_check(ctx)) {         \
> > +        return false;                         \
> > +    }                                         \
> >   } while (0)
> >
> >   #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
> >       if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { =
\
> >           return false;                                        \
> >       }                                                        \
> > +    if (!smstateen_fcsr_check(ctx)) {                        \
> > +        return false;                                        \
> > +    }                                                        \
> >   } while (0)
> >
> >   static bool trans_flh(DisasContext *ctx, arg_flh *a)
>

