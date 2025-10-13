Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1846CCA476
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 11:57:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8HBG-00081l-QW; Mon, 13 Oct 2025 07:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1v8HBE-00080n-VR
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 07:57:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1v8HBA-0001ds-NL
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 07:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760356645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BbqqdvDIeJ3GclYuDYa5riG1p6Sktidf0Dul2IV54B8=;
 b=L6lCwXrkmY8V3MoSSkOdEiddyOQfj2t0ZcRiK27GJIu6BDBVTWpH+yJdmEtnFY3LWiKEHl
 QMqjAcsGLKXoveqKATpCAzSNq8WN4wRPRfJUbnFFl6Jpmg35S1l8bTKPaS5vFz7DNnaLht
 WNfcp0OJpUkQxCow+FATmuczDThqu7g=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-mmo8Y40oMfqPqqoRNeAUOQ-1; Mon, 13 Oct 2025 07:57:24 -0400
X-MC-Unique: mmo8Y40oMfqPqqoRNeAUOQ-1
X-Mimecast-MFC-AGG-ID: mmo8Y40oMfqPqqoRNeAUOQ_1760356643
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b55735710f0so10771740a12.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 04:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760356643; x=1760961443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BbqqdvDIeJ3GclYuDYa5riG1p6Sktidf0Dul2IV54B8=;
 b=ed6BJdTeKOqeAW6SnCPQ3u5jDw93Lcxo13HGQeW3sabS/57d92/JgK86JzK9OFf1ET
 viINhcldUg+UbggQv6/BYaf6sWCrH/kzk3RClk29wMIPZzCWxI/29wdl1dMy7vNbjl59
 rRoJCNsXr9yOLU7zoVPHtJtl5kv6zbk0YhddRnrGgl2c5BU7qkcRW/GwxH4F0ywnnQg5
 nT5rXduTy1mnhwgaK8YEO6rs68WjTPThZukfcILql+zU8AUNirOLxEUOrznPkUyR5KDM
 NMdsHM3E3fO9JPxi+JzxqYGoc/8g5oDAeTVLVhfQmRMEGBFiHTuxRYs+Y8dFqSoaUgdS
 txGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmEnA98w5RpphB0HZ1s0oBSSCRhfh+mjMcpeNqSHGHZxxGUf/Ijxtk4u3LJtoeksymiynYHpX8j+Go@nongnu.org
X-Gm-Message-State: AOJu0YyTVz0v8FGylEuHsowZI7vNXDF6bZKfZecoF3p3Gt2rHi+lZhEm
 7WleWMGpXuV73nndoxy7eWvfY435zHSqk+zPciVXVuhCqnMSGV71K+kRRT2W//jY9GkrTXGrHh4
 IfGnnlG9UF279vsIVSDpGINNSbY4xzeI8kHfIniNgvImqnAVc12TDV2SpYxgqpRS0HEJmE5/kC8
 gQc8I0rR3C4WGHnpympsj7tcuHba77/oDHMOktL3Gm24bKrVo=
X-Gm-Gg: ASbGnctFFxKQzz60s1JO2ycZ3eBzzt4WMdDYVlDj7tA5DnvTti58VqOzxzbUvfu2Tod
 9Gg+VhV8RemotYTUQQb1N0fcj5YzIF6TvqLRO8ItXxiKgoML81DgTRqU7rubXc+A6KgpmnN01VE
 Hnxz7wRSZUk3KuFh8rZqkwrrpb3R0ju2QqdW236Mv8fYJbyUE0gJxG
X-Received: by 2002:a05:6a21:99a8:b0:2d5:e559:d22f with SMTP id
 adf61e73a8af0-32da845fb4bmr30683545637.49.1760356642743; 
 Mon, 13 Oct 2025 04:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7LGixjjEDseKUORIGEudWXi/O2opok7Q7zmrqIyrLJdJkjU2cMwoI7xu5JYsoh2aEUdni4H4BFclC4wLPObw=
X-Received: by 2002:a05:6a21:99a8:b0:2d5:e559:d22f with SMTP id
 adf61e73a8af0-32da845fb4bmr30683526637.49.1760356642407; Mon, 13 Oct 2025
 04:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251010134226.72221-1-philmd@linaro.org>
 <20251010134226.72221-4-philmd@linaro.org>
In-Reply-To: <20251010134226.72221-4-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Oct 2025 15:57:10 +0400
X-Gm-Features: AS18NWDk4SvZ4_CNTAWuVHePQfmjemFIniEPBq48zkrNcM1cWAstXNj9j5GWPEQ
Message-ID: <CAMxuvaxHGS_-VBP72ZzzHN63z0fGvPchy7XDGSU8XAf6AOkvRg@mail.gmail.com>
Subject: Re: [PATCH 03/16] ui: Replace HOST_BIG_ENDIAN #ifdef with runtime
 if() check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7-jtQFSZMi2TRmSAH--MuJDef4rLghqPNGlMYFCgCm8_1760356643
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000595458064108f8f3"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

--000000000000595458064108f8f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 5:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Replace compile-time #ifdef with a runtime check to ensure all code
> paths are built and tested. This reduces build-time configuration
> complexity and improves maintainability.
>
> No functional change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  ui/vdagent.c | 16 ++++++++--------
>  ui/vnc.c     |  6 +-----
>  2 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index ddb91e75c64..66dc33567df 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -660,14 +660,14 @@ static void vdagent_chr_open(Chardev *chr,
>      VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);
>      ChardevQemuVDAgent *cfg =3D backend->u.qemu_vdagent.data;
>
> -#if HOST_BIG_ENDIAN
> -    /*
> -     * TODO: vdagent protocol is defined to be LE,
> -     * so we have to byteswap everything on BE hosts.
> -     */
> -    error_setg(errp, "vdagent is not supported on bigendian hosts");
> -    return;
> -#endif
> +    if (HOST_BIG_ENDIAN) {
> +        /*
> +         * TODO: vdagent protocol is defined to be LE,
> +         * so we have to byteswap everything on BE hosts.
> +         */
> +        error_setg(errp, "vdagent is not supported on bigendian hosts");
> +        return;
> +    }
>
>      vd->mouse =3D VDAGENT_MOUSE_DEFAULT;
>      if (cfg->has_mouse) {
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 77c823bf2e8..e93b5335690 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2348,11 +2348,7 @@ static void pixel_format_message (VncState *vs) {
>      vnc_write_u8(vs, vs->client_pf.bits_per_pixel); /* bits-per-pixel */
>      vnc_write_u8(vs, vs->client_pf.depth); /* depth */
>
> -#if HOST_BIG_ENDIAN
> -    vnc_write_u8(vs, 1);             /* big-endian-flag */
> -#else
> -    vnc_write_u8(vs, 0);             /* big-endian-flag */
> -#endif
> +    vnc_write_u8(vs, HOST_BIG_ENDIAN);         /* big-endian-flag */
>      vnc_write_u8(vs, 1);             /* true-color-flag */
>      vnc_write_u16(vs, vs->client_pf.rmax);     /* red-max */
>      vnc_write_u16(vs, vs->client_pf.gmax);     /* green-max */
> --
> 2.51.0
>
>

--000000000000595458064108f8f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 10,=
 2025 at 5:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:=
philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Replace compile-time #ifdef with a runt=
ime check to ensure all code<br>
paths are built and tested. This reduces build-time configuration<br>
complexity and improves maintainability.<br>
<br>
No functional change intended.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vdagent.c | 16 ++++++++--------<br>
=C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-----<br>
=C2=A02 files changed, 9 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
index ddb91e75c64..66dc33567df 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -660,14 +660,14 @@ static void vdagent_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);<br>
=C2=A0 =C2=A0 =C2=A0ChardevQemuVDAgent *cfg =3D backend-&gt;u.qemu_vdagent.=
data;<br>
<br>
-#if HOST_BIG_ENDIAN<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* TODO: vdagent protocol is defined to be LE,<br>
-=C2=A0 =C2=A0 =C2=A0* so we have to byteswap everything on BE hosts.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;vdagent is not supported on bigendian=
 hosts&quot;);<br>
-=C2=A0 =C2=A0 return;<br>
-#endif<br>
+=C2=A0 =C2=A0 if (HOST_BIG_ENDIAN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TODO: vdagent protocol is defined to b=
e LE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so we have to byteswap everything on B=
E hosts.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;vdagent is not supporte=
d on bigendian hosts&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0vd-&gt;mouse =3D VDAGENT_MOUSE_DEFAULT;<br>
=C2=A0 =C2=A0 =C2=A0if (cfg-&gt;has_mouse) {<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 77c823bf2e8..e93b5335690 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -2348,11 +2348,7 @@ static void pixel_format_message (VncState *vs) {<br=
>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, vs-&gt;client_pf.bits_per_pixel); /* b=
its-per-pixel */<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, vs-&gt;client_pf.depth); /* depth */<b=
r>
<br>
-#if HOST_BIG_ENDIAN<br>
-=C2=A0 =C2=A0 vnc_write_u8(vs, 1);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* big-endian-flag */<br>
-#else<br>
-=C2=A0 =C2=A0 vnc_write_u8(vs, 0);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* big-endian-flag */<br>
-#endif<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, HOST_BIG_ENDIAN);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* big-endian-flag */<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, 1);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* true-color-flag */<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u16(vs, vs-&gt;client_pf.rmax);=C2=A0 =C2=A0 =
=C2=A0/* red-max */<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u16(vs, vs-&gt;client_pf.gmax);=C2=A0 =C2=A0 =
=C2=A0/* green-max */<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div></div>

--000000000000595458064108f8f3--


