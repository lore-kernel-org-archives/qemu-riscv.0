Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589EEC36010
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 09:08:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u3AMk-00038I-5g; Fri, 11 Apr 2025 05:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u3AMj-00037g-54
 for qemu-riscv@nongnu.org; Fri, 11 Apr 2025 05:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u3AMg-0004LX-2Y
 for qemu-riscv@nongnu.org; Fri, 11 Apr 2025 05:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744362475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wit5nAM4wkpguINE5v7fffgRXaaImNpdDDK3jmum1PA=;
 b=PEgwpTv14XYnS8iuTKw94vMdsxNJEf+GUN4nEW2omgJ+gkoYtaEY/MrViIHH/efgHyLYn4
 /lGVsa4pUxV54iSS08hRTd7uAjWugIfApuPsMPptOpCNN6wjn5K+hSuBS3bBDpLRAwWxc0
 KquaTAL/oPF2ztxi38pAUTDFor6xYLI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-pFx9eOmMNAOG1RjKoWgj0Q-1; Fri, 11 Apr 2025 05:07:49 -0400
X-MC-Unique: pFx9eOmMNAOG1RjKoWgj0Q-1
X-Mimecast-MFC-AGG-ID: pFx9eOmMNAOG1RjKoWgj0Q_1744362469
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac737973c9bso110955766b.2
 for <qemu-riscv@nongnu.org>; Fri, 11 Apr 2025 02:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744362468; x=1744967268;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wit5nAM4wkpguINE5v7fffgRXaaImNpdDDK3jmum1PA=;
 b=EyxewEQdCdtCYsiDDb1At/I770D/bS14fn3p7W4vNw7W4WR32NjsBpZAQgEMBLYuO1
 cRzi1n2Q5kP5THtElkG4WifnQOgSnB8pAMNb3zyoLNJutAp83skKuzpG4qwWo+vzBCy2
 seaE4GH7wrIAspGgK1L6L4N2GID11c23fKUgvR9fwIxrR3TEsxgkq39Hb6MjJizigDGD
 HVAZEmRylnfeO3uO5WEhbhGKVLgnQBRHJhmfcNH0jadTmCQB3qowWphC1xVCRgyNTh0/
 ljpo98GTqb1e9Dx3OlDbLKnnGhnZN6ju950RgfyoLgpRqk3d8urhRSB/rZ+h9dI92uRK
 /zfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZyduN7HwfN+icZ9f+ItyfWQELxRbz9K5s83+C16FrAriIY/wj4S7FlQBlZF8Luf/rxIESolHdiFjD@nongnu.org
X-Gm-Message-State: AOJu0YxwTCmUvxHKTOwp1CqJRJ60VFVCCle4wcfwJuDy5v6eD0WklgHc
 tjaZqRWSXlSLoxZNLlqlIWAahfbWOo0woSusdZb/V5EAI097+5XCiiZEXxt0zepB/6Hq3+X+pRQ
 JpyRxiyDVGsyMVt106GyCu2C/GN+JPXkUiChjajJDj6lCVaLOcaKJ
X-Gm-Gg: ASbGncsoMamPVUQ3sftVFUv2jlLbRpQPmGP53UajLWN6lXNtR7O0/0Tk1MixRhh4b7g
 s1O2bHiv1csBlHoKp4G3J/JZdyvNDAwfeLblIC92Akr8Zmwwh3kpQswNJ8fmEN971pP5pVNar/s
 PL4ilK3ZXZKUw6jVk3+WhYKQ4Dz/OjkWhgluMsKuEqUgJ2VapVmcRz6J/+WrKgNpHU6kV5mb9Eu
 n1x7VDPYpCr5++82EFMpVHSAF3QpDm+GjOWIsdOf3sB1x8ZW1mLm0pakptDWNK6Ann0YjF5BV93
 JHtWa77zbjGeonEMA8Rs
X-Received: by 2002:a17:907:cd0e:b0:ac3:4373:e8bf with SMTP id
 a640c23a62f3a-acad3439f51mr160071366b.10.1744362468574; 
 Fri, 11 Apr 2025 02:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX4V0Kxlp31esIYoLp/xQHOhKge6JN4SRvRw2rAHvwwAeQzEPOfGijwDCw6g70baKewlTmgg==
X-Received: by 2002:a17:907:cd0e:b0:ac3:4373:e8bf with SMTP id
 a640c23a62f3a-acad3439f51mr160067066b.10.1744362468117; 
 Fri, 11 Apr 2025 02:07:48 -0700 (PDT)
Received: from [192.168.136.235] ([176.206.103.255])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4204sm410087866b.116.2025.04.11.02.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 02:07:47 -0700 (PDT)
Message-ID: <26951ab5-cc40-465c-88d2-d70e98bae3f6@redhat.com>
Date: Fri, 11 Apr 2025 11:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
 <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xXUkgyI7fq3scQrleFOvA6GyaJsCz6G5npvPUB4ab-M_1744362469
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.593,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/10/25 15:13, Kohei Tokunaga wrote:
> > The biggest problem I'm seeing is we no longer support 64-bit guests on
> > 32-bit hosts, and don't plan to revert that.
> 
> Yes, so the sixth patch ("[PATCH 06/10] include/exec: Allow using 64bit
> guest addresses on emscripten") should be considered as a temporary
> workaround, enabled only for Emsripten builds. It will be removed once
> wasm64 gains broader support and is adopted in the Wasm backend.

Maybe there's a way though. Currently we don't support 64-bit guests on 
32-bit hosts, but more precisely we don't support 64-bit guests with 
32-bit host word size.


The wasm TCG backend is able to compile with 64-bit words:

+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
etc.

and if x32 was a thing it would as well.  In fact the changes in patch 
6/10 are not a full revert, and the "#ifdef EMSCRIPTEN" could be changed to

#if HOST_LONG_BITS >= TARGET_LONG_BITS
... use uintptr_t
#else
... use uint64_t
#endif

Paolo


