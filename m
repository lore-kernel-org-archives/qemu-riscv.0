Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3ZKA-00078Q-V8
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZK9-00076R-6x
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:24:21 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:45328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZK6-00024w-7e
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:24:20 -0400
Received: by mail-io1-xd42.google.com with SMTP id u126so11175548iod.12
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hafr8k9YOgdf5KgqdQie/z85p/Ia5bt7WDCDxUBdvdg=;
 b=ZBcNKliwxZMR5CwNl76Wp2MBF+d0mCTiEHLWCbnihmHspuuIycm0JRhajxmIqIqjD5
 LIcVcQv7YsIPKMD/3us2JiqENp6e163Vo3Vd/jm1IDEbv0OzeKx9jUjtZ+pOrEBAloMQ
 hUd0CRqvTG/EyGCz/SELWi0QunfTNmL75FoHyN0j9HajqPjv1o7QhZmz7GoHW24OReNW
 1/JJ8qgIAaQA+RfogiacEoiLGyjp9i1qhp6DI1qC65DBU4FOjfpnEaaiClibpsLQS8c4
 NkqwVmN7GJQ4fJjguFYOOHdOpfFxdw52CF+OZyTYwzeVxANFDhtONbsljvWgMdGrKSkH
 UBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hafr8k9YOgdf5KgqdQie/z85p/Ia5bt7WDCDxUBdvdg=;
 b=Ha8pCdnfZQc4VTW3ewB0pCypWXvmKVLO5FOBzwE/5g7wFNrTwqgfeenuKPOqWfmc++
 +p3O4+eUFcqoUZyexwNO4QwWixkDd5VDnqFZCt7LCD5slJ6PYIJkTELwys5J5FQfaYA9
 SppWN5lTO1oL75yTVEu6m4NkWqP0U9U4knqKNh7PD/5nS1KaFUfzvb+BmHc8d31TBDHT
 Rsm/+0ngLm+6h9Wbxz03wWD7LBxSOHaGsabX6NGUyqo6HiWgD4geNRn8w/2VvE7pQnk3
 iQCo5ElPpUKg0VwDIwha4+2aJWOHZOOgPp4KaZ9CD1mhoIiFqg8Kcr/GB25JCEGuvK7c
 19ew==
X-Gm-Message-State: AOAM5323nqH2k5Z7gvxEEMiJNgtgVyxa3znJjM6RvHpZSKwqbirayjI+
 A2weRY6qD7K2W6jVOVMnqzPYf/NNnB2BCthSKZrKcA==
X-Google-Smtp-Source: ABdhPJz2LgU4WegSavfCTiM5F1hAmXbq54wUcw3akGtW5IbEFgOmUWBOwsb1yTNcpvGgGZvYx4gXv3+4RydYcinzXJk=
X-Received: by 2002:a6b:f911:: with SMTP id j17mr7631181iog.96.1596695053544; 
 Wed, 05 Aug 2020 23:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-3-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-3-richard.henderson@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:24:02 +0800
Message-ID: <CAEiOBXWCULxgcJwme=cvS1iHpogubtTE72a5LN38WfLGKqbrjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] target/riscv: Generalize gen_nanbox_fpr to
 gen_nanbox_s
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="0000000000007b454f05ac2f8969"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=chihmin.chao@sifive.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 06:24:21 -0000

--0000000000007b454f05ac2f8969
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Do not depend on the RVD extension, take input and output via
> TCGv_i64 instead of fpu regno.  Move the function to translate.c
> so that it can be used in multiple trans_*.inc.c files.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvf.inc.c | 16 +---------------
>  target/riscv/translate.c                | 11 +++++++++++
>  2 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
> b/target/riscv/insn_trans/trans_rvf.inc.c
> index 3bfd8881e7..c7057482e8 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -23,20 +23,6 @@
>          return false;                       \
>  } while (0)
>
> -/*
> - * RISC-V requires NaN-boxing of narrower width floating
> - * point values.  This applies when a 32-bit value is
> - * assigned to a 64-bit FP register.  Thus this does not
> - * apply when the RVD extension is not present.
> - */
> -static void gen_nanbox_fpr(DisasContext *ctx, int regno)
> -{
> -    if (has_ext(ctx, RVD)) {
> -        tcg_gen_ori_i64(cpu_fpr[regno], cpu_fpr[regno],
> -                        MAKE_64BIT_MASK(32, 32));
> -    }
> -}
> -
>  static bool trans_flw(DisasContext *ctx, arg_flw *a)
>  {
>      TCGv t0 = tcg_temp_new();
> @@ -46,7 +32,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>      tcg_gen_addi_tl(t0, t0, a->imm);
>
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
> -    gen_nanbox_fpr(ctx, a->rd);
> +    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>
>      tcg_temp_free(t0);
>      mark_fs_dirty(ctx);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 9632e79cf3..12a746da97 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -90,6 +90,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t
> ext)
>      return ctx->misa & ext;
>  }
>
> +/*
> + * RISC-V requires NaN-boxing of narrower width floating point values.
> + * This applies when a 32-bit value is assigned to a 64-bit FP register.
> + * For consistency and simplicity, we nanbox results even when the RVD
> + * extension is not present.
> + */
> +static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
> +{
> +    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
> +}
> +
>  static void generate_exception(DisasContext *ctx, int excp)
>  {
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> --
> 2.25.1
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000007b454f05ac2f8969
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>=
</div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson &lt;<a href=3D"mailto:r=
ichard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Do not depend on t=
he RVD extension, take input and output via<br>
TCGv_i64 instead of fpu regno.=C2=A0 Move the function to translate.c<br>
so that it can be used in multiple trans_*.inc.c files.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvf.inc.c | 16 +---------------<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 11 +++++++++++<br>
=C2=A02 files changed, 12 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_tr=
ans/trans_rvf.inc.c<br>
index 3bfd8881e7..c7057482e8 100644<br>
--- a/target/riscv/insn_trans/trans_rvf.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvf.inc.c<br>
@@ -23,20 +23,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0} while (0)<br>
<br>
-/*<br>
- * RISC-V requires NaN-boxing of narrower width floating<br>
- * point values.=C2=A0 This applies when a 32-bit value is<br>
- * assigned to a 64-bit FP register.=C2=A0 Thus this does not<br>
- * apply when the RVD extension is not present.<br>
- */<br>
-static void gen_nanbox_fpr(DisasContext *ctx, int regno)<br>
-{<br>
-=C2=A0 =C2=A0 if (has_ext(ctx, RVD)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_i64(cpu_fpr[regno], cpu_fpr[regno]=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MAKE_64BIT_MASK(32, 32));<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
=C2=A0static bool trans_flw(DisasContext *ctx, arg_flw *a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TCGv t0 =3D tcg_temp_new();<br>
@@ -46,7 +32,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_addi_tl(t0, t0, a-&gt;imm);<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_ld_i64(cpu_fpr[a-&gt;rd], t0, ctx-&gt;mem_=
idx, MO_TEUL);<br>
-=C2=A0 =C2=A0 gen_nanbox_fpr(ctx, a-&gt;rd);<br>
+=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t0);<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 9632e79cf3..12a746da97 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -90,6 +90,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t e=
xt)<br>
=C2=A0 =C2=A0 =C2=A0return ctx-&gt;misa &amp; ext;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * RISC-V requires NaN-boxing of narrower width floating point values.<br>
+ * This applies when a 32-bit value is assigned to a 64-bit FP register.<b=
r>
+ * For consistency and simplicity, we nanbox results even when the RVD<br>
+ * extension is not present.<br>
+ */<br>
+static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)<br>
+{<br>
+=C2=A0 =C2=A0 tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));<br>
+}<br>
+<br>
=C2=A0static void generate_exception(DisasContext *ctx, int excp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(cpu_pc, ctx-&gt;base.pc_next);<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;<br></di=
v></div></div>

--0000000000007b454f05ac2f8969--

