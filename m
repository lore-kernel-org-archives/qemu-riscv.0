Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E58C02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:38:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiB3w-0001Ng-6v; Wed, 12 Feb 2025 06:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiB3u-0001N1-CU
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiB3t-0008RG-Dt
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739360266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fdAx9belAf6W5/OTtK5Mrt9oS3V2UprySoa1u+ILRdA=;
 b=bsYGzcTN5jEQ9SY/HWBZI1v1dz+XTqVtsWh9Pr1vc4gfyGBNNdhnLQ0uyJhkgy8dcFJ89I
 XLPYJS0C7FWi4nJS4K/hfDxi9+Eo4nbeb7vOtRdh1CyE7XnO+PwDyv0YIeepa+jRHH/vNP
 nb5Pi76DEoIepARY3Exs640ME5789uc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-KoTDfUmrMpanghXnUcdzDg-1; Wed, 12 Feb 2025 06:37:42 -0500
X-MC-Unique: KoTDfUmrMpanghXnUcdzDg-1
X-Mimecast-MFC-AGG-ID: KoTDfUmrMpanghXnUcdzDg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38de12153d4so1940773f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360261; x=1739965061;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fdAx9belAf6W5/OTtK5Mrt9oS3V2UprySoa1u+ILRdA=;
 b=XnGJWQQYmEqWIA4UOG6VcdfdJo0kuoUQHu1/el1D3FWgJ1GPr4+5S3iQESCcKn+kdu
 4UhVHaW0gDR6EeiFIiT/6x980v8scYJlCN7SAWMGBORbIRw7rxD198KiIzbnP02cqegX
 DLIfbzWk9DBBGJpr854LBmzMr+HshkxtQAXo2H87JVX4pnTRaT0aypyxuekqh+1sWp7l
 oKmD9qVFvqderWz+LKBOE+UumUlK09OIjh+kCU1EQNWVJSISFgJn2nbwhG6CbNzShQ+c
 RcdjS4r0XJwHIIgFmByzZxZfC/ovGYJVqExVStIm3KnECEC7rN5Ba+si8qRAvNJ72Ohi
 rcEA==
X-Gm-Message-State: AOJu0YyROuOA/fkfdM4Ih12Zf6BT+cTQEYkcZy+I2f1isj/vwYmoVhcE
 BiIctmChhUCaeeksoR1kV2UcsbZW9vBVQLsxZROtKxmM4xRMRwnpgsPH1xQ5oA9aVHt/nLUoCS1
 LhQMnsEcRSbOCOe4dRZdtwZ5HX547Q6B1yaO+1opyv6cRm1ltS6hX
X-Gm-Gg: ASbGncv9lrF3bGF2Tw+GEEOQmJ6APoht0+KxOdffBDnMMhaJ+N2oBtQV8BEwnJzLiEV
 irVpbWxCZGT9RHTfhcyf3ybHlxree8X9je4kKpzJ83lDdvNJOnDM1Kqk/ZfpgroikNMYzZ2iaG7
 zzokxYQ/V3teXkCMaRBn/ehEZoBsE9VnhLdRMJb0b1VYrlW2fqfnzqmT1kFLWb2S1eSznIsHwXi
 xYVdBMwUe6Bhtd1U5/ppkXhuL2cQYKrpKibGUJT6Acpf6iRsnJ3ny7X4m0RJbjV3Dm3xxyDpvP4
 +ykI33Fl6VXKBiMWRP2lDKCwljWXn94sHQ==
X-Received: by 2002:a05:6000:1887:b0:38d:d69e:1326 with SMTP id
 ffacd0b85a97d-38dea25917emr1984523f8f.9.1739360261608; 
 Wed, 12 Feb 2025 03:37:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlFC6J/cuJbi5s9mo0Cj8OHoQL1hf7dLhicQRKIUADg1ueKyFbiVob+EsgUpMBByyc4bN7IA==
X-Received: by 2002:a05:6000:1887:b0:38d:d69e:1326 with SMTP id
 ffacd0b85a97d-38dea25917emr1984494f8f.9.1739360261094; 
 Wed, 12 Feb 2025 03:37:41 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-37.web.vodafone.de. [109.42.48.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcaf3e4bcsm14209303f8f.41.2025.02.12.03.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:37:40 -0800 (PST)
Message-ID: <cb828dd8-25f6-47c6-9ac7-cae5b0d0932e@redhat.com>
Date: Wed, 12 Feb 2025 12:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250212112413.37553-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EhTxnZHLouf8UWXw76yGrt_zoKGnl6wD9CPL3IYTDjA_1739360262
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
> Endianness can be BIG, LITTLE or unspecified (default).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   qapi/common.json                    | 16 ++++++++++++++++
>   include/hw/qdev-properties-system.h |  7 +++++++
>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>   3 files changed, 34 insertions(+)
> 
> diff --git a/qapi/common.json b/qapi/common.json
> index 6ffc7a37890..217feaaf683 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -212,3 +212,19 @@
>   ##
>   { 'struct': 'HumanReadableText',
>     'data': { 'human-readable-text': 'str' } }
> +
> +##
> +# @EndianMode:
> +#
> +# An enumeration of three options: little, big, and unspecified
> +#
> +# @little: Little endianness
> +#
> +# @big: Big endianness
> +#
> +# @unspecified: Endianness not specified
> +#
> +# Since: 10.0
> +##
> +{ 'enum': 'EndianMode',
> +  'data': [ 'little', 'big', 'unspecified' ] }

Should 'unspecified' come first? ... so that it gets the value 0, i.e. when 
someone forgets to properly initialize a related variable, the chances are 
higher that it ends up as "unspecified" than as "little" ?

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>


