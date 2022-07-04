Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8Op1-0002pE-5l
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 12:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Ooz-0002gm-Ed
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 12:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Oow-0003PI-U3
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 12:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656951670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNG6EvBYvsu+Vu3UGBZ3dhBxzLsoA2k3lqqk942lSJw=;
 b=SqwXe816WqUjmmwOpsIcUdU0LkNM5MrnrXVozJXtF7m2TJfwE+DtbVL2/8JB4Gf2FUH5S6
 HkUA5PxHx1nvmVjpvAGd/vBvZbt2oIw7/pxhDHFPcrZUZEC9gPEVLZtWWbMzCgmJoSVZ1E
 qcgTluAuPiFnPqzZGUBpAF30GY+CK6I=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-5cdsB9vxNJ2auzJMmINZKg-1; Mon, 04 Jul 2022 12:21:01 -0400
X-MC-Unique: 5cdsB9vxNJ2auzJMmINZKg-1
Received: by mail-il1-f198.google.com with SMTP id
 j17-20020a056e02219100b002d955e89a54so4432121ila.11
 for <qemu-riscv@nongnu.org>; Mon, 04 Jul 2022 09:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dNG6EvBYvsu+Vu3UGBZ3dhBxzLsoA2k3lqqk942lSJw=;
 b=pHJXnz03DMr/c1RuQX0tVWFjRe4BD0bGdslf5PyfJCoRrEFt9SkBi2pXc0lTkE2RE5
 qlNBl00SoNNEgmO8bacF54742cXPH0WkZGDy5TzzI1SZEnu9+G/nMQIF10iDkc2xmJ1X
 P+nL+3x08NWBHMZPSodgAf6TCDctvAPEwXKynf305JpIXwtudmIfSyq1rjhYqod992J0
 OBi1XdfFy30OigRafnjcV7UGxkxGTNRiilrBnT81f+j9+b+qjEbfpJbYQmS8eZlPJiTb
 c4oXFfH5gMo5WjXBf5H0W6NjTJUxSb/bs3wUiqobmqhZL3k4IRQfHTF4v/io1B/mfwcC
 RJtw==
X-Gm-Message-State: AJIora9Vw1tGZdeAcMi3KmS0QuQU+2ADqzmF41Z8mFW5ayscDXRZmQKt
 K4cbJuKjtuoRfPIeC+njx8IXgbohEVf4CoiUiuat1q17u5NKgRpE785B1N75QZdf9owu5qTqWAB
 1FqT7kiyPq1WmGUcbw8foq4wMZ75G+S4=
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr17833808ild.16.1656951661128; 
 Mon, 04 Jul 2022 09:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/+bFwP3NFLxCXEhXCB9tGBdMIf2+KPtL97PvzmTJwGF+P76N8wQkbecn53EgjuYLUeu309AQtlsK38/P5zxw=
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr17833776ild.16.1656951660874; Mon, 04
 Jul 2022 09:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-2-afaria@redhat.com>
 <89089143-3f55-02c4-c881-95d356108569@redhat.com>
In-Reply-To: <89089143-3f55-02c4-c881-95d356108569@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 17:20:25 +0100
Message-ID: <CAELaAXydmSu5EvAnbvVUcHW9dv2EN8p-DvEuyufQzhrO_V4AMg@mail.gmail.com>
Subject: Re: [PATCH 01/18] block: Make blk_{pread,
 pwrite}() return 0 on success
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Denis V. Lunev" <den@openvz.org>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afaria@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 04 Jul 2022 16:21:13 -0000

On Mon, Jul 4, 2022 at 2:52 PM Hanna Reitz <hreitz@redhat.com> wrote:
> There are a couple of places where you decided to replace =E2=80=9C*len=
=E2=80=9D
> variables that used to store the return value by a plain =E2=80=9Cret=E2=
=80=9D. That
> seems good to me, given how these functions no longer return length
> values, but you haven=E2=80=99t done so consistently.  Below, I have note=
d
> places where this wasn=E2=80=99t done; I wonder why, but my R-b stands
> regardless of whether you change them too or not.

Thanks, this was just an oversight on my part. I'll fix it.

> > diff --git a/qemu-img.c b/qemu-img.c
> > index 4cf4d2423d..9d98ef63ac 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -5120,30 +5120,27 @@ static int img_dd(int argc, char **argv)
> >       in.buf =3D g_new(uint8_t, in.bsz);
> >
> >       for (out_pos =3D 0; in_pos < size; block_count++) {
> > -        int in_ret, out_ret;
> > +        int bytes, in_ret, out_ret;
> >
> > -        if (in_pos + in.bsz > size) {
> > -            in_ret =3D blk_pread(blk1, in_pos, in.buf, size - in_pos);
> > -        } else {
> > -            in_ret =3D blk_pread(blk1, in_pos, in.buf, in.bsz);
> > -        }
> > +        bytes =3D (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
> > +
> > +        in_ret =3D blk_pread(blk1, in_pos, in.buf, bytes);
> >           if (in_ret < 0) {
> >               error_report("error while reading from input image file: =
%s",
> >                            strerror(-in_ret));
> >               ret =3D -1;
> >               goto out;
> >           }
> > -        in_pos +=3D in_ret;
> > -
> > -        out_ret =3D blk_pwrite(blk2, out_pos, in.buf, in_ret, 0);
> > +        in_pos +=3D bytes;
> >
> > +        out_ret =3D blk_pwrite(blk2, out_pos, in.buf, bytes, 0);
> >           if (out_ret < 0) {
> >               error_report("error while writing to output image file: %=
s",
> >                            strerror(-out_ret));
> >               ret =3D -1;
> >               goto out;
> >           }
> > -        out_pos +=3D out_ret;
> > +        out_pos +=3D bytes;
> >       }
> >
> >   out:
>
> We could use this opportunity to drop in_ret and out_ret altogether (but
> we can also decide not to).

Dropping them sounds good to me.

Alberto


