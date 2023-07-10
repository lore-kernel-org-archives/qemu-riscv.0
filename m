Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65094EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 11:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIowB-0005tl-Gu; Mon, 10 Jul 2023 07:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qIow8-0005sv-8c; Mon, 10 Jul 2023 07:20:12 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qIow4-0007Ie-W5; Mon, 10 Jul 2023 07:20:11 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7672303c831so397932985a.2; 
 Mon, 10 Jul 2023 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688988004; x=1691580004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1zXGzS/0sE5e+QYS0lYZsTi/l4GhadTivJcFUlQANPE=;
 b=In7plE3TSYyUI5g4EoQDf6j0cBc4wOS2bMTQFSuEZNVjxHcEgob12YJ+LG/kcOyX2v
 l2aoxwZMsIB4yEyH+cTp/LrM8RS+QvjqgEJiLPwfYQ6dYIzYjXAsNzIPtIf61AXe2H5V
 /wqCSb/DDACTWJvAAGadFTQ3GUJqOKN5f3CQ1GbCZHX2R7wAax9d7lnVfdjkE8Zz+kDR
 qlVPLzCGHfLX2HV6OMbo9ZlNyoL0VrOemFFEejn2PqM+Xqdw9chlL4vgmxdndOWbmgrB
 fSgXE19qYjvm1KDyWqOYmL9/rMe6H2pHRkxVv9okVsJtw4vlKoyhSMw9hsUozP89C4Y2
 CHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688988004; x=1691580004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1zXGzS/0sE5e+QYS0lYZsTi/l4GhadTivJcFUlQANPE=;
 b=c36qjeZJg1C/u9ZkVA/h/4It1sJhq/8sh6e5tEXK8hIbhgQmOUTPT7WwQgTrpsSDOe
 SQGuIJiPYiyzl9YkXQ/tga2A30D8neh8E+66IZEWkAdjTgIiSNP6biHUQ+Pz2zwOfjh8
 SDKKkWvitUFyjFmk2SFwXQ07fKPxu4fK38jUjBvFPFQlbhQHRtdnJTU1EdpbvIxNQqol
 NuZZSMECXpGCAJ5Ci7WIuAO9Q073/z2qYqkHWu/fOZqbo6mG3KVZ4GLBmTZjArOBh3iA
 ifQR7VktHrmleItZAtvpBeqEjY5ViXH49pDt9JMO2bFi0TWisFl7WC2H08LGab0hM6hz
 f1Dg==
X-Gm-Message-State: ABy/qLbVF4ppQfl24UYZjgylHF2E3gZ9iRQl9PJ7bB2qpc0yXFpXIgBF
 udAw0FGKhJGy59amijxkWy/ptayf6Ze93jOpx/U=
X-Google-Smtp-Source: APBJJlG188g3oV4E7tb4B+AjdMj2MIC7lQjaUlO0egUq0rdKsqg6+QWbBf4pIXIwbpSC87ojpuN51w7urwQhagfcLOg=
X-Received: by 2002:a05:620a:198a:b0:765:abeb:a13e with SMTP id
 bm10-20020a05620a198a00b00765abeba13emr14143181qkb.60.1688988004321; Mon, 10
 Jul 2023 04:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230705133139.54419-1-philmd@linaro.org>
 <20230705133139.54419-3-philmd@linaro.org>
In-Reply-To: <20230705133139.54419-3-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 10 Jul 2023 15:19:53 +0400
Message-ID: <CAJ+F1CJ_vkZRK4F7mYY_+rFZmHMuO6ivB8L=aemJswgrvUhHWA@mail.gmail.com>
Subject: Re: [PATCH 2/4] chardev/char-fe: Clarify qemu_chr_fe_add_watch
 'condition' arg is a mask
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000007134b0600202ada"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000007134b0600202ada
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 5:33=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org>
wrote:

> qemu_chr_fe_add_watch() can poll for multiple conditions.
> It's @cond argument is a combination of all the condition bits.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/chardev/char-fe.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> index 8c420fa36e..309960046a 100644
> --- a/include/chardev/char-fe.h
> +++ b/include/chardev/char-fe.h
> @@ -179,8 +179,8 @@ typedef gboolean (*FEWatchFunc)(void *do_not_use,
> GIOCondition condition, void *
>
>  /**
>   * qemu_chr_fe_add_watch:
> - * @cond: the condition to poll for
>
- * @func: the function to call when the condition happens
> + * @cond: bitwise combination of conditions to poll for
> + * @func: the function to call when the conditions are satisfied
>

Not really worth imo, do you want to also fix all the io/ docs for
@condition? and probably elsewhere...

The rewording of @func isn't much clearer either... "any of the conditions"=
?


>   * @user_data: the opaque pointer to pass to @func
>   *
>   * If the backend is connected, create and add a #GSource that fires
> --
> 2.38.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000007134b0600202ada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 5, 2023 at 5:33=E2=80=AFP=
M Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phil=
md@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">qemu_chr_fe_add_watch() can poll for multiple conditions.<br>
It&#39;s @cond argument is a combination of all the condition bits.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/chardev/char-fe.h | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h<br>
index 8c420fa36e..309960046a 100644<br>
--- a/include/chardev/char-fe.h<br>
+++ b/include/chardev/char-fe.h<br>
@@ -179,8 +179,8 @@ typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCo=
ndition condition, void *<br>
<br>
=C2=A0/**<br>
=C2=A0 * qemu_chr_fe_add_watch:<br>
- * @cond: the condition to poll for <br></blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
- * @func: the function to call when the condition happens<br>
+ * @cond: bitwise combination of conditions to poll for<br>
+ * @func: the function to call when the conditions are satisfied<br></bloc=
kquote><div><br></div><div>Not really worth imo, do you want to also fix al=
l the io/ docs for @condition? and probably elsewhere...<br></div></div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The rewording =
of @func isn&#39;t much clearer either... &quot;any of the conditions&quot;=
?<br></div><div class=3D"gmail_quote">=C2=A0<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0 * @user_data: the opaque pointer to pass to @func<br>
=C2=A0 *<br>
=C2=A0 * If the backend is connected, create and add a #GSource that fires<=
br>
-- <br>
2.38.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--00000000000007134b0600202ada--

