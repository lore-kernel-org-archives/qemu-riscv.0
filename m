Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA5CCD1AB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 19:21:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBeOJ-0001TO-2w; Wed, 22 Oct 2025 15:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vBeOH-0001SX-H6
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 15:20:57 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vBeOF-0000oh-Lz
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 15:20:57 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-3c917ea655bso169fac.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761160854; x=1761765654; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nuDFMedm7dvC4LLauebf2+P3UrOxbtantE5TkQj5FhQ=;
 b=ut0E0ynhn/Duv0xWPKBarOBI2uisgVq9YFoNasRlwk9aAtPOTtEvtuH+f5nuA1LxEp
 gdA0oFqDIbrXhuCaoHQII8tZ/fKW8/FxrB04EU/XKeBhXsqCitK141DiwoZxt1xN56sF
 Gj5zvuGNX9HU8TsRbTpDcxz0c/BHf0OgmVSR6WVQ5axiMKKi+3s7w9MLFOdUpG0omjyi
 +hdYm8Lb9XYdQnJCPC6Z4TZb/waCMqIw84z3QIMjQEuzLnq+Dm3rKMPylyEJao7NvrPy
 3qvT53ThQt+evTtA/5sWqnz6E9R6W+j0OkAkY+qsc5cBzw9PXVDfHaPEwuCEJnfw+sGJ
 IX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761160854; x=1761765654;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nuDFMedm7dvC4LLauebf2+P3UrOxbtantE5TkQj5FhQ=;
 b=fye0IHZGqVo3EJOuYveONMLnAUWxtUMv7qJEhPWlGjULPRkjb6K1Wewh1TSGqBy22d
 mgQFXtuCs3RDeL4AHVF4TYB4LQNeLGdKihZsgKO5cJc0yLyZFNnKeqmfPYNoW5/FByWz
 rY3AKTALJEZLc4WiiZfvwvuTAlJhEyUi/4gADvirAK5lDV42iGtmppt7sdcar6q8iJ3S
 qwiXa+scrllgcjuf+7xZZuakXiJ+GKk098WAFYoBHyitHjwaX0AIqudO2jvp4+PwzpPI
 OxM+d7aVjfprWYmQdSdK6F0/x6Ov5+UuHCw6FHMFITUsXD1x+yHg0Kql4Ijc/IIGYP2I
 dVPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS34gxRN/TiCYQNzeqbjnhloPF7iAGnYag/t4TuG1DLiXBNEKO+04JEubYEi2ZFE6dqeHTPeXff4GZ@nongnu.org
X-Gm-Message-State: AOJu0YzS98bTVEaYIBDty7EJHXSaypenZ20b41AA6jau+uS2tmJfAoLD
 +z/oTHS0hCSZmTGqQ5W99Uow4kV3Tsd9Lk/KgbOLiNER3EUNjDh6sL46ipeA/qVIQlo=
X-Gm-Gg: ASbGnctoCIAX4lvGdmGwksHLASKDjMa7ud4w+hFmAS6e+DyReA466YKsYxy9CM0EcNB
 oGOQn17cNwB0H0ZTYPq8SIlpXMfCxaTkRXsiugsBQIso8EebEGy08SVi4swe0nraZvtgxX/+hYc
 Yx2ACRYUuSdpdpHZheJj+kHS+E9EQcfBGEopZtVeHMEoyqfRyPjz6oFuSlM9CjoHgIk48M0A4SV
 Dz50lOL+XmTIrR4b+6hPLYDlZF0AEUepfUbdPWmO5Im5KpKUM+eo3GqMpXK1wx9FskI3NkYO6kh
 OD2jZCoqQC8CX8iXHgWQYivhOU9t6Y4ao9LpuzTFXw7QkCkkFSgbYPEL0IWrb2EjZ8SOVeTo0Tk
 jwS9OCPTkXKioUVAVHhqfgsI67PqsgR9i9oOMzTaFHevosVkUU/fLoddD7RJ+nYykwVtv4Fy51F
 dBDBdtbEwF6b0FHok6aU6KyXt8fRGRrdJyUtszvK9ixDxUkWf6bPChkDyB+6iT
X-Google-Smtp-Source: AGHT+IHCOzK20dYCU1HfQZuOQJ41oxfxtHo0QQJDtshobhvYbHHVKpovBuqotny3nvcRWPrNbcF5Ug==
X-Received: by 2002:a05:6871:eb0e:b0:30b:ba5e:3472 with SMTP id
 586e51a60fabf-3c98cf3f699mr8968704fac.12.1761160854155; 
 Wed, 22 Oct 2025 12:20:54 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5ec2:421a:7b72:4f29:1f36:27f3?
 ([2607:fb90:5ec2:421a:7b72:4f29:1f36:27f3])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3cdc4e73475sm22836fac.19.2025.10.22.12.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 12:20:53 -0700 (PDT)
Message-ID: <6083717e-a013-4089-a54f-4c2ecc98a351@linaro.org>
Date: Wed, 22 Oct 2025 14:20:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Pass actual memop_size to tlb_fill instead of 0
To: Nikita Novikov <nnovikov@NB-7271.syntacore.com>
Cc: n.novikov@syntacore.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20251022115213.91457-1-n.novikov@syntacore.com>
 <79beaf9a-9558-40e7-a01d-5f80d8931eba@linaro.org>
 <busf3stsde5y7hq7zslr2kfyibp5ve2wrvrrawik3xbfpmsr7f@2nr5m4kdlltn>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <busf3stsde5y7hq7zslr2kfyibp5ve2wrvrrawik3xbfpmsr7f@2nr5m4kdlltn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/22/25 13:59, Nikita Novikov wrote:
>>> Fixes: ec03dd972378 ("accel/tcg: Hoist first page lookup above pointer_wrap")

This cannot be true, btw, because ...

>>> -        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
>>> +        if (mmu_lookup1(cpu, &l->page[1], l->memop, l->mmu_idx, type, ra)) {

... this line did not change with that patch.

>>>                uintptr_t index = tlb_index(cpu, l->mmu_idx, addr);
>>>                l->page[0].full = &cpu->neg.tlb.d[l->mmu_idx].fulltlb[index];
>>>            }
>>
>> How is the memop really applicable to the second half of a split-page operation?
>>
> Because the second half is still part of the same guest memory operation. It must obey
> the same size, alignment, and atomicity rules. Passing the real memop ensures correct
> alignment and atomic checks even if the access crosses a page boundary.

How?

Let's use a concrete example: Access MO_64 | MO_UNALN at 0x1fffd.

The first tlb_fill gets to see the start address 0x1fffd, and the length 3 (and also the 
memop).

The second tlb_fill gets to see the second page address 0x20000 and the length 5 (but not 
the memop).

Exactly what is the second tlb_fill going to do with 0x20000 and MO_64 | MO_UNALN?



r~

