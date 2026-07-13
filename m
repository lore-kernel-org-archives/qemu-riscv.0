Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B6C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:53:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjAXH-00065a-I4; Mon, 13 Jul 2026 02:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wjAX2-00064j-JB
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 02:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wjAX1-00048O-3m
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 02:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783925565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0ZFEGQgLUrEEMAXipHw/EG2/+KkMcSNIs9r1La8aBo=;
 b=GevrpGCPmBmfgUWPsgMqF7g5PaBMxLk18xSecP/P9aUApO3UFU8I1GAB3OAynvqYzB+bN5
 CjFsa6/FPclf8ZAX3260sQ6MY8tbu/2ICved7i/mGXHvRInrEu0+kbAk2ppClmXGz8BR8b
 zpMKNIoVfVVkEu28TobYlNjuVAJzAIs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-CuOJnHCON9yiaE1JDEng-Q-1; Mon, 13 Jul 2026 02:52:44 -0400
X-MC-Unique: CuOJnHCON9yiaE1JDEng-Q-1
X-Mimecast-MFC-AGG-ID: CuOJnHCON9yiaE1JDEng-Q_1783925563
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-473941177b0so2228780f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2026 23:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783925563; x=1784530363;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=D0ZFEGQgLUrEEMAXipHw/EG2/+KkMcSNIs9r1La8aBo=;
 b=qdJtSC4Z98ulqdaMdE/08HDAuxpg3yah7TDogWERcCTSshL5RCyqR7edrZS/CXInYC
 04+tYZFco2S1j2z2/pXktpA0Dt13wjvq6bwJ4a+MKpZ5OeDFnWJLVf7C2m+ah8Ak7HZn
 M+hE4SZSqNjTf/QAW3uYWg6MhfJNa5APa0xw3p/N115sliQtMY+YrAAKpvXHtJxLgUwh
 oE876LnYj0Knq9p6Qrm6Z4OsNl2MpflwkNJa8W62/b3RroGa5wTdXRSB12nEHkIDaosO
 onUdv9l+ZYsALm4WWooU+64J/L4jxia0guyeW7wKbvklAtvGwHtkK5NgGugm4GzLGq4u
 4NEA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3FZEi2/MrxWzoMSfq1DCBWxt1cFqN5KUxQ5tXfJsvHr4uplxw42yRTGB29lTaQKesVUKq5zBe8Kwn@nongnu.org
X-Gm-Message-State: AOJu0YyjTTPMk0uLq+0CaK++v4Vtn0Q8UyKvpOCytB44gzrW9Vtz7+/Q
 5QehqjVe1wqNDiMOGCJtLVGvXyZfO4P6R+MaQSnAUfbgjdSnKI8iXPLTB0PINprN3yKTOK7RHag
 ki0hpqgK/CStfcsOcKV79iqSbbwzZCkxTpmgdfm8CP9Fk8DoYal07Xh3u
X-Gm-Gg: AfdE7cnrLWgofSXF6rOjc194P+Y0Qzq6Bg5ep0L8bM8UmqbE3pkRCSq+hMyhJQD2fGQ
 9He4H7AP4ppB1cn2Mv7LNbAP4kpl7sg3TQmUYrD1sQGsIKJJ5J4a6pzHxn0D/4DGFEI19UPI3ie
 UoNwFHg7lzp6f+YK75Uxn12jgarI5ngg8MSvkT+zbJePWN1C5BaZT8NP8KyYF4Q9V9Jt2jLnHsZ
 cGPckS7VWirm3cJK3kBzFUAplVl7W2VHqYkglFP7NYXT/zl1p2CAT6ktyx8FPwLHg10SP804hK1
 KZIgQLvU6h/uYVi4C3DtIM51U05tpaIdBB1fHlhAapdDn4O4FcOczzOxkon6SpNPMgZRd7DmZRP
 cvgg=
X-Received: by 2002:a05:600c:c166:b0:493:cc25:85cb with SMTP id
 5b1f17b1804b1-493f87d620emr82164465e9.8.1783925562641; 
 Sun, 12 Jul 2026 23:52:42 -0700 (PDT)
X-Received: by 2002:a05:600c:c166:b0:493:cc25:85cb with SMTP id
 5b1f17b1804b1-493f87d620emr82164255e9.8.1783925562192; 
 Sun, 12 Jul 2026 23:52:42 -0700 (PDT)
Received: from redhat.com ([178.132.109.84]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb74835esm364623285e9.14.2026.07.12.23.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 23:52:41 -0700 (PDT)
Date: Mon, 13 Jul 2026 02:52:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 alistair23@gmail.com, qemu-riscv@nongnu.org,
 bin.meng@processmission.com, mzamazal@redhat.com, sgarzare@redhat.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark "vhost-user-scmi" orphaned
Message-ID: <20260713025003-mutt-send-email-mst@kernel.org>
References: <20260710114305.2961898-1-armbru@redhat.com>
 <20260710114305.2961898-3-armbru@redhat.com>
 <20260711035848-mutt-send-email-mst@kernel.org>
 <65079ad4-3ab9-4ad6-b683-09d46c72b266@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <65079ad4-3ab9-4ad6-b683-09d46c72b266@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZvoIw0VN48OufZXQn99ik2u2Mp5rY1cmU04T5TnmmAs_1783925563
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, Jul 13, 2026 at 08:13:38AM +0200, Philippe Mathieu-Daudé wrote:
> On 11/7/26 10:00, Michael S. Tsirkin wrote:
> > On Fri, Jul 10, 2026 at 01:43:05PM +0200, Markus Armbruster wrote:
> > > Commit a5dab090e1 (hw/virtio: Add boilerplate for vhost-user-scmi
> > > device, 2023-06-28) added the section with S: Supported, but no M:.
> > > This makes no sense.  Downgrade to S: Orphan.
> > > 
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > 
> > 
> > No, this makes sense. The reason this section was added is so that Milan can
> > get copied on vhost-user-scmi but not other virtio stuff:
> > 
> > ./scripts/get_maintainer.pl -f hw/virtio/vhost-user-scmi.c
> > Milan Zamazal <mzamazal@redhat.com> (reviewer:vhost-user-scmi)
> > "Michael S. Tsirkin" <mst@redhat.com> (supporter:vhost)
> > Stefano Garzarella <sgarzare@redhat.com> (reviewer:vhost)
> > qemu-devel@nongnu.org (open list:All patches CC here)
> > 
> > Pls drop this patch.
> > 
> > > ---
> > >   MAINTAINERS | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index aa2df9cbe3..4d558ddee9 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2622,7 +2622,7 @@ F: include/hw/virtio/vhost-user-snd.h
> > >   vhost-user-scmi
> 
> So what we want is to add here:
> 
>   M: Michael S. Tsirkin <mst@redhat.com>
>   R: Stefano Garzarella <sgarzare@redhat.com>

But these files already get M from the match against hw/virtio/ -
what am I missing?

> > >   R: Milan Zamazal <mzamazal@redhat.com>
> > > -S: Supported
> > > +S: Orphan
> > >   F: hw/virtio/vhost-user-scmi*
> > >   F: include/hw/virtio/vhost-user-scmi.h
> > >   F: tests/qtest/libqos/virtio-scmi.*
> > > -- 
> > > 2.54.0
> > 
> > 


