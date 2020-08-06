Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3ZO5-0002k0-JS
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZO4-0002jV-Cf
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:28:24 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:44777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZO1-0002ct-In
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:28:24 -0400
Received: by mail-io1-xd41.google.com with SMTP id v6so33200564iow.11
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7+dwA52LFgoqbPKABny4UMtQ9l1F6ipCaAgdhCX8nw=;
 b=N6xoSPHai76sHPjyfpAZGeaCbmvLHKagSrU7KCPM/Y1JcqBwdHBey9f63MIzZvz6ps
 UqkyRQQzAGm/h0sndJoa0cCfwoExQUlpDnl7B3viwjMKpMFrqv1k3gKpR/SPey1JgF9j
 QmDzG4H6XDelN2g1au4FzJcfTcDA1gquqjypM9m4HzFY5plz42UI6w7Z3kQwVxqg0Yfr
 ExHKeBGImsB+a5HAcyb/Ropac4L4fJbjL++A6qjmSskSaTsb1kYaxFIa/6AR5RZvts1f
 SOsdpElCYoh7tevKsoS1gWg2DZE5SJIoA9dZnEVBzq9MfEP3/KYNZX0ywEd6Ex6tW4OV
 ihZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7+dwA52LFgoqbPKABny4UMtQ9l1F6ipCaAgdhCX8nw=;
 b=JC1PespAdW+B+OJF5syABf5x7fcGcILp3hZbP1oLENWRATnRmMv9AUOpi9lw7O9tjb
 QJcU1AMa3xa5Je9F/hWtUwm3sFyhHUaXPWbW/vAOYS1cmGoGv5DrEwkNedc8gwCOAtK2
 UMXQYFkY0iZu94GxwFNVbTpf9uN7ZG4ekEZAGX7VxXmej7GYWYjJKD/7FmPlmUrDjaa5
 1QhAExVT1hcEQ7aQwmw63VyKBpwSczAqp4Bt2jMXr+eWDlP1S9zQLW0Fbg9NxZnCr+kx
 DfKFbVNN2xlqsXDz0hkopxuv2fDXdihZHa/BvhQqbhjh9FRfL95TjojBopF/mzlEJJ4U
 oxdA==
X-Gm-Message-State: AOAM530p+3bPJMrAFSm7SFY8xKvzp6u4q7eajojccKyrJnrOwzeOIIDp
 C6rIhN33YgyUoqlrhenQDMPNoa3zVwQrZ90OMWRdeA==
X-Google-Smtp-Source: ABdhPJw49kO7uOZkjhFABGivosEmmHg+x3lnwScAamW+08uLzUWhOA8uSFdBuoEfyrpGmTZ8rC4FPcDdw1bkuHOUEZA=
X-Received: by 2002:a5d:8a04:: with SMTP id w4mr8072540iod.15.1596695300397;
 Wed, 05 Aug 2020 23:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-7-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-7-richard.henderson@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:28:09 +0800
Message-ID: <CAEiOBXVfY8KsXmfQ9htojsuWX_X3U0oFdis0YXoDmyj_G_JHGw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/riscv: Clean up fmv.w.x
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000031f73b05ac2f98cd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=chihmin.chao@sifive.com; helo=mail-io1-xd41.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 06:28:24 -0000

--00000000000031f73b05ac2f98cd
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Use tcg_gen_extu_tl_i64 to avoid the ifdef.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Message-Id: <20200626205917.4545-7-zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvf.inc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
> b/target/riscv/insn_trans/trans_rvf.inc.c
> index f9a9e0643a..0d04677a02 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -406,11 +406,7 @@ static bool trans_fmv_w_x(DisasContext *ctx,
> arg_fmv_w_x *a)
>      TCGv t0 = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>
> -#if defined(TARGET_RISCV64)
> -    tcg_gen_mov_i64(cpu_fpr[a->rd], t0);
> -#else
> -    tcg_gen_extu_i32_i64(cpu_fpr[a->rd], t0);
> -#endif
> +    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
>      gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>
>      mark_fs_dirty(ctx);
> --
> 2.25.1
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

Chih-Min Chao

--00000000000031f73b05ac2f98cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 24, 2020 at 8:=
28 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org"=
>richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_=
liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
<br>
Use tcg_gen_extu_tl_i64 to avoid the ifdef.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20200626205917.4545-7-zhiwei_liu@c-sky.co=
m" target=3D"_blank">20200626205917.4545-7-zhiwei_liu@c-sky.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvf.inc.c | 6 +-----<br>
=C2=A01 file changed, 1 insertion(+), 5 deletions(-)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_tr=
ans/trans_rvf.inc.c<br>
index f9a9e0643a..0d04677a02 100644<br>
--- a/target/riscv/insn_trans/trans_rvf.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvf.inc.c<br>
@@ -406,11 +406,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w=
_x *a)<br>
=C2=A0 =C2=A0 =C2=A0TCGv t0 =3D tcg_temp_new();<br>
=C2=A0 =C2=A0 =C2=A0gen_get_gpr(t0, a-&gt;rs1);<br>
<br>
-#if defined(TARGET_RISCV64)<br>
-=C2=A0 =C2=A0 tcg_gen_mov_i64(cpu_fpr[a-&gt;rd], t0);<br>
-#else<br>
-=C2=A0 =C2=A0 tcg_gen_extu_i32_i64(cpu_fpr[a-&gt;rd], t0);<br>
-#endif<br>
+=C2=A0 =C2=A0 tcg_gen_extu_tl_i64(cpu_fpr[a-&gt;rd], t0);<br>
=C2=A0 =C2=A0 =C2=A0gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;</div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><span style=3D"color:rgb(136,136,136)">Chih-Min Chao</span><div style=3D=
"color:rgb(136,136,136)"></div></div></div></div><div>=C2=A0</div></div></d=
iv>

--00000000000031f73b05ac2f98cd--

