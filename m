Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3ZL2-0007n1-L2
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZL1-0007lZ-7o
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:25:15 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZKx-0002AF-6s
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:25:14 -0400
Received: by mail-io1-xd41.google.com with SMTP id g14so10978343iom.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D03pH4/RHWhvDXCkl4s6Xg7HWl5SAcWRrXSEuLtG1mU=;
 b=bzmMoSiy8t7wWj4sJ4h0n9xU8i4wA1ST2IQ/2dK5TWKRAr+Jam4n3qxfUeIM9jGBkf
 KhkLgMtMbUy+LODoOzbLqzjZnSf4aq/Rkl/hGm4vxKbpheU4HECnANJqFolJ9sZVlxS8
 YvkEFbooot0rEyLijHoPeicm0GeIo1uNDoZ1wkappbWLf5tNZElgdQd0ieCoH5u6zHza
 hwXEfL1/OqowjMA0b2SV8+0xNW2H71FsHsKMonx+WUwNeKf9j+ysTzDMaD940nBB1NA6
 A7rtuPfHCgFvE8oOaMqTs6YJEdNOovKj34DZ360vFS50oyjizPJ5Ba3OeXttLpV83j5v
 F2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D03pH4/RHWhvDXCkl4s6Xg7HWl5SAcWRrXSEuLtG1mU=;
 b=WRbubWgf678FO7KZPD8GH+JvVE0EMPHm0imv6JLjckSkhp4wi/lOi8l1NfNRQEuNRk
 k2OOjAgx7GUjWnh1OK3G9njtc4qX4uhAPUh2BpS0CL7LeOHNWebGjCbImORtTJ+62I6b
 S+WPiore8+zvsVrhwvc3rxmZlADidruW/HOC0/nE/q1tObunkv9ksaNoB4X63eB2P2AN
 XXOsH3O69ca906dPrnbpeqZUWg87fJm2ealpPiIH0hVp3RsYe9YdwGrLicNs6g4pmjW3
 0AtWTDIHHWLx5NIQ9kgAyQPhkXf+oTQeb2dRxp2ni2FSf5rpzndUh6YB5thStja9ovg7
 ch1Q==
X-Gm-Message-State: AOAM530xL2VtLkT11sHx5SpX8RuNsdnB8FrA6SZF2r1AOaXmysEtLLil
 qoZKxB27CVn/YDJTue/5XRyGgPtNPmf5Y/jBii3jog==
X-Google-Smtp-Source: ABdhPJww8BmqDQCGA1QvvorDSd7dRANSkDTtd7M9//xyYS2zGYAJedgJLR2F1MY/sc+2Sc/RTaD4guoXO8FCtMcV4wM=
X-Received: by 2002:a05:6602:2549:: with SMTP id
 j9mr7557298ioe.89.1596695109002; 
 Wed, 05 Aug 2020 23:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-4-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-4-richard.henderson@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:24:58 +0800
Message-ID: <CAEiOBXV8A65PzDExGXwFWDJqQCShK_93ZpBAzeqAP0U4C3s3UA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/riscv: Generate nanboxed results from
 trans_rvf.inc.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000c97c4805ac2f8c01"
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
X-List-Received-Date: Thu, 06 Aug 2020 06:25:15 -0000

--000000000000c97c4805ac2f8c01
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Make sure that all results from inline single-precision scalar
> operations are properly nan-boxed to 64-bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvf.inc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
> b/target/riscv/insn_trans/trans_rvf.inc.c
> index c7057482e8..264d3139f1 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -167,6 +167,7 @@ static bool trans_fsgnj_s(DisasContext *ctx,
> arg_fsgnj_s *a)
>          tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
> cpu_fpr[a->rs1],
>                              0, 31);
>      }
> +    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -183,6 +184,7 @@ static bool trans_fsgnjn_s(DisasContext *ctx,
> arg_fsgnjn_s *a)
>          tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
>          tcg_temp_free_i64(t0);
>      }
> +    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -199,6 +201,7 @@ static bool trans_fsgnjx_s(DisasContext *ctx,
> arg_fsgnjx_s *a)
>          tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
>          tcg_temp_free_i64(t0);
>      }
> +    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -369,6 +372,7 @@ static bool trans_fmv_w_x(DisasContext *ctx,
> arg_fmv_w_x *a)
>  #else
>      tcg_gen_extu_i32_i64(cpu_fpr[a->rd], t0);
>  #endif
> +    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>
>      mark_fs_dirty(ctx);
>      tcg_temp_free(t0);
> --
> 2.25.1
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

Chih-Min Chao

--000000000000c97c4805ac2f8c01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 24, 2020 at 8:28 A=
M Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ric=
hard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Make sure that all results from inline single-prec=
ision scalar<br>
operations are properly nan-boxed to 64-bits.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvf.inc.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_tr=
ans/trans_rvf.inc.c<br>
index c7057482e8..264d3139f1 100644<br>
--- a/target/riscv/insn_trans/trans_rvf.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvf.inc.c<br>
@@ -167,6 +167,7 @@ static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_=
s *a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], cp=
u_fpr[a-&gt;rs2], cpu_fpr[a-&gt;rs1],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 31);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
@@ -183,6 +184,7 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnj=
n_s *a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], t0=
, cpu_fpr[a-&gt;rs1], 0, 31);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp_free_i64(t0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
@@ -199,6 +201,7 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnj=
x_s *a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_xor_i64(cpu_fpr[a-&gt;rd], cpu_fp=
r[a-&gt;rs1], t0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp_free_i64(t0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
@@ -369,6 +372,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_=
x *a)<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_extu_i32_i64(cpu_fpr[a-&gt;rd], t0);<br>
=C2=A0#endif<br>
+=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t0);<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;</div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><span style=3D"color:rgb(136,136,136)">Chih-Min Chao</span><div style=3D=
"color:rgb(136,136,136)"></div></div></div></div><div>=C2=A0</div></div></d=
iv>

--000000000000c97c4805ac2f8c01--

