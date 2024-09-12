Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32051EED607
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 13:35:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sojyM-0004yq-8r; Thu, 12 Sep 2024 09:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sojyI-0004xJ-UM
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 09:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sojyH-0007tP-GL
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 09:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5rcG9lzD4F05sYwu5eA1U+Vp3lpTYiZKcFNxAMkStY=;
 b=KbNOsMmSYCqiSSQBVkGStb/jxQZoFYhldtRu2VmsZBcuWg/6fvgF9elpE+fWXT0QGME43w
 NKO7QzumnBEJYa3Z4Hfh2rzSZT4MCrDUvxB44Q6LaS/2+1DAEcASVZ4L2zcMNYMsPqbUcD
 oA9BZwCiIBpFntX8HpSn/KJBPhG8E+I=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-YDaAyGmrNxSEkrfItwDm9w-1; Thu, 12 Sep 2024 09:34:50 -0400
X-MC-Unique: YDaAyGmrNxSEkrfItwDm9w-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4583282de71so20013411cf.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 06:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148090; x=1726752890;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M5rcG9lzD4F05sYwu5eA1U+Vp3lpTYiZKcFNxAMkStY=;
 b=bph83vziIuEM9WUlus24X/Jwlb59lGBKPxLn+qr1GFcdFUTrRD/RSwn+9U4eU8oqjv
 OkzoYxUH/xIcP0HICy+I3zB4yhLl5usYPx5TeJv3QKMVxLuKF5dTFFMwDd19/prD+zbC
 SCwd36VsdCSX0v6fEOeVXepTSYzLgrgXxJE5OGlJBIbYMjiyFO87i1Vm6bMBaHxXoP6S
 /NzX30BbIdL7wmTMKEJsfDmGqg4Y9Joqc2eDa+U0KA3irMVxhjWRGuPSLCFLom2Zk467
 0hK0jmB9cshpW4TzvJiGhk0s9Fq0FiZfArzLmY+3PvMsZNckBhiqhxN3iiMpp3UlBug6
 UyxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmnviM0hdm6ztgjorunzTe2F84e1kmoxIlrUb6EErRL0VpI4MGlAKjMBKNd+UxudObt+wX/yFkVYa0@nongnu.org
X-Gm-Message-State: AOJu0YyPG1L3AIlqU3GmdAJxzwaYCRLFleVlBEdk2ENMHT78QVk8BnDO
 Kcd6BIFrFg89Xutnz7Go7NdoOGPiKYf8zO4e9VKCgEpfUEYnWxg9p2FjeDk5VrYbja0+laHGdlX
 UjH+aK5hawaOf0XoBRU+i5ZsUM8aG02Au3u/Nyj2X+S+Rl2nHF4pe
X-Received: by 2002:ac8:5d94:0:b0:458:156f:965c with SMTP id
 d75a77b69052e-458602de102mr45427401cf.22.1726148089984; 
 Thu, 12 Sep 2024 06:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLmm/DxJ65yRHOiD4VWdc/MylUpsQX+KMLJTCpwrDneBOgcnrBMqj+57SrU2QpuXZYBzdjWw==
X-Received: by 2002:ac8:5d94:0:b0:458:156f:965c with SMTP id
 d75a77b69052e-458602de102mr45427011cf.22.1726148089600; 
 Thu, 12 Sep 2024 06:34:49 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822e9b207sm53312581cf.49.2024.09.12.06.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:34:47 -0700 (PDT)
Date: Thu, 12 Sep 2024 09:34:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: "Fea.Wang" <fea.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/1] softmmu/physmem.c: Keep transaction attribute in
 address_space_map()
Message-ID: <ZuLt9fDgA9C_nNZ6@x1n>
References: <20240912070404.2993976-1-fea.wang@sifive.com>
 <20240912070404.2993976-2-fea.wang@sifive.com>
 <444dbb46-bee5-4983-aa90-4d88f005c5eb@linaro.org>
MIME-Version: 1.0
In-Reply-To: <444dbb46-bee5-4983-aa90-4d88f005c5eb@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 12, 2024 at 09:13:40AM +0200, Philippe Mathieu-Daudé wrote:
> On 12/9/24 09:04, Fea.Wang wrote:
> > The follow-up transactions may use the data in the attribution, so keep
> > the value of attribution from the function parameter just as
> > flatview_translate() above.
> > 
> 
> Doh, long standing bug...
> 
> Cc: qemu-stable@nongnu.org
> Fixes: f26404fbee ("Make address_space_map() take a MemTxAttrs argument")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks, queued with these attached.

-- 
Peter Xu


