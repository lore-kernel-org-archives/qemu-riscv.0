Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E231DC7114A
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 19:38:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uQADM-0005CR-B5; Fri, 13 Jun 2025 15:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1uQADC-00059p-Go
 for qemu-riscv@nongnu.org; Fri, 13 Jun 2025 15:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1uQADA-0005NL-OG
 for qemu-riscv@nongnu.org; Fri, 13 Jun 2025 15:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749843428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v6KgViuFjR1WJCP8hMyuFp9zVb8OEl6/pzjbqiT4YPc=;
 b=SmIwrtWVVYxtyR8vuwM64N8osvt5q22UMFLTFGYzKz4XdNjjYOBcVIJKxlp9WdC9Avh4Qh
 FIjAeTKIPbeaAwxhlZIvTM/f9ge/iKzxqRIsn2UrfX9TP5FnNVSZ2VsQ2/wNiLKmf/sXF4
 NQUvbHzNO+giP7rPNCcoJzzh5yPYY50=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-BYI3nMP3MCClILdi1lkQZA-1; Fri, 13 Jun 2025 15:37:05 -0400
X-MC-Unique: BYI3nMP3MCClILdi1lkQZA-1
X-Mimecast-MFC-AGG-ID: BYI3nMP3MCClILdi1lkQZA_1749843424
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso3514255a91.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Jun 2025 12:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749843424; x=1750448224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v6KgViuFjR1WJCP8hMyuFp9zVb8OEl6/pzjbqiT4YPc=;
 b=skvd1pzp13i64M+5cuXAOj5HiQhUS8qDui5W3ICXTDTUhxpe++USSHAbeq9fo/+hG1
 Zg3m4Vqv3b3voXBZ+/y/cF3s2bt6833aqUm40TGPRpEbCn+CUXfzSONSHoLUTNhL6dHr
 JhjUaonSCFyqOeVPtDgw2tjYamF5DnJdSa2uTm2Nzrp+QoL0WUrRnznqvLJuxdcCHAc7
 GskHj+PX9clW0cqH5Gc875lWRJXia2K9UJwqKDY5V8creENX4ik2G/GlWmPvEDv+sCgP
 TU0dIDgjraQ2V6OMLTrPvIc6EZ7/Dh6m1aX2fXnoqzwm8LO1fJmH8chJoOUTYfWQKYBd
 WrvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsng8NlqgGfNyUhcx8cB6GRbRGaPLk5hZ3jF51HPYmTYoSJUIYlYBAWMMCasTYU6yDFYxbEZt6elGK@nongnu.org
X-Gm-Message-State: AOJu0YwqqnxPHARNnPfLwd7/ayI1AcyFVrzZhkrT/z3fIrGVlYz7pT/D
 IvdTbPjTD21jjZ8HHZsRCI00GknT/4LX9ZyjzVcIIqG/xEz9+OYgo8F6+yo0AVxBBKBmgtKeRJE
 pyQ4/GZzkPI74D6KotawEnIYNlrC3AuHIuQWlIWqrI0KlEASX2hZK/L5aoCRbdH0WYHOqxeLmwL
 E8QPyKL9J/c8I4UyF781FENDYvYMSRELU=
X-Gm-Gg: ASbGncvK4tuImpepfZY+zM9AMcrfRhNn7cstKSy66BB2I6agQNzCuW8rtj+ggw/V0X1
 lSK2LLYxV5HXT4K7nv7CYWnmOi7wRUecrH1GE5ARbFQ3T4ya9Z2jVdz7LARMAg9Sciq6941mW25
 Ttz6pXWthR7jPSPa1SnnZYsSIG3swroYuGqUg=
X-Received: by 2002:a17:90b:38d1:b0:313:d79e:1f48 with SMTP id
 98e67ed59e1d1-313f1cd5fd7mr1412203a91.16.1749843424224; 
 Fri, 13 Jun 2025 12:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhf1HqKLp320naz0KUatZcE9BnzmY7beSDDUcZNuUCQOKgLCaWfg8YHgA6yJFkz4svRxh8Tde5oKAfHRznHds=
X-Received: by 2002:a17:90b:38d1:b0:313:d79e:1f48 with SMTP id
 98e67ed59e1d1-313f1cd5fd7mr1412109a91.16.1749843423695; Fri, 13 Jun 2025
 12:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250612205451.1177751-1-jsnow@redhat.com>
 <20250612205451.1177751-2-jsnow@redhat.com>
 <7e66e758-da47-47eb-9114-22f07e1ffdc9@redhat.com>
In-Reply-To: <7e66e758-da47-47eb-9114-22f07e1ffdc9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 Jun 2025 15:36:51 -0400
X-Gm-Features: AX0GCFuiAeQBZnODkOUFiBBQ0SwoPYSj3-6O0mDgbYSey7x4h5zk9dtghUBJoLg
Message-ID: <CAFn=p-aZz51W14-v4jd2J6wXqzO6ZKvo8L5ckhA=RGsWE9D1UA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] python: convert packages to PEP517/pyproject.toml
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Yi Liu <yi.l.liu@intel.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Fabiano Rosas <farosas@suse.de>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Warner Losh <imp@bsdimp.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Eric Blake <eblake@redhat.com>,
 Troy Lee <leetroy@gmail.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Roth <michael.roth@amd.com>, 
 Laurent Vivier <laurent@vivier.eu>, Ani Sinha <anisinha@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Eric Farman <farman@linux.ibm.com>, Steven Lee <steven_lee@aspeedtech.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 Maksim Davydov <davydov-max@yandex-team.ru>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Mads Ynddal <mads@ynddal.dk>, 
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Alessandro Di Federico <ale@rev.ng>, Antony Pavlov <antonynpavlov@gmail.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-rust@nongnu.org, Bandan Das <bsd@redhat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 kvm@vger.kernel.org, Fam Zheng <fam@euphon.net>, Jia Liu <proljc@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Kyle Evans <kevans@freebsd.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>, 
 qemu-ppc@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, David Hildenbrand <david@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Ahmed Karaman <ahmedkhaledkaraman@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5e0gIvBValcXXA0fHVPDWcl0F_Vqd_rDOatsf_CtRNg_1749843424
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000aeb5fa0637792b4e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000aeb5fa0637792b4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 4:36=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:

> On 12/06/2025 22.54, John Snow wrote:
> > Newer versions of setuptools increasingly expect that packages are
> > defined using the pyproject.toml/PEP517 packaging layout format. With
> > 3.9 as our minimum, I believe it's finally appropriate to make the shif=
t
> > away from the legacy packaging format.
> >
> > Update documentation and dependencies that change as a result of the
> > different build/packaging/installation pathways.
> >
> > This change has the effect of fixing "make check-dev", which has been
> > broken on newer versions of Fedora for a while, now.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/README.rst        | 33 ++++++++++++++++-----------------
> >   python/Makefile          | 18 +++++++++---------
> >   python/pyproject.toml    | 10 ++++++++++
> >   python/setup.py          | 40 ---------------------------------------=
-
> >   python/tests/minreqs.txt |  2 +-
> >   5 files changed, 36 insertions(+), 67 deletions(-)
> >   create mode 100644 python/pyproject.toml
> >   delete mode 100755 python/setup.py
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>


Thanks. If there are no objections, I might stage at least the first few
reviewed patches here so I can get this stitched up sooner than later. The
more disruptive parts I might wait a touch longer on.

--000000000000aeb5fa0637792b4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 13,=
 2025 at 4:36=E2=80=AFAM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com=
">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 12/06/2025 22.54, John Snow wrote:<br>
&gt; Newer versions of setuptools increasingly expect that packages are<br>
&gt; defined using the pyproject.toml/PEP517 packaging layout format. With<=
br>
&gt; 3.9 as our minimum, I believe it&#39;s finally appropriate to make the=
 shift<br>
&gt; away from the legacy packaging format.<br>
&gt; <br>
&gt; Update documentation and dependencies that change as a result of the<b=
r>
&gt; different build/packaging/installation pathways.<br>
&gt; <br>
&gt; This change has the effect of fixing &quot;make check-dev&quot;, which=
 has been<br>
&gt; broken on newer versions of Fedora for a while, now.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 33 ++++++++=
++++++++-----------------<br>
&gt;=C2=A0 =C2=A0python/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++=
++++++---------<br>
&gt;=C2=A0 =C2=A0python/pyproject.toml=C2=A0 =C2=A0 | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0python/setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 ---=
-------------------------------------<br>
&gt;=C2=A0 =C2=A0python/tests/minreqs.txt |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A05 files changed, 36 insertions(+), 67 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/pyproject.toml<br>
&gt;=C2=A0 =C2=A0delete mode 100755 python/setup.py<br>
<br>
Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"=
_blank">thuth@redhat.com</a>&gt;</blockquote><div><br></div><div>Thanks. If=
 there are no objections, I might stage at least the first few reviewed pat=
ches here so I can get this stitched up sooner than later. The more disrupt=
ive parts I might wait a touch longer on. <br></div></div></div>

--000000000000aeb5fa0637792b4e--


