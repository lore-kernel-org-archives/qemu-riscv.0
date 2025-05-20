Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14313C3ABDD
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 May 2025 14:33:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uHO1d-0002FY-7E; Tue, 20 May 2025 10:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHO1Y-0002EP-RP
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 10:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHO1X-0004Sj-9o
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 10:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747751571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eyyKewFowLGN6weCf+HOMRYql1fcCQIkABOVNAcjl/4=;
 b=LTBo3J3ETX57/0YzbvhJZKDFZxmsrTbns2JcrdjVVcQiHJsdOzbLi3DkuMNRirNHsOwAsu
 dPvfJB+hcDOp2MCC6PVZwZNm5RlAqQlqUACjUSFXqiEp+U0BVrmMGF5ytSrQi/+lqo8I99
 /CXxvKL7NdjBn20qgtU8G+kY5RBkDho=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-mroxjdWqOOKcW-8qrFffkQ-1; Tue, 20 May 2025 10:32:48 -0400
X-MC-Unique: mroxjdWqOOKcW-8qrFffkQ-1
X-Mimecast-MFC-AGG-ID: mroxjdWqOOKcW-8qrFffkQ_1747751567
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-acf00f500d2so130900666b.2
 for <qemu-riscv@nongnu.org>; Tue, 20 May 2025 07:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747751567; x=1748356367;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eyyKewFowLGN6weCf+HOMRYql1fcCQIkABOVNAcjl/4=;
 b=F8WDP3hrM5ya0CIG0vYbDYPJVKtwAm7KC20Iy4nivHwTEwc50U9794RyX/e0tHYaAg
 zCYdgv+7Sz9y76ujmmKVY9bCLA4QKQcXU+C9784AnPH+s7y0ArVM70D18j/9DrqP66wS
 EYJjMfDEsNqyueF0PcJldKIt2xTyvSkd5D4wEZJwkQKEO7OJex7TkMzdgXi1YNDxr6wH
 ABbIRUQSNbMK1G/mih9LNXkZlAF+O3PSfkyE6lk1X07u+aV8lol+ajDTUYKD+PCWNOse
 1D7ci50LIRlfnp62eXvOeEoOqQdiNfh7RdIHxr+cGu/YU2olnslTVow/DI0vkIRp1WNG
 OHvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGK3RjCOyD1jDPPwdOMagxF6JH5AWBoJOkgWHPDLfhe6LCetcDnuXaHr45gNUgKEdZKr3V3usz0XNL@nongnu.org
X-Gm-Message-State: AOJu0YwqyuNqmOSWdMnteorHXv5iF6EmSrRXfRwNYgQFey79js44Z3V5
 pcj0ekbPMFKFEDYES5+xW+Fe9xexJy+F1Vn25vieJdK7V53Mkn/j8wk9vIpmG12Cxxd9iySEHtT
 Wmg4Zxx9rmbALoJ5Qd9Yh7MdfcWcwGsu/YzCUIzYqkR+G0/7X9NwBn9+i
X-Gm-Gg: ASbGncuwyo8QNx3bnAOHj2qut9uorc8O+J+RTHX8xPoo+0np2hD4pEw6Hij9cJg7Wom
 HFDAykzTfPW8En21uWFCK5TyFewp96lIsnmpWJqa7ulzPbHEmfUd1hm/qdU4GWX42K33JwSak+H
 DyyM4+cgSW0qyE46dlTfw9771C4M7ajf3mTQskzxggiDQVB3Wqq8YR7LazNxAF2fWWNfkDQ3ERU
 +uxCq/YZk2E3DqOnLVcGfP0vCefqftnD//Xhw7XkTZ78XKRN0mxaAA/10FuZSELUX/DvmVo0L70
 66LLDLpHZLVKDw==
X-Received: by 2002:a17:907:e915:b0:ad5:1e70:7150 with SMTP id
 a640c23a62f3a-ad52d443a03mr1562848166b.2.1747751566970; 
 Tue, 20 May 2025 07:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1SxvMnrYo33aixijukBQ/jU3ZzXQOYrVXJsOtOSsQa/0cDLcVOY8ds12Wdqw3mvwY7QVFrg==
X-Received: by 2002:a17:907:e915:b0:ad5:1e70:7150 with SMTP id
 a640c23a62f3a-ad52d443a03mr1562843466b.2.1747751566513; 
 Tue, 20 May 2025 07:32:46 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.46.79])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ad52d278247sm732727166b.76.2025.05.20.07.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:32:45 -0700 (PDT)
Message-ID: <5d54270a-51be-4462-a02d-a12432e42be4@redhat.com>
Date: Tue, 20 May 2025 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/33] include/exec: Allow using 64bit guest addresses on
 emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
 <d3e7e584cf61c76952f4c9d913ba80d905c80e76.1747744132.git.ktokunaga.mail@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <d3e7e584cf61c76952f4c9d913ba80d905c80e76.1747744132.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aMGw7TtbP935hGxu7a7SwVyonGt3gelzBLwCNW0M_Dk_1747751567
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/20/25 14:51, Kohei Tokunaga wrote:
>     target_kconfig = []
>     foreach sym: accelerators
> -    # Disallow 64-bit on 32-bit emulation and virtualization
> -    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> -      continue
> +    if host_arch != 'wasm32'
> +      # Disallow 64-bit on 32-bit emulation and virtualization
> +      if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> +        continue
> +      endif
>       endif
>       if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>         config_target += { sym: 'y' }

I'd prefer something like

# Detect host pointer size for the target configuration loop.
host_long_bits = cc.sizeof('void *') * 8
tcg_vaddr_bits = host_arch == 'wasm32' ? 64 : host_long_bits
...
config_host_data.set('TCG_VADDR_BITS', tcg_vaddr_bits)

Then in the target configuration loop

-    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
+    if tcg_vaddr_bits < config_target['TARGET_LONG_BITS'].to_int()

and throughout the code you can have

#ifdef TCG_VADDR_BITS == 32
...
#else
...
#endif

instead of

#ifdef EMSCRIPTEN
...
#else
...
#endif

In fact, I think this patch would be acceptable as a separate 
submission, because it could be tested using TCI already.

Paolo


