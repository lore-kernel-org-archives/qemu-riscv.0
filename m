Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA72606A324
	for <qemu-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 03:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbju5AEK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNLz4-0001Az-JB; Sat, 31 Oct 2026 23:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNLyx-00019I-7V
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 23:11:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNLyv-0008TY-1S
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 23:11:42 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6acb57c2b88so2430474a12.2
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 20:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793502696; cv=none;
 d=google.com; s=arc-20260327;
 b=qTeiiioPm1PxG/ej+2EfzI5py9qCfB9atkD1QmR7PhRqCgqzHwwy2lwy/Jw53IDo++
 ZVcCEsUOD3Fh9quXzyHUSvA+FfF69m2jtDFWBppMIWQi2BK6qQs0epDTI+X+w0P71rN6
 EwFL6kLveaj3owN+VZHLXfecX9pm4tco80fuTqfpr7Dnwn9h0SfgxhKWsLf0/jQwnnjG
 wW8uTpEnk6Cq165lRhw0HRcQceFg1cwEKqJGoyliwW3tukNnC1KI+PVq9f0fA0qYf5R7
 H5uhh19eB3jC9Ky7a1ZeXNo5sdHxVBJwHCju1/WxStpigKBJO1RilPOsX/o3Nt9ON+fv
 CYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=vhYx8NCTJ3gLuFoY2YcO8xoKIGGtbLmWpknfBd4Xk+g=;
 fh=2OldP4gmPg+8i6XBEhGmm1BOzpzvnYgiTWdAr2Vo0s4=;
 b=E7N/mOP5WOcDUcOUx3DKFZ1I03Rx10iL7xv66puCYyLlkQUm5F+9np5vTdHOFBk8Mn
 y/3wYQ4OhclLVpJ5mrrx8TiYbDxAcKohnpZpCOt0f5eo3anBlLsw716cJZIuHHx0B76M
 FJO7bee4q9Y2g0oeEGH8ugv00KkjDLqAEd6d4fKb5jVdVAY/5S+JrtToW5mDzgiRwhel
 9sI2QW13wf55mjVM6h4w7Ot+on8Ss4ewKR78T8Qh5cNogknQD6IXEOJOIcdg7bUDya4T
 qePZMKqsk19LmWR5b24Zr5Q9kDDzzeqCctadkCMXb5z5U/6C7bZx6XfDa4p3cwZIGhxB
 tz6Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793502696; x=1794107496; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vhYx8NCTJ3gLuFoY2YcO8xoKIGGtbLmWpknfBd4Xk+g=;
 b=wbju5AEKH5L24+ILSIL6/BugdIg3Xzol+E6qEoGBRHckj0OWEESqfAKhoWQnt8GKpn
 92f2dpVHvmmYTRwsGHt51PW1FKl+NNmpzpPrYLP/MQoPE2eWk6gObaUlgK4CDp1ibpSV
 Uhj0rsTgQxiUpsKwH3iYGkGSBa6rzWC7umMq3iSGPzibBD/JQZdx8vCb4u1enqSUQ5Xc
 Ok4t2opd0WjuYvEU490N+STeE6mrZyJEIA+CKVRtfRAmo/Lw7O3xbSTqn3FVK8jFWyCj
 ab3Oa/fUzEWzXCjHS5V55kU0iNXd9rlzwAZ9mZqK7wJstZ7QLEyMLu5DEYc4JbQFWNW5
 gjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793502696; x=1794107496;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vhYx8NCTJ3gLuFoY2YcO8xoKIGGtbLmWpknfBd4Xk+g=;
 b=tUbREkSDkK9jnqjthz1N+EI17EY4rgB5P3BR4I65ZXwe4K22+wmsfr5Rty+1c54hMe
 t0UDHbrD+Pd8O0tcDAlGnNa4kgyW51vR60Z3JBXbtP0YBRREhraXNTV7NXKWnnbaACcy
 3uRwz0UbyxPP6dgEZjpoY6z+RsUHkTw7ZKUEw8dMOYA/QMzFiELesVzsOZIf2RLoWrjj
 KLrnz6lqRR8qkD8jCXvdUp1Dshe3RGeL1wl/qZr/dS38imdroH6QGF3w74NmmmIhEAR7
 gIVVzRc+nFh+fWmMPU7FbSvSdnoLSkMLpKnhv44F3BFfLerE/69uJIW3M7vtxWPAPWPI
 FBjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDUP1ZYnZV811XGx+rW9DRz2Gy2yYh82XHTJ2U+B0JBDNDxRRFX8KHBZpgrICdz4COYJ7B45Jk2UQg@nongnu.org
X-Gm-Message-State: AFq9FYIvhJuIn475MdInsn8+12THJYwqPt9DMLcO13VqiHCwWODENJd7
 Cnv8SP3XYdEtBcJoyzu4LnkF7VL0P94W2Da+yxsJLcQ0uM1SiR6bvcTqiPUFrTZwum9ywQqTOhw
 wiPU6qtn9wXgCHMZM6gDS1FiTWyM2QOA=
X-Gm-Gg: AYBFou0MtQWLtuKYmF4VrgnSeaNE2HbVLY9XWQn63/sbA3VayY+7p4d3/dmTo2Vknvf
 qRcwWjc99ViqOKcr2nuBeaw+fREzBoydLhEgudCbcHy0qHHWVYuU9SCBnQBMnTIzuo7mTMLXHQl
 hCwwdsd4dbqwdbeBC3Qv/BiggrmeDzu8riqqXsixj+p8czY6O+ssS07UqlfISoN1viedYmy9BhG
 tb8+Gmmy6ovIdvHUjsOs2Xl+JdZa3KgU5L66CWeCj9uqhRA39f05/bxV7BpcBvGBM8O5WdW/Ivv
 GXT922Q8Xti+bN6P1/Mhqa9zj55QmY061Pw9QrRZBx2a0v8OIIG4jtTA0Pk/zvkUU6ao5kJMdpx
 3C0nZAQ/J9sGwpXmtTDKiZbtzm06REyAPbf+W
X-Received: by 2002:a05:6402:1f45:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b4d4c6fdd6mr4363005a12.31.1793502695567; Sat, 31 Oct 2026
 20:11:35 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu>
 <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
In-Reply-To: <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 1 Nov 2026 11:11:23 +0800
X-Gm-Features: AclHuK8ADYiZfnAadMiHgWxlPjajz8RpFN0nm2TYzD60cICsbmJtIpy63UnxYO4
Message-ID: <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 7:29=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> > On Sun, Nov 1, 2026 at 1:06=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.=
hu> wrote:
> >>
> >> On Sat, 31 Oct 2026, Yonggang Luo wrote:
> >>> On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> >>>>
> >>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> >>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and =
the
> >>>>>>> type_init
> >>>>>>> function that calls type_register_static(). A later change needs =
to
> >>>>>>> pass a
> >>>>>>
> >>>>>> That's the point of the macro to hide the boiler plate code.
> >>>>>>
> >>>>>>> target mask into that registration, and the macros have no parame=
ter
> >>>>>>> for it.
> >>>>>>
> >>>>>> Couldn't you just change the macros to take that parameter instead=
 of
> >>>>>> expanding it everywhere?
> >>>>>>
> >>>>>
> >>>>> Problem of macros is that they don't have default parameters, so yo=
u
> >>>>> need variants for everything:
> >>>>>
> >>>>> DEFINE_MACHINE
> >>>>> DEFINE_MACHINE_EXTENDED
> >>>>> DEFINE_MACHINE_WITH_INTERFACES
> >>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>>>> and now would need a new variant, with variant for other existing o=
nes.
> >>>>>
> >>>>> In the end, it's just simpler to remove this and add the boilerplat=
e.
> >>>>> It's written once and never modified, so using a macro just save ty=
ping
> >>>>> those lines once.
> >>>>>
> >>>>>> Regards,
> >>>>>> BALATON Zoltan
> >>>>>>
> >>>>>>> This series expands every caller first, with no behavior change, =
so the
> >>>>>>> follow-up only replaces the type_register_static() call.
> >>>>>>>
> >>>>>>> Each machine file gains a class_init function, a TypeInfo, and a
> >>>>>>> type_init
> >>>>>>> function that calls type_register_static(). The last patch remove=
s
> >>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/b=
oards.h.
> >>>>
> >>>> Macros help reading the code not saving typing. If the actual
> >>>> functionality is buried in a lot of boiler plate it's harder to unde=
rstand
> >>>> and spot bugs so putting the unintresting boiler plate behind a macr=
o is
> >>>> better even if you need a separate version for different cases. Then=
 the
> >>>> code that uses the macro will be much more obvious and not just a lo=
t of
> >>>
> >>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
> >>> not defined properly
> >>> that causes them to not be extended easily.
> >>>
> >>> DEFINE_TYPES is another example, use them can extend easily, how abou=
t
> >>> always use DEFINE_TYPES?
> >>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MAC=
HINE*?
> >>
> >> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
> >> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't you =
add
> >> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for machi=
nes
> >> that need it, or if it's needed by all machines then make the new
> >> parameter required and add it to all convenience wrappers too so you c=
an
> >> keep using DEFINE_MACHINE* and just need to add one parameter to it in
> >> machines?
> >
> > That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means all
> > calls to it also need
> > to be changed, that means touch many $target_arch files. currently
> > it's 13. But after these
>
> That's not different from expanding the macro which would touch the same
> files.
>
> > changes, there will be much more usage on it, and if we want to add
> > more parameters or attributes
> > to it, it will be a new tree-wide change.
>
> Do you expect to need more parameters? Can't you add them at once then?
>
> > And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] is
> > explicit defined for
> > DEFINE_TYPES
>
> My point is that keeping the boiler plate as little as possible makes the
> code more readable. DEFINE_TYPES hides some of the boiler plate,
> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would expose
> some even if it's better than no macro at all.
>
> What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED that
> need to be added?

Hi BALATON
the things we faced is we first is to add TypeInfo::is_available parameter =
to
DEFINE_MACHINE_EXTENDED, and have more usage of it.
Then we will add targets:uint64_t parameter to DEFINE_MACHINE_EXTENDED, thi=
s is
a prepare to remove TypeInfo::is_available parameter from
DEFINE_MACHINE_EXTENDED,

And finally, once all usage of TypeInfo::is_available can be replaced with
targets:uint64_t, then we finally need to remove
TypeInfo::is_available parameter from DEFINE_MACHINE_EXTENDED,

That's what I am facing now. And the explicit
static const TypeInfo xxx_machine_typeinfo =3D {
    .name       =3D MACHINE_TYPE_NAME("xxx"),
    .parent     =3D TYPE_MACHINE,
    .class_init =3D xxx_machine_class_init,
};

Will help me avoid the issue. And I think this is a little boilerplate
and very explicit.


And the
    .instance_size =3D sizeof(MachineState),
is indeed not needed, they sharing TYPE_MACHINE's sizeof(MachineState)
is enough.
Even though DEFINE_MACHINE expands to .instance_size =3D
sizeof(MachineState), and it's redundant.
So I think convert to DEFINE_TYPES would be a good alternative to this
issue, less boilerplate(not none)
And dealt with the issue we faced.

What do you think about this idea, BALATON

>
> Regards,
> BALATON Zoltan



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

