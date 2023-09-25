Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C621CE7AA5
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:07:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkp2i-0000HO-PL; Mon, 25 Sep 2023 13:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qkp2g-0000Gt-R6
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qkp2R-0001XR-Da
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695661586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LDm5R4GeSOdbeUEoV9jGBuX5oNous+Ah519BTpIljNM=;
 b=VbD/1Z6cG4D6BHRgEpVuwYAggEh/tx88xIalE//RCsJrrDi2KypmEp4z4Wn2ACVR3gNvwi
 +WtJ9fZ6zaEQ3uZ+yRTMTd+WoekmXjDVaL8x11dT3bQ8ssvCusYgHaCuZV0haKcWqK+/ai
 XOuh9v6zJL3D8sIRmOS2U9ye11IahpA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-s5CLDm4PM9ekLJLBOaqx8g-1; Mon, 25 Sep 2023 13:06:24 -0400
X-MC-Unique: s5CLDm4PM9ekLJLBOaqx8g-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-7a88fdb90a4so1927937241.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695661584; x=1696266384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDm5R4GeSOdbeUEoV9jGBuX5oNous+Ah519BTpIljNM=;
 b=uvKSlJZ/QDcPIP1bWCK5FJhLzY4Xun4fbTf7YULof6zFaznjsQHy30eVLkkoCt5KQT
 0M1y42t1zcPYROFao/CW4HIWspvY3LVsOBEhG+Vuc8YSAGr3Z11AmyRabDuSp7bPQnoq
 98s+QAioil+AzEa5cCxcYrlmA4T5nlDJZVUJKjPx/x0mT4ai/WbhRp0dUEpKR4LJ9hFd
 R7iGCb38dW40rSau4YCDKKsQPbigmeJToWO3rKeXFZzJGjKL+UKIiUV7lmFXrujcGQ+W
 urdeEwcewvJn0c1y9AoXQ5m40puX56CdMaKEF5SCAIBW+cdUWit3MaTJDhSBVKXEzn/I
 3qtQ==
X-Gm-Message-State: AOJu0Yx5li6pSy3KGxOP+S3YA+pvYxf6n8onOQ7nLnlDzJbnBqQUmKYu
 0iUOBucVKr2LMIpe2JVAXdsLs1cSqGJhKJuIrlayT+G3CjWHP6+0JN29YVAM3nsaitSh1m33PEV
 mc5v5RXrg87TRp2rrlvUr3xA+OJ03aTE=
X-Received: by 2002:a05:6102:383:b0:452:94b8:2fe9 with SMTP id
 m3-20020a056102038300b0045294b82fe9mr3108860vsq.21.1695661583879; 
 Mon, 25 Sep 2023 10:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJDDAGcT6Jkw67XLdrGAxNzSQtErAjQpBKap9csvjVYdlThOEmF0zoz3hUbdTrsxwbiCMG7N4cnX9Yvy1GKp4=
X-Received: by 2002:a05:6102:383:b0:452:94b8:2fe9 with SMTP id
 m3-20020a056102038300b0045294b82fe9mr3108839vsq.21.1695661583616; Mon, 25 Sep
 2023 10:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org>
 <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
 <87cyy6rylx.fsf@linaro.org>
In-Reply-To: <87cyy6rylx.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Sep 2023 19:06:11 +0200
Message-ID: <CABgObfYHRCoNCPW5QpydfttBMBXW7tvZo5PuQ5FYTGoVt9eorw@mail.gmail.com>
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile setup
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list <libvir-list@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-s390x <qemu-s390x@nongnu.org>, Song Gao <gaosong@loongson.cn>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 "zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>,
 David Hildenbrand <david@redhat.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000059e3a7060631fa97"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--00000000000059e3a7060631fa97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 25 set 2023, 18:45 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
> > On 9/25/23 16:48, Alex Benn=C3=A9e wrote:
> >>             echo "HOST_GDB_SUPPORTS_ARCH=3Dy" >> "$config_target_mak"
> >>         fi
> >>   +      echo "$config_target_mak: configure" >> Makefile.prereqs
> >
> > This in practice is not adding anything; if "configure" changes then
> > Makefile's dependency on config-host.mak will trigger a configure
> > rerun anyway.
> >
> > If you want to add it, you should also add it for other config-*.mak
> > files.  However, I'd remove this line and just change
> >
> > -# 1. ensure config-host.mak is up-to-date
> > +# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
> > +# files for subdirectories will be updated as well.
>
> Peter ran into a mismatch between config-host.mak and
> tests/tcg/foo/config-target.mak in his build system so it didn't get
> picked up at one point.
>

But what is the rule that the new dependency is going to trigger? As far as
I can see there is no rule to regenerate the $config_target_mak files, and
also no rule to regenerate configure; the only effect of a change to
configure will be rerunning the script, but that's triggered by the
existing config-host.mak rule.

Paolo


> >
> > in the Makefile.
> >
> > Paolo
>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>
>

--00000000000059e3a7060631fa97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 25 set 2023, 18:45 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Paolo Bonzini &lt;<a href=3D"mai=
lto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redh=
at.com</a>&gt; writes:<br>&gt; On 9/25/23 16:48, Alex Benn=C3=A9e wrote:<br=
>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;HOST_GD=
B_SUPPORTS_ARCH=3Dy&quot; &gt;&gt; &quot;$config_target_mak&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 echo &quot;$config_target_mak: c=
onfigure&quot; &gt;&gt; Makefile.prereqs<br>
&gt;<br>
&gt; This in practice is not adding anything; if &quot;configure&quot; chan=
ges then<br>
&gt; Makefile&#39;s dependency on config-host.mak will trigger a configure<=
br>
&gt; rerun anyway.<br>
&gt;<br>
&gt; If you want to add it, you should also add it for other config-*.mak<b=
r>
&gt; files.=C2=A0 However, I&#39;d remove this line and just change<br>
&gt;<br>
&gt; -# 1. ensure config-host.mak is up-to-date<br>
&gt; +# 1. ensure config-host.mak is up-to-date.=C2=A0 All other config-*.m=
ak<br>
&gt; +# files for subdirectories will be updated as well.<br>
<br>
Peter ran into a mismatch between config-host.mak and<br>
tests/tcg/foo/config-target.mak in his build system so it didn&#39;t get<br=
>
picked up at one point.<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">But what is the rule that the new dependency is goin=
g to trigger? As far as I can see there is no rule to regenerate the $confi=
g_target_mak files, and also no rule to regenerate configure; the only effe=
ct of a change to configure will be rerunning the script, but that&#39;s tr=
iggered by the existing config-host.mak rule.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;<br>
&gt; in the Makefile.<br>
&gt;<br>
&gt; Paolo<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
<br>
</blockquote></div></div></div>

--00000000000059e3a7060631fa97--


