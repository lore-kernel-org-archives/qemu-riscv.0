Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE2606A31E
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OEy6eupq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKM9I-0007kD-47; Fri, 23 Oct 2026 16:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xKM8v-0007iw-1g
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 16:45:38 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xKM8r-0001VI-L1
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 16:45:36 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-35f1f76ea84so2108506eec.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 13:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792788331; cv=none;
 d=google.com; s=arc-20260327;
 b=qhb/OXf1/ouptDVDRizUZb1eF6sMf1ThcuKLjEVq2NBmBEXigmBxTYFLWFrsSKBcaY
 zIixx3NHmFEG/VGEWnB3mdrkWFQ9mGpeaiSYpEVKvBgU9bmVfcSVztSDZk7a1rky1JfN
 ezy9Q7AcC5z9nZY0euIUzCLcLMBxZXtt+PwAkp+u80NEWq2vTd+6V1tVTNPHWO57O6Tt
 DakGgqzAD7++g9mQKS36qPHZ5excFcokIWw9JXre5YEVVET+5EDjUBgdJBNEdpHgaT3e
 AqyYDIU7x8PnJEzLGWHbZ4PCFxV3wKguv2TYkWrlQ1oatHvBTgOndtRJYzvYDK730KZG
 tdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3wgv4a/torst+KqBEV6aXmXBAE8cRB+9LNTkry3U9CM=;
 fh=TC67gYRNnWyVeoEXtemUaNB1be1oyzs5qGgOB9ZxZEU=;
 b=OXFk7KArTiQ1heqCyc1PseYVJKMMJ5IXabZZHxuyDnJhOPZXN/TsQ8X9UljGSOzz/J
 VrDz/cuSCIy2NUE4gjn7OmOXjizyPoHzgJJjqri0ZoesWeob7X57FKOeLJbLX2haezVM
 ckrTuprUmmxNqfr3gWdVRcAsGCjvSxyRYFn1s2ELDG7Buzv4jfiOIbbMjSiGIquSfep6
 HXpnO8izeRWYLopU36qtzi3QdIH7YD6lc7vjyZtTYmAJpkSq+DuOc+8KmDppsnbS6qJ9
 GXr8WjsDnnhFZ09V04vKOOr90zfKRCl9IBGb8xD3N6lacMHbbLK+at0j4T4DT5uAK9q5
 +7bg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1792788331; x=1793393131; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3wgv4a/torst+KqBEV6aXmXBAE8cRB+9LNTkry3U9CM=;
 b=OEy6eupqsMzfcQ30DAAJHAe893OauStK4S677S588TvLbLaQ54ZVaSpOEc7Mu2RICx
 pKAsjyAk2SGULFbhX1GEtoWbw8WZsyWLgxF0mA0AbmzkWB4RJYRZb50rM6BdIrzjjnKS
 fEEOJ6e1mPrRnwmgXWGCHD3x/qxE8k6mFVr75geNhSR80NvCi33KgbL5nm4gdQgqHjai
 l1X6yZzEU80uy1CrauUdJtJxQ3IJEK31uAjn7mIAcR9UUf/nDVRX3ry7gfy/tpaKi+J1
 Pw87RmxNnDXG8TA23hQf36UhG7f+F9bR/UtIOCHT90+P840qFy2asHSsCsNph6uPjbe8
 dWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792788331; x=1793393131;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3wgv4a/torst+KqBEV6aXmXBAE8cRB+9LNTkry3U9CM=;
 b=cs0ivNL1sf4CAJLo1y5Kny6PMnXhxOWZobCOnklau5/7y7P8uLgOWp3V08oXJ7dVV6
 WX8RVlMHUO/uYm7h5aIZ+ZyzyHXKreQqUXKIcDdxv3vncVGMzH2oqIVmaoZPk3zIrruO
 OnDBgjifTe0bqK/Oo1NSgRGrpsZCZBmUrV7Le3Sgz2FNncWJJTNoPIsRKJgzarwO5SnQ
 QkdXoSmyLzxCgnwm4oxE1AwF2DD2UsKIipHgtZa0sTZcs0ENfEPXnnugfd5FrEME/klv
 Dc0+JIOYjWX6ev8tJHGpCS66ugiHPmDSb+4WgZyqNIBb/NMSWvLCM1JrU4n0oO2ISm+z
 cr6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwNoborZKgldLdl8GIr2Mcjf+qt/iSf3QqoR3rGDc7dgxV+RyEgfQtl7ss2xsz6MpAf8jb+AicKn/GL@nongnu.org
X-Gm-Message-State: AFq9FYKqTHMZ+7EbObLeEt+HSQVY0mbtK6C1VmYWbD9e6LaNQyvoI+Fj
 B17pk2x1dr51dRMOw5cIkPBJRw6rsHlnXYVZJ7ba/1djQ9oKItzF2rTVY2S7tz2DJlLn4Emr8vs
 +ksrD+4Dm3biuyz12nAmXU9orhqcJGro=
X-Gm-Gg: AYBFou1VeZbh8rctfPNYcNz6GTh1+v2BH8v4ROeVaN1VKJHAvXp8D9kkHvuIQbaGrc4
 MLAQKTNugT6AR6dPzLeVDLk+k4CInfkPMydY1v77BnwEix6Yz7A4cvrib1L6Oxx2RMJekADI+vh
 J8ZCvsAluVtiDmuOn9ED5RVsPXBN981KU8Lrzb5acRGFbe8b4CQgbXU9SbQqjx1YhnUtihL2PRA
 XKeMZ36/utB5kVOZYx0vxYrUKribmKC0hkAIvjxELzY5WyFX1vIBkUZgqwyqjfJlmoMj9Be92i5
 XvqiLUMgs826bcMqV4UktFD1aUKF4W9pptkHPimzqefcjXUmA0kfhSIxJd7RM8uwSf4ZHel3WFJ
 4rUSJvdUl/AkiLcWXu9pvV0rLjF7n3HaY6byBJr1CuZyMGz74ypfqnyMvoNSDP1e3GkPd
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id
 5a478bee46e88-369e8362dcbmr586622eec.2.1792788330921; Fri, 23 Oct 2026
 13:45:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-11-7ad902b9a7cf@redhat.com>
 <atqdgESEVhYYsz5e@gallifrey>
In-Reply-To: <atqdgESEVhYYsz5e@gallifrey>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sat, 24 Oct 2026 00:45:18 +0400
X-Gm-Features: AclHuK_Ipiep31aDNKnrUUTrB3mz8eljqFakdlFzfUKaQf9-NiLk5TF7SMOnTC4
Message-ID: <CAJ+F1CJvkXiBLWrRvWOeG7+qBLOovsZ8xOhoBtxd26CVor=DgQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] target/i386: drop HMP $pc
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Oct 23, 2026 at 3:35=E2=80=AFAM Dr. David Alan Gilbert <dave@trebli=
g.org> wrote:
>
> * Marc-Andr=C3=A9 Lureau (marcandre.lureau@redhat.com) wrote:
> > The to be deprecated MonitorDef provided a synthetic $pc alias on
> > x86 (which begin as an $eip alias). Preserving it requires x86-specific
> > semantics (CPUClass::get_pc() omits the historical truncation).
> > Use $eip or $rip instead, adding $cs.base as required.
> >
> > It was never a documented feature, HMP is not a stable API, x86-only,
> > and the replacement ($rip/$eip + $cs.base) is arguably more correct.
> > Nobody asked for a deprecation window on ML either.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> <snip>
>
> > diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> > index a523dbb446ce..b3f8fd58612d 100644
> > --- a/tests/qtest/test-hmp.c
> > +++ b/tests/qtest/test-hmp.c
> > @@ -58,7 +58,6 @@ static const char *hmp_cmds[] =3D {
> >      "object_del mem1",
> >      "one-insn-per-tb on",
> >      "pmemsave 0 4096 \"/dev/null\"",
> > -    "p $pc + 8",
>
> That leaves us with no test of the 'p' command, and no test of reading
> a register.
> Given how much you're changing accessing the registers you
> should still have a basic test by the end.

The existing test doesn't really do much though, it just checks we
don't crash basically. I can try addressing this as a followup

>
> How does this test work on S390 where 'info registers' shows
> NIP but 'p $pc' works but 'p $nip' doesn't?

I assume you are talking about gdb, since $pc doesn't work with HMP-S390.

>
> I assume gdb also has some concept of a 'pc' at it's end?

GDB has extra synthetic pseudo-registers. We have a bunch in QEMU (and
this series add more). We can add extra as necessary. But $pc for x86
is currently ill-defined, so we decided to drop it earlier.

> Dave
>
>
> >      "qom-list /",
> >      "qom-set /machine initrd test",
> >      "qom-get /machine initrd",
> >
> > --
> > 2.56.0.116.g6de20f6092dc
> >
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
>

