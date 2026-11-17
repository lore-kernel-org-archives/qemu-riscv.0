Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F91606A32C
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=V5sZGkg5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFDN-000768-8V; Tue, 17 Nov 2026 04:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFDM-00075u-Jj
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:10:56 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFDK-0001lv-NQ
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:10:56 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c50dd1e2f11so279758266b.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794906653; x=1795511453; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aRfquUDAPsLpa9/2xbyG+SbrtcQRB0PT56U1jR1xO1c=;
 b=V5sZGkg5ajDRNkmMiiANz8LFDNCI3dtaEBy6Dp4yr8TsemhREiV1XcANl/p0RHCoRU
 KllpdOsz5eqvWle6O3Eamf0CgEuIX4hOTf2KiOvkxXXqMglsOGfvUli8CnIhsnusg4Dw
 Cukm/DB467PyhaTb+W4vyZmqXz1mp6jN77uiL4+jrdvwOyoy6P+hJ3BDW2MbxSpO3AaC
 90NGCBW1CAa8MxlF6Br2JGswVj6vWrT644ydQH0379dq6RBX7VFmjHWaj/HWpYK/Uje3
 WJLUgDI0Mz6RN4FNCDcoxV2omk3m2OiLv1drWltYKiSPrjV3iHKz+F5W6LlLQEqHBo7B
 TYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794906653; x=1795511453;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aRfquUDAPsLpa9/2xbyG+SbrtcQRB0PT56U1jR1xO1c=;
 b=FAknXkeu7jVcqvpl8XQJi6rz+XCE/sq/aDmaSKahtUHqIxf3MxvRGJn6tXdt0CRrNf
 N2dB4FSH7yHfshCjkQy3/VFc2UTUzflFgI9xhv+Kqylf8fT0VIxASvaBfjgAeHveL2sD
 7ZRZzpSfrCLq1s9LmHjwmG15mO/gWoXd8+Zbq+LgbYZT9s1pedc4LIIA6w8bP2xXmw4G
 o/VOwtPLxisrGuUbx38OLv1+IQjZKzKNGqo90izyLIKkIZn3YXQy0gjt09XC1UHwTBIy
 ima0bLiUAcAIPTjsJCR9vbRHRzRSO4KLfWuz8lWaxezVgLBqeyr5fUjGfKQIZwFwrp0z
 L9WA==
X-Forwarded-Encrypted: i=1;
 AL+hErE5u8oT5cHHNTonBR6V3KhW6yaOaHjyWmNKj7Qr0LlALICwIvbwdLZO85nU8dYZUNDoxbOegl7x3TIX@nongnu.org
X-Gm-Message-State: APuU4Z9KDYqKpwj7oCKwII8nElCeoB2M8YaMevYEPiyOVa6hsGmObzel
 4RSSyAtdGUUGz+26TnY+Gy9eoH1glwTtOsGq/00twRiqXKnp7qzpy3gJttSIBfMiJsx2DgPtVvf
 a1htyR7l0BRo8rOS5VSTD018kyykXnbnkw/oImQEEYz9v8xY7l+a8A+HhBSQmtRDIlDtNWGGQgp
 jhSXjfhjHT6YTYQZ3MKiaQWLItBOYQxIvTm73ZVoeNyRc=
X-Gm-Gg: AYBFou3KD7WwWiETxwWdtCEZ1PzYSs1qT6P0zpHZuLXhjioA2VOWokKyXsL6Bn3cXQb
 iMhV5Oo5Lua8SZhvkQNCwYp7PUR5yoOZK89U59KLfC2tTZftqrPkEWrD/5dQBiMTt8KX6M5hiGQ
 ZWACycQRYZtJ5eeFfYIbWtF+dpeHM3cD6uGxG8ybw/0LjfaC+iFVlo37LrO8HzlIol0e9v+gY80
 udqfBLvn3TXCSNeib7AnsQUOpF3wgCEUbzbRLslnD8vFd+BZyWuESWpgWrNwQB6FmunJDInfARL
 YXLeOcZds4BOjSQTjjUS2h1vZGWx+9350pJremWpUoPMIGlCWkQ8CAqxkXElbF5CnRc1Iljdbxn
 /ePD2LoX1uo+xKiaYWjJBivVRgqTr4KNBb5NDIxIuFxbvmMkrrAXZ1jyLL3QxNKM6z/3BQXsB8B
 HwCYdhMre+Ipj4iibk21xyauB0RjE8wmveEO8MQes4uTL5h7Y6SyzGtgWd765Nl7S3M74afLKst
 wPTYDpxQS/aZ5HMe0RdjMmpoX2+HX+qSO5F2XOMucj4nfTIU2oL2TMM8lxTSui64HaxPjOBqRSy
 tM64aHAKtb8aKbFvpgPVgwGJOrRIPAHXP94hwolrsj4RB/Txpx5jjK9CaSnYNchVnJs=
X-Received: by 2002:a17:907:9686:b0:c50:8ff9:4f40 with SMTP id
 a640c23a62f3a-c509630763amr1235870066b.11.1794906652665; 
 Tue, 17 Nov 2026 01:10:52 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c50b13a2ae7sm375046166b.62.2026.11.17.01.10.51
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:10:52 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso9824843a12.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:10:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErEx7mwxobuQOO7BV0lVRkBItXgToj6osLn4fm1G/0CTaGf2hwGsmgJUIYYW52IKNrzw1CQPniSCS7Ug@nongnu.org
X-Received: by 2002:a05:6402:a513:10b0:6b7:186:e60b with SMTP id
 4fb4d7f45d1cf-6b7c0891425mr7749743a12.5.1794906651535; Tue, 17 Nov 2026
 01:10:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-4-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-4-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:10:40 +0800
X-Gmail-Original-Message-ID: <CAMXXpfYGwRLKurEaC3ypaWL=BdDbASZuSYxFXeFC35rKn-GVfQ@mail.gmail.com>
X-Gm-Features: AclHuK-dqqgmNgt4vsN72xM89LbqEydezYISjPky5Sh_z0QS4_iMlNzGs9s5F0w
Message-ID: <CAMXXpfYGwRLKurEaC3ypaWL=BdDbASZuSYxFXeFC35rKn-GVfQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] hw/riscv/trace-encoder.c: align ntrace messages
 with ones
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005eaf97066075458f"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000005eaf97066075458f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semichastnov <
antikostya2@gmail.com> wrote:

> N-Trace format requires idle bytes to be filled with 0xff, instead of
> zeroes, like E-Trace format
>
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
>  hw/riscv/trace-encoder.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
> index 10e52e207e..703454c9b7 100644
> --- a/hw/riscv/trace-encoder.c
> +++ b/hw/riscv/trace-encoder.c
> @@ -398,21 +398,35 @@ static void trencoder_send_message_smem(TraceEncode=
r
> *trencoder,
>      hwaddr dest =3D trencoder_read_ramsink_writep(trencoder);
>      bool wrapped =3D false;
>
> +    if (trencoder->ntrace) {
> +        /*
> +         * RISC-V N-Trace 3.1. MSEO Sequences:
> +         * idle bytes in N-Trace format are filled with 0xff, instead of
> zeroes
> +         */
> +        memset(msg + msg_size, 0xff, 4 - msg_size % 4);
> +    }
>      msg_size =3D QEMU_ALIGN_UP(msg_size, 4);
>
>      /* clear trRamWrap before writing to SMEM */
>      dest =3D FIELD_DP64(dest, TR_RAM_WP_LOW, WRAP, 0);
>
>      /*
> -     * Fill with null bytes if we can't fit the packet in
> +     * Fill with idle bytes if we can't fit the packet in
>       * ramlimit, set wrap and write the packet in ramstart.
>       */
>      if (dest + msg_size > trencoder->ramsink_ramlimit) {
> -        g_autofree uint8_t *null_packet =3D NULL;
> -        uint8_t null_size =3D trencoder->ramsink_ramlimit - dest;
> +        g_autofree uint8_t *idle_packet =3D NULL;
> +        uint8_t idle_size =3D trencoder->ramsink_ramlimit - dest;
>
> -        null_packet =3D g_malloc0(null_size);
> -        cpu_physical_memory_write(dest, null_packet, null_size);
> +        idle_packet =3D g_malloc0(idle_size);
> +        if (trencoder->ntrace) {
> +            /*
> +             * RISC-V N-Trace 3.1. MSEO Sequences:
> +             * idle bytes in N-Trace format are filled with 0xff, instea=
d
> of zeroes
> +             */
> +            memset(idle_packet, 0xff, idle_size);
> +        }
> +        cpu_physical_memory_write(dest, idle_packet, idle_size);
>
>          dest =3D trencoder->ramsink_ramstart;
>          wrapped =3D true;
>
> --
> 2.43.0
>
>
>

--0000000000005eaf97066075458f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jay Chang&lt;<a href=3D"mailto:jay.chang@sifi=
ve.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<div>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semic=
hastnov &lt;<a href=3D"mailto:antikostya2@gmail.com">antikostya2@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">N=
-Trace format requires idle bytes to be filled with 0xff, instead of<br>
zeroes, like E-Trace format<br>
<br>
Signed-off-by: Konstantin Semichastnov &lt;<a href=3D"mailto:antikostya2@gm=
ail.com" target=3D"_blank">antikostya2@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/trace-encoder.c | 24 +++++++++++++++++++-----<br>
=C2=A01 file changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c<br>
index 10e52e207e..703454c9b7 100644<br>
--- a/hw/riscv/trace-encoder.c<br>
+++ b/hw/riscv/trace-encoder.c<br>
@@ -398,21 +398,35 @@ static void trencoder_send_message_smem(TraceEncoder =
*trencoder,<br>
=C2=A0 =C2=A0 =C2=A0hwaddr dest =3D trencoder_read_ramsink_writep(trencoder=
);<br>
=C2=A0 =C2=A0 =C2=A0bool wrapped =3D false;<br>
<br>
+=C2=A0 =C2=A0 if (trencoder-&gt;ntrace) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* RISC-V N-Trace 3.1. MSEO Sequences:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* idle bytes in N-Trace format are fille=
d with 0xff, instead of zeroes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(msg + msg_size, 0xff, 4 - msg_size % 4)=
;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0msg_size =3D QEMU_ALIGN_UP(msg_size, 4);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* clear trRamWrap before writing to SMEM */<br>
=C2=A0 =C2=A0 =C2=A0dest =3D FIELD_DP64(dest, TR_RAM_WP_LOW, WRAP, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0* Fill with null bytes if we can&#39;t fit the packet =
in<br>
+=C2=A0 =C2=A0 =C2=A0* Fill with idle bytes if we can&#39;t fit the packet =
in<br>
=C2=A0 =C2=A0 =C2=A0 * ramlimit, set wrap and write the packet in ramstart.=
<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (dest + msg_size &gt; trencoder-&gt;ramsink_ramlimit=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *null_packet =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t null_size =3D trencoder-&gt;ramsink_ra=
mlimit - dest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree uint8_t *idle_packet =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t idle_size =3D trencoder-&gt;ramsink_ra=
mlimit - dest;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 null_packet =3D g_malloc0(null_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_physical_memory_write(dest, null_packet, n=
ull_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idle_packet =3D g_malloc0(idle_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (trencoder-&gt;ntrace) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* RISC-V N-Trace 3.1. MSEO=
 Sequences:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* idle bytes in N-Trace fo=
rmat are filled with 0xff, instead of zeroes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(idle_packet, 0xff, idle_s=
ize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_physical_memory_write(dest, idle_packet, i=
dle_size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D trencoder-&gt;ramsink_ramstart;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrapped =3D true;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--0000000000005eaf97066075458f--

