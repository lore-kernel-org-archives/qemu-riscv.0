Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5B4C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 07:16:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjAtn-0001iO-4C; Mon, 13 Jul 2026 03:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wjAtm-0001i3-Ao
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 03:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wjAtk-00087z-Dc
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 03:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783926975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0K03lVwcJ5+dIuuvpDGtvoD8RHBphbmWnFeGuzmS9yY=;
 b=d0NGXopfUjIzRIx7CY1ZWjnlfxBJYWWOs3baVZUdebEvRyC8rLvG14bjJ5tKWQ+kBAEPge
 pFGFlM1qa3izrcPFYxUkhl8MW8aBxeHUbVu5IehNCO6C3xKqykVgMUhuEBnZrxqdrRD6v+
 QgKHqxyOIgqF3cN0E3x+QcZSSDPQexM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-ueM8eapZM6Wq7Zv-7zYSew-1; Mon, 13 Jul 2026 03:16:13 -0400
X-MC-Unique: ueM8eapZM6Wq7Zv-7zYSew-1
X-Mimecast-MFC-AGG-ID: ueM8eapZM6Wq7Zv-7zYSew_1783926973
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-473e18559b2so1731623f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 00:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783926972; x=1784531772;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=0K03lVwcJ5+dIuuvpDGtvoD8RHBphbmWnFeGuzmS9yY=;
 b=ecBSGw+/9wsYg9bSIW/SVNGHWnnWBBfs+A4LtqqEeRCXCBvmdQ/mueiGndiRnq40KO
 XN4QJ+wWHUrN3utezSoIRjrhenM4CbQNOI9pDHWMex5uZnZtoCByHwTTI1N80r7/NZis
 2lsCd8LqTQzdvod+6t72QmVGnoV4vThwwnulUiYRpS7q+QHPXiQrXWgGBnVHLQuoemHv
 82ac56rMcUHZ8xulAqYSWLAEZJUdeoJma7VgztgUBgI5I6GPxVy5SEJrCXaYOBdxOnmv
 Y3vr9LXVJXZOeoICG0AJnFj5KceNJrDxe9mEtDiTyTsBau5/1jPg18Rv8mTRqFgPAbEc
 vaYw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFmIQL/tKOYwiW+KLj0bfhxjrNHFLLD53fwxETcMMLDF4VoBHHU/2WZYkrB8DngP+V3M2IpUOvmbS8@nongnu.org
X-Gm-Message-State: AOJu0YysW5M9TxnQ/lhYFGNoE6Khr2ZGq6xLClQMhBRLhi9q3o/Dg7dV
 YRpvPdTe0a0POm8NwGFQ/nSHlNfiFre4aSOxNK/FD9LyTQnQle1r04MmhzPIY9iIozAIa9ssoqc
 mwkrFDzWO75i2HJvdLnIsmWZ3himbFpIJFCSgRFHQH8Supl2MZN/KRO/e
X-Gm-Gg: AfdE7cnibjaO8UsJgK53bkN+Qby6haxOk96YnEISWUbqdss1SREbpk0fNl8SExxwGwg
 7OeBmieDxw0JaNjfAkneL7S6jww+7w037T+yxFTiiEQPtr1QcZgBE481/BvAmcOya+beDuwdc3T
 Wy/LB5woGktfKXebWpTJ1UVKFQ4hZF+60GXhUNaddLQwAK32touiqrH8G2hzYvFCkwCA9/5iGY5
 wq+gH8LSFfVLbfXlb/AV6k6Oi5ZbtotvBE1wI8P3oQk1YhmeAqhWAhOGiG9qPwCOZSAAphuRvCT
 YOuYsnZZBx7zSRiH2tHJORz1fD/GWYmUNrDxo1yAKOhLEvvvLFXYyifQZ08OYrf/bdVbhB+1LIu
 gmrQ=
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id
 5b1f17b1804b1-493f87d7fcdmr76616265e9.7.1783926972416; 
 Mon, 13 Jul 2026 00:16:12 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id
 5b1f17b1804b1-493f87d7fcdmr76615965e9.7.1783926971864; 
 Mon, 13 Jul 2026 00:16:11 -0700 (PDT)
Received: from redhat.com ([178.132.109.84]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a558easm84840339f8f.27.2026.07.13.00.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 00:16:11 -0700 (PDT)
Date: Mon, 13 Jul 2026 03:16:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 alistair23@gmail.com, qemu-riscv@nongnu.org,
 bin.meng@processmission.com, mzamazal@redhat.com, sgarzare@redhat.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark "vhost-user-scmi" orphaned
Message-ID: <20260713031514-mutt-send-email-mst@kernel.org>
References: <20260710114305.2961898-1-armbru@redhat.com>
 <20260710114305.2961898-3-armbru@redhat.com>
 <20260711035848-mutt-send-email-mst@kernel.org>
 <65079ad4-3ab9-4ad6-b683-09d46c72b266@oss.qualcomm.com>
 <20260713025003-mutt-send-email-mst@kernel.org>
 <650b9d5c-ca79-447c-b91d-a83d017f42a6@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <650b9d5c-ca79-447c-b91d-a83d017f42a6@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IR2BeH7NfGh8uqWsUHuH2VaNOrDC4w9GF7mOYFCl7sg_1783926973
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 13, 2026 at 09:11:34AM +0200, Philippe Mathieu-Daudé wrote:
> On 13/7/26 08:52, Michael S. Tsirkin wrote:
> > On Mon, Jul 13, 2026 at 08:13:38AM +0200, Philippe Mathieu-Daudé wrote:
> > > On 11/7/26 10:00, Michael S. Tsirkin wrote:
> > > > On Fri, Jul 10, 2026 at 01:43:05PM +0200, Markus Armbruster wrote:
> > > > > Commit a5dab090e1 (hw/virtio: Add boilerplate for vhost-user-scmi
> > > > > device, 2023-06-28) added the section with S: Supported, but no M:.
> > > > > This makes no sense.  Downgrade to S: Orphan.
> > > > > 
> > > > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > > 
> > > > 
> > > > No, this makes sense. The reason this section was added is so that Milan can
> > > > get copied on vhost-user-scmi but not other virtio stuff:
> > > > 
> > > > ./scripts/get_maintainer.pl -f hw/virtio/vhost-user-scmi.c
> > > > Milan Zamazal <mzamazal@redhat.com> (reviewer:vhost-user-scmi)
> > > > "Michael S. Tsirkin" <mst@redhat.com> (supporter:vhost)
> > > > Stefano Garzarella <sgarzare@redhat.com> (reviewer:vhost)
> > > > qemu-devel@nongnu.org (open list:All patches CC here)
> > > > 
> > > > Pls drop this patch.
> > > > 
> > > > > ---
> > > > >    MAINTAINERS | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index aa2df9cbe3..4d558ddee9 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -2622,7 +2622,7 @@ F: include/hw/virtio/vhost-user-snd.h
> > > > >    vhost-user-scmi
> > > 
> > > So what we want is to add here:
> > > 
> > >    M: Michael S. Tsirkin <mst@redhat.com>
> > >    R: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > But these files already get M from the match against hw/virtio/ -
> > what am I missing?
> 
> Yeah, just trying to make Markus script happy ;)

I don't mind though the duplication is a bit annoying.
But let's pls document what the rules are somewhere then.

> > 
> > > > >    R: Milan Zamazal <mzamazal@redhat.com>
> > > > > -S: Supported
> > > > > +S: Orphan
> > > > >    F: hw/virtio/vhost-user-scmi*
> > > > >    F: include/hw/virtio/vhost-user-scmi.h
> > > > >    F: tests/qtest/libqos/virtio-scmi.*
> > > > > -- 
> > > > > 2.54.0
> > > > 
> > > > 
> > 
> > 


