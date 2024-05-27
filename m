Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC9C25B78
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 May 2024 07:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sBUee-0006Sp-JV; Mon, 27 May 2024 03:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1sBUdu-0006AW-DN
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 03:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1sBUdc-0004ut-GZ
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 03:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716794359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoTiePj2SgsSyNDFQiutDJsrzjZVw0FMcnBlVOFGPVo=;
 b=iLcn+T4QKyHiDykptJu1KNirqFcu2eRImbyInszAT8k3YA6S7pOHktW/gsUtkoweBjpktG
 7fjyMMaDyvdJl/sZw2oo8QSYIUM2T83Skt6FkmNxnmjw/xMOJF1IZidm7DM7fVXPzfeYP9
 x3KEB6hNn47RW2cZ+HIw8qqDZXokz9Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-lzP5ncRVM6elP7xHsPDYCA-1; Mon, 27 May 2024 03:19:16 -0400
X-MC-Unique: lzP5ncRVM6elP7xHsPDYCA-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-43fd3f7ca43so199161cf.1
 for <qemu-riscv@nongnu.org>; Mon, 27 May 2024 00:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716794356; x=1717399156;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoTiePj2SgsSyNDFQiutDJsrzjZVw0FMcnBlVOFGPVo=;
 b=pCci/Tm4/T1u4ENzEajWpnQOeDnFzMMnb3Fo8JQQMPOLlx4dpZTYbbJP7GjtHjvpOh
 rnJ9k2d2B83foGGkhF9dAM7mbNTiM/5dWmkqHOm87o5ulX+xm310mP44+SB5VfwFAzlf
 0upbWBCGDFCtXKKH9AacKM04YiKpYleJGJeul62hzZpoMSuYGCeVZUPp4DywsLCAI0aH
 AuNzr+jUQ+3BisB8cRtTL6q9X85MtjC/HUnFmsa//xgT0pxfNSfItc4UZTevJo4AQ4LX
 8p9fSHajNw6Z7ucHZiDVCfItq8iLhT7srqVSydwsJ1MQe24vQ/7c708kG7rg7c7ZF/rh
 Js8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4xbabmBO6x/405E9BUTlvg9DQ/AhxLEVae9L/v8tdst15rIE8oQ9sxYzT2dviHuJibf9uzTU+23aqKcjdM+K3Yr64fvU=
X-Gm-Message-State: AOJu0YyuNfcQW3UKX2oguJHVkDHW43v1EQ04rzJb2QIpbMPBxammuayH
 woBzOgX78apxbVKJPrlkTAvLOHOrV4EJ3hbJ6W+EZT0aYlhZ90Bjg/nmSYTneOhL+NIWDAvIPU0
 YciqCT8PxtX7WM9KzBv5j8qvIMJNZ9ChP9skr0AbuaP6TkxCKjTyt
X-Received: by 2002:a05:622a:188e:b0:43c:7504:32ba with SMTP id
 d75a77b69052e-43fb0e5149cmr91741891cf.10.1716794356074; 
 Mon, 27 May 2024 00:19:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExM2/nlFpN6xxacm/DZQWnwb57vvtqWgQW75EWgLwk087q6KqJMuI28JP+sMiV5LIZeeCvhg==
X-Received: by 2002:a05:622a:188e:b0:43c:7504:32ba with SMTP id
 d75a77b69052e-43fb0e5149cmr91741671cf.10.1716794355378; 
 Mon, 27 May 2024 00:19:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:4600:d3a7:6c26:54cf:e01e?
 (p200300d82f284600d3a76c2654cfe01e.dip0.t-ipconnect.de.
 [2003:d8:2f28:4600:d3a7:6c26:54cf:e01e])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb17cc2d8sm30838891cf.26.2024.05.27.00.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 00:19:15 -0700 (PDT)
Message-ID: <f1fe0673-254d-494e-ba8a-d252723c1f16@redhat.com>
Date: Mon, 27 May 2024 09:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hw/riscv/virt: Add memory hotplugging and
 virtio-md-pci support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Santosh Mamila <santosh.mamila@catalinasystems.io>,
 Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>,
 Sivakumar Munnangi <siva.munnangi@catalinasystems.io>
References: <20240521105635.795211-1-bjorn@kernel.org>
 <20240521105635.795211-2-bjorn@kernel.org>
 <55810d52-0360-40ad-a8d2-3b6a8aa220ae@ventanamicro.com>
 <51ef570c-da63-4e25-9c48-dbdf8a40a34d@redhat.com>
 <18f217cf-6d68-4676-8674-d91f96e155fc@ventanamicro.com>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <18f217cf-6d68-4676-8674-d91f96e155fc@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> 
> I wonder if we should forbid users from removing memory that is 'out of place', 
> i.e. users
> should always remove pc-dimms in LIFO order. Usually this kind of control is 
> done by
> management, e.g. libvirt, but if we're not sure we'll keep consistency during 
> memory
> unplugs ...

I really don't think we should do any of that. ;)

-- 
Thanks,

David / dhildenb


