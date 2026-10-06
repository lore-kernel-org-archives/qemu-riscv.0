Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F1CA5FFF
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xENFw-0001Zv-F2; Wed, 07 Oct 2026 04:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xEJ0T-0001lS-OL
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 00:12:18 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xEJ0Q-0006pb-LD
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 00:11:53 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-53391786e55so18696551cf.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Oct 2026 21:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791346306; cv=none;
 d=google.com; s=arc-20260327;
 b=CWFGxF6VuNfD88nEC2KTl59N3j1E5heYEzTu8PG3H/h6c2IiWAC37EKy30i0Qi3LCJ
 WuTvrwlY58sQOtUhdGQQaIzcotXQfGOcq6Y109uKmPu3SqWCW00NqemA/SQ6rUKDMZXs
 bM2u+nF1FLiHi6HF55JJEHGxC87dt6Fpb+AeagGsSxPSY8yP4z9g4VKalYEzhGpZiBOl
 8yvAacFFIJmpR8QllYE5ASg6nomG++6QxTvX7ElHRmhcsDIxUX+zPr8NVR8Gx0+lWM9c
 Qk2Q3VLkZa32DLlJzt188rr+5yAO2kpay5NJVfqyUaLeD8F2KrMTjmaVpb/30ZR5jsPu
 /jIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vCUogBX76A4PNkRqpBF2c8Vgx8g3b73735jcch5yTeY=;
 fh=w/GsEIGS9ITjR6ZopufzJSrY4KItZGRgKHbImF7msOU=;
 b=jelBV6Mn2LNCnSYdAtmFQQrzZon6Gcd8lkoBEdXy+p9YTocdOt4WHJfN1a3bTlD92a
 iR4Ix7jQZ4p8CHgovU+GoPxqjjFl0RCZXypVz8KH6Pj1a9Ium/43Ip9+Z6HtuDRKqqr8
 aEnU+VqA9ZmRTPswRrPgWLg4Rrkql4jqxB4Se7niy0KkAUPlyYB3vdXG1RlEDf0wwoYe
 F5NhLOM6vRDzhR3dr+jXS7JSmV8jx8Vzf7xx5xUmkYEgyNejhkrwede8tBs+PVRkWZFM
 Y0KErZuLcvpLzRZqJJJwrSy8QR8I3vO5r8ssX/J/s3h9DfmUmLAssCeLZDuerZtFR7Xt
 cTzQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1791346306; x=1791951106; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vCUogBX76A4PNkRqpBF2c8Vgx8g3b73735jcch5yTeY=;
 b=bUcC8veWZOGP/DavZgPCt2c2TXqQppMPIfsmPmzVSnNxVW11JboZgqVfAIQtLM5r58
 jvVGY+n9ci0Xd5+lrxRwGYF+GRo0x7Wf3cxPQgTrlDM1xkSYtoYeJYZ/jy6vso4HIGLi
 nb6fg6+QTLdqLKAvd7j6RLkHjon/+gKfGklTch8XebGpYGLzadGKF1C6yvDlvsw8s00B
 sOaYWvtQVnFrmEp6BIjr5MS84vmgD2g+mGSncaaLm9couD1Kp8BoORNS30XtKAVJUrIR
 42gr0Zd0Ul85it+u8N1VqYhNhO6vTv5bqyFYmFdv7UIBB3ZjHLdQJW44O7efYDoZaQC7
 Yh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791346306; x=1791951106;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vCUogBX76A4PNkRqpBF2c8Vgx8g3b73735jcch5yTeY=;
 b=bJf8+RSAapk0zoXN72mAfvLlCsgJPXykXdYvOsZZHPPEg1fPx1QD37OcJnQP66E4fM
 xeaf5c+hchyIi0VITYzv8H7hP8vCCI3Sd52iGJZQoc9XuZIomKu4occMWO3AQJrzZaPJ
 MLXWsg3de0Bv6OFrYDY8287bKBHBdx0ZSDM+jXUNkusT2LzKlP41ZoQ5qVbAEY7rtmwD
 zo1Jxp982CuUACIo+E6MSRJ2ly1mYiHtH+E3fVw4FHLBfnZRl2sdfijeOyJBDPDNTU8u
 4axXPXgctH3hI+GsK9LWuAhXXT4WfYZgKiA6fQVNIDlC4xf5rrz/aZ9rwCfezuZq80wV
 Fg1A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVdJx8lBfzNqH9PsG8u57G6+d3EoRAynfSPHfv34c89gsAaxANRLi/mi7Ygzv0FViE7EHpNYdHGUyQ@nongnu.org
X-Gm-Message-State: AFuF++nE5DZ8MWb//glug9zu+RWwEOGZ7qTQduh8ROmtsZagnHR2Nnxr
 BbQu+W8yVrFR90AqltDHj4kRpZMiP6JKt8WgGJt+ziniuY639LTjFScpgs2b5O4bbh2SxrShMUi
 d6uO1Ps/+dGck6L+7FuHRbf3g60JHsULUtE8h
X-Gm-Gg: AYBFou3FcoiLXaxl92nvOif8FAk8Pf6tQsKG6SFLGsUhbEP4H15O07Zx3IRHdXilXCE
 PAtk7x4NHMIF9KWGgWYjU4zY87YELsIBxfKir1DH38Y8jt7L+UBRKXBVdQ9vwNBXmESIQIk6QyF
 n5vUPrv7PKAnbRm7T68z/mJtVp/FuAwbV8BEsZMOV59UBEEUMAS8RvJ8btydwitXWKsoAZfcqvI
 td0EV50nc98dYDW+EiRbjT/aDGUcqM+6r7GjsARfijK3+z+jcyRYt68vMoN6I8vmL/h7ixxHRAc
 ccSw5F+er5i1pFpDzrKLVMVIKPmLKjlBndXbt1GC5tYIQ84v0tteloHw7F915nB3Ulj4Q+2U1t/
 cSr83nqDrEXoE
X-Received: by 2002:a05:693c:83d9:10b0:343:80af:5ab0 with SMTP id
 5a478bee46e88-3514e3285e3mr1583202eec.25.1791297111054; Tue, 06 Oct 2026
 07:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
 <1b9d9cef-8f65-4e96-9e7b-fd136f64a75d@oss.qualcomm.com>
 <33ad7803-82ad-49f0-b39d-d3a23807ab75@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <33ad7803-82ad-49f0-b39d-d3a23807ab75@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 6 Oct 2026 18:31:38 +0400
X-Gm-Features: AclHuK-kbtdLOIWlDva4Svd6YVmMvahlYS-c4-tOA45DeYixouliCXuXbbxC1Rc
Message-ID: <CAJ+F1C+0A4_VU3aNk=fWwvR=MPbe3Zw2zyeFnyCGmJET6fAoKg@mail.gmail.com>
Subject: Re: [PATCH 00/10] monitor/hmp: replace MonitorDef with GDB registers
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
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
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Akihiko

On Thu, Oct 1, 2026 at 12:03=E2=80=AFPM Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> On 2026/10/01 2:18, Philippe Mathieu-Daud=C3=A9 wrote:
> > Cc'ing Akihiko who worked on gdbstub.
> >
> > On 11/9/26 14:27, Marc-Andr=C3=83=C2=A9 Lureau wrote:
> >> Hi,
> >>
> >> HMP monitor supports printing $register expression. The lookup
> >> was done via GDB stub registers, and supplementary MonitorDef
> >> HMP-specific tables.
> >>
> >> Migrate HMP registers to use the GDB infrastructure and remove the
> >> legacy HMP MonitorDef. Use a "qemu-debug" register group, as they are
> >> aliases or synthetic registers, but gdb doesn't seem to care.
>
> Unfortunately, these aliases and synthetic registers appear to have
> several problems:
>
> - GDB already provides writable pseudo-registers for SPARC64's asi and
>    pstate. The new QEMU registers shadow them but ignore writes, breaking
>    previously supported functionality. See:
>
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dgdb/sparc64=
-tdep.c;h=3D93db3417a2a9f64790acab33288eb05764112e0b;hb=3D6a5e5259790e5a854=
ddbb69eb486b9245fcfeee8#l976
>
> - GDB caches each raw register independently. Updating one alias can
>    leave another stale, causing incorrect reads or skipped writes.
>
> - The new raw aliases do not inherit the original registers' unwind
>    rules, leading to incorrect register values when selecting older
>    call frames.
>
> The latter two issues also affect the RISC-V aliases and cannot be
> resolved merely by changing QEMU's register read/write callbacks. I
> therefore think we need to retain HMP-specific handling for these aliases=
.

Thanks for the feedback and findings! Would it be an option to have
qemu/pseudo registers use a prefixed name like "qemu.", then it
shouldn't conflict with GDB. HMP would need to try with it if not
found. Wdyt?

Alternatively, keep the monitor specific register lookup, as a secondary pa=
th.

> Regards,
> Akihiko Odaki
>
> >>
> >> Known behavioural changes on RISC-V: CSR lookup is now case-sensitive
> >> and vector registers now report "unkown register" instead of a
> >> target-specific message ("Unable to print the value of vector vreg 'v0=
'
> >> from this API")
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >> Marc-Andr=C3=A9 Lureau (10):
> >>        hmp: don't crash on invalid register
> >>        gdbstub: fix next register base after register gaps
> >>        gdbstub: set feature->base_reg for dynamic features
> >>        target/i386: expose segment limits via GDB
> >>        monitor/hmp: add CPUClass::get_pc fallback for HMP $pc
> >>        target/m68k: expose system registers via GDB
> >>        target/sparc64: expose system registers via GDB
> >>        target/riscv: bypass smstateen check in debugger mode
> >>        target/riscv: expose register aliases via GDB
> >>        monitor/hmp: remove legacy MonitorDef infrastructure
> >>
> >>   configs/targets/i386-softmmu.mak          |   2 +-
> >>   configs/targets/m68k-softmmu.mak          |   2 +-
> >>   configs/targets/riscv32-linux-user.mak    |   2 +-
> >>   configs/targets/riscv32-softmmu.mak       |   2 +-
> >>   configs/targets/riscv64-bsd-user.mak      |   2 +-
> >>   configs/targets/riscv64-linux-user.mak    |   2 +-
> >>   configs/targets/riscv64-softmmu.mak       |   2 +-
> >>   configs/targets/sparc64-softmmu.mak       |   2 +-
> >>   configs/targets/x86_64-softmmu.mak        |   2 +-
> >>   gdbstub/gdb-xml/i386-segments.xml         |  14 +++
> >>   gdbstub/gdb-xml/m68k-system.xml           |  32 +++++++
> >>   gdbstub/gdb-xml/riscv-32bit-alias.xml     | 105 ++++++++++++++++++++=
++
> >>   gdbstub/gdb-xml/riscv-32bit-fpu-alias.xml |  40 +++++++++
> >>   gdbstub/gdb-xml/riscv-64bit-alias.xml     | 105 ++++++++++++++++++++=
++
> >>   gdbstub/gdb-xml/riscv-64bit-fpu-alias.xml |  46 ++++++++++
> >>   gdbstub/gdb-xml/sparc64-system.xml        |  22 +++++
> >>   gdbstub/gdbstub.c                         |  14 +--
> >>   include/hw/core/cpu.h                     |   2 +-
> >>   include/hw/core/sysemu-cpu-ops.h          |  16 ----
> >>   include/monitor/hmp.h                     |   6 --
> >>   include/qemu/typedefs.h                   |   1 -
> >>   monitor/hmp.c                             |  52 ++---------
> >>   target/arm/gdbstub.c                      |   8 +-
> >>   target/arm/gdbstub64.c                    |  10 ++-
> >>   target/i386/cpu.c                         |  32 -------
> >>   target/i386/gdbstub.c                     |  24 +++++
> >>   target/m68k/cpu.c                         |  22 -----
> >>   target/m68k/helper.c                      |  47 ++++++++++
> >>   target/ppc/gdbstub.c                      |   2 +-
> >>   target/riscv/cpu.c                        |   1 -
> >>   target/riscv/gdbstub.c                    |  52 ++++++++++-
> >>   target/riscv/internals.h                  |   3 -
> >>   target/riscv/monitor.c                    | 140
> >> ------------------------------
> >>   target/riscv/tcg/csr.c                    |   3 +-
> >>   target/sparc/cpu.c                        |  19 ----
> >>   target/sparc/gdbstub.c                    |  38 ++++++++
> >>   target/xtensa/cpu.c                       |   2 +-
> >>   37 files changed, 562 insertions(+), 314 deletions(-)
> >> ---
> >> base-commit: 209b2afaface001c7d4d981e38f186afe7b24a50
> >> change-id: 20260910-query-reg-80cd59cf4707
> >>
> >> Best regards,
> >> --
> >> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >>
> >
>
>

