Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nURiT-00052r-2V
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 07:21:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nURiQ-0004vM-Ou
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 07:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nURiN-000612-1s
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 07:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647429670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/TL583DEkbDyjI2lISe6tf0W0oZtMhVFkrT7h414pGk=;
 b=BYnNWJeX/FV4n5wD8ceq6ffq/z5Lj20WupZIORYAICtCFWXQ7Y5EOFzz29wEJ7TXSjXoHf
 ojft9y638Rebtlr3Y9KHhshDbIC3L+PWp7Bi6X/jbmvRP1XfJQB86sy6yrNqF5NcKlL+yg
 WhzVbq6YGYx1kqY/9+xHO5dQlfH52IE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-i-13knyVMR62--s46Xjj2w-1; Wed, 16 Mar 2022 07:21:09 -0400
X-MC-Unique: i-13knyVMR62--s46Xjj2w-1
Received: by mail-yb1-f198.google.com with SMTP id
 b12-20020a056902030c00b0061d720e274aso1697223ybs.20
 for <qemu-riscv@nongnu.org>; Wed, 16 Mar 2022 04:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/TL583DEkbDyjI2lISe6tf0W0oZtMhVFkrT7h414pGk=;
 b=w+15g4yaDHolgWJVZEOve01oxId6tj4lZu9sLEj2QsPKmq6S2CLbkyQioNHgor0aEv
 SP+v2jxN35YFzi3AYvaVOHSdDeqCbVbOUrUDGchS2jsdYUvH3Nf+7Y+fE7YLCFM3oCWR
 a7XKDNVz0TS5OyYH7RX1N4v1HSV4rNDNor1nw2VM5B9klz9Hkgt1WxN5RGpA7y9Lh9QG
 A/9yQCD4Bg1jCFIq1vU0u0Tz7/n1WwAd7HUA7YDkRwFG7tiD2LQ4YlDCZRwvi5B/AukY
 c48hPRaetquq0Dchj6BVuFqzcV9N+ZznY8pXX5x3A3KpPK+8UX39nc2sbP8jINbNTF59
 h1bw==
X-Gm-Message-State: AOAM532mHSahGREWJaLkE+z68V26mHrwlsnXPgEi8SnXsRQJ2aY7DCd7
 L2yfmn/fZlDuzROUsSCxxQC5jdxOFJOJhp4zZDuBhWv8JKZv4L4T+3yNEnHFBypax1BVZYeXo61
 OYk6tJr48903Ezq3Ox0mVfAtdh8XNCuU=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr29007706ywb.312.1647429669294; 
 Wed, 16 Mar 2022 04:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysU1nQ1vExu2W7Wpq+SqXhNmkXldO9veWJlMB2rGlBq+e+M8MHMrYczbsW9bkpOSaf+yfhZ8+NOLyVtGvuMg4=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr29007686ywb.312.1647429669039; Wed, 16
 Mar 2022 04:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com>
 <20220316121535.16631f9c.pasic@linux.ibm.com>
In-Reply-To: <20220316121535.16631f9c.pasic@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 15:20:58 +0400
Message-ID: <CAMxuvayNSQxv_fkSE9z1acMk-D3bC+rxyh9q9CLzsDqyADHvNw@mail.gmail.com>
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, 
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, 
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Coiby Xu <Coiby.Xu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Mar 2022 11:21:19 -0000

Hi

On Wed, Mar 16, 2022 at 3:16 PM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> On Wed, 16 Mar 2022 11:28:59 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>
> > On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Replace a config-time define with a compile time condition
> > > define (compatible with clang and gcc) that must be declared prior to
> > > its usage. This avoids having a global configure time define, but als=
o
> > > prevents from bad usage, if the config header wasn't included before.
> > >
> > > This can help to make some code independent from qemu too.
> > >
> > > gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > [...]
> > > @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
> > >    * a compile-time constant if you pass in a constant.  So this can =
be
> > >    * used to initialize static variables.
> > >    */
> > > -#if defined(HOST_WORDS_BIGENDIAN)
> > > +#if HOST_BIG_ENDIAN
> > >   # define const_le32(_x)                          \
> > >       ((((_x) & 0x000000ffU) << 24) |              \
> > >        (((_x) & 0x0000ff00U) <<  8) |              \
> > > @@ -211,7 +211,7 @@ typedef union {
> > >
> > >   typedef union {
> > >       float64 d;
> > > -#if defined(HOST_WORDS_BIGENDIAN)
> > > +#if HOST_BIG_ENDIAN
> > >       struct {
> > >           uint32_t upper;
> > >           uint32_t lower;
> > > @@ -235,7 +235,7 @@ typedef union {
> > >
> > >   typedef union {
> > >       float128 q;
> > > -#if defined(HOST_WORDS_BIGENDIAN)
> > > +#if HOST_BIG_ENDIAN
> > >       struct {
> > >           uint32_t upmost;
> > >           uint32_t upper;
> > > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > > index 0a5e67fb970e..7fdd88adb368 100644
> > > --- a/include/qemu/compiler.h
> > > +++ b/include/qemu/compiler.h
> > > @@ -7,6 +7,8 @@
> > >   #ifndef COMPILER_H
> > >   #define COMPILER_H
> > >
> > > +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__)
> >
> > Why don't you do it this way instead:
> >
> > #if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> > #define HOST_WORDS_BIGENDIAN 1
> > #endif
> >
> > ... that way you could avoid the churn in all the other files?
> >
>
> I guess "prevents from bad usage, if the config header wasn't included
> before" from the commit message is the answer to that question. I agree
> that it is more robust. If we keep the #if defined we really can't
> differentiate between "not defined because not big-endian" and "not
> defined because the appropriate header was not included."

That's right, thanks


