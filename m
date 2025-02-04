Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFCFC0218F
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 07:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfCuV-0000xb-TW; Tue, 04 Feb 2025 01:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfCuT-0000w2-Et
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 01:59:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfCuQ-0008TD-Gi
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 01:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738652384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l7lwg8YP17MbRt/gRdMrBX5rcvwloCNp2hDJDqNV+Wc=;
 b=M5Mt3I+bruJWNPUusSrIVGKxR7Ay9oEVIObj+14wg5AEXZKXTSrwNnofiE2+YVUDvImS+j
 XMhXYR7fXz/BS5bxZe5dNeLFRXWqVVlVgpt91lFRV9juqQqIdTRQji0i4FVEi4LuPxyMu3
 crgthh72BDqFRDWkJhu9EXNQVqItt50=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-8yot5Bp7OP6dBWxKPH8LVw-1; Tue, 04 Feb 2025 01:59:43 -0500
X-MC-Unique: 8yot5Bp7OP6dBWxKPH8LVw-1
X-Mimecast-MFC-AGG-ID: 8yot5Bp7OP6dBWxKPH8LVw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dae3db3bcso77587f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 22:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738652382; x=1739257182;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7lwg8YP17MbRt/gRdMrBX5rcvwloCNp2hDJDqNV+Wc=;
 b=uuplMGGxkOGIx8ZQ6UiWUc94aPs1DfrnEwJBx9jjhcH3aPid62sOn7G9RGH5FJEPsp
 oI+CyQDLe7mmrwKT3GjLO4fyfAtnjLAhfZJbdo9628LJ3GvoePo691vhGY9dXj6H6UBJ
 xzTm5/PodjX3dXlIZnLuNuZL2mvDQF4LrCSgvaAmroRbQLkoCq3hK+LSIwcO3fNtrRSZ
 MnLmmIJvsygtTHVSxW3X+/wdTwq0q7Wp9JoFbsGjAZi+qZwyGmgZbM65IF34DieknSyi
 ejuDMb81ilzL+B0CeTtSXu1VXaqsP8ZEGFAOYv1fwYOjsh4E3M6TMnAlxFIDjU+vCRH9
 Hspg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjQfm2QY+c+UyUaQSm84lXXK/5YCeUy+5Mpzkn3VVuKl/qeTHUkmE7OVoNvYZ7CMM2HlN23KYD6SyL@nongnu.org
X-Gm-Message-State: AOJu0Yy5AXqYzqo7Gm81e6NP07Ym9ky2IhBj0+RvUyXquC3MLt+tZKop
 sqXJRTH5YXM3GgKY6AJVceTxhMajCXKZTXlKi0l/2p9cHBJFTtoi5r6dgoWw6LIEIymcZKed5gR
 9SxUnHD8UnOe94nkTzhYhDVpbgkFnXwzgGWT5VVhkoDVvLmSZz/0I
X-Gm-Gg: ASbGncsTxO497WfOSCt+NRksNqPIIta3f+W0QPpfq4lIUPuoxh3m76fDVSRot4xTHDz
 84aWtp5odRzGGpaTB7r25tGbMblW8zAqfP7sS4hV/WfQUsTr6A/4OG1b1cFi9d/1ZKAbmFnWWlz
 egRX/Hi2VicVVyI3bUnpb8PwwJjbOiVW/yDXlxZrWsXqjg7mhY87CHB2r2V4YTuJGXNe7p4KaNy
 DnyzmRWAzD8CZYEUZfn5hvfgD4Vq905x8l68TFAUwmDcviyN4pz90migvs2/mdc54Vzppp9B2/a
 9cE9mDyAxdUgIiWu3mm0LfwXnwpkGGK143Im
X-Received: by 2002:a05:6000:1446:b0:38c:5d95:305a with SMTP id
 ffacd0b85a97d-38c5d953273mr15325847f8f.26.1738652382200; 
 Mon, 03 Feb 2025 22:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3cQvQspw6UFnXg3O78rdIOk9zOY6yx0MK1eN4wc8D+sw02SmHYl1YLN3me4Rj82Zqot1fRg==
X-Received: by 2002:a05:6000:1446:b0:38c:5d95:305a with SMTP id
 ffacd0b85a97d-38c5d953273mr15325791f8f.26.1738652381018; 
 Mon, 03 Feb 2025 22:59:41 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81941sm214581435e9.36.2025.02.03.22.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 22:59:40 -0800 (PST)
Message-ID: <c26294a7-22db-4255-8886-c7973471feae@redhat.com>
Date: Tue, 4 Feb 2025 07:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/3] hw/boards: Convert no_sdcard flag to
 OnOffAuto tri-state
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
 <20241125181420.24424-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241125181420.24424-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ofo05eOOvtNIuVpS8SZ5lSRvN0y4HtXVy9jSMf48rHs_1738652382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 25/11/2024 19.14, Philippe Mathieu-Daudé wrote:
> MachineClass::no_sdcard is initialized as false by default.
> To catch all uses, convert it to a tri-state, having the
> current default (false) becoming AUTO.
> 
> No logical change intended.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/boards.h        | 2 +-
>   hw/arm/xilinx_zynq.c       | 2 +-
>   hw/core/null-machine.c     | 2 +-
>   hw/s390x/s390-virtio-ccw.c | 2 +-
>   system/vl.c                | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


