Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2FFC3601E
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 15:54:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2uEJ-0004Iy-Ne; Thu, 10 Apr 2025 11:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u2uDp-0004Cf-Ip
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 11:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u2uDl-0001R2-Li
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 11:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744300420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SdA1HWLoO2kXNuLxZ0pYMZg0KJtTsj5uujt/ImDbGME=;
 b=SLoDFLR/AxjLm35NrdW3jyc3DWu5la+w8pcKgXuxeJHrPADPEHxKvruiA4T1wTH3CRdCsw
 yPzSSqhKYXe/YXywfIB6qaMrZtBRHvo85fn0wZSv+v9izLARU/O0T99ajJPBqg3iGdRSyk
 hPGFhIf1tCDnvhTQERshzX93qmyFp/w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-GWOQvthyMtiZE6lvvbLFmQ-1; Thu, 10 Apr 2025 11:53:36 -0400
X-MC-Unique: GWOQvthyMtiZE6lvvbLFmQ-1
X-Mimecast-MFC-AGG-ID: GWOQvthyMtiZE6lvvbLFmQ_1744300416
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ac6ef2d1b7dso98023466b.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Apr 2025 08:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744300416; x=1744905216;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SdA1HWLoO2kXNuLxZ0pYMZg0KJtTsj5uujt/ImDbGME=;
 b=GyenocFZXHuc6VMFv863gtX+ZC8JCltJGrDC6Zu4ythELSMpxNcrcByL+AyxX3b0z0
 74+USrm1qg7TKB3XRvWI/BsRcNEYi94V9EDqOVWl0Vomq3U32n70vwsVnZ0fzTd/Vay/
 ip+We3SGJiUJsXRtslve0C6YZjk27jW541iauSduRyUEARqypjVRzrDzCbNluFlfiz/A
 X7GarQni+SFx5g/pDqLyHFAqPWSmukH+Up/NrbR4ANWpOQKZ4cr1SuH0uNadhM+PJ27e
 qINv1uhyFEyxzuvboS265vtKX0aYxHQHSvrbfcbirHXksbkErLsXqqpn4YjGckjZnZY9
 IIXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwvPUkdMXIUNNEwd36/7LKmNQoBD3i3xzqamUdaVew6D2jy/9XArZkEuKrrFsF4Di00RLdZS6X9vcy@nongnu.org
X-Gm-Message-State: AOJu0YwbV+jrxDrxGaoWn4u3vXYFLNyDC6xnOdXlK3i8RckDaBUvgEys
 oo95cYY30KWu0w5UMonLFQSmIRq7PsdrAPTA9OWt/2EAjhUHMO3P7x1gk2+GOwEtsebYB7+iYxk
 mZK9nbFXVrPedd8MSe226yNftiqKeWovTTC+RZRpHSv/2cqsxhruV
X-Gm-Gg: ASbGnctQgOoGvBkjUX0R6UMpWM2V3ve1oq4iPg6KR3TnuQgulhieXZWq2BniAo+oJ9E
 q26NT6VU4GXaCoRlHCDtK2q1FX75WLhnNEI/Pb0BFdqrvR+DHQNto9t2Nj4aVAGqzO64DmWhqeZ
 YWNP5t4ZoZCxcut18AgK9/zyHG2eaEF6hyaQW3IEf9Doov0Y54FnQbegWMe+d/hYewIvCZ8W1Ms
 g56wSOHR/szR5GNrw2M8xxe+7qEdGKTArqcejJrzkDVfC/RVhTFMVJ8dja6pMzeZ1zaVV9PPmc6
 UIo7ZOvTY6GTGKczo/N4Ew07ksggxwmiEoBlGJhO7NO1FmaHng==
X-Received: by 2002:a17:906:9fc5:b0:ac6:e42b:7556 with SMTP id
 a640c23a62f3a-acac0056156mr260831466b.11.1744300415618; 
 Thu, 10 Apr 2025 08:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPq9I117gRAxQnVppXPN//j0+rdWODWfsdFNSbNEf7zlN/YrLkuitMXr3B2aG/FD2+GfuB5g==
X-Received: by 2002:a17:906:9fc5:b0:ac6:e42b:7556 with SMTP id
 a640c23a62f3a-acac0056156mr260828166b.11.1744300415150; 
 Thu, 10 Apr 2025 08:53:35 -0700 (PDT)
Received: from [192.168.213.163] (93-33-70-196.ip43.fastwebnet.it.
 [93.33.70.196]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4104sm297000366b.99.2025.04.10.08.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:53:34 -0700 (PDT)
Message-ID: <5cc73887-1073-49d3-8267-0e84483bfc2b@redhat.com>
Date: Thu, 10 Apr 2025 17:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] various: Define macros for dependencies on
 emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <5f2a8fa2d7116b1d65b79fbb3a95244096fb7308.1744032780.git.ktokunaga.mail@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <5f2a8fa2d7116b1d65b79fbb3a95244096fb7308.1744032780.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7IScrnEl606_e5GndRWeO7As2p6umhQ_HyhYHIrqReQ_1744300416
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.593,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 4/7/25 16:45, Kohei Tokunaga wrote:
> +#ifdef EMSCRIPTEN
> +/*
> + * emscripten exposes copy_file_range declaration but doesn't provide the
> + * implementation in the final link. Define the stub here but avoid type
> + * conflict with the emscripten's header.
> + */
> +ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
> +                             off_t *out_off, size_t len, unsigned int flags)
> +{
> +    errno = ENOSYS;
> +    return -1;
> +}

Please add a file stubs/emscripten.c with this function, and add it to 
the build in stubs/meson.build.

> +#ifdef EMSCRIPTEN
> +            error_report("initgroups unsupported");
> +            exit(1);

I think it's best to add a new function os-wasm.c in addition to 
os-posix.c and os-win32.c, and disable all the functionality of 
-run-with and -daemonize in vl.c via

-#if defined(CONFIG_POSIX)
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)

(there are a couple occurrences).

Thanks,

Paolo


