Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E4CC7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:21:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzfRC-00070T-Hm; Thu, 18 May 2023 11:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1pzfR9-0006zr-LS
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 11:21:03 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1pzfR7-0002na-7w
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 11:21:03 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-561a33b6d63so26880787b3.1
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684423259; x=1687015259; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sTwXrNh0Ep9xOR8C05db2uNg4hHrqrdrXo6qYkVmN0c=;
 b=YKIGDrkX5aWztG25z8SJyu5AhcjNJcsZCTDWj4+tqKARDtPp/iXzNMr2svVKqDk1yW
 lXVxVAy/F0nb523AqzBHu+Z9FRWC4UTc0DT9xTRWco3Yu9Uyl+oV9XPkxMiodl+9GHaN
 Jp8RAQpvT3zeLns/S0H38euSydmzCTEjjIxsuw0yVzuW1JDWC0nNhYdOQ8Zl0mX51fUe
 +VcBQZuPDB70bzU34B7NtQvK7O4/BPRWklH465PpBDW1hHyzJBatpAlM1AsTJW+gLdcX
 84A1PudQxZFW4wgSZCdCrx4Ci9e0vuQBya9sDzS+78bWrBiQsyyhv5QTyla2oXlHKbeD
 qe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684423259; x=1687015259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTwXrNh0Ep9xOR8C05db2uNg4hHrqrdrXo6qYkVmN0c=;
 b=lmDd97FDwakxIS1cKj4UonN75D76S5Bs+9pEmrOdEVt2kGhAjgWfDsfDlftAbFPBsW
 pswAW95Xpbv2sQ1/BaeDg6FZCToTrm69B+s/ydWK/Rgl/5bbYP1TnzVss18hxVxJAaij
 JW2ABI5JeDcrBqwVuWhz3hhnWW/gon7Rra6+esUREOxGys6eBKj31DxiSIfyA4Mgc4Xx
 PwLcwE5qXKhiKThyf94hLaH89OzucEulKsx2Jul1YodPX1CeGmpB/6INt6CMHL0HvuBB
 RM+lczujcM8O6hjxiZSUrQ6GOl+znHOh5u8E8ohaBzMdqH6sfWJTjgTXN6uP1C6udWt8
 VC/Q==
X-Gm-Message-State: AC+VfDzPMto5pArTtXfexvDa6tr69HVd1t5l9LhXOG8RMD0H30QmpcDn
 mFG16/Lph3BarUNTpGpGFC0rMJrTwJ1twrpteaM+EQ==
X-Google-Smtp-Source: ACHHUZ5fOqVdI29uGSfPBrXkJ3RUJ9YhUxXJuyv8Bz5x7p4HkAbkTnOpkILgmgZUFRw42V5ViHu0SmzhBbhThdY2kK8=
X-Received: by 2002:a0d:cc02:0:b0:561:e7bb:1b20 with SMTP id
 o2-20020a0dcc02000000b00561e7bb1b20mr1438850ywd.34.1684423259425; Thu, 18 May
 2023 08:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113838.130084-1-rkanwal@rivosinc.com>
 <20230518113838.130084-3-rkanwal@rivosinc.com>
In-Reply-To: <20230518113838.130084-3-rkanwal@rivosinc.com>
From: =?UTF-8?B?TG/Dr2MgTGVmb3J0?= <loic@rivosinc.com>
Date: Thu, 18 May 2023 17:20:48 +0200
Message-ID: <CAGKm2NK3+46Te9bFwmyAXkRy3RVXXe61Zz1BYdPaZqxMoJ7HHA@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/riscv: Check for async flag in case of
 RISCV_EXCP_SEMIHOST.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: multipart/alternative; boundary="00000000000007a7cd05fbf95a74"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=loic@rivosinc.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000007a7cd05fbf95a74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is there a reason to keep RISCV_EXCP_SEMIHOST handling separate from
other exceptions?
Otherwise it could be moved in the switch block just a few lines below.

On Thu, May 18, 2023 at 1:39=E2=80=AFPM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:

> RISCV_EXCP_SEMIHOST is set to 0x10, which can also be a local
> interrupt as well. This change adds a check for async flag
> before invoking semihosting logic.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 57d04385f1..c78a2a9514 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1602,7 +1602,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong htval =3D 0;
>      target_ulong mtval2 =3D 0;
>
> -    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
> +    if  (!async && cause =3D=3D RISCV_EXCP_SEMIHOST) {
>          do_common_semihosting(cs);
>          env->pc +=3D 4;
>          return;
> --
> 2.25.1
>
>
>

--00000000000007a7cd05fbf95a74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there a reason=C2=A0to keep RISCV_EXCP_SEMIHOST handlin=
g=C2=A0separate from other=C2=A0exceptions?<div>Otherwise it could be moved=
 in the switch=C2=A0block just a few lines below.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 18, 2023=
 at 1:39=E2=80=AFPM Rajnesh Kanwal &lt;<a href=3D"mailto:rkanwal@rivosinc.c=
om">rkanwal@rivosinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">RISCV_EXCP_SEMIHOST is set to 0x10, which can also =
be a local<br>
interrupt as well. This change adds a check for async flag<br>
before invoking semihosting logic.<br>
<br>
Signed-off-by: Rajnesh Kanwal &lt;<a href=3D"mailto:rkanwal@rivosinc.com" t=
arget=3D"_blank">rkanwal@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_helper.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 57d04385f1..c78a2a9514 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -1602,7 +1602,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0target_ulong htval =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtval2 =3D 0;<br>
<br>
-=C2=A0 =C2=A0 if=C2=A0 (cause =3D=3D RISCV_EXCP_SEMIHOST) {<br>
+=C2=A0 =C2=A0 if=C2=A0 (!async &amp;&amp; cause =3D=3D RISCV_EXCP_SEMIHOST=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_common_semihosting(cs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc +=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--00000000000007a7cd05fbf95a74--

