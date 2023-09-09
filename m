Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBBEEEB57F
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 07:19:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qesEv-0000fd-Pl; Sat, 09 Sep 2023 03:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qesEe-0000dy-Hm
 for qemu-riscv@nongnu.org; Sat, 09 Sep 2023 03:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qesEV-0003Ap-HH
 for qemu-riscv@nongnu.org; Sat, 09 Sep 2023 03:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694243898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAvgtyv/sTqakl8Ns2rRNwy+i9Zch4V4puqiXJ+E2E0=;
 b=EN3mF5qdgdEv8KK9BjztY33otiUbfrc3kF+ydIScQqNmUHsxy8OpTNPmA0P0pmfKBmo3Ak
 eeKrHlcgs6sJ5ey9oeG/M+C+CK2oO/lxk71aIejB+78YH99UkkTjTfIAtLmHuGh9qWdFVb
 ToQSdZuRtFml/AOy0haNTNSQ+RbvZRI=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-iCnyhMA5Ok-FTGg3c3fZmg-1; Sat, 09 Sep 2023 03:18:16 -0400
X-MC-Unique: iCnyhMA5Ok-FTGg3c3fZmg-1
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-7a4dcc18886so993870241.2
 for <qemu-riscv@nongnu.org>; Sat, 09 Sep 2023 00:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694243896; x=1694848696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAvgtyv/sTqakl8Ns2rRNwy+i9Zch4V4puqiXJ+E2E0=;
 b=agunSdefl/I5kODtA0FTurWD0sKjLGa7flhUOj/XGgXEOKJJBcVyGyRvUqjshS2Haw
 nTdW0v24bl1t8BStqShpGavWuVP8RXmD+EuWbDd6qy/T6pUGVp/ZVUyXgH1h7hBLVYsJ
 tX6os41OLvm/zaXNFeXaMJFngUoUukxu134vzx1wzWaQ4u2ODnKUEyTOdTGv54GYU0Qj
 dQ5P3HaX16bNxczYhK7vNPwFeIns4bCSTKrwRggD6L815/dVulp8S99PYdUDsverzw0f
 +rzODjJg8mFwe8Sc+YKw6rD9q/l+0QetuIWqJgp+OVM+ozGCfYIHYIwkRRWsnceRiPwf
 v+rA==
X-Gm-Message-State: AOJu0YyHr2jqjKbHg4UBXM8pHyxFf3qNWq7D3e9Hr8a6NZhhJqfJCECS
 YgQNDvanPURrj/dLO5RPIN4gvXHcAfTCMPOD0KM7PXofZr9s777fpzHXJYWM3KYH2Vi3Z8AUZoz
 1oIZD2tQqyvG6NPY/vthhfPcpBm3M6K0=
X-Received: by 2002:a67:f94d:0:b0:44e:a348:9e55 with SMTP id
 u13-20020a67f94d000000b0044ea3489e55mr4134728vsq.17.1694243895825; 
 Sat, 09 Sep 2023 00:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIaW7XhvpskRgoAKC+627qvwZpFi/Kyj6MHfXstBaoEet0xz/L1I9VVHvVOa0nJhK4uWR53Wt3wB3MK7GYdM0=
X-Received: by 2002:a67:f94d:0:b0:44e:a348:9e55 with SMTP id
 u13-20020a67f94d000000b0044ea3489e55mr4134724vsq.17.1694243895566; Sat, 09
 Sep 2023 00:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230908033129.694-1-zhiwei._5Fliu@linux.alibaba.com>
 <20230908102912.535248-1-pbonzini@redhat.com>
 <CAOnJCUJexy3PhmGnGNgOk3a5LWLw6ZvFkwYRXTCErGnhn_A9uA@mail.gmail.com>
In-Reply-To: <CAOnJCUJexy3PhmGnGNgOk3a5LWLw6ZvFkwYRXTCErGnhn_A9uA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 9 Sep 2023 09:18:02 +0200
Message-ID: <CABgObfa9EehjW=p3mA-qiC8_tmkoYCT4SwF5Vtf+710OvSEw3g@mail.gmail.com>
Subject: Re: [RESEND] qemu/timer: Add host ticks function for RISC-V
To: Atish Patra <atishp@atishpatra.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 LIU Zhiwei <lzw194868@alibaba-inc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008efb250604e7e5d5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--0000000000008efb250604e7e5d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il sab 9 set 2023, 03:35 Atish Patra <atishp@atishpatra.org> ha scritto:

> On Fri, Sep 8, 2023 at 3:29=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> >
> > Queued, thanks.
> >
>
> I didn't realize it was already queued. Gmail threads failed me this time=
.
> @Paolo Bonzini : Can you please drop this one as this will break as
> soon as the host riscv system
> has the latest kernel ? I have provided more details in the original
> thread.
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01941.html


If you have dynamic clock adjustment, does rdcycle increase with a fixed
frequency or does it provide the raw number of clock cycles? If the latter,
I agree that it should be provided by perf; but if the frequency is fixed
then it would be the same as rdtsc on Intel.

Paolo


>
> > Paolo
> >
> >
>
>
> --
> Regards,
> Atish
>
>

--0000000000008efb250604e7e5d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 9 set 2023, 03:35 Atish Patra &lt;<a href=3D"ma=
ilto:atishp@atishpatra.org">atishp@atishpatra.org</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Fri, Sep 8, 2023 at 3:29=E2=80=AFAM P=
aolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" r=
el=3D"noreferrer">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Queued, thanks.<br>
&gt;<br>
<br>
I didn&#39;t realize it was already queued. Gmail threads failed me this ti=
me.<br>
@Paolo Bonzini : Can you please drop this one as this will break as<br>
soon as the host riscv system<br>
has the latest kernel ? I have provided more details in the original thread=
.<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01941.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu.org/=
archive/html/qemu-devel/2023-09/msg01941.html</a></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">If you have dynamic clock adju=
stment, does rdcycle increase with a fixed frequency or does it provide the=
 raw number of clock cycles? If the latter, I agree that it should be provi=
ded by perf; but if the frequency is fixed then it would be the same as rdt=
sc on Intel.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
<br>
&gt; Paolo<br>
&gt;<br>
&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Atish<br>
<br>
</blockquote></div></div></div>

--0000000000008efb250604e7e5d5--


