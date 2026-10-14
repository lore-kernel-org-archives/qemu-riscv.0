Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD3CC6B1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 10:49:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGwXj-0006ix-8f; Wed, 14 Oct 2026 06:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGwXg-0006hd-3w
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 06:49:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGwXc-0000zX-Nd
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 06:49:03 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6af9a9451daso6238303a12.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 03:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791974939; cv=none;
 d=google.com; s=arc-20260327;
 b=P5CVSjkgnCh5/9w9a6XQBlcHfowVwteagP6eXDKLMI/ah5C11zbbYW7OWREu747eKh
 Aoz9ng1tZVDmsaPXju/EaBGI/UY1fh83A4cCzW6H4sli0jvB5cL/m5ggpWYPgFO+blVI
 aM7YSNexW/0bsTmSDcueBBFeIf+j3mWvt8f8DcBjf5VCzpmsneKhGlZoadPOedNvKox0
 1hgP3CLBZrkjNd4+Rh+pC84Ou/oFqRM9KhZ+0iEfF5A3TRA1eS50ba+Xn9zArEtQ4sAn
 wrvApEeMujT3l+LENsdc3WRW6k4kdgdyvZvyNJ4VYpPVO94G+NqDXNXgYSTbk09V83+g
 c8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Vm4UdWBLGMY1/33zteiFmhB7a2Bd38ynxMbjpAoT3XQ=;
 fh=CjxV8M4WfmU4M/g7VOc7Ldbj6rCaUODHT+AxCjvroOc=;
 b=shlR4EGuubkKBPYV1fW9yKg1GliPcTvrI+mjiKoV4duZHxBWlG/ki3pdrGDhrX66Eo
 r2ZnOjhYx5X+8LawgzkVhUYk/mFflBHGPnNm0Xy4ItjgxLbtKwiNqb1Zom2yidBEs//1
 YeIc0wnA5cAGjXTa9C0rbh9jOHguJheqnG37Q2vchsgqPp/dxNlt7q8Z9iviWFUZF10x
 UyXrLL9P0U+fnzeAmuK5pVTwlvYnz+TlHXps9nUpB8Z0mgY6uklsHnkk25MLH9e4o8v9
 qX2r5Zz7Zm8N5YL0+bTy1VuoLYLtpFI35ZLlOi9ykAKN7B523nL71BKAm0dkZJC4Qtn/
 y4nA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791974939; x=1792579739; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Vm4UdWBLGMY1/33zteiFmhB7a2Bd38ynxMbjpAoT3XQ=;
 b=dhmOeUn98u18Ozv6JjCQkWnOhHHL31N1FNiZCN3jR/CvfNgdAdUB79OazvNbw5XPsP
 +U8MvWQcPeC9u6J+WxoKBPU9tWhkh+4lnCzMYnbl1znimcI+1YASWATJ2qWTiVRfbWxm
 i7vRMssoyiWcedPyEyOvSbVYJ3wbPVzQUhhDMbkkoCM4/dkHE987vn7bWeI4F9GHJ+AO
 3sWrp491NYwXh1jgU7g2pZoCCET5bFhrkzu7tFoO468TzBPJpuL/Dsms64lKtizRIpbN
 dUdqC+4ElLH0ItGdXRtx2qwRcndLhnsWjkfrxxuv4wONR8gOrQ5CQjyXp8jyBucY6xpM
 puvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791974939; x=1792579739;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Vm4UdWBLGMY1/33zteiFmhB7a2Bd38ynxMbjpAoT3XQ=;
 b=yBwtDZHFwHCV8ZjAUyhKTR1WaFYfOW8E7KT1855C3peQV+yNsYq40KhVOCrajyK/oM
 V6OGGqG7VFvLIlc0m/JWvylEbtr8zIdKvkOu814ZEoWCGTStV11+Lcfh2Jsjw3/URrpf
 Dk/0ycVA19dzMklspC/BOjVfN/xElrfR5LPLAM/GeWai/mgBGv1RsCTiQ8kUtt3W/PcQ
 JVvLBPnSpqIGVVcm5RpbJFNbyfXTlGJ0rH2HegdYBZjgclwW8tmKXuaqV2onGUpJy6zC
 70bIXfdXFI6ni0hLTBis8sh+8SmuO9lGED+WxBiunRlH6sOyHsufiCXFUcrsV2IySDFQ
 ZmoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzi0UUEPRZnMwDpNU1m/cTRaEECZdZsu6gGRTWLXM3Zw+l3lpXiqy+K3bgzgVizPPa9QlxY5qynRyPi@nongnu.org
X-Gm-Message-State: AFq9FYL/bFTM9ZgpAP/wpj2g7UeG06JKdVK39z9uWkJ0z69BYSGFVpu8
 Ci/cgQQPcRKqUr8fvzsm1MrZUCTnh13yltmPQDynOWY7SLyqqjmJ5Wh2HSWOqeg7qP48VSYjetO
 UPxO5tm2op9PCtdbWfpyg/htmieUjFkc=
X-Gm-Gg: AYBFou3cBld5xcnR/UdppLSkOnChAjtflQYmXcsR/Py0ilj6vIzWDDPOKxmb0CCfSv1
 KXiK4bWAbL/Bee6i6oPRjiy8otjZiVQXrHCPsmATCxtfcNgIaSXTEXAVQfkpb9okFfayJ8xdI8Y
 tKZmljK4v2JHMnwY5spGxR6pV9C9rJfprKtMZx9sBrc+iU+7ouqFa+tXLhbWK5ztcZDcRTGCUgi
 EpfijOTBDtUafqLk7n5oP8OQ+9teOJ1kzPIrGn2ZP3skhUp9iG5FwkaObnocV9KDr9JyeOAiEgi
 AULhaAfe/DshAhFqW+LBB1NxNoYV6pN8Ta0kjvC8hDCs9ryCRTXnapo=
X-Received: by 2002:a05:6402:44da:b0:6af:8022:ffe4 with SMTP id
 4fb4d7f45d1cf-6b17c2b5870mr9690638a12.38.1791974938747; Wed, 14 Oct 2026
 03:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <20261014093152.834-6-luoyonggang@gmail.com>
 <e09a64d3-7632-4f90-bd69-0c6097f8cd78@oss.qualcomm.com>
 <as9ZvlmXQUwvm0vz@redhat.com>
 <5d86e4c0-43b3-475b-b135-29b9d685d13b@oss.qualcomm.com>
In-Reply-To: <5d86e4c0-43b3-475b-b135-29b9d685d13b@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 14 Oct 2026 18:48:46 +0800
X-Gm-Features: AclHuK9uPxvtfRhW7ESLgpVV_cu6gA6XspSKH1AK2-K599jdYaeO_JC3w74U-Vw
Message-ID: <CAE2XoE9uPmQUDNUubFZ7v+E=++PDEmNTz7LXVpzHB-EdrJipfQ@mail.gmail.com>
Subject: Re: [PATCH 05/34] qapi: add missing Linux user-mode targets to
 EmuTarget
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-s390x@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 qemu-arm@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 14, 2026 at 6:45=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 14/10/26 12:30, Daniel P. Berrang=C3=83=C2=A9 wrote:
> > On Wed, Oct 14, 2026 at 12:24:57PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> On 14/10/26 11:31, Yonggang Luo wrote:
> >>> This usermode targets:
> >>> aarch64_be
> >>> armeb
> >>> microblazeel
> >>> mipsn32
> >>> mipsn32el
> >>> ppc64le
> >>> sparc32plus
> >>> are not in machine.json
> >>>
> >>> This is a prepare for directly using TARGET_ARCH_VARIANT latter.
> >>>
> >>> Also get target-info.c to be compatible with future TARGET_ARCH_VARIA=
NT only usage.
> >>> So that we can define TARGET_ARCH_VARIANT to target_name directly
> >>>
> >>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>> ---
> >>>    include/qemu/base-arch-defs.h | 13 +++++++++++++
> >>>    qapi/machine.json             | 25 +++++++++++++------------
> >>>    target-info.c                 | 26 +++++++++-----------------
> >>>    3 files changed, 35 insertions(+), 29 deletions(-)
> >>
> >>
> >>> diff --git a/qapi/machine.json b/qapi/machine.json
> >>> index 07fac4f0764..a3d6e08a847 100644
> >>> --- a/qapi/machine.json
> >>> +++ b/qapi/machine.json
> >>> @@ -15,11 +15,10 @@
> >>>    ##
> >>>    # @EmuTarget:
> >>> -#     The comprehensive enumeration of QEMU system emulation
> >>> -#     ("softmmu") targets.  Run "./configure --help" in the project
> >>> -#     root directory, and look for the \*-softmmu targets near the
> >>> -#     "--target-list" option.  The individual target constants are n=
ot
> >>> -#     documented here, for the time being.
> >>> +#     The comprehensive enumeration of QEMU system and user-mode
> >>> +#     emulation targets.  Run "./configure --help" in the project ro=
ot
> >>> +#     directory, and look for the targets near the "--target-list"
> >>> +#     option.  Individual target constants are not documented here.
> >>>    #
> >>>    # @rx: since 5.0
> >>>    #
> >>> @@ -30,17 +29,19 @@
> >>>    # @hexagon: since 11.0
> >>>    #
> >>>    # .. note:: The resulting QMP strings can be appended to the
> >>> -#    "qemu-system-" prefix to produce the corresponding QEMU
> >>> -#    executable name.  This is true even for "qemu-system-x86_64".
> >>> +#    "qemu-system-" prefix for system emulation, or the "qemu-" pref=
ix
> >>> +#    for user-mode emulation, to produce the corresponding executabl=
e
> >>> +#    name, where that target supports the respective emulation mode.
> >>>    #
> >>>    # Since: 3.0
> >>>    ##
> >>>    { 'enum' : 'EmuTarget',
> >>> -  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'hexagon', 'hppa', 'i=
386',
> >>> -             'loongarch64', 'm68k', 'microblaze', 'mips', 'mips64',
> >>> -             'mips64el', 'mipsel', 'or1k', 'ppc',
> >>> -             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
> >>> -             'sh4eb', 'sparc', 'sparc64', 'tricore',
> >>> +  'data' : [ 'aarch64', 'aarch64_be', 'alpha', 'arm', 'armeb', 'avr'=
,
> >>> +             'hexagon', 'hppa', 'i386', 'loongarch64', 'm68k', 'micr=
oblaze',
> >>> +             'microblazeel', 'mips', 'mips64', 'mips64el', 'mipsel',
> >>> +             'mipsn32', 'mipsn32el', 'or1k', 'ppc', 'ppc64', 'ppc64l=
e',
> >>> +             'riscv32', 'riscv64', 'rx', 's390x', 'sh4', 'sh4eb', 's=
parc',
> >>> +             'sparc32plus', 'sparc64', 'tricore',
> >>>                 'x86_64', 'xtensa', 'xtensaeb' ] }
> >>
> >> 'machine.json' is for system binaries.
> >>
> >> If we want to expose these QAPI types to the user binaries
> >> (I'm not sure we want...) then this declaration block should
> >> be moved in another {qapi}.json file. QAPI types are versioned,
> >> so we'd need some "  @aarch64_be   # Since v13.0" comments.
> >>
> >> Anyway I doubt we want to alter EmuTarget, I'd rather let it
> >> die as a legacy field, and expose {arch, wordsize, endianness}
> >> to management layer if this is important to consume.
> >
> > Libvirt uses query-target so we don't want that data to go away.
> > If we want to expose other data alongside the target name that's
> > fine.
>
> I'm not suggesting to change 'query-target' format; the opposite...
> If we are going to add 'query-targets' (the plural form) then we
> should report something more useful like {arch, wordsize, endianness}
> but not that EmuTarget type which I consider legacy.

I think it should be moved to qapi.json. As I needed it, do you have a bett=
er
way to have an enum for mapping target-name to that enum?


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

