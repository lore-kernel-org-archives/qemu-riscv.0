Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B32ECCD1A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 13:36:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBCVi-0005Oj-Qs; Tue, 21 Oct 2025 09:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1vBCVX-0005MU-9Q
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 09:34:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1vBCV3-0003nQ-2Q
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 09:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761053434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8G6fSfFVaONhcxA1DHI9VcxajpmfGw7mPN/aSeM7JQ=;
 b=TNmu0DTlvL778nnZni5kfWR02bqdOtBWdoGZJo2C+cg1tI+IqNTq3mpx5TU3hhA4y5I6iq
 AXdrtEtMmRXOLc+KLN8aZJ3MZae+gbEJ4c6nxnrqt3jhbmZe5rXCNg16nKsh1EJPi50rlQ
 fZmu5JBACe3z8ik9rtsTCx2b/BuauIU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-Gi7hUbNsMWu40WD9GTtQQg-1; Tue, 21 Oct 2025 09:30:31 -0400
X-MC-Unique: Gi7hUbNsMWu40WD9GTtQQg-1
X-Mimecast-MFC-AGG-ID: Gi7hUbNsMWu40WD9GTtQQg_1761053431
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32edda89a37so4965522a91.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 06:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761053430; x=1761658230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q8G6fSfFVaONhcxA1DHI9VcxajpmfGw7mPN/aSeM7JQ=;
 b=JWFuFSvsBkVW+hJGO9GjRW6lLnL1yhe/pdgN28aOVtjhAdpecx3jZCIa1UdRJ9vT/I
 R5cbl9320l5jZcrhvwBm8wjuhTvhhkA78LFBKxhHBcQ+RLFAh8jEjIeD9Obce446ehd4
 BmeLZfVLTMASz2QfZYFAxDhuJ5yfzMjcJNIj8itQSQN44kDLYpqM1vlGL9/SBYZeO5rZ
 w6J1KC0exnUVsJ5vJYtbNZux3oJzr5b7fRi3opSmkfAmgMPB0R61lmhllIfGLE6TtzPF
 S/CjXNC420YDM7ctjmuuqsTjHfkirD9LRl3Bg5Gg6J5dWxeHhokQ/k9plKKkIBuTxeoq
 SsIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxZG59f6LtR4uVDw/E344QbM7ilhGt3mZcPoO9y6BAdD8uVCN69lJ67p6cPWcpRp1uka5Al6K1tDyv@nongnu.org
X-Gm-Message-State: AOJu0YzahayHmYl1WOwaO83ZxIXuFMzuemcKst7JLYXJTkMfgUbv87TI
 rs9i2vDtRFXE4Kli4lGzvRevbfiV7i0yBo/zhi9JqW1xVW45/Y0VqAFideHmHae66xHPlir12bR
 MMGJ3b/d6JW64rdJWZbOdETk7mRkFeqqRZq2JgHgjfNRxLE0rDpOsKybqeRSPvSz69y2jZxTaoZ
 Qim6l3EA5lgJtSjjKxYOPr6mLNXkAN8T0=
X-Gm-Gg: ASbGnctPfNKtDBtH/hzXS8JLgxSm9eU++m9byaXSn7T4O3IS4erSG3zMZYkogUTeg/q
 cdxH749GoLoHvxR/qxFQI2nhUbeJf1IEDlLFtWlZs7p5tl7POTC8j0VyeZ1ejWlmwqsnrcM+XlY
 cgEDFbvaU5/isrnkxYzvrAyY4fJo5SXIsE5oNPULMsaE2PDP4vDdchEgbZt+ECsdBm9Hv8121M7
 En17x456ZZC4d0=
X-Received: by 2002:a17:90b:3ec6:b0:339:ef05:3575 with SMTP id
 98e67ed59e1d1-33bcf8f94c3mr25685578a91.26.1761053430046; 
 Tue, 21 Oct 2025 06:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrcrzdwZmuF2cCRqH2vToyJMLy2bHoJ+Kx9jzECaxXzAzohnouc6v8JutWnCy0AcLWb81s8PtUoo7SVr1fd6U=
X-Received: by 2002:a17:90b:3ec6:b0:339:ef05:3575 with SMTP id
 98e67ed59e1d1-33bcf8f94c3mr25685486a91.26.1761053429385; Tue, 21 Oct 2025
 06:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
 <01a51fe7-4414-e787-ddf5-5ede0c1e1e74@eik.bme.hu>
In-Reply-To: <01a51fe7-4414-e787-ddf5-5ede0c1e1e74@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Oct 2025 17:30:18 +0400
X-Gm-Features: AS18NWC-i6fdjk32NEoXZbM96aNPF-p1sZDoFKybRPcKVdB4OOANWfiaSgrGQ2I
Message-ID: <CAMxuvaz8GueSp-vPHFWnbv+Odcy63Cz_hZHd3NzReWXp3pnsqg@mail.gmail.com>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Alberto Garcia <berto@igalia.com>, 
 Thomas Huth <huth@tuxfamily.org>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, 
 Yoshinori Sato <yoshinori.sato@nifty.com>, Magnus Damm <magnus.damm@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>, 
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 Raphael Norwitz <raphael@enfabrica.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Zhang Chen <zhangckid@gmail.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>, 
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _JiLeU0-M6mO0z3lV-Cc3vGE4H3be26yYSUwzrVfdsI_1761053431
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000016e15b0641ab341a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000016e15b0641ab341a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Oct 21, 2025 at 5:25=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:

> On Tue, 21 Oct 2025, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > /**
> > - * struct CharBackend - back end as seen by front end
> > + * struct CharFrontend - back end as seen by front end
>
> I stopped here, haven't read the rest of the patch but the above comment
> seems to become inconsistent. Which is the front end and back end now?
>
>
It's the "frontend side" of a chardev "backend". Naming it CharBackend has
always been the source of confusion, since the actual backend is Chardev.
There was earlier attempt to rename it and various complains. I believe
this is is long overdue.

--00000000000016e15b0641ab341a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 21, 2=
025 at 5:25=E2=80=AFPM BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme=
.hu">balaton@eik.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, 21 Oct 2025, <a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br=
>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>&gt;<br>
&gt; /**<br>
&gt; - * struct CharBackend - back end as seen by front end<br>
&gt; + * struct CharFrontend - back end as seen by front end<br>
<br>
I stopped here, haven&#39;t read the rest of the patch but the above commen=
t <br>
seems to become inconsistent. Which is the front end and back end now?<br><=
br></blockquote><div><br></div><div>It&#39;s the &quot;frontend side&quot; =
of a chardev &quot;backend&quot;. Naming it CharBackend has always been the=
 source of confusion, since the actual backend is Chardev. There was earlie=
r attempt to rename it and various complains. I believe this is is long ove=
rdue.</div></div></div>

--00000000000016e15b0641ab341a--


