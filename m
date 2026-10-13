Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76878CC6B03
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 13:28:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGcXd-0007mq-Eh; Tue, 13 Oct 2026 09:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGcWX-0003w2-J7
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 09:26:38 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGcWU-00054w-AD
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 09:26:32 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b0a36f1c95so16659687b3.2
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 06:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791897989; cv=none;
 d=google.com; s=arc-20260327;
 b=T4iD/6FZGyfSw4FglNby7HuplwOyb+6Tg/ObQsDMq0AYMGeDAFslB9WL2qBCs9KGkB
 siyZsVQU9davPNOfg/Z9UdGMUuagxNfrPSUCjvhYIkpSSPdR0PGaV4OOGP47pxyZIsVI
 v2qzkub96GowOWcX+CCavUotHzgKzv+UIIaoVzKLPMjBWbUjklG5NsWU+RxLdgO26NeF
 L4IN5VgpUivddKdINts9y1rDofT7hSzxtuWgo55YBwV4vd6nBJ57ci3MlG4smGr/7I0D
 BVrmigZAdiAALoJUM9U1oQ3ulOwDGu6wj1xd7KQ8H2YP2RJempbXWwO7D5gcfS8o4Dsh
 wGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BxjKlSnFW7VCYLeeGqCDT1nwAnPJiESgUTFF/yby+lk=;
 fh=901AY/qCTLdEP8yEAn9wZDFwuLE88Es09NPwXZ9/zk4=;
 b=NJVPntxTcuOLn+prcIrcLCTumxcUEmGK6/U1MnOz4VorXslWOYt6ZKIpf8wjhNBs/N
 ZWDis1vjq+ugcg6qt0ko+QNlh1gGVlcI5s3YAOikRzPDHeYSDm5+8y59CDWWJ8U8jBGH
 XEAZzUwv465BkuOpL7Eijyxi0XGsq8c8UBFQIgKdzYsbTdJEET6C6yEwgBHH+Ssl6X7u
 X4CfX7dTErhmL9OltOSDgGnEBx7BDXy7wq3zRj1+vNMqpialKczfzddz9Dt8dgn3O3XS
 +vel/30DB2zQ9m9LYsyIBGdaWoGLRD+cac7guGaykUPgIcBnenJu3nh+3aVR542vfHPO
 oeXA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791897989; x=1792502789; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BxjKlSnFW7VCYLeeGqCDT1nwAnPJiESgUTFF/yby+lk=;
 b=cmqnZ0Twj3kWq9IHV4tzxfc+YO5KlyAbhBK50sVqEcxoN0rkOw98s7BC5au6iDSPqV
 pOQ8CY2lyitKPus/xtyfrqvwJuSyJnOZhU2BrlIVubDlLxHlHvpM/7DaZ3MCHwWbT1Aa
 VBtX93xcDJINt8jmj1cx4786aPmOwA3bDKuvd4+s/+zQHy/dhgZHqiCyOMPOqYIGBJBt
 3LYbefBBxM9vq2DA4BuuoSjW82O/dTst7YecJV6nejTDDy3AI3ORnllbMzcrKd8lrD7J
 iQYF2ZbiglUdsgmgW36RdBmewJIPiDVp1wlD7HTlyALFA5xi6NN0Z3ul9w8M4KLZnm/8
 rUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791897989; x=1792502789;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BxjKlSnFW7VCYLeeGqCDT1nwAnPJiESgUTFF/yby+lk=;
 b=qQPV4QbRejF7zaNWaBEz6QEwvUbdFou1Rd8rd3f95I7m5VEN5MFtQUaN/bC0s47d4l
 Qk1seKts8sRx8vP+2sJkBWEbp7GpsukFaX+7oLZfSiaQST1IqvX/59TO0cxM+vx/hQYp
 txiI9OQfe6OxLoYWnHd5hpDqJRIzzRVlitr98YZsaG6KgzjpeAAMc4sp5sKYxhSjLUQd
 a1CtVP20X6t2HGIWXaMVJ+ixVnbJUV9vK+xcRfF3cXndCGRaTO8i0hHX9wA26xqNwC/G
 MlbME8ttndilORD7Qun/4GrP1yl//DBXC7a/AWYzL6kgNOjluOvo2R0+V8yK5FjU5jCl
 z3Sg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzV6LInHaDp6YRpKHVmgXmXQSf6GqJqW7q+NW5AixjFQqTz1iRBwwri9/KOkS0rBY+z3kMH/u19mYB6@nongnu.org
X-Gm-Message-State: AFq9FYLdBK4wxXfrHw6jhI/O0fWluJMZNHhvkG8IrSi8U2THGT5Yne1J
 Tjh05v3Jb7lxX06wHZf0iRanh/5EaK4mbvzXw8JfirRQDgoQE7IsXVQVcFJfvGrV8mOj7fLkyj/
 gQwAPgUMaLkSYO6tjry3nvZW09bwM7wZiQVAhYIqcpQ==
X-Gm-Gg: AYBFou0c3JNhMlRQPhxiCZx2lN3+cjZ1VAQ03nwhR53+XKn3GndsynPVhkUKkO0B2Yh
 c+NNC79DzU3+zMbKrTMrrzjyjDp6x46y4ylumb0hGdsBn/zxv315V7g8LFlYiOAaBkl6ntTx2YY
 TiVyO23Os8uR+rIica13Vx5Fy+kWT9Bmw4/WpgPrgzhcNMPGOdiRlRJdfkYCMVe+ZTz23L1tOUq
 SatBF+rUPc4nlRACzg29d97HV58jqo/u6BfSOE0ntqeA+debIjKNh4+rfnc5GDO47Kl/tGF4jFl
 aa6E8B5sk/Y+24TiTiDCi3htQsjrfeo0eRupxH3FNptMiW6kO52+Ni+wRkFZOXslwsMn2H79RXK
 SD97vo3KTDyGQJgDvi/mOL/xD0b7hNMTu3Dstg40=
X-Received: by 2002:a05:690c:e68b:20b0:8a0:6e6a:1312 with SMTP id
 00721157ae682-8b07ee2783cmr37314737b3.29.1791897988509; Tue, 13 Oct 2026
 06:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-query-reg-v2-0-6f95a2e139a9@redhat.com>
 <20261013-query-reg-v2-4-6f95a2e139a9@redhat.com>
 <87ik36gfe6.fsf@draig.linaro.org>
 <CAJ+F1CK938-GciwPJj_KjtvKZ04fvKhi8UcSHHORmoboVURzeQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CK938-GciwPJj_KjtvKZ04fvKhi8UcSHHORmoboVURzeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 14:26:17 +0100
X-Gm-Features: AclHuK9NAF9EYHepxe0Cdi_y_NuX0msAEX4qMG1Ft9XjPqcq1h9pAGCcJ6CuGc4
Message-ID: <CAFEAcA-sKfp-1u_UaPbv=SCbDNYrdc69NZdVPT8RTTXgwXYSZQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gdbstub: add gdb_register_internal_coprocessor()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 13 Oct 2026 at 14:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Oct 13, 2026 at 12:51=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
> >
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
> >
> > > Add support for registering coprocessor features that are only visibl=
e
> > > to QEMU's internal APIs (HMP monitor $register expressions, plugins) =
but
> > > hidden from GDB's target description XML.
> > >
> > > When a feature is registered as internal:
> > > - It is excluded from the target.xml sent to GDB
> > > - Its XML is not served via qXfer:features:read
> > > - 'p'/'P' packets for internal register numbers return E14
> > >
> > > This is useful for exposing system registers to the HMP monitor witho=
ut
> > > affecting GDB's register namespace. Exposing aliases or synthetic
> > > registers through GDB's target description can cause problems: name
> > > collisions with GDB's pseudo-registers, independent register caching,
> > > and missing DWARF unwind rules.
> >
> > Hmm are they *that* useful for HMP then?
> >
> > The front-ends do limit what they export to gdb (see for example
> > ARM_CP_NO_GDB) generally because reading them causes side-effects. Thos=
e
> > restrictions are also a reason to limit them from the HMP interface.
>
> I am not a user, but I can imagine they are useful for developers.
>
> I would like to be able to implement "info registers" purely based on
> QMP for ex.

Yes, getting rid of the current hacks that "info registers" does will
be a very nice cleanup.

I think that the reason we get this internal-only interface is
that gdb itself sets up pseudo-registers for various things that
are nice for a human to have but are not directly exposed that
way in the XML. So for HMP we can either:
 (a) not expose that human-facing convenience at all
 (b) reimplement the equivalent of the pseudo-registers and
     aliases, to the extent that we care to do so, in a way
     that they don't appear in the XML we expose to gdb

Personally I'm sceptical of the utility of the "info registers"
interface -- if you want to see what the guest CPU is doing then
you're going to have a much better time connecting gdb to the debug
stub rather than using the extremely rudimentary monitor commands --
but "preserve the existing functionality" is a much easier path
towards getting this cleaned up than trying to get agreement that
we can drop some aspects of it, so I support doing that.

thanks
-- PMM

