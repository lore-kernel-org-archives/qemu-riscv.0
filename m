Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE68CC44507
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 11:15:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkgX4-0001jh-Ij; Fri, 17 Jul 2026 07:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkgX2-0001if-Gf
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 07:15:04 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkgX0-00077N-6L
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 07:15:04 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-81ea0b7d137so70160957b3.2
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 04:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784286901; cv=none;
 d=google.com; s=arc-20260327;
 b=cxcqD9zTqK7QYTaHViQOKj/B8uxrWVPf2PIuqPb82ramujvGmS00/yOk+KmV+wJ2aF
 8w4iAGTZYZCXWortLhuRFQ3Y0OqIUD1z/bXjqsaKHuZxTxseMt80mKnkcqngjk2RT/lg
 Rt1JCZTXL8hBoUiBoWOpFD7RBpG/QyIHNJ9cUjeHVIqcfA2ebO5huw23bmDEHOtZJJaS
 IGYLAvuH4r6fgX/q1DFz7kvc3NYiQLeiZokHltMpsypmamFiNKstd9jk87ocUW41P9v1
 Teg/A6sD6sSKZxGzrhP91+59La98J5HENEhSy5i55z5ygwcP+/0INEapFBTm53PJ1Hcd
 zwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u8Dgw/Lyjrt/Dov5nZwYezl8BE5KDy6X0z8HghCf2oc=;
 fh=FGSZ4u/HmtUMb39ouWBB1MsMTD6G9VSyC20MNpywzkE=;
 b=mM8sFSqVkB1dh6k9ECJ68htsKV5y5XdN12JgyQ3CbUXs7YVBpJI/KNu4ihwtHBEKE0
 gEy647nAkwhy/Qcli+jyWBawlgEhUJmUU4+AY6vd+lM0iuGwIItvQc4ziPLlb2dAzucO
 EnN87XFfeL8LU/gYjlt2L4nQLFi9QlqFF0yu2seHTVZrBorpUQ4x1bGzxaq0027eBGWh
 234RVh52piY6Z3A+tLxzyHzytbFO0bJT0pasQ+Gm96iYON4h95aBQKqGb7vXHKNgLEm/
 NHrfHKnFHm3SU+bRktHnkSUpRsFe7tsddAcoHzD/zJfinojJoe2FzjIwmeCVf6RF713Q
 aMvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784286901; x=1784891701; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=u8Dgw/Lyjrt/Dov5nZwYezl8BE5KDy6X0z8HghCf2oc=;
 b=hzdDspKQoAgYSeSExSYHb7CvfgdxIwbMiWS2+cVYHM4zaTXXJ0s5CJUTgYUm/4raC9
 9eIJVp8tFwPLrwnIZ5PkynwtrBbmCj72zbZ8bMqUi7ElsPOUvYum/HOBp3LbjYJlZWwY
 R68qEMRusfVAiwqtWSxx1pKDR5WCgPHctmBx2jhH8xA73TWkmM1gHJJmUDBNoEqg2pBe
 VsDAzKRe81oxS8Pb8BSWfed5zzBaUUKhx9H76I7dNFpeTYPkpbN/q6/r5q+2zuxxNQwj
 mcuyr2AbWo1nN675v65rHoWyyuJrf9lI2X4M4MxNZqA2fQqc8oMmcbH6Vd64JS9XsISD
 UH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784286901; x=1784891701;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u8Dgw/Lyjrt/Dov5nZwYezl8BE5KDy6X0z8HghCf2oc=;
 b=gkjwgHFuR58mP07aTOJBSXaN3pu7MZIlN+ZL/9jvJPO1vrZRjuAPM56Fg7HxP5FT2R
 sX+P5A3XgOsMpSrTeISY/ff5dN/mFgsBfxyuYA8YjHJHaYZ+cseDV9ouiR42utfxe1Zn
 Jgc1VvBnljUsoplDsKS75kpAjBWK/5Qa5AOCBpfOuSMWuxgK796qy8cH19HxFCUgiNfa
 e4qS1JAWZzzIQmNTehJCtltL7Q8RMtvz07/5Y4mPYa74NiDxjVAjG2CUxp4h2upnOR8/
 diCPnR2Fs8kzsw1z3NIUc9IPWU8/Q4oD88LHOPf2xHGEI1FOsmB/cRFPnwdhgHRqZSvy
 semA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUa0JhBFSyxAPOh2ypsrCqXq10sHo1NzmxIGtvPnGhHpRwt0a23SXGJRVUInGDJUg1pcdw2VTayQD8@nongnu.org
X-Gm-Message-State: AOJu0Yx/V9V+52UU8MA79u/HjnF2nb41DYt682rQOI3yRZgI8gqw6V/Y
 loV8UXwsXZ1wHZXeFSK46AnUJlH4E26gbZ6NJG6mUg7NyRmEkphbZMGY8gKojRZGzT3WsHCymlQ
 2HTpGAikyXzX6a7uGCleNmA5gEJGQUnpe6huI374rrg==
X-Gm-Gg: AfdE7cmQcPFGkWqpaXFUQhfz4HV9Mp8sVUWZroi2TiyjSo+mY2vENxf7hHOOJxoQWOF
 RK0ZprveuPbKi1z2mzwa9rlJO1I0jiCbFIYBDPeLScEWNKr4mRvW+TqleSPuYSpcY1TkYthaeEo
 +zf6WFA2XAGVQkwSPi5etxA/uddKi2r7Y40oZ8kxEGheZzUAMxssYJcWCstKIiZcdJMrRMd8NOE
 5yCXYiH49+UBxffRhbj/lCXiYoZ7+kCwvI1Kz2pr3dKYbIRJ3PIPE/ihc3TTNm/9lHM7gOgRasa
 qv17IJDYxe442sBBDrCyfAtdfEW7kW0KldawekjSUT/2fw==
X-Received: by 2002:a05:690c:3613:b0:80c:85e5:875e with SMTP id
 00721157ae682-81ef28dd35amr6332367b3.71.1784286900745; Fri, 17 Jul 2026
 04:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <87ik6e2ajn.fsf@draig.linaro.org>
In-Reply-To: <87ik6e2ajn.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 12:14:49 +0100
X-Gm-Features: AUfX_mxTIV90G6KKybRVUi7CI-JYruUFU0A0gBrQrJo9qRl7qh-1zCqS4zef6bg
Message-ID: <CAFEAcA_q7jtebfD0EFXUh6VOdqMjy0WGo7ZOfvpA3W8p4=tkMA@mail.gmail.com>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jim Shu <jim.shu@sifive.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@kernel.org>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 17 Jul 2026 at 11:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> > On 18/3/26 05:40, Jim Shu wrote:
> >> On Tue, Feb 10, 2026 at 8:25=E2=80=AFAM Richard Henderson
> >> <richard.henderson@linaro.org> wrote:
> >> ...
> >>> Hmm.  This really overlaps the secure and space fields from arm, and =
possibly some of the
> >>> others as well (e.g. user, requester_id, pid).
> >>>
> >>> I don't really have a good suggestion for that right now, but it woul=
d be nice to not keep
> >>> expanding the count of these sorts of fields that somehow specify the=
 originator, but
> >>> clearly cannot overlap.
> >>>
> >>> I'm reasonably sure we've had this discussion before, but nothing has=
 come of it.
> >>>
> >>> Time to paint the bikeshed again?
> >
> > Last discussion IIRC:
> > https://lore.kernel.org/qemu-devel/CAFEAcA8vKNkfKgp_Yymo9NA1=3DE2XJYXAM=
TgO3z6q6DHgqkAwRw@mail.gmail.com/
> >
> > (see also a suggestion in
> > https://lore.kernel.org/qemu-devel/Z4+P3eHXqcU4Dqdx@intel.com/)
>
> Also somewhat related:
>
>   Message-Id: <20221111182535.64844-1-alex.bennee@linaro.org>
>   Date: Fri, 11 Nov 2022 18:25:15 +0000
>   Subject: [PATCH for 8.0 v5 00/20] use MemTxAttrs to avoid current_cpu i=
n hw/
>
> Another case that was mentioned in a Core Collective meeting was
> handling MMIO devices with IOMMUs (currently requester_id is tied to
> PCI). I guess the WorldGuard WID field is a similar thing.

The worldguard ID is more like the Arm security space field, as I
understand it -- it encodes what the request should or should
not be able to access, and multiple different transaction masters
might be able to send with the same worldguard ID. A requester_id
on the other hand is intended to identify a unique sender.
(In AXI these things turn up in different signals.)

I think the trick with requester_id is that we need to identify
what we need to encode here and make sure we don't confuse things.
(e.g. a CPU needs to not be able to emit something that looks like
a PCI request by accident, because some devices need to be able
to tell "this really did come from a PCI device" from "this is a
CPU doing a normal load/store insn"). So we probably want some
kind of "this is what the requester_id is" enum rather than just
a convention.

thanks
-- PMM

