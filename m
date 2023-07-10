Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF914EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 11:22:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIoyW-0000FQ-0n; Mon, 10 Jul 2023 07:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qIoyT-0000EN-Pb; Mon, 10 Jul 2023 07:22:37 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qIoyS-0007pB-AW; Mon, 10 Jul 2023 07:22:37 -0400
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7679d444210so332343985a.2; 
 Mon, 10 Jul 2023 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688988154; x=1691580154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gUvbCVY/317D3QeuSshcE0x5zBgLgj5qT7WR3kC5t/k=;
 b=Um27WrSPHbNEafzMAvzJhRAnxv1ZF+D+9dh11lsLvlil51+KIJsleElmDwzsdB/JS7
 qx/N63CgXeahtWlodxIlVL7zFJev5nQr/C6GMCQAnJ5TXjzb5dHDhfC283Rc/7LvVssJ
 1pXX5oZ0iJhvBjpTaJ4hByf67VpX2iL+iIfGtHH+H7qe6i9CTH/pksPCxTKks2BdC6Jm
 WfxHS8uLLPFDh0X3w96YQslQbZNkVb8QVoFMh9KIldFaB/68Rdxb/pqFpa9GNR8lIVuO
 043dg4RjMGEN2pTQmAAjZvJZVrQAaoJP0jo3d5chj8hjR1IImGVeX7h4IbEADrqaUCbZ
 LDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688988154; x=1691580154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gUvbCVY/317D3QeuSshcE0x5zBgLgj5qT7WR3kC5t/k=;
 b=WFicDaU1C72wqv/JZj0o3m16H1Jnw5LwFuPo75jhw7H8Av6pP+QuwOM/Vw9zF0PuK+
 GR/J9XHVWjaPk4dkIhIk5DSlb393cpuV1ZNRT7YXe9iqO/+uQFJF+QEDgsgqiAjTRBc1
 RAgyXeSIKe7SGkpDn7BJfx+PcfU7CiDyT3jBWUx+atQLrqOfdNyL8FKO+hjQn9AO2kUi
 npTCWMhcuY3gQda3CymUUM1iF/4c125fjMESkkxh7pioZcXkoomwjPfgvyfkntAorKUY
 YXTuvLUGN+L8LQFJPP95rPkufZXifIMOpM85G4Xa8iQCz90/MLOgP8hpJZ2ibJ55BPtQ
 mhLA==
X-Gm-Message-State: ABy/qLY28hz62Gw/3YiLwWNysFXG8KSuzHwM1KXqXrOOaz89zZQL0zDa
 kYytbBz+GuA5nC7HPt4zaCp4zMCYC7XQoubMwsw=
X-Google-Smtp-Source: APBJJlG9Gb82RrGg3hTjTPiNluH2VZc14PdI2qOGaM6xAu6qVPDgxDiUeLmR0MFjZ5O13v3r7OfNxCGQvp1YdjRrzRE=
X-Received: by 2002:a05:620a:290d:b0:767:250d:f083 with SMTP id
 m13-20020a05620a290d00b00767250df083mr13847203qkp.78.1688988154493; Mon, 10
 Jul 2023 04:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230705133139.54419-1-philmd@linaro.org>
 <20230705133139.54419-4-philmd@linaro.org>
In-Reply-To: <20230705133139.54419-4-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 10 Jul 2023 15:22:23 +0400
Message-ID: <CAJ+F1CKeWVD=ZF_J6X7SJzXD3PBPEV7EXoXhNVQ7cXPJYo7+Qw@mail.gmail.com>
Subject: Re: [PATCH 3/4] chardev/char-fe: Document FEWatchFunc typedef
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
Content-Type: multipart/alternative; boundary="000000000000fa829f06002032a3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x732.google.com
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

--000000000000fa829f06002032a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 5, 2023 at 5:33=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org>
wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/chardev/char-fe.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> index 309960046a..ec3f706a14 100644
> --- a/include/chardev/char-fe.h
> +++ b/include/chardev/char-fe.h
> @@ -175,6 +175,20 @@ void qemu_chr_fe_printf(CharBackend *be, const char
> *fmt, ...)
>      G_GNUC_PRINTF(2, 3);
>
>
> +/**
> + * FEWatchFunc: a #GSourceFunc called when any conditions requested by
> + *              qemu_chr_fe_add_watch() is satisfied.
> + * @do_not_use: depending on the underlying chardev, a GIOChannel or a
> + *              QIOChannel. DO NOT USE!
> + * @cond: bitwise combination of conditions watched and satisfied
> + *              before calling this callback.
> + * @data: user data passed at creation to qemu_chr_fe_add_watch(). Can
> + *              be NULL.
> + *
> + * Returns: G_SOURCE_REMOVE if the GSource should be removed from the
> + *              main loop, or G_SOURCE_CONTINUE to leave the GSource in
> + *              the main loop.
> + */
>  typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition=
,
> void *data);
>
>  /**
> --
> 2.38.1
>
>
>
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fa829f06002032a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 5, 2023 at 5:33=E2=80=
=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">=
philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"=
mailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/chardev/char-fe.h | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h<br>
index 309960046a..ec3f706a14 100644<br>
--- a/include/chardev/char-fe.h<br>
+++ b/include/chardev/char-fe.h<br>
@@ -175,6 +175,20 @@ void qemu_chr_fe_printf(CharBackend *be, const char *f=
mt, ...)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(2, 3);<br>
<br>
<br>
+/**<br>
+ * FEWatchFunc: a #GSourceFunc called when any conditions requested by<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_add_watch()=
 is satisfied.<br>
+ * @do_not_use: depending on the underlying chardev, a GIOChannel or a<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIOChannel. DO NOT USE!=
<br>
+ * @cond: bitwise combination of conditions watched and satisfied<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 before calling this cal=
lback.<br>
+ * @data: user data passed at creation to qemu_chr_fe_add_watch(). Can<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be NULL.<br>
+ *<br>
+ * Returns: G_SOURCE_REMOVE if the GSource should be removed from the<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 main loop, or G_SOURCE_=
CONTINUE to leave the GSource in<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the main loop.<br>
+ */<br>
=C2=A0typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condit=
ion, void *data);<br>
<br>
=C2=A0/**<br>
-- <br>
2.38.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt;</div><br><span class=3D"gmail_signature_prefix">-- </span><br><div=
 dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></di=
v>

--000000000000fa829f06002032a3--

