Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F184FC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 05:23:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whhEM-0002li-3x; Thu, 09 Jul 2026 01:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whhEI-0002kW-CF
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2026 01:23:23 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whhEF-0008MJ-AX
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2026 01:23:20 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba3e6so2715369a12.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 22:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783574596; cv=none;
 d=google.com; s=arc-20260327;
 b=SMQ2NFW4m/YMcV33tZnVq2BwiYiSTCFEzolykcknHlSYc9C3capf9NFQybY3g0jUk9
 ypqgeY0N7XDjpVQQ0Y1JEKsjHwDQ8yxtCyfUkDVJAYFGXUnqE9kNYyVbE+CHziYP12fU
 19VreVvuBaVVjxWvsh6PIaDwEHa8mJTAkjNv6dsi4mimguZJuWxwnl+TM1KzC/debIUk
 ARgkWnE9B3HsC245imzuiRuAWQoquxTEIsGCqZO2Ui15cvO0YmZVvO2pG5dLkkHdavcX
 jureQGTIhNCdhTYyyJJTKSc2DyTEDsG3+alTfg9AtvMHgS3R30ZT925so3HabJAN66L+
 XqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xndrcRuhepZhzYUiBoWpSUf8i+jjiQ+COEmMXWTn91g=;
 fh=NNlDQCVt2BDNcd4OWYb8wrMtLlBhyOi/Tt0G/9AhM8Y=;
 b=nWePH72vfmK9Vhm7c+Xop4gTXpeKCobDfZ9V9sJhhHI3Vu8mTRi56H/s1LwpE9TTQo
 /rj7z+d83nNZjLqV9qpB8Gto7w4Nv6Imz3uEbPGAf+7YxjegmupyAVqjm4Lc2e5CN1Hw
 8eEnChbkek6R+Z75gIklFOKjY48xZ77pkTHQF8T5dgZMFRTKaAmfV1ukkv32dNiHp0Ra
 Oa0DiJroviB7CcZ7gdzxWwRqVVsqd8u5tqkPErrNKBUaN3UlnVawvVjuEojxVjvbaHXF
 1rW5Xieq7rjncqBGWu68uBRut8lSP89KnZJ9ps6cbQXsAJPw3te5I0my3AFC8vmTy+7O
 0FjQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783574596; x=1784179396; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xndrcRuhepZhzYUiBoWpSUf8i+jjiQ+COEmMXWTn91g=;
 b=gZ7ctdaokGZQ1qEVGAST4QBsgY4SAzxx0yyzKNps4GfYLlZVkQNt74UKxWKEXisPRK
 Nr5CM9nqsNIJx/pmaWXjKgtgCSehadHNCx8vA9Fsjbkebhh/fDXJIGwGs+2my5UBP/Ay
 teAj9Bdw+IUODWmP5jaoDitlO/xQLq3CafAcuyPiec6vJAD5nNpdlzuDkFoDQhmdQcKN
 W+WhJI/0S6jehn8KynDxdvOiNhnf2HfjtWgPQ8+vummBxIVBxLzH0em00vO61pFwicHa
 KUEmtiKopk7Y/ENYg4gkWS+faK+jk+5PLXrlJ2QyRZijggppV8G6Be2ppLMDRMLPdq68
 vu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783574596; x=1784179396;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xndrcRuhepZhzYUiBoWpSUf8i+jjiQ+COEmMXWTn91g=;
 b=rPLUkX5+yTtiHIES9yecKT9F78+4FRN9At5G4Afq5nD2R841C79aTIRYkhYhViNa8b
 Va7kyMnO9IgxBbmKfa9FEVEGnYKD5FeR7v+ZafUJ48KRIDw2gaxdPoEgkr9B5aHjC6Bs
 vcTHxyaC/oEMYDLiJy7eIpIAdB5Y8v4KcckXRpudCoU02JLHq9Kbo72M1INmvH03kdeS
 3K6iOwQMstd2m1QhhaCV4q31lV/oZznDeA/53NiTS6yj9F7qvjKM+wbTa40v671P/hvA
 I/GPFC1jee/kTQg0p8sKQYCaW7AODVywtMYhtVqqo+gOmCMi91N7KtP/Q6BhFuLoRZi5
 3xdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoR5XrnE6rjOI+2N10vhU18F017n9tjmdCGYL8wzmtC7BeCH1bNF8cXtzeunRUQZBFybdqiSASs0Jaj@nongnu.org
X-Gm-Message-State: AOJu0YwyqjZi/yCW4bda8Xx7EuGn8jSTqrVUwWRWSfjZy7iFqrazzc59
 uS/U6Jtm0delT186/n7dGYBjR4Ec6KqlC4uiOQ2WCXyUVJnsA5KqBLJFmB6I1hfkBagtSbh67KV
 XLDXv1ReAvHtK8iLGOkt4UY4PJ1jczU0=
X-Gm-Gg: AfdE7cmkSNNINgoaTlVZj9QdL4NINPu8X/aOngCEn/Zzc0qpOqD1vJ9WwOtRxl1zZ78
 rW0KzG1+H1/qDbomRv9brKG5WOEC8AdFyNaBXxcr86awvwle0GF0IxZDuOYxem9awAg1VRL/T3B
 ZctgGGt4dPw1t4o76LAqJiQ3ksqCdlEYjWEMc+FLzvrdm3iNK6s+vcMXedUDUJJheFNzB0HOWQE
 WPcVo4URWlLSM7M4Ppwg8MUfAgvVxRZk7cryHGK4arKyQujgxHe4QJX1ceg6fRHDIaObd+wyiDq
 HEUko/YvrK/1EbZ/iBEVNM4Syn1Lm/DsNJ+Dyg==
X-Received: by 2002:a05:6402:268d:b0:698:9251:2f72 with SMTP id
 4fb4d7f45d1cf-69ab44b563bmr2402766a12.35.1783574595411; Wed, 08 Jul 2026
 22:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260511124828.3210477-1-vulab@iscas.ac.cn>
 <bcc0aaa1-8d1c-4f52-a681-85bc903c8d66@tls.msk.ru>
 <6e42ecc1026a057e07e73386463bd57e1467a46f.camel@wdc.com>
 <bf46f39c-6173-4cfd-b374-63529892a1fb@tls.msk.ru>
 <87ecix59j9.fsf@suse.de> <da24799f-dd23-49b6-8e7f-65d757721d3d@tls.msk.ru>
In-Reply-To: <da24799f-dd23-49b6-8e7f-65d757721d3d@tls.msk.ru>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2026 15:22:47 +1000
X-Gm-Features: AUfX_mxGYHk7g7UScX8Vc2vmOqesUdLNCoKIBD18idkhq0-NKDEREsFLgvka2wE
Message-ID: <CAKmqyKNmb1J86B1TXqZ8xK8=4Q0VoUBUSWcoc6QSis+7nFv2Cg@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: Add mseccfg to VMStateDescription
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Fabiano Rosas <farosas@suse.de>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Zishun Yi <vulab@iscas.ac.cn>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, May 29, 2026 at 5:44=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:
>
> [Trimmed the Cc list a bit]
>
> On 27.05.2026 15:20, Fabiano Rosas wrote:
>
> > There are no migration compatibility guarantees for an unversioned
> > machine type. Only migration and snapshots from same-version QEMUs are
> > expected to work in this case. Other scenarios may or may not work.
> ..
> >
> > The addition from this patch is in a subsection, so .needed will
> > determine whether it will be put on the stream. If we backport the
> > change, then the stable QEMU build will (likely) start sending this
> > subsection, which the old, non-stable QEMU will not recognize and
> > migration will fail. Migration from stable-stable would likely work.
> >
> > So any stable versions that (would) contain this patch are likely to
> > block migration from that version into an unpatched QEMU.
> >
> > Note that since the machine is unversioned, migration from QEMU x to
> > QEMU x+1 is already prone to being broken.

Sorry, I forgot to reply to this one.

Yep, that's fine. AFAIK no one expects this to work, so we are still
avoiding adding versioned machines.

>
> Yeah, this was my understanding too.
>
> And given all the above, I think we should apply the fixes to the
> stable series, and treat this as changing version (the version is
> actually changed, but only the minor version).  Yes, the VMs wont
> be migratable between 10.0.9 and 10.0.10, exactly like it was
> not-migratable between 10.0.x and 10.1.x.  Because basically, with
> no versioned machines, there's basically no migration capability
> between different qemus *at all*.
>
> When we do have versioned machines, we can't add fields to previous
> versions anymore, exactly because of the migration guarantees.  But
> as long as we don't, there's no guarantees at all.  And the only
> place where migration can be done is between different hosts with
> the same qemu versions.
>
> The above description leaves one question still.  What happens when
> migrating from unpatched qemu to a patched qemu?  Will the migration
> fail due to missing field, or succeed, making the missing field to
> have a default value?
>
> If it will succeed, then we definitely should add the field to fix
> the original issue.
>
> BTW, can't we just skip, at the receive end, fields we don't know about?
>
> But all this is.. well... sort of moot for this very change already.
>
> I haven't realized that this discussion is about a change which I
> *already* applied (I wanted to revert it until this question settles,
> but I forgot to do that!).  And meanwhile, I released the next set
> of stable qemu releases, with the changes in question (two of them)
> applied.  It wasn't my intention (or else I'd not start this
> discussion in the first place, obviously).
>
> So we do have this migration breakage already, "thanks" to my sloppiness.
>
> And I don't want to break things for users for no reason.  The original
> issue were described as a security issue even, so there's a reason to
> fix it.  I think.
>
> But in the future I'll try to be more careful about such things.
> Again, understanding the machinery and consequences helps here too.

That's much more my fault than yours. I nominated it for inclusion. It
does sound like in future including breaking migration changes like
this is ok though

Alistair

