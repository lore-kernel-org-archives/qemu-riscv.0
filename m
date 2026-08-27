Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01968C61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzYRH-0000LA-9W; Thu, 27 Aug 2026 07:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzYR6-0000Jp-58
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:38:24 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzYR3-0001XJ-Jr
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:38:23 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66e452df0easo286868d50.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787830700; cv=none;
 d=google.com; s=arc-20260327;
 b=jTKIRgSPpWUexbqLr3SJcbKk+yBAWE9v4JGFOynYXL57TdzTzN1hZp1wQgZZSkkfra
 MAgDnm/xJrTgkjy1mcTSdPnmi/StiC/ElnjDQ5F302aFi3s/W7PalUrPhDQpQZorRx8U
 Vpbsl0XLgEEPoIHBD/goz1CHCgpUclpJVHaKXoT4aL/wOpJlOIhPjK1IhRKGxOQIVSTh
 OM/oVkP6QaNcj38I35+38d7EsmKMf2xXmG71VXieVzeUb8Co8Kt+MA+VsGQMcWemQDOl
 2xxZ/1vf/NAuTCi1s9sau4gGJJ9gm31OaaQ34MKflPVxDhrkbiInm3prBq7Gni0AjQRm
 QQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=smE1oioKynN20kHMh+tO2twTO8YmnrAzbMbMtnZZ3+U=;
 fh=oo3cmdzTDgOG0lIX3qCagfe2Mp7ROBQgVnYWHIOjUvQ=;
 b=a2+19G7WZpPfPXc7HC8i+KFrzhMTwJTgrp8/LInZfmBz4pxE1QUJ9o61ilwl99XJQv
 D2LLuFHy/iU82ob7GDupisrTe9+xkyVXdhig/Czx2151SwqfIqvXclC2PhVWV5uxX2lW
 MLZAAz9kb0fFeQDh04wxOZCHJUDY/CLc/uXVkLJ/k65Cf2dHqixW3k3XXu8lm7roBP9K
 Ch8/etAJz1QefGOEPBv7b5qITnPvOCueOa4ESto/iMe3ctuA5GT8dNQKQ83SIDC7IXar
 8hveNaJDCRwZQos7ug3B52gP4ETxc9u7r6hyMLQNnnXbuym3lXAngVyWfGKr9ReINR3O
 iVNQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787830700; x=1788435500; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=smE1oioKynN20kHMh+tO2twTO8YmnrAzbMbMtnZZ3+U=;
 b=BzWRAHQD/02JTDcXjJGAFMWlgjyoX06mdL77yASa4NNSTe8RM9k8vOGgg/Nckld6Q9
 CZH24PbLK86/DjV/HW0RsD7shp7Agl7y9Y/FaxXWZ7EWKO+fHlg9U/g/G7jbITYLkLJY
 ARxPf3wEPen3zAHEWxykLTyAdkyhd04a62EBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787830700; x=1788435500;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=smE1oioKynN20kHMh+tO2twTO8YmnrAzbMbMtnZZ3+U=;
 b=V1ZGJT9Jm7/i4cWYZLremHE+kIaTBfzKgRn/7RcPZ8V0r+SMgm7de4W3En7PMAgkED
 i40fW3W0+rVuxmC+rfO3b093rreDeUGrSZSEkuBL6T8z3g3GuS1qrR71yL13XIlBSJfL
 N2xWN+T8AAWpKx8T0Wphc8Vmtf495tZ+28yrRzpJ767/P7BPf43icSLhIMgFT4mxziGA
 ZS1zmAAo60Fx4ZDVKDp3EW6ARRQD8nrajFt0ERs5c+4F2xGmfEtMpXJrNXOvD53Q3+BJ
 NpQA3SDlBevow+8/3ZJmH15V2PaTBCu62oKmeGjfXxWW6/DtqOXlwtKBBw3FcrLmN3cQ
 FDLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro19Yc3vy834luW/f3SUMl6GP/MbMetMY7d3pLxKxrlK7CdqstblaKxRlCNv1tNo8BEThFvnA8Qh47Y@nongnu.org
X-Gm-Message-State: AFuF++mE2ILb1PajwX4m1tJviTXAlL7Nc6GktvK3UxZQGyMGXmLIijJ9
 v1HaEJJTMmmwDSEOyzB/GFizYvwDZE4xSzSbiZVqGsHAanRbFM7HmzXgwjNTujOErkvy4RxeyCg
 f1XubRLz3kKm1yZVf1d6npfQsmoCywFQ=
X-Gm-Gg: AR+sD1090ROb1vGVgJAlMeG39Sl79kOlfvUNkk7RuLI7/7J/nWWzzBuUMZB9P9mz+AU
 WLnqI+e144j4OSjhZVo876LO0BOGeF0LMZAYMgF0UbQkI77UiiWVC/SREpms9flcqpnCF5eHnHY
 ZflYz6Lm12DVclMsiao5tSo9dE9RhefHyN+c735y5UkFna4rR66rGws9gFiQSt1XovaoxKb0oxU
 zUnhXUNkolAgxcYrIjWn1PqCxmdteaMKE4WHi/7XzkR6qwChQ1T0WDgrBb/w7MZVK98YAbClTaQ
 FpIQlbuyNm1JzZ2ajioISR/6COJtwkOqXm1ioV3ZqKiAiBOFPeKELGvomhZi2YkXBHLqNCaKjB5
 U8JAkGWGJwl5vRQiTJ/R8mKg7YpXe07O+3qcjILU1oZ2tqEncvhE9rZw/3Ziyjiqiqc0GYU0/Dz
 84dN7OkVOf9ssM7Xdo
X-Received: by 2002:a05:690e:bcd:b0:66c:e0ea:a25b with SMTP id
 956f58d0204a3-66d80541034mr2387599d50.1.1787830700314; Thu, 27 Aug 2026
 04:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826220528.54516-5-joel@jms.id.au>
 <53fe0bed-9694-44b0-a1ff-628e2983b0cb@oss.qualcomm.com>
In-Reply-To: <53fe0bed-9694-44b0-a1ff-628e2983b0cb@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 21:08:07 +0930
X-Gm-Features: AcwNN1WUFpBMG_leDaNXikIKmZ45jbz_LybxJAfCtsji0Vf2bUNrYQalH82vuK0
Message-ID: <CACPK8XcyTVkdeifw3bvVR-SqWDc+JRetYDHcjkVo7hO8KrtEjw@mail.gmail.com>
Subject: Re: [PATCH 04/16] hw/intc/riscv_aplic: Take a MemoryRegion for the
 created device
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 27 Aug 2026 at 20:38, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 8/26/2026 7:05 PM, Joel Stanley wrote:
> > riscv_aplic_create() maps the device it creates into system_memory,
> > which prevents its use by SoCs that map devices into their own memory
> > container.
> >
> > Add a MemoryRegion parameter and map the device into it instead of
> > calling sysbus_mmio_map(). The mapping still only happens when the
> > APLIC is emulated. All callers pass system_memory, so there is no
> > change in behaviour.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   include/hw/intc/riscv_aplic.h | 2 +-
> >   hw/intc/riscv_aplic.c         | 5 +++--
> >   hw/riscv/aia.c                | 6 ++++--
> >   hw/riscv/cps.c                | 6 ++++--
> >   hw/riscv/xiangshan_kmh.c      | 6 ++++--
> >   5 files changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
> > index c7a4d4ad0172..baeec76e4c3e 100644
> > --- a/include/hw/intc/riscv_aplic.h
> > +++ b/include/hw/intc/riscv_aplic.h
> > @@ -80,7 +80,7 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
> >   bool riscv_use_emulated_aplic(bool msimode);
> >   void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr);
> >
> > -DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> > +DeviceState *riscv_aplic_create(MemoryRegion *mr, hwaddr addr, hwaddr size,
> >       uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
> >       uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
> >
> > diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> > index 84606e9f3d88..87d7d9e49cdd 100644
> > --- a/hw/intc/riscv_aplic.c
> > +++ b/hw/intc/riscv_aplic.c
> > @@ -1109,7 +1109,7 @@ void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
> >   /*
> >    * Create APLIC device.
> >    */
> > -DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> > +DeviceState *riscv_aplic_create(MemoryRegion *mr, hwaddr addr, hwaddr size,
> >       uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
> >       uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
> >   {
> > @@ -1137,7 +1137,8 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> >       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> >
> >       if (riscv_use_emulated_aplic(msimode)) {
> > -        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > +        memory_region_add_subregion(mr, addr,
> > +            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
> >
> >           if (!msimode) {
> >               for (i = 0; i < num_harts; i++) {
> > diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> > index 49cb14349f00..974806c425e2 100644
> > --- a/hw/riscv/aia.c
> > +++ b/hw/riscv/aia.c
> > @@ -71,7 +71,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
> >
> >       if (!kvm_enabled()) {
> >           /* Per-socket M-level APLIC */
> > -        aplic_m_dev = riscv_aplic_create(aplic_m->base +
> > +        aplic_m_dev = riscv_aplic_create(mr,
> > +                                     aplic_m->base +
> >                                        socket * aplic_m->size,
> >                                        aplic_m->size,
> >                                        (msimode) ? 0 : base_hartid,
>
> Not a problem with your patch but seems like we have a goofed indentation here
> and down below in the next riscv_aplic_create() instance.  Seems like we tried
> very hard to avoid breaking the 80 char line and we ended up doing this:
>
>
>          aplic_m_dev = riscv_aplic_create(aplic_m->base +
>                                       socket * aplic_m->size,
>                                       aplic_m->size,
>                                       (msimode) ? 0 : base_hartid,
>                                       (msimode) ? 0 : hart_count,
>                                       num_sources,
>                                       num_prio_bits,
>                                       msimode, true, NULL);
>
>
> i.e we moved the MULT to the next line, indented it, and all other parameters
> follow suit.  The result is not pleasant.
>
> If you could take the oppourtinity to also fix the indentation of these 2 instances
> that would be terrific.

Agreed, x1000.

> It will break 80+ char line soft rule and that's fine - the
> hard limit for checkpatch is 90 chars per line for 10+ years now.  It should be
> 120 char/line at this point but anyway ...

But I'll move this to the next line as to not pass comment on this can of worms.

