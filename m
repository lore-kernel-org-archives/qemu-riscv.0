Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B10EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 11:24:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIp03-00018m-J3; Mon, 10 Jul 2023 07:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qIp01-00018H-DN; Mon, 10 Jul 2023 07:24:13 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qIozy-0008BI-Tf; Mon, 10 Jul 2023 07:24:13 -0400
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-76754b9eac0so422207085a.0; 
 Mon, 10 Jul 2023 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688988249; x=1691580249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQBbGtvtixAAhIdlmqyG5jna613Bp3yNoO6wXA1U5Nk=;
 b=DvIFrYZ9DgFTo8uvw9rkAMCPhtQCTnYD//HchG7XxFQIY8i5tyzIfAg7Jcj3kuD1QF
 lFrvsPuSOb6NEKDio4FFH2+F8ZYrR1GKj8+2BOeiJ8VD2lxl+QRXsLGO3Q7VjkSNWEe9
 HXsKlYeZbXFZoZOZrs+smxiMOgfuqrOorwdyT5USI8r/wPgdp4Kl1c4sT0yqPLD9hNik
 p/Gks5PKZQmQiLIepgxpCTSXlgpyt7ZdKDU1EuJxB3wg88S6gcQJrFI7WBPW0zGoc/I5
 uBWzMFQ2idMObEtc6naj/EjhwOUvxzXuTP/BCJ37lcHnmud5gsxihqZCvtfrZs59rWtE
 cnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688988249; x=1691580249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQBbGtvtixAAhIdlmqyG5jna613Bp3yNoO6wXA1U5Nk=;
 b=gEwjgbQJ7krOyjzvFz3k/Ip9lPJJBNT+LsV0DdUtiWKD6EhAKLua0jYglnMkbOXxI+
 2dLfDyFTdHpCheCCgQlAblQMO+3bSJh5+zrTUF857999sXgLXfuvNMKc+zbPa7vvTcTW
 XzfJg3De30WCrQvgDvhaUhWE80F9k+DOw6priym+W+kCa0eO38IR8xVtKQsee7yAjLwI
 JOQFVJNsLyC2GEl3Vk4dSWVX8uOhHaO9UKxL4vxoevyVVnkdw6aqfCL+3XuXRixUbNHX
 74DiVqtRE814E/EwX3kP0A6KPoTjPOlqWNnmalzSoYoPLx+mVPb7AEmGvqKw4b3UZtYW
 HZWQ==
X-Gm-Message-State: ABy/qLY9st9JsqPhd0vAVt9jToPPXLGxOyX0o+KDU+DHLDfZzPfla8N9
 7Ochieb7HEerQQWOJiudp3RDTj37rumAldU+2C3C/zvg9a8=
X-Google-Smtp-Source: APBJJlFvNGaYPOzUrc+Rd0v1p98R0VNmqAHVZ2e3rKZvkDimuqqk8bhJPZfTh5dxkIZCezp6pVBIrdnEmezGI+dWmeM=
X-Received: by 2002:a05:622a:19a1:b0:400:aa4d:7a60 with SMTP id
 u33-20020a05622a19a100b00400aa4d7a60mr15269817qtc.37.1688988249132; Mon, 10
 Jul 2023 04:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230705133139.54419-1-philmd@linaro.org>
 <20230705133139.54419-5-philmd@linaro.org>
In-Reply-To: <20230705133139.54419-5-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 10 Jul 2023 15:23:57 +0400
Message-ID: <CAJ+F1CK861C=7erQ6RcRCLXQ=mDdD5SRHotZnAqhfU=5Y9pPJA@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/char: Have FEWatchFunc handlers return
 G_SOURCE_CONTINUE/REMOVE
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
Content-Type: multipart/alternative; boundary="0000000000009e930c0600203818"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72b.google.com
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

--0000000000009e930c0600203818
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 5:33=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org>
wrote:

> GLib recommend to use G_SOURCE_REMOVE / G_SOURCE_CONTINUE
> for GSourceFunc callbacks. Our FEWatchFunc is a GSourceFunc
> returning such value. Use such definitions which are
> "more memorable" [*].
>
> [*] https://docs.gtk.org/glib/callback.SourceFunc.html#return-value
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/char/cadence_uart.c   | 8 ++++----
>  hw/char/cmsdk-apb-uart.c | 6 +++---
>  hw/char/ibex_uart.c      | 8 ++++----
>  hw/char/nrf51_uart.c     | 4 ++--
>  hw/char/serial.c         | 2 +-
>  hw/char/virtio-console.c | 2 +-
>  hw/usb/redirect.c        | 2 +-
>  monitor/monitor.c        | 2 +-
>  net/vhost-user.c         | 2 +-
>  9 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 807e398541..eff0304a18 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -307,11 +307,11 @@ static gboolean cadence_uart_xmit(void *do_not_use,
> GIOCondition cond,
>      /* instant drain the fifo when there's no back-end */
>      if (!qemu_chr_fe_backend_connected(&s->chr)) {
>          s->tx_count =3D 0;
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>      if (!s->tx_count) {
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>      ret =3D qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_count);
> @@ -326,12 +326,12 @@ static gboolean cadence_uart_xmit(void *do_not_use,
> GIOCondition cond,
>                                          cadence_uart_xmit, s);
>          if (!r) {
>              s->tx_count =3D 0;
> -            return FALSE;
> +            return G_SOURCE_REMOVE;
>          }
>      }
>
>      uart_update_status(s);
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> index f8dc89ee3d..d466cd93de 100644
> --- a/hw/char/cmsdk-apb-uart.c
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -199,7 +199,7 @@ static gboolean uart_transmit(void *do_not_use,
> GIOCondition cond, void *opaque)
>      s->watch_tag =3D 0;
>
>      if (!(s->ctrl & R_CTRL_TX_EN_MASK) || !(s->state &
> R_STATE_TXFULL_MASK)) {
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>      ret =3D qemu_chr_fe_write(&s->chr, &s->txbuf, 1);
> @@ -215,7 +215,7 @@ static gboolean uart_transmit(void *do_not_use,
> GIOCondition cond, void *opaque)
>          }
>          /* Transmit pending */
>          trace_cmsdk_apb_uart_tx_pending();
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>  buffer_drained:
> @@ -227,7 +227,7 @@ buffer_drained:
>          s->intstatus |=3D R_INTSTATUS_TX_MASK;
>      }
>      cmsdk_apb_uart_update(s);
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  static void uart_cancel_transmit(CMSDKAPBUART *s)
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index f70adb5308..51708c0836 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -147,7 +147,7 @@ static gboolean ibex_uart_xmit(void *do_not_use,
> GIOCondition cond,
>      /* instant drain the fifo when there's no back-end */
>      if (!qemu_chr_fe_backend_connected(&s->chr)) {
>          s->tx_level =3D 0;
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>      if (!s->tx_level) {
> @@ -156,7 +156,7 @@ static gboolean ibex_uart_xmit(void *do_not_use,
> GIOCondition cond,
>          s->uart_intr_state |=3D R_INTR_STATE_TX_EMPTY_MASK;
>          s->uart_intr_state &=3D ~R_INTR_STATE_TX_WATERMARK_MASK;
>          ibex_uart_update_irqs(s);
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>      ret =3D qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
> @@ -171,7 +171,7 @@ static gboolean ibex_uart_xmit(void *do_not_use,
> GIOCondition cond,
>                                          ibex_uart_xmit, s);
>          if (!r) {
>              s->tx_level =3D 0;
> -            return FALSE;
> +            return G_SOURCE_REMOVE;
>          }
>      }
>
> @@ -192,7 +192,7 @@ static gboolean ibex_uart_xmit(void *do_not_use,
> GIOCondition cond,
>      }
>
>      ibex_uart_update_irqs(s);
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  static void uart_write_tx_fifo(IbexUartState *s, const uint8_t *buf,
> diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
> index 3c6f982de9..dfe2276d71 100644
> --- a/hw/char/nrf51_uart.c
> +++ b/hw/char/nrf51_uart.c
> @@ -93,13 +93,13 @@ static gboolean uart_transmit(void *do_not_use,
> GIOCondition cond, void *opaque)
>               */
>              goto buffer_drained;
>          }
> -        return FALSE;
> +        return G_SOURCE_REMOVE;
>      }
>
>  buffer_drained:
>      s->reg[R_UART_TXDRDY] =3D 1;
>      s->pending_tx_byte =3D false;
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  static void uart_cancel_transmit(NRF51UARTState *s)
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 270e1b1094..f3094f860f 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -226,7 +226,7 @@ static gboolean serial_watch_cb(void *do_not_use,
> GIOCondition cond,
>      SerialState *s =3D opaque;
>      s->watch_tag =3D 0;
>      serial_xmit(s);
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  static void serial_xmit(SerialState *s)
> diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
> index dd5a02e339..dbe0b28e60 100644
> --- a/hw/char/virtio-console.c
> +++ b/hw/char/virtio-console.c
> @@ -45,7 +45,7 @@ static gboolean chr_write_unblocked(void *do_not_use,
> GIOCondition cond,
>
>      vcon->watch =3D 0;
>      virtio_serial_throttle_port(VIRTIO_SERIAL_PORT(vcon), false);
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  /* Callback function that's called when the guest sends us data */
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 39fbaaab16..4bbf8afb33 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -278,7 +278,7 @@ static gboolean usbredir_write_unblocked(void
> *do_not_use, GIOCondition cond,
>      dev->watch =3D 0;
>      usbredirparser_do_write(dev->parser);
>
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  static int usbredir_write(void *priv, uint8_t *data, int count)
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index dc352f9e9d..941f87815a 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -144,7 +144,7 @@ static gboolean monitor_unblocked(void *do_not_use,
> GIOCondition cond,
>      QEMU_LOCK_GUARD(&mon->mon_lock);
>      mon->out_watch =3D 0;
>      monitor_flush_locked(mon);
> -    return FALSE;
> +    return G_SOURCE_REMOVE;
>  }
>
>  /* Caller must hold mon->mon_lock */
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 5993e4afca..12555518e8 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -239,7 +239,7 @@ static gboolean net_vhost_user_watch(void *do_not_use=
,
> GIOCondition cond,
>
>      qemu_chr_fe_disconnect(&s->chr);
>
> -    return TRUE;
> +    return G_SOURCE_CONTINUE;
>  }
>
>  static void net_vhost_user_event(void *opaque, QEMUChrEvent event);
> --
> 2.38.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009e930c0600203818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 5, 2023 at 5:33=E2=80=AFP=
M Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phil=
md@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">GLib recommend to use G_SOURCE_REMOVE / G_SOURCE_CONTINUE<br>
for GSourceFunc callbacks. Our FEWatchFunc is a GSourceFunc<br>
returning such value. Use such definitions which are<br>
&quot;more memorable&quot; [*].<br>
<br>
[*] <a href=3D"https://docs.gtk.org/glib/callback.SourceFunc.html#return-va=
lue" rel=3D"noreferrer" target=3D"_blank">https://docs.gtk.org/glib/callbac=
k.SourceFunc.html#return-value</a><br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/char/cadence_uart.c=C2=A0 =C2=A0| 8 ++++----<br>
=C2=A0hw/char/cmsdk-apb-uart.c | 6 +++---<br>
=C2=A0hw/char/ibex_uart.c=C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
=C2=A0hw/char/nrf51_uart.c=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0hw/char/serial.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/char/virtio-console.c | 2 +-<br>
=C2=A0hw/usb/redirect.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0net/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A09 files changed, 18 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c<br>
index 807e398541..eff0304a18 100644<br>
--- a/hw/char/cadence_uart.c<br>
+++ b/hw/char/cadence_uart.c<br>
@@ -307,11 +307,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, G=
IOCondition cond,<br>
=C2=A0 =C2=A0 =C2=A0/* instant drain the fifo when there&#39;s no back-end =
*/<br>
=C2=A0 =C2=A0 =C2=A0if (!qemu_chr_fe_backend_connected(&amp;s-&gt;chr)) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_count =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!s-&gt;tx_count) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_chr_fe_write(&amp;s-&gt;chr, s-&gt;tx_fifo=
, s-&gt;tx_count);<br>
@@ -326,12 +326,12 @@ static gboolean cadence_uart_xmit(void *do_not_use, G=
IOCondition cond,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ca=
dence_uart_xmit, s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!r) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_count =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0uart_update_status(s);<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *bu=
f,<br>
diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c<br>
index f8dc89ee3d..d466cd93de 100644<br>
--- a/hw/char/cmsdk-apb-uart.c<br>
+++ b/hw/char/cmsdk-apb-uart.c<br>
@@ -199,7 +199,7 @@ static gboolean uart_transmit(void *do_not_use, GIOCond=
ition cond, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;watch_tag =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!(s-&gt;ctrl &amp; R_CTRL_TX_EN_MASK) || !(s-&gt;st=
ate &amp; R_STATE_TXFULL_MASK)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_chr_fe_write(&amp;s-&gt;chr, &amp;s-&gt;tx=
buf, 1);<br>
@@ -215,7 +215,7 @@ static gboolean uart_transmit(void *do_not_use, GIOCond=
ition cond, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Transmit pending */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_cmsdk_apb_uart_tx_pending();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0buffer_drained:<br>
@@ -227,7 +227,7 @@ buffer_drained:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;intstatus |=3D R_INTSTATUS_TX_MASK;=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0cmsdk_apb_uart_update(s);<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0static void uart_cancel_transmit(CMSDKAPBUART *s)<br>
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c<br>
index f70adb5308..51708c0836 100644<br>
--- a/hw/char/ibex_uart.c<br>
+++ b/hw/char/ibex_uart.c<br>
@@ -147,7 +147,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCon=
dition cond,<br>
=C2=A0 =C2=A0 =C2=A0/* instant drain the fifo when there&#39;s no back-end =
*/<br>
=C2=A0 =C2=A0 =C2=A0if (!qemu_chr_fe_backend_connected(&amp;s-&gt;chr)) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_level =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!s-&gt;tx_level) {<br>
@@ -156,7 +156,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCon=
dition cond,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;uart_intr_state |=3D R_INTR_STATE_T=
X_EMPTY_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;uart_intr_state &amp;=3D ~R_INTR_ST=
ATE_TX_WATERMARK_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibex_uart_update_irqs(s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_chr_fe_write(&amp;s-&gt;chr, s-&gt;tx_fifo=
, s-&gt;tx_level);<br>
@@ -171,7 +171,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCon=
dition cond,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ib=
ex_uart_xmit, s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!r) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_level =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -192,7 +192,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCon=
dition cond,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ibex_uart_update_irqs(s);<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0static void uart_write_tx_fifo(IbexUartState *s, const uint8_t *buf,<=
br>
diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c<br>
index 3c6f982de9..dfe2276d71 100644<br>
--- a/hw/char/nrf51_uart.c<br>
+++ b/hw/char/nrf51_uart.c<br>
@@ -93,13 +93,13 @@ static gboolean uart_transmit(void *do_not_use, GIOCond=
ition cond, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto buffer_drained;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0buffer_drained:<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;reg[R_UART_TXDRDY] =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pending_tx_byte =3D false;<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0static void uart_cancel_transmit(NRF51UARTState *s)<br>
diff --git a/hw/char/serial.c b/hw/char/serial.c<br>
index 270e1b1094..f3094f860f 100644<br>
--- a/hw/char/serial.c<br>
+++ b/hw/char/serial.c<br>
@@ -226,7 +226,7 @@ static gboolean serial_watch_cb(void *do_not_use, GIOCo=
ndition cond,<br>
=C2=A0 =C2=A0 =C2=A0SerialState *s =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;watch_tag =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0serial_xmit(s);<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0static void serial_xmit(SerialState *s)<br>
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c<br>
index dd5a02e339..dbe0b28e60 100644<br>
--- a/hw/char/virtio-console.c<br>
+++ b/hw/char/virtio-console.c<br>
@@ -45,7 +45,7 @@ static gboolean chr_write_unblocked(void *do_not_use, GIO=
Condition cond,<br>
<br>
=C2=A0 =C2=A0 =C2=A0vcon-&gt;watch =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0virtio_serial_throttle_port(VIRTIO_SERIAL_PORT(vcon), f=
alse);<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0/* Callback function that&#39;s called when the guest sends us data *=
/<br>
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c<br>
index 39fbaaab16..4bbf8afb33 100644<br>
--- a/hw/usb/redirect.c<br>
+++ b/hw/usb/redirect.c<br>
@@ -278,7 +278,7 @@ static gboolean usbredir_write_unblocked(void *do_not_u=
se, GIOCondition cond,<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;watch =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0usbredirparser_do_write(dev-&gt;parser);<br>
<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0static int usbredir_write(void *priv, uint8_t *data, int count)<br>
diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
index dc352f9e9d..941f87815a 100644<br>
--- a/monitor/monitor.c<br>
+++ b/monitor/monitor.c<br>
@@ -144,7 +144,7 @@ static gboolean monitor_unblocked(void *do_not_use, GIO=
Condition cond,<br>
=C2=A0 =C2=A0 =C2=A0QEMU_LOCK_GUARD(&amp;mon-&gt;mon_lock);<br>
=C2=A0 =C2=A0 =C2=A0mon-&gt;out_watch =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0monitor_flush_locked(mon);<br>
-=C2=A0 =C2=A0 return FALSE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_REMOVE;<br>
=C2=A0}<br>
<br>
=C2=A0/* Caller must hold mon-&gt;mon_lock */<br>
diff --git a/net/vhost-user.c b/net/vhost-user.c<br>
index 5993e4afca..12555518e8 100644<br>
--- a/net/vhost-user.c<br>
+++ b/net/vhost-user.c<br>
@@ -239,7 +239,7 @@ static gboolean net_vhost_user_watch(void *do_not_use, =
GIOCondition cond,<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_disconnect(&amp;s-&gt;chr);<br>
<br>
-=C2=A0 =C2=A0 return TRUE;<br>
+=C2=A0 =C2=A0 return G_SOURCE_CONTINUE;<br>
=C2=A0}<br>
<br>
=C2=A0static void net_vhost_user_event(void *opaque, QEMUChrEvent event);<b=
r>
-- <br>
2.38.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--0000000000009e930c0600203818--

