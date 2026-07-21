Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4289FC44529
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 06:36:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm45n-0001sq-Fk; Tue, 21 Jul 2026 02:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1wm45j-0001rg-BH
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:36:35 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1wm45h-0004Pa-Mg
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:36:35 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6a381bec3f4so7090703eaf.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 23:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784615792; cv=none;
 d=google.com; s=arc-20260327;
 b=RFHJDAxWkME8wWL8LwYaakkyu3EurFxt+95AQvHTdCIxoeWEr08/3JPqo+qxYUSwZ8
 YoQy8tctjkPohL7Rr/vO7xV6DGVeaf/8IBaKWnBNLmgXwhpQOSOgl3+i/WA+23dHrZ/1
 HDPcqifYnLIJN49B9AiX3dqWgPOs+s0OelH5DcmFleH/O4Aw1f95u1bdzfdHztdY/SJy
 EyjpteJdTbFcBy1LPWO5j2mTgoJqoW0XEPq/n/A3ueLZWJphTJxbRWej/cwX/l3fSdwi
 uTl1sQVVli9CWjcnzJUFfavpW6L9NS2RRxEXcbzp1luNGvuE2gSw2KPHPBeS4kOSUxvX
 fHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LmlgzZqlI/7CETKV9QdjUehLc+l/GSfoUdaynNXB6m8=;
 fh=4Ul6S80VILVjWiOrL64N1GzE1bjNpk6/bMHU1w/ayPo=;
 b=DnIkFfNzyfSyHpa2WWlVeJ5weKaW9OzRdeVoyEerUPFJD7SLzVHXyJ8RarbPYWD9Yo
 E7TP2IHBjSwKH5P7DJI2BXOignAVaGI9P3BSdcl/dVSkYL1JlvWmolY0dS9QjfRB5k7A
 0S8azR3qvnpaI3diCZI5ENzTQaqOWtsB/E7zAQum6tjY8rvOHKCPwNn1awherE1NetPW
 GMkiuIewTz6UI6ZaieM3TmKSarZf2vd0pEmiSkTnpfGd1/PhLm1xkCy+r+j1/ZNyQji5
 EDmVDFAcKPrSeiJn1Ypaab1w2ggHqthv32K+izbbbIAZ5i4hsY9hUPNU1QXHT2aBkxd/
 OGfA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1784615792; x=1785220592; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LmlgzZqlI/7CETKV9QdjUehLc+l/GSfoUdaynNXB6m8=;
 b=nLUs47c2iooLd1njWAfa6LImoMZuaXjG35qRLLBUevhZ40qMCsNURTpzWOsbpq+g8X
 AYhL1a0AEwdtK1QHOMBwkzeTtajxY1OZ2NVemv8lmW2qntrLNpM0gHgy98tTUsIPRsIg
 VxtRyVQJ6x5KhvwJ2cd5BWbKdApnePppBdMXULCMZ9pqRQLmqtwOdYpmzEvhQ9bJkZne
 QDqKiCXiubMWhowzx60FdU6L5zWHySKJMqCSlfZoe8VP/SwgGyTchigT6TFgkY55jBCp
 WhRZuP6CCNd5DNwrcd9FTX59bAWUZWLmfeqQjmV5pWKBGbGtJReXTuXfmZfqf26NQkTZ
 kn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784615792; x=1785220592;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LmlgzZqlI/7CETKV9QdjUehLc+l/GSfoUdaynNXB6m8=;
 b=Hma2VwfuuL8yfkpGmGNRfUMWP2YgEAjA/AnfIVcs48qQbW7fdgSctgS5ImTJdmo9bv
 oqbCtHwY/gf93xir5PutkbL1LCWVIpjISiTS1gKJYRoLR+kjBbnm6VnHgt5/9JPcRx7U
 9avrJjqZpsfja4EOADKfZXewEFRLXgpBEsIHUP4kI2ijohlq+nkIjBUnngWHprh3FXAn
 SpM8E8pV3z2VTHDA8Z/sTfPrq/s09LnDYBHyvoS1H11ponMND9OnRGAOIStYzPi5Aoit
 BnfcsbnXz+uHYEAkqNKRnJd82DvnGJu5vVi+uPJ92/hcGSg9LyVqjDHLY2kykSFckOoN
 Oa5g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpxZKP9Ic9YJlR47hooO0wzkY8V7iCDg7BZELl5TMZGccaNQsBf2JDJNgKMpwJBgcfNwluPq3QFEJZw@nongnu.org
X-Gm-Message-State: AOJu0YzfRmUnspdGH5MO0+oZ/MQ9gOJEwA1I464oRQ7Qa4VvHxAd0As/
 hSecXIKD0dm/VfBrxi3I+FoArCdLXRt4Xc/pa6cffb6tC1lPQuZtYZ4SK56/pFycxGIaCt4H5Aj
 6FSQ5JyK5tHJSvFFTEqAVy48mxb4KsmrQk1m+I/ElPg==
X-Gm-Gg: AfdE7cmSMeFDS2Q8xgDyEL7bZYRey7Xws5tu5Jq8ZzPjYxNiiCAl8leVSzWDa49yxiS
 ZLEiX7AflASc/nYkcTmq0TfR3MWKK/rrJjHHgffWOZHqm8EIHWE2y+rndBJaD1/zE5Zb/CREgQ4
 exop7amjFaR/KQVuajGH2mk0ySKsHTp9ZlXnXsipV8UpuB6TltbWkgNiUlSxx6fmmNrJ9YzYej8
 gy9qzwC35ndeN/iVAOEZt0g1ozTdOVWNG1AMHPfJIUcrohlnXX73MzucPsJUiOa9Af3hWPyowQ=
X-Received: by 2002:a05:6820:1507:b0:6a3:8611:8ef5 with SMTP id
 006d021491bc7-6a53668e887mr9047848eaf.1.1784615792056; Mon, 20 Jul 2026
 23:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <CALw707pP_5a_EeUQLRw51nLCoFo4vKkKPGaVtJJdWEqR8K-u-A@mail.gmail.com>
 <CAFEAcA8V-eNMTF6dmR2AHwSjWj_MWaijgG_inepf62BRLYo8DQ@mail.gmail.com>
 <CALw707pb5iKy-CAnVn-npdP8NRGwaz+yZKGi2ZbjafqNLNJtKw@mail.gmail.com>
 <CALw707ozF4se+s7CUYNHY+f7xHCc5mqMiQQf+GK8eM1WrjN1qg@mail.gmail.com>
 <CAFEAcA-O1OsvisDF9CiFXvKS-2FDG=+mrxU27w+HfyQpRiF1eQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-O1OsvisDF9CiFXvKS-2FDG=+mrxU27w+HfyQpRiF1eQ@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 21 Jul 2026 14:36:20 +0800
X-Gm-Features: AUfX_myDm4gBheCEKEYTTx9bhYJJyGHtHRBrPS1l5akgnJea0zWVQsiv-BO1IBk
Message-ID: <CALw707rzojpHmatHeP5LJqhEcvd8ZiU=a2+EC23H3nvS=yZf1Q@mail.gmail.com>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@kernel.org>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=jim.shu@sifive.com; helo=mail-oo1-xc35.google.com
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

On Fri, Jul 17, 2026 at 4:59=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Thu, 16 Jul 2026 at 04:12, Jim Shu <jim.shu@sifive.com> wrote:
> >

> >
> > Thanks for mentioning it! I think re-use requester_id is better.
> > Then, I think we only need a boolean flag `src_is_cpu` and we can
> > rename it to `requester_is_cpu` to match the naming of `requester_id`.
>
> But, what do you now want it for? If we put the world ID in the
> MemTxAttrs, do you still need a CPU ID? (There are some situations
> where it might be useful, but if we don't need it right now we
> shouldn't put doing that rework in the path of implementing
> the worldguard work you want to do.)

Yes, Adding the world ID to MemTxAttrs is totally enough for me and
the worldguard patch series.
I just explain the idea if someone still wants to use CPU ID.
Sorry for the confusion.
I will try to add a field that combines ARM secure/space and RISC-V
World ID bits in the next series.

> > > > > The whole plan is to add the following 2 fields
> > > > > ::
> > > > >     unsigned int src_is_cpu:1;
> > > > >     uint16_t src_cpu_id;
> > > > >
> > > > > src_cpu_id is the CPU ID from 'CPUState->cpu_index'. src_is_cpu i=
s a boolean flag to check if the transaction is from CPU.
> > > > >
> > > > > Moreover, I think this idea is extensible. DMA device transaction=
s can also have security attributes like world_id. We can also add src_devi=
ce field to 'MemTxAttr' to store the 'DeviceState *', so we can get the Dev=
iceState from MemTxAttr to get security attributes. If 'DeviceState *' is t=
oo large to add to 'MemTxAttr', re-use requester_id as DMA device ID is ano=
ther possible method to support this.
> > > >
> > > > I don't think that having the thing that receives the memory
> > > > transaction get or get hold of a pointer to the source of the
> > > > transaction that it then uses to get the world ID is a good idea.
> > > > (Especially not putting a DeviceState* into MemTxAttrs: the
> > > > size of the type needs to be kept small so we can conveniently
> > > > pass it around by value: we currently assert that it is 8 bytes.)
> >
> > OK, I think store the DMA device ID in the `requester_id` is another
> > way to keep the small size.
> > However, IIUC, the current SysbusDevice doesn't have the concept of a
> > device ID. We need to add an additional device ID to the device to
> > support this idea.
>
> What exactly is it that you need a device ID for? Earlier you
> suggest that you would want it to get the world ID -- but we
> should just put the world ID directly in the MemTxAttrs.

Same as previous responce. Adding the world ID is enough for me.
Sorry for the confusion.


Thanks,
Jim

