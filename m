Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD88C5CFCF
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 16:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuYle-0004nd-O8; Thu, 13 Aug 2026 12:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wuYlc-0004n3-6c
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 12:58:56 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wuYla-0007Xv-ID
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 12:58:55 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-81ecf499af9so1428597b3.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 09:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786640332; cv=none;
 d=google.com; s=arc-20260327;
 b=R6lSQS34JDuwe/TnR6Rm5sLvd43Aga3u+IMAInpLp3hAX/i6EKQ5PDkUDuLgxNOyE1
 13AcAOgqY+GOIfV61n8SmIjBU1JOpBi+ocWE24/5Ss+beVKnFWYpjzXhr1gu06RywiDn
 oPFeZACTIHvzaVckKjhhsltAJzqxJW0KrnCZnDgog5xm96030CkPLvF8EXXGNQWArIWZ
 3s8q8fDBIFjFWMNfVZZunodbrSo4HoOpfNweXk0x+7sgt2smenBxLVJxRIc7PExngX5n
 4DxaMsctPWYYi8sd+2zT1zehQ92h5FrnuxR2eM5tGyJzuIIBEfgk4o29QyM62KPo7cLY
 rwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MP18d/TC71YUOxdO0/YRDfuHPRMgw0QU6l5dRxileKk=;
 fh=RmEJOYGqGSjSe/+t8AaFf8cOXNz7Ui26XmlO00Adom8=;
 b=jAodS10BYMOqC/20alZ+9FrFQT0c+UUXPZN5MJfoVsIxjIVKlmk3Kmwk6ixE5cwzIG
 78Wy88yAHHjaIgm071ZVl4B00a2IJDhA+MPSSTm1LYarbWJ5ssEQ8XM4D64JJzPe6+Ze
 dRc267NNenA2GI4iH2So4QJTSOFrk630/v3yHJvxOgtfZ3tnNrkoxiA8Z/OpAgLzk13c
 xHDsVgfyscLGgroEG7GLT8tyPpth+r0GVEn0RvfKo1ZDM0FJp3cPLhLVC9Q51Y77C9V1
 mZYsbnafH73wdvDAc6nYQDzm+Om7xwzZIPBC0neT/YjZXZVlLZVgBnn13tOTZf9k8iqj
 Bc7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786640332; x=1787245132; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MP18d/TC71YUOxdO0/YRDfuHPRMgw0QU6l5dRxileKk=;
 b=LgJKqU50G3C9Cgr354hgoJ1HavMMz3+UPekm+VFRKlBl216kQCxH8QbR/QDEbmNKp8
 irsO7UBbS6mEDerg30zvTTNi9/fyDSwlIbDrsvcAvThEFM1mdHZ/8+qzOZtrKN6vsksO
 sHQLCfbM9XtZDgX0ySJEAGoMbpr0kkCYvTc79GWzZIDa4ZuqippHCqjxkylRAtEiZut+
 Z1O1H1s+QDYGKoZlv4uk2u0Vf7vfw4JALQZocSV17lSY7Tf6FBYMIj7IqxfWghYGFqfa
 Yifl1fVWS31+e5YGM326UDS+QN0VnFqoUsLP4OmAB6ejGAcShUl0XoBRx+nDnT5iaBaz
 QJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786640332; x=1787245132;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MP18d/TC71YUOxdO0/YRDfuHPRMgw0QU6l5dRxileKk=;
 b=iUSsYcKtmbEhKisnnaUzqHkIFVCWi7pCyGsmrvwKYF0Hwn5qgBsR16uca3mkno9dS1
 MiZffm7HGZz0f5LESv7B/KeoffXYFbEHfc/Y9gsKPzS9YtaQKjybz7IAXAWnZi9RamQM
 uzwPsLm76fc09o2GJVLptEaK9YRxF6pdxNg4hOHl4u8B56l52qkj5BvPLpvU8lp1owIh
 T7rOSENbGfYy4fpsadmTe9gyR92EgjfI9mdp+HO/uboPD4cPLgyPnpjmVF8uEBSI7HBN
 fjefrQW9TnW760dveoh1Jt3/dWh2wtoEfpZAC5NdXojloW0LubX/BXRP8TiU1syt28ai
 xrNw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rov2DOVZeC8gn1yikDCDYtS252/1YQpKThoXph+lTO4ns53rMVIU0mZp+CDLvO2dBRkqyAdixOSlqeS@nongnu.org
X-Gm-Message-State: AOJu0YyZmBuqEdGlt8V9mrSa9CuNHTp8tOIcSq+1RuSeHFs+RnL97eSJ
 w276cKuevntxz9FH9ZfWKu14ZinzI/po+S6xcZwf2wjsNRdE/LDOIyz8ph2Ms55KVSShlCiD27l
 v6i7hnbeLuqMpqULWs7LtD5SR2+lmjmLeB0UVpa2i9Q==
X-Gm-Gg: AR+sD11qn6rsqNiPJEat7C4EFt3paKF/vPhnAIeYmh1u6fS5S3HSR2R17mBGyYNiHyp
 mJaAQAiTIw/13IoT8qxP1L/TsvbzPZt0hRynQYVrZV59y6aVsX67JSLmKhSdQg60n/LEur456vw
 2hznoDigbggbSNZXwQ/rcb/aojw1HdjlR9TlO/bsxp+84zp8KTNn6tgOSaDEI0aqPXhu8RlKKrG
 VNHmDiGADkoZD5ZggXGAKDTduHpLxYtKDTuxhlYI02SGYEkGAxpI+9EUJ07dpioWh9xb+aDSTFT
 BahNtFOOJuqQFzibbA2WR89RRGhc/2FGp7vjrbSiI3F8HBqZfelYhKhJ7QPa9mQZeyC9VTqldHj
 QDThxtpVWrzREc2wayqDAcaoBbqWZ
X-Received: by 2002:a05:690c:19:b0:81f:e85b:f9f4 with SMTP id
 00721157ae682-8347623df87mr34724367b3.27.1786640331935; Thu, 13 Aug 2026
 09:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260717135254.508701-1-mark.caveayland@nutanix.com>
 <an2epcdoZPrz1T9Y@redhat.com>
 <1e3fe188-2406-4ab4-9555-bf04b6d1498e@nutanix.com>
In-Reply-To: <1e3fe188-2406-4ab4-9555-bf04b6d1498e@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Aug 2026 17:58:39 +0100
X-Gm-Features: AUfX_mx0B9boXQiDDXpcsVHdH4AGA06dYluUNfZqmKV6mlSTfSOcAqoZXM2wsvQ
Message-ID: <CAFEAcA_u4zec+O1q9ZQHpih7EoH6nf4swbHDxhY6QEXGugE_nQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] qom: tidy-ups and preparation for class property
 conversion
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 pbonzini@redhat.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 13 Aug 2026 at 17:42, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> On 13/08/2026 11:38, Daniel P. Berrang=C3=A9 wrote:
>
> > On Fri, Jul 17, 2026 at 02:51:40PM +0100, Mark Cave-Ayland wrote:
> >> Based upon feedback from my existing efforts to start converting from =
object
> >> properties to class properties, here is an initial preparation series =
which
> >> I hope can be applied soon after 11.1 is released.
> >
> > IMHO this version is suitable for merge and could be include as part of=
 a
> > general tree-wide PULL that does a broader set of class property conver=
sions,
> > unless Paolo really wants to queue it in a dedicated QOM series.
> Thanks Daniel. In theory I could send a PR for this, however I'm unsure
> as to how to handle that my current signed GPG key is for a different
> email address from my work email address which is where the series
> originated.
>
> Does anyone in a similar situation have an idea as to how best to handle
> this?

What we care about for signed pull requests is that the identity who
signed the pull request has a GPG key that the person processing
pullrequests knows about. The email address used as the author
address on the patches/commits doesn't matter.

You can either:

(1) send a pullreq where the tag is signed by your personal address's
GPG key, as you have been doing up til now. (I mention this mostly for
completeness: if you expect to be doing QEMU work including compiling
and sending pull requests on work time you probably want to do that
labelled up under your work address.)

(2) update your existing GPG key to add your work address to it,
upload that key to the keyservers, and tell us that we should update;
then send a pullreq signed by the key from your work address.

(3) create a brand new separate GPG key with your work address,
sign your new work key with your personal GPG key, upload the signed
key to the keyservers, and tell us that we should update; then send a
pullreq signed by your work key from your work address.

In any of these cases, if you're sending the pullreq as an
identity that isn't the same as the one that authored the patches,
you should add a signed-off-by line for you-as-pullreq-submitter
to each commit, just as you would for any other contributor's patch
that you're putting into a pullreq. Nothing checks this or fails if
you don't do it, it's just a bit of bookkeeping that tracks "this
thing from me with one hat on went through a pullreq handled by me
with my other hat on".

I have no opinion about whether (2) or (3) is preferable here.
I think (looking at 'gpg --list-keys' output) that generally
people add both work and personal IDs to a single GPG key, but
I don't know GPG well enough to know if this has downsides.

thanks
-- PMM

