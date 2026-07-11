Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9D8C43458
	for <qemu-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 08:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiSdO-00062I-CW; Sat, 11 Jul 2026 04:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wiSdN-00061k-0J
 for qemu-riscv@nongnu.org; Sat, 11 Jul 2026 04:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wiSdK-0007Bu-S4
 for qemu-riscv@nongnu.org; Sat, 11 Jul 2026 04:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783756820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CYVTOBlmUklmpZLG1jFyXhs1sQxjfRtp4qnO7JRT+Bk=;
 b=Hole68P7Ojln+FlULa0ZqlzzQZbreoo+DobluyJPnF1HjIcWy8VLYB5GlUD51YG9fSV4bI
 heQRt1eCCorvqxf+BpcOPV5CGvUW3FFgHfTIfMk9Re9ThgcI5U64LsJfue6pPSQeyBYG5c
 W1G+GM06vh61il3Fs7froSI6Vsi2Frc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-abbLPljVP0GpO8xGBkY1rg-1; Sat, 11 Jul 2026 04:00:16 -0400
X-MC-Unique: abbLPljVP0GpO8xGBkY1rg-1
X-Mimecast-MFC-AGG-ID: abbLPljVP0GpO8xGBkY1rg_1783756816
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-c1288e572c9so165446366b.0
 for <qemu-riscv@nongnu.org>; Sat, 11 Jul 2026 01:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783756815; x=1784361615;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CYVTOBlmUklmpZLG1jFyXhs1sQxjfRtp4qnO7JRT+Bk=;
 b=Vahcuuw4iLy97MxiTZ8bgANGTpE6hMzRd7bmtBttv7J0Gq3h2IoaGOEovdC0HBluNM
 U9+wbU15wTSTIsY4uRCvS2aVP8sbFehopKYp4QTtPZWvdtHNz3KW/QyxseYSzFsGi9ay
 +Kgw6oIG/b7i2bwwy0DpK02DNppUtHk6DR0Um5sCkMneOFxsu3NPKrYcgtX5LnAxKL4X
 Joma5ZZW9++HncwFDefdavNvQyOqv5SbbAoXBvxY21zvx+6//7dmsvCmZlwapB8n2Xkl
 v0XPGicBcCVTVvNepP2z9h0HWL3hXlCXbRDSkwVe5RRcmC8sRO1UpRbFexsLtzjQnBov
 ogIg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoCYa0vEK67NS875gdu6/Ja9/+nXAG2/Fl1sILzKwCKdha4gaD0wpf/f6SdYVO1QsdmScZMbP8ldMX0@nongnu.org
X-Gm-Message-State: AOJu0Yw7AofYIoxjDaN8RvCTfBic1vqNQBUSfaFq+agiZnvbCHCmqXNO
 WUDVA8s5Bp1voOe0WHXq5XVuJKGQ6D5VyYjVN/o8esJ8JLiV1VcbrstdSO8YZ+lOXkHI9XJNI28
 7yuWy9Gc900xWz8zmYsRXB33X+o7xIfMsW15VxTe41IlwvhxrmDvhIlry
X-Gm-Gg: AfdE7cmIaxYmE1TXTRMbkp44H3auND6La/MEXhg/rWqP9A/i6l4DLxW2A++uf9XJBHx
 HYh+tzAZS1pfqqcdyKsIqgMQCHiagUmDOOiAba9xOknxHjNiwSvx1Ndw1heCJ+Bv2B9J3uc/ABb
 kNhDZprIvYngo4bfk3Qx4cmxT58R0NrCWi7a6MY7wp4YD6u3RwQFX0PRl9L4DwKFfI142dZ2Qwn
 NjHs4XOBDW9CzCehQEy1/vPfPJFBlx2jVsS+JUatso701g/ffTZj2KaeDhuc3+MOzz1jg41XTRa
 lMFnd6aCk3nBfDLP+I6tgMGs0rdEds2L4Ohbq9pcUZw7raihNNrs94xbPx1guCw/u9CqFbfjwgG
 BPwiQuxnOP4q/6Ef1CW4b6mMuJUJCh0NgBNTTieDooQ==
X-Received: by 2002:a05:6938:a08e:10b0:c12:7512:18de with SMTP id
 a640c23a62f3a-c161f3cedd3mr49638066b.57.1783756815543; 
 Sat, 11 Jul 2026 01:00:15 -0700 (PDT)
X-Received: by 2002:a05:6938:a08e:10b0:c12:7512:18de with SMTP id
 a640c23a62f3a-c161f3cedd3mr49637166b.57.1783756814914; 
 Sat, 11 Jul 2026 01:00:14 -0700 (PDT)
Received: from redhat.com (bzq-79-177-145-168.red.bezeqint.net.
 [79.177.145.168]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15d5739621sm470316866b.32.2026.07.11.01.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 01:00:13 -0700 (PDT)
Date: Sat, 11 Jul 2026 04:00:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, qemu-riscv@nongnu.org,
 bin.meng@processmission.com, mzamazal@redhat.com, sgarzare@redhat.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark "vhost-user-scmi" orphaned
Message-ID: <20260711035848-mutt-send-email-mst@kernel.org>
References: <20260710114305.2961898-1-armbru@redhat.com>
 <20260710114305.2961898-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260710114305.2961898-3-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 85ui-ysTeh6rMKFCSwTSo9E4BTuekUo_ZhbLf61ENdE_1783756816
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 10, 2026 at 01:43:05PM +0200, Markus Armbruster wrote:
> Commit a5dab090e1 (hw/virtio: Add boilerplate for vhost-user-scmi
> device, 2023-06-28) added the section with S: Supported, but no M:.
> This makes no sense.  Downgrade to S: Orphan.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


No, this makes sense. The reason this section was added is so that Milan can
get copied on vhost-user-scmi but not other virtio stuff:

./scripts/get_maintainer.pl -f hw/virtio/vhost-user-scmi.c
Milan Zamazal <mzamazal@redhat.com> (reviewer:vhost-user-scmi)
"Michael S. Tsirkin" <mst@redhat.com> (supporter:vhost)
Stefano Garzarella <sgarzare@redhat.com> (reviewer:vhost)
qemu-devel@nongnu.org (open list:All patches CC here)

Pls drop this patch.

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa2df9cbe3..4d558ddee9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2622,7 +2622,7 @@ F: include/hw/virtio/vhost-user-snd.h
>  
>  vhost-user-scmi
>  R: Milan Zamazal <mzamazal@redhat.com>
> -S: Supported
> +S: Orphan
>  F: hw/virtio/vhost-user-scmi*
>  F: include/hw/virtio/vhost-user-scmi.h
>  F: tests/qtest/libqos/virtio-scmi.*
> -- 
> 2.54.0


