Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A65CC61DBE
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 16:56:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyuR8-0007Y7-Pc; Tue, 25 Aug 2026 12:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wyuQx-0007WK-UO
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 12:55:35 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wyuQs-00074o-MZ
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 12:55:35 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-855de2d0d4dso403657b3.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 09:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787676925; cv=none;
 d=google.com; s=arc-20260327;
 b=ntalpEjDxoZ6YVj7qcFJ5OlPOwkss1NP7L42UKW5w8ofHrflb6Ge1R+CI3WEpGXF35
 vM7eJbWI4MlcgvpWQVGa/T167XE012y6xIzo/jz4hwb19Dq3U3cQp7V+DdApGUwp463v
 EvIU7QPD3CDw+buzxRwzYwJbSngo5xBtTTWvLfQqWWab08L1y2WnRoyItfVWxq2PcQAZ
 IIJ4XpZx5DZt0dXFlHK2nngt3l4biA3PS4yJR5Ew7LngcRRWW3iQpxjzkApDAi2wDrBn
 9Z1+ijQsM6LbWobiIBovKf4gCrOdSYM63aa89Maa+fSaN2QVsU8tVrD9NBd5tj73/VPb
 xOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0PGKUcpisL/PdVjbCIBj9taleCgb4geVsx0pZw5E3b0=;
 fh=aLx5CtsOxDc6ePaQ3LftPfquc8rLxkhsKrvGzS9cyhw=;
 b=Ft3gRl3tw55Nz492xJjjfuwrFla4FcE/ptS5c05swPs2Gy5mS3khZ0WIJX5QSe66Uo
 xdoB7D76OeIxNRdxoFrkXVz9fFyreNyB9MqdFZGv5zH6nBz1HM2kfL1TJ8zLUaoxt2zq
 qdcPP5hyQQmuhwepVu4Vo0QrZUfyXCJ2NZfBt9lix+7uVkbGEd0GFQ3hnkFsVv3wkE9Q
 Z051HTcihYIFDFEp9lroyF+6OPAliFKIBZ1B0pxd3/y7MYBi/7PmhrLBu/GtHByRzC3a
 C7uOCq7LiyNyuvp/ZjVFMaV6UOii3I7JUb2y6JYU5vgXdtBF8UNwoW5K95joKgISZtB0
 aUIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787676925; x=1788281725; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0PGKUcpisL/PdVjbCIBj9taleCgb4geVsx0pZw5E3b0=;
 b=aqXc2a5bbAivHOjMse/rWLaE8J+/HniBJpk+4Xft1aOae3fpCwHmYUBcMFXgkFTsoQ
 Cy6N76XE95LzTe0gXjugPyDow+fjE6soUaHFXaOKqFBcY5qQf4ux7aUZ3YV86l528lJG
 liHgeQcjsbxgb2bZ+cYrrlkWn7raDkevMP5U4EAM+zBqEvNBK479CYTOpg3Qwa7Q1JFd
 gE/C/aEwC9Z1fp0nwpCQaQp/Yr6hGGeGRDgQF4Q9FIBD04P7MfHPv2nZ44KzhGcT4we2
 VQSYAhhkNNHfKqrNN03uTzwOaQe0+QGckdZlU6WZ7+bOM2XDIibmeOp87dI5XAGNotBy
 UaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787676925; x=1788281725;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0PGKUcpisL/PdVjbCIBj9taleCgb4geVsx0pZw5E3b0=;
 b=ZRt4Ce7RvKjuRctjDsBfR6Ve+iPxkn1bnxhBvbyZDU7DLN+s7Ob/ZqS/SMv4vNQyRz
 r4W+BcSxdaLakLpOEKkADw7VBp8tv+rMm+jeKTHmMXA+qh+sGeWRBSwCVOLCylHooyLB
 7EZRI9jolhGuv9Ng5WYdw2bxd1UZ5pgeDupe5qLKcj0Cu1F6X2ex3WbUV0SQRyusvlBD
 XE642ZmVYPuLEQv7StV0SiMTr062we6qPCUWCMhPiRNOMkqyLn12NpiYIYC8uJyQ2wxx
 6mn/rQ868kNcDpQRvkYSWYPF30QnYD0l7cv8zP1ZEJH8nOf2hxCmHMeCf/oc2ptuNhly
 9eAA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZ+8OHhBxvygZ25Ctp2/uJaSNNFCR2YI6RwqfCDEG2DU/xV1WVCMnvH8mXI/Me6vgvVuY5+yaJoUjx@nongnu.org
X-Gm-Message-State: AFuF++nAoZm2+PW7vcBAk0PK1nxwBC0/2e6Pbz1lKIdOweBKyh+4i1pK
 vKFIJT5UzHHk5rpWQVpD7nn13Pg15PWPV+KHKsrYhv8OmJ0q8OxY0+RQySnhNTSj1406vqlBPiv
 WYTLdA+0rsA70XqgsuByTtJCyK3kgDL4=
X-Gm-Gg: AR+sD11NP1yZMNBFWat+rQce1e/I3gKEIm1Wh6YnRYfiozfeQjmALJlu5Yds+mLrJ/0
 WEJqXAEDLOmy/0fklt7XkQLJIbCak9IVwHrL6GksNHzV9yoP9YTT0ATsO/9VcVA3h+vHmGXmPH3
 w8d5hO/LOmOQMCJhUQMHLWMD9LruocT2ZOvGJ1mAUBm9RmYilXJf6CBBaFFx+Ma3HzciJmR9YDN
 N1RcootWd8/rO+7oeY63oSdfB/WimqZZ2DmkpknOHZulriEJiAO4kL4J0B9AWxzuTunqMn7Ioox
 HR0rQ501QV6Wpl3PI1DtzUZGe/mLE6i7i9aFV2eJqMmE
X-Received: by 2002:a05:690c:30e:b0:81e:f337:494b with SMTP id
 00721157ae682-85470beb834mr39361027b3.8.1787676924940; Tue, 25 Aug 2026
 09:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao235Hm8Uovrk0ON@redhat.com>
In-Reply-To: <ao235Hm8Uovrk0ON@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 26 Aug 2026 00:55:09 +0800
X-Gm-Features: AcwNN1XxiiOybUdcnAMhBxhLRl0Ru7IaT7l5U8Ezqkmoe0-ZJG7jflEoexKYMDY
Message-ID: <CAE2XoE-EJQH7c3TWvpioa7yokNR6cf6pGMjZ2e001yU4-F7rag@mail.gmail.com>
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Xianglai Li <lixianglai@loongson.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-s390x@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Fabiano Rosas <farosas@suse.de>, Aurelien Jarno <aurelien@aurel32.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000015957c0659e1f89d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=luoyonggang@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000015957c0659e1f89d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:42=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com>
wrote:
>
> On Sun, Aug 23, 2026 at 11:07:18PM +0800, Yonggang Luo wrote:
> > This series produces one qemu-system binary that can run ARM (32 and 64=
)
> > and RISC-V (32 and 64, little- and big-endian TargetInfo). It follows
> > Pierrick Bouvier's merged series "single-binary: implement dynamic
> > filtering for machine types":
> >
> >
https://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss.qualc=
omm.com/
>
> Do you have a public git branch somewhere with this series ? I'm
> having trouble getting either this series or Pierrick's to cleanly
> apply at any point to test it.


https://patchew.org/QEMU/20260823150731.896-1-luoyonggang@gmail.com/

you can use git patchew do it

git fetch https://github.com/patchew-project/qemu tags/patchew/
20260823150731.896-1-luoyonggang@gmail.com

a>
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000015957c0659e1f89d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Aug 25, 2026 at 11:42=E2=80=AFPM Daniel P.=
 Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.c=
om</a>&gt; wrote:<br>&gt;<br>&gt; On Sun, Aug 23, 2026 at 11:07:18PM +0800,=
 Yonggang Luo wrote:<br>&gt; &gt; This series produces one qemu-system bina=
ry that can run ARM (32 and 64)<br>&gt; &gt; and RISC-V (32 and 64, little-=
 and big-endian TargetInfo). It follows<br>&gt; &gt; Pierrick Bouvier&#39;s=
 merged series &quot;single-binary: implement dynamic<br>&gt; &gt; filterin=
g for machine types&quot;:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 <a href=3D"http=
s://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss.qualcomm.=
com/">https://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss=
.qualcomm.com/</a><br>&gt;<br>&gt; Do you have a public git branch somewher=
e with this series ? I&#39;m<br>&gt; having trouble getting either this ser=
ies or Pierrick&#39;s to cleanly<br>&gt; apply at any point to test it.<br>=
<br><br><a href=3D"https://patchew.org/QEMU/20260823150731.896-1-luoyonggan=
g@gmail.com/">https://patchew.org/QEMU/20260823150731.896-1-luoyonggang@gma=
il.com/</a><br><br>you can use git patchew do it <br><br><div>git fetch <a =
href=3D"https://github.com/patchew-project/qemu">https://github.com/patchew=
-project/qemu</a> tags/patchew/<a href=3D"mailto:20260823150731.896-1-luoyo=
nggang@gmail.com">20260823150731.896-1-luoyonggang@gmail.com</a><br><br>a&g=
t;<br>&gt;<br>&gt; With regards,<br>&gt; Daniel<br>&gt; --<br>&gt; |: <a hr=
ef=3D"https://berrange.com">https://berrange.com</a> =C2=A0 =C2=A0 =C2=A0 ~=
~ =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://hachyderm.io/@berrange">htt=
ps://hachyderm.io/@berrange</a> :|<br>&gt; |: <a href=3D"https://libvirt.or=
g">https://libvirt.org</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://entangle-photo.org">https://enta=
ngle-photo.org</a> :|<br>&gt; |: <a href=3D"https://pixelfed.art/berrange">=
https://pixelfed.art/berrange</a> =C2=A0 ~~ =C2=A0 =C2=A0<a href=3D"https:/=
/fstop138.berrange.com">https://fstop138.berrange.com</a> :|<br>&gt;<br><br=
><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=
=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>=
Yonggang Luo</div></div>

--00000000000015957c0659e1f89d--

