Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nphPg-0008R4-0b
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 22:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nphPd-0008Pb-S3
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 22:21:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nphPb-0004jz-TU
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 22:21:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id k27so11895160edk.4
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D7Cjve6oVbvbq4mfrf+2D8PGe71UvGWRoO0r4pyFkJM=;
 b=C9/BT/hQXYCTbyBsf4lNX8znSockOzmbO1NmtvwFjD/F+GmTQCzl1Wif+bbtZhAYcx
 5UylEb22pXLzHheFspy1cmdxLToRwPgfJKJHyw7jhiWo/AJ1DuY4ppLhjrt57bIMLifG
 BmbMJkTEMtltLJSBeBgWpQ+YMg4nyEDg53ho8WD/hikh9e4oigyCNme/g4lXxHMY7bNv
 iQ08qBm29yUYvkHSKll+yaXZ8TdLsrKl4zG27fGUwFquwXy2N8Fi2XArFrjkN27kWlm2
 WIwSEn082rDKXywLMHDmUmPyD6WkYd/5JoR92jql9ZzKjFh+9jewNZ5CmggvWEN26BYg
 9R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7Cjve6oVbvbq4mfrf+2D8PGe71UvGWRoO0r4pyFkJM=;
 b=6KVKQDZT+hZO+8WY92n8O/GTfd8sMXUWadZ5IlG5YzTPdgWPHBr/LqJKc+YohFG8CQ
 3QOt0Mj+IDu3FXSqmpfTbYuf6+7sZJB/i8QbluNe/Ly0VdrrtsqU75w2JkRROofSdfiE
 /b6Y9TfW0LU6yUqKNEE6aERI4YNGd6i5MxLj6Q2FKj0wAxifmS12Y+UA/zIJySt67RLP
 B3Zm4OXlAIaf2R+79hc7KsoqYjFl83oqHgtybkalYkAmShfNlngSpE4jquajOIKdqhSX
 LsqhN+9uZz0Sdrmtdiwsc3QYFiuKoeD3qv7v41pxpl6eyqykt3FLqApf2PYld9QD6Poy
 sutQ==
X-Gm-Message-State: AOAM53164LU3pPUq6Haz7gWDppweijl9RPY+ISS+OZD02Qj+/meXK3nY
 c/z9yUCGRj9Xu5yoj/37pRq/xgVAXkGmlT9LqKSH6w==
X-Google-Smtp-Source: ABdhPJzeYAxkhgz90+cV4xzjxuYXWK3FMvXNU8unx1ubipJguwj8JbmG3y6hvp2zYCNQbarkufBVgQCknZhoyDkaBMo=
X-Received: by 2002:a05:6402:ca9:b0:425:ff4d:f6fd with SMTP id
 cn9-20020a0564020ca900b00425ff4df6fdmr1539826edb.405.1652494901250; Fri, 13
 May 2022 19:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220513221458.1192933-1-atishp@rivosinc.com>
In-Reply-To: <20220513221458.1192933-1-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 14 May 2022 10:21:30 +0800
Message-ID: <CAE_xrPiG6a1oH8UC1sr7cPqrJFQTMBHj+d-Tzs1TjaRtY2p2NA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Pass correct hartid while updating mtimecmp
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 dylan@rivosinc.com, 
 Bin Meng <bmeng.cn@gmail.com>, Jim Shu <jim.shu@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000009520b505deef7303"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 14 May 2022 02:21:46 -0000

--0000000000009520b505deef7303
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Sat, May 14, 2022 at 6:15 AM Atish Patra <atishp@rivosinc.com> wrote:

> timecmp update function should be invoked with hartid for which
> timecmp is being updated. The following patch passes the incorrect
> hartid to the update function.
>
> Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register
> writable")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  hw/intc/riscv_aclint.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 0412edc98257..e6bceceefdbc 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
>                  continue;
>              }
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> -                                              i, env->timecmp);
> +                                              mtimer->hartid_base + i,
> +                                              env->timecmp);
>          }
>          return;
>      }
> --
> 2.25.1
>
>

--0000000000009520b505deef7303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 14, 2022 at 6:15 AM =
Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">t=
imecmp update function should be invoked with hartid for which<br>
timecmp is being updated. The following patch passes the incorrect<br>
hartid to the update function.<br>
<br>
Fixes: e2f01f3c2e13 (&quot;hw/intc: Make RISC-V ACLINT mtime MMIO register =
writable&quot;)<br>
<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0hw/intc/riscv_aclint.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<br>
index 0412edc98257..e6bceceefdbc 100644<br>
--- a/hw/intc/riscv_aclint.c<br>
+++ b/hw/intc/riscv_aclint.c<br>
@@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, hwa=
ddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_aclint_mtimer_write_t=
imecmp(mtimer, RISCV_CPU(cpu),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 i, env-&gt;timecmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mtimer-&gt;hartid_base + i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 env-&gt;timecmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000009520b505deef7303--

