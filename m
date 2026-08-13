Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C4C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 02:00:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuKjl-0003Wx-9e; Wed, 12 Aug 2026 22:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wuKjj-0003Vw-0N
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 22:00:03 -0400
Received: from mail-lr2-x0b.google.com ([2a00:1450:4864:38::b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wuKjg-0001wO-WF
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 22:00:02 -0400
Received: by mail-lr2-x0b.google.com with SMTP id
 38308e7fff4ca-39ef8d1da14so2408391fa.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 19:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786586399; cv=none;
 d=google.com; s=arc-20260327;
 b=FRzTSI2HDQiSEaunCpHGH0BrkIy5iDoNkfRvrPIaeCmIeWrqsCMR/Xo5djRVGSB7tg
 2DtYjqA7IUFijuaQ6tkQlPIqMN0fSJT/kCDEkG/j6aJ/Y9qzuGiBouy9poMSCpsf1fZ/
 q77H9n+9egbSLzhE4Z2cYLVXr3k7YkiIl1r7mi6bHJngdRrJwlzKMxmFgEz1J0fI5swx
 47OnO01rZlNe1JqmnyRqvqcMx1ywifBIdJzP1p/l1tPTq5yXSnigZXlvvq+dm/aaL2x7
 GYRlz86JcxI0px1+PqGgb0pfLKmHlft3vUlIA5NZFZi3lcacYzHyZ3VG6SUC5OejUZ95
 Uj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ewIXW3DQOyDEAWMQKdINf3zRTImEA9ixdsV1WKYCg+E=;
 fh=PDGgTDdDfJCIXIm0mO8iRo60HCqGx3MsIK43pmxj6ZI=;
 b=ijuANZSu0VsJNfHxdBTfCadOHY1Nux9Aits2//CoAwgrfBhFRE0Rxxas+T9Dh3fWVI
 hnsLgNESJy7JRN8xHmzz+WKLFPPk1OUjGo/AVfKcpYbaJMRTbE5ONG/18NoiA1f9/kEh
 uZYJXtTdvdy/R7WYAxUtPZe0qCFlxeyxXAizdfvEygVV0EnH5FvoaOREVyXfE4Xt2zUl
 DzaxYyoRrAmKBJlhUWf1Ik5NO4Alj8EsVtDvfGfHNjZxagywN7AAWpYe8KBd0XR/AtE+
 biqZDX4htYq4g4KZ+iJp29M3YHKOAgi+Ih77WHZWNWuY1N6DNLLYO3ls+if8TEYkCUS2
 fRyw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786586399; x=1787191199; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ewIXW3DQOyDEAWMQKdINf3zRTImEA9ixdsV1WKYCg+E=;
 b=fS3GLvP9WoJsv1e1aRb78Y4zLQRmrQ/RfF4LFeOHxUq1Ai9benzqhwkVidoX19ZJ78
 6+NIu9lgg3htxG5FkzhmY8oVh22ST8cRoWqMVw1v7GsNTcO2aR2QNXNwWQcrMn9mlURk
 lqsx84eGU535E+0zmWqeg0luedJz8fJFuawGh+6i8rZhY/XNI9tJ+2tTOh+M0zImvCpo
 OYifnR5ob4MgdCkq9EPaADMc6TPf4oBjtM+Ju+27SvxJfbnkkMhWozj8Rvs+xoNd7K1Q
 U5s6Gf+Lvr0vSK7dL/srcfRk14l8F7zIbOnG+jb6oR3VJfe/xyxD+ncX9L7T7wv9K8Ar
 yWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786586399; x=1787191199;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ewIXW3DQOyDEAWMQKdINf3zRTImEA9ixdsV1WKYCg+E=;
 b=AzmxQs+1yT8zzlR4ZgHMMiGKNgqMF+oWnrj3klylX4LGKL+XRqa5NZ1ZVKSlWOZ6Bh
 uwSKcsOXtxFAZOROLrKH/5T/VDdhkYcGrV8Z8epg30ouA1EFH4nDHLHEd1BTz2nWw34f
 uk53hpht1GUs3s0sj88qo1XklNg6ZdZtQZKlMfKt+iAj4ArhwUCWbASiJcCeA0DZDtHB
 BaJz0oCS8KWGJp6vaHYb3/O6S9C3tgXz99DgO5+gNLSwVIays0t7m4DMhWe0u/sy2oGE
 0OULdFtgNKhauyYv/OPAOEaZsED6GMBuugNPh93cEIXlDbKvy3CIccTqZIhPl4f1VE/9
 KKng==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQx9sXjra7tVsAPEQ7dfXqAi8wL3biGoDdYtQS1v2hSwVr10P1bk/plovamH52dUR0rYIjUJbgR3bI@nongnu.org
X-Gm-Message-State: AOJu0YzQKigQzIoSLLZbhGUWf0h/XWbdcYdgmrNzJfau4lnhdH0tUB/f
 zX72wxs4BS12brbs1TCe/fC4UKU+TCTxu0otuv2O+mMCCI+NyILXI/crvZpRoOTcKAzgo3Df7bB
 JFfYy9Ty1JJKIWaU5mckC7WXZKjazuRo=
X-Gm-Gg: AR+sD12g/nGxxJYlZWybOszaW600iyX1VWAnXdWGtjZwtyq+COsjEDm1d6FUYNAZkJC
 kT/9KjFUESe9AwxWBj6A9U4C2jmVMNZENkbtJuNFtK5Ko3NeieZ+iGJ621lrqy4NVJ3RX064RZ+
 xOreUy5Qsy2I/51irDs8/VzbIpKerAm2sa4aL5NH9ccXxQQvXcCoJbwpdR5DbdooXwUpWh96ED+
 zvpKyMF4QmUmGIAw5ge7p2JSEOcfDdmNxdPbDnm1vqv9o9TXWl5zhPQww1SQNc4lVecnGgvzNJA
 YgeYwzsAO9xxPb/AQ5z8FFgK8Xe5rcC750Sx0/xE84ZWmW4J9YkxnE5B
X-Received: by 2002:a05:651c:553:b0:38a:5bf2:80d6 with SMTP id
 38308e7fff4ca-3a11c0b341cmr2599461fa.5.1786586398271; Wed, 12 Aug 2026
 18:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260811025516.337888-1-fritchleybohrer@gmail.com>
 <anyNHaPM7jwM-a1w@sifive.com>
In-Reply-To: <anyNHaPM7jwM-a1w@sifive.com>
From: Zephyr Li <fritchleybohrer@gmail.com>
Date: Thu, 13 Aug 2026 09:59:46 +0800
X-Gm-Features: AUfX_mybhp4iqE-Xe6bNFzAlsLyP03kO5wq24G7daOZLZi99P6cBwy-yp6NRUp0
Message-ID: <CAN4PorXO69P4c4JYpqe6ZUNsch2ujTcyU73ocROxh9bTDsYGfw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: preserve vl on element-zero fault
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com
Content-Type: multipart/alternative; boundary="000000000000a12be40658e40f05"
Received-SPF: pass client-ip=2a00:1450:4864:38::b;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-lr2-x0b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000a12be40658e40f05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Max, that makes sense.

I'll update the root-cause description and the test comment accordingly.
The implementation itself will remain unchanged.

Thanks,
Zephyr

On Wed, Aug 12, 2026 at 11:13=E2=80=AFPM Max Chou <max.chou@sifive.com> wro=
te:

> On 2026-08-11 10:55, Zephyr Li wrote:
> > A unit-stride fault-only-first load must leave vl unchanged when elemen=
t
> > zero raises a synchronous exception. Keep the shortened value in a loca=
l
> > bound until all loads complete, and only then update the architectural
> vl.
> >
>
> The failing case is a corner case. When the element-0 faulting probe in
> vext_ldff() faults, it longjmps out of the helper, ProbeSuccess is never
> reached and env->vl is never touched -- that path was already correct.
>
> The broken path is element 0 in a mapped MMIO page: probe_access()
> succeeds there, but QEMU cannot know a device transaction will fail
> without issuing it that broken the assumption of the pre probe_access()
> checking.
>
> > --- /dev/null
> > +++ b/tests/tcg/riscv64/test-vle32ff.S
> ...
> > +     vsetvli t2, t1, e32, m1, ta, ma
> > +     li      t0, 0x18000000  /* Unmapped gap in the virt memory map.
> > */
>
> Actually it is not unmapped -- it is mapped as unassigned MMIO, and that
> is exactly why the bug reproduces: an unmapped address would make the
> element-0 probe fault and the test would pass even with the bug present.
>
>
> I think the fixed vext_ldff implementation is valid according to the
> RISC-V specification, considering the VL reduction rule and the
> non-idempotent constraint. Only the test case wording and the root
> cause explanation may need to be updated.
>
> As for the patch:
> Reviewed-by: Max Chou <max.chou@sifive.com>
>

--000000000000a12be40658e40f05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Max, that makes sense.<br><br>I&#39;ll update the r=
oot-cause description and the test comment accordingly.<br>The implementati=
on itself will remain unchanged.<br><br>Thanks,<br>Zephyr</div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Aug 12, 2026 at 11:13=E2=80=AFPM Max Chou &lt;<a href=3D"mailto=
:max.chou@sifive.com">max.chou@sifive.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 2026-08-11 10:55, Zephyr Li wro=
te:<br>
&gt; A unit-stride fault-only-first load must leave vl unchanged when eleme=
nt<br>
&gt; zero raises a synchronous exception. Keep the shortened value in a loc=
al<br>
&gt; bound until all loads complete, and only then update the architectural=
 vl.<br>
&gt; <br>
<br>
The failing case is a corner case. When the element-0 faulting probe in<br>
vext_ldff() faults, it longjmps out of the helper, ProbeSuccess is never<br=
>
reached and env-&gt;vl is never touched -- that path was already correct.<b=
r>
<br>
The broken path is element 0 in a mapped MMIO page: probe_access()<br>
succeeds there, but QEMU cannot know a device transaction will fail<br>
without issuing it that broken the assumption of the pre probe_access()<br>
checking.<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/tcg/riscv64/test-vle32ff.S<br>
...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vsetvli t2, t1, e32, m1, ta, ma<br>
&gt; +=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 t0, 0x18000000=C2=A0 /* Un=
mapped gap in the virt memory map.<br>
&gt; */<br>
<br>
Actually it is not unmapped -- it is mapped as unassigned MMIO, and that<br=
>
is exactly why the bug reproduces: an unmapped address would make the<br>
element-0 probe fault and the test would pass even with the bug present.<br=
>
<br>
<br>
I think the fixed vext_ldff implementation is valid according to the<br>
RISC-V specification, considering the VL reduction rule and the<br>
non-idempotent constraint. Only the test case wording and the root<br>
cause explanation may need to be updated.<br>
<br>
As for the patch:<br>
Reviewed-by: Max Chou &lt;<a href=3D"mailto:max.chou@sifive.com" target=3D"=
_blank">max.chou@sifive.com</a>&gt;<br>
</blockquote></div>

--000000000000a12be40658e40f05--

