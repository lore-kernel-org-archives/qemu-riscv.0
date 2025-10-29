Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2279CCF9E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 05:49:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDz3j-0000kC-Lf; Wed, 29 Oct 2025 01:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vDz3e-0000jH-5W
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 01:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vDz3Q-00040g-CZ
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 01:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761716943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xYR3B3TiIvJS4F7Ao0pvqXQy69kfGfibOZ6NDWzYlZ0=;
 b=TASaQi6p/E5OE8Q46AkRAcpjHgsTsfxrXoOupNUMVXyMJkpmEOZatgPan9InyboSEJucpL
 eF1Z8j8gHXMxOBFI+mYxhDLaKBDQSkTige62HD4gY9V9jiMyOym+WNjbKQzsa+0Qs9dGpa
 SwPsjAG3DaPIaGMo+YK+agrymiGbdS8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-NoRFc0lKNm-zQtyPm4SXXQ-1; Wed, 29 Oct 2025 01:48:59 -0400
X-MC-Unique: NoRFc0lKNm-zQtyPm4SXXQ-1
X-Mimecast-MFC-AGG-ID: NoRFc0lKNm-zQtyPm4SXXQ_1761716938
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b3cd833e7b5so872589766b.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 22:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761716938; x=1762321738;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYR3B3TiIvJS4F7Ao0pvqXQy69kfGfibOZ6NDWzYlZ0=;
 b=A6eBF6ExGrWny3mKfIHkW/V+5tLnWGhMSP2KQxmBKDZKVX1xcseAOYr6PcApgw3AEb
 Fmmmxlui7HMoMG60vyR4Gr9TloOnCun2yWZzikmE/b937Sj494G1TtNFt6jmK7gN9BW9
 00wqXV7HShmj8pPNo5jRX08KgnnAIv4fp8XGz4YJ42hZbiSfdvUJVDaX3zytZdfg9pDM
 hrn+wivN7FiWuiNKgKUNwMEJHz64cSW2fm2xaKCqTE0UKGMp1HwAgYikISRHpfDgU8CC
 5AMRR3RFnU0XGimOCpbdOZrpH+cNvT0T143ITsarhaQo8zHBJYQ5bXjQ2eWS+ejuMvN4
 8qAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFfCGioIH+wCLVHVx9uuftuEztQMhrzVAtKeIEw4rLwZqTfswZCpoDYf6MOn8ZEQV1yHtpLFGYQZ29@nongnu.org
X-Gm-Message-State: AOJu0Yx5wHflvSEyqbIWaUEy+YjsJh9UbCsdkc/jZn/X3MkBFUqFXyP5
 fkzvqL/CPjDdU4qzOazDXgCLpgU5lAcjOGXs9rmWMd4e6Q7KapXRjUpXsfxDGwlhnG5wOyixV2q
 73Xes50fpnRAaWCMk4JUAPavlqx1KP9hSu05Si9w2zmCL7JM4hgnHqL3G
X-Gm-Gg: ASbGncsvvNeVVPi+NJvh4mLR66ZIPbFrPnMXbRuwo/Rwfg+08I2Q+DGLICKpj34kwEl
 XRbJXMUT1xQvDKC0tQx4rY+BqdFjLZyBvi+rJF5lw+UmobWQw3buoPTv1z7iEJSY4OM6BwJ86hB
 J7RTp/EKEdA4QrgRtgy017mCMmZa2QT6mZNiF+yXauk0Ea/+vN/76MsgqdMzGEJfDG2l2uVIaiy
 dJfH03hRINNlqux0ZxeCi61SrZGRwDtLdHrief7orDGBadF3NAVZlNgehr57qKT6ha327VKM/Cs
 V4WJAMiTd/7yO2OLFN2QHP5N0/ol7mEDiRvlXYlN4L7iE0isCxI35FM+0eLO8aMdeiut6vk=
X-Received: by 2002:a17:907:749:b0:b53:e871:f0ea with SMTP id
 a640c23a62f3a-b703d57269amr156349266b.56.1761716938537; 
 Tue, 28 Oct 2025 22:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO3Vp5ADjeCuxdZpUZ5hkPxmAAvCD6ptEhfbC9hiTItYvCJLrpJWdqZfGyJzKSGfdOo3qZYw==
X-Received: by 2002:a17:907:749:b0:b53:e871:f0ea with SMTP id
 a640c23a62f3a-b703d57269amr156347366b.56.1761716938163; 
 Tue, 28 Oct 2025 22:48:58 -0700 (PDT)
Received: from [192.168.0.7] ([47.64.112.33]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853696a3sm1302412366b.27.2025.10.28.22.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 22:48:57 -0700 (PDT)
Message-ID: <b2916e5c-41d3-4562-9d12-6f39f3d2e4fa@redhat.com>
Date: Wed, 29 Oct 2025 06:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/25] system/memory: Have memory_region_size() take a
 const argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-11-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251028181300.41475-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8VdKnztIWl1mVsYBC6Om51Y86-sBaVKuxr7sXKg7qh8_1761716938
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
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

On 28/10/2025 19.12, Philippe Mathieu-Daudé wrote:
> Since the @mr argument is not modified, it can be const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/memory.h | 2 +-
>   system/memory.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/system/memory.h b/include/system/memory.h
> index 3bd5ffa5e0d..45de6946812 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -1776,7 +1776,7 @@ Object *memory_region_owner(MemoryRegion *mr);
>    *
>    * @mr: the memory region being queried.
>    */
> -uint64_t memory_region_size(MemoryRegion *mr);
> +uint64_t memory_region_size(const MemoryRegion *mr);
>   
>   /**
>    * memory_region_is_ram: check whether a memory region is random access
> diff --git a/system/memory.c b/system/memory.c
> index 8b84661ae36..d1c060b2b50 100644
> --- a/system/memory.c
> +++ b/system/memory.c
> @@ -1870,7 +1870,7 @@ void memory_region_unref(MemoryRegion *mr)
>       }
>   }
>   
> -uint64_t memory_region_size(MemoryRegion *mr)
> +uint64_t memory_region_size(const MemoryRegion *mr)
>   {
>       if (int128_eq(mr->size, int128_2_64())) {
>           return UINT64_MAX;

Reviewed-by: Thomas Huth <thuth@redhat.com>


