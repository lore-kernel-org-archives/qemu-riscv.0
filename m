Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E59C0218F
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 07:07:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfD2I-0001BX-2q; Tue, 04 Feb 2025 02:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfD2D-00017m-8M
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 02:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfD2B-0004Ib-Jq
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 02:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738652866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uNjCgVuyeIElYttdKJKPR46f1EfWRRdzrsundMziGWI=;
 b=eSUgeYtXfntFkajoqLrthckq8jaB7m3hTrkpU9k1PYBwczWjWZBJ3h2/neLNZN6vBD/1Af
 mGOgXuG9iv+ZV0zi9LWLJoQmX2qB9vQiuT35Qlmp5rNidSxbM3SBnb3PqF7RYalJFRicvj
 qdfgCDmbRaI5bexvn/az3D5fvLw/0oc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-ge-aDmv0NaSjihLxz3Oygw-1; Tue, 04 Feb 2025 02:07:44 -0500
X-MC-Unique: ge-aDmv0NaSjihLxz3Oygw-1
X-Mimecast-MFC-AGG-ID: ge-aDmv0NaSjihLxz3Oygw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dab928a84so139060f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 23:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738652863; x=1739257663;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNjCgVuyeIElYttdKJKPR46f1EfWRRdzrsundMziGWI=;
 b=GiRiZdf2NGGJ48hTxDAG9GIN9RIm4UX5jog8tyNxOclwQ7RpKS5BwIlZ7zi9pW35Ba
 F3ZO6wGMqxMGCwgDmTksCMLHJ06NmM1P7kRv40FANzZx8a6CMx2DB1ukD9xDcPop8OCq
 bhnrfP2RK7XC+eSpFx1RZ3oehoJ2wgBjbwE12lMnm3XGeLtt4Utv8v+JKypxJf4ZNsk0
 5rUjCybdYeoMOy7qYda+H9GosTl6uyvMi/cO0gZz4HkNvIzc6Fd5j5w1ql9I2f9hwwbX
 7O4GaPbY6urx9v//bEzU7kIfVi7qu5Bg3o0TYO7ZC8kd5T6DXqisZPevk7zjTxE2hatU
 EZYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDO2XwZq79sHeS3iJ3M6wkgMZ7+QmSACCLv4D2zIo1Fxk76fYAEhM/ErOzA4uKY5blb9UkxpJfcygK@nongnu.org
X-Gm-Message-State: AOJu0YxLvx/gQMOcYWnp9zuArJYgbd98D8avImI/X2dXvJRwu43kOqRJ
 pgKmSxi9BYbqI3QN230BAIQXsVrOiLyMdzWSPnm6FgsPY3etneSIDh4D3XvyB6tWW0IjBKjc8Ue
 o0JudIiamLsKdQbzsq4dpNy9vGCeu5HbmceOgMuJYWL2IRrQxLE27
X-Gm-Gg: ASbGncus4GlhlXAxbkZIjEmUPYhS2bIwIVWFZMfxixaGY2PoiAdDzDsv0t0iRONa5E1
 Deqy4yKCuZ5ZkIMMfQYNBIXQg+11wN4XFDfCrFygzK8HN1f1paFt86G5GovUej7sYBp+hmKAdcE
 vIbeh0eBSXvy4yiQK0CJrGUDWJ659HPDb4ED8zpBw5G4VuZcecLytmV2ARcBcCDd53SukJDT5zt
 YYG+3ECdGqhE9K+/9AcZinjaAcdWX97KIdlA1DjIDgkjE9xwbuQD5uy1EQ0SIyNz0PqtF9AqVAh
 pjP09h68PUgIQiQw/STfkFBMLLYRkck5D15y
X-Received: by 2002:a5d:6d86:0:b0:38a:518d:97b with SMTP id
 ffacd0b85a97d-38c519311d8mr19192005f8f.11.1738652863611; 
 Mon, 03 Feb 2025 23:07:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSn1LZCScag6to9Tp3UuDQTRV5bpNr9hgs/eMUBEsWbZP5j9P7I/HeqME+MxG7HqYfaGRiGg==
X-Received: by 2002:a5d:6d86:0:b0:38a:518d:97b with SMTP id
 ffacd0b85a97d-38c519311d8mr19191986f8f.11.1738652863259; 
 Mon, 03 Feb 2025 23:07:43 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102d2esm15119864f8f.33.2025.02.03.23.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 23:07:42 -0800 (PST)
Message-ID: <47db9d33-8fa4-4ebf-90c9-db6e252cc38e@redhat.com>
Date: Tue, 4 Feb 2025 08:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 3/3] hw/boards: Rename no_sdcard ->
 create_default_sdcard_drive
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
 <20241125181420.24424-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241125181420.24424-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lOX4qokySJaewKYBLhL7sw13D13c8rVkQcu8e7e9NZU_1738652864
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Invert the 'no_sdcard' logic, renaming it as the more
> explicit "create_default_sdcard_drive". Machines are
> supposed to create a SD Card drive when this flag is
> set. In many cases it doesn't make much sense (as
> boards don't expose SD Card host controller),

This indeed shows the insanity of the previous state, thanks for tackling it!

> but this
> is patch only aims to expose that nonsense; so no
> logical change intended (mechanical patch using gsed).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 86fcf9c81f..5cec73ae68 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -285,7 +285,7 @@ struct MachineClass {
>           no_cdrom:1,
>           pci_allow_0_address:1,
>           legacy_fw_cfg_order:1;
> -    OnOffAuto no_sdcard;
> +    bool create_default_sdcard_drive;

Can we maybe still bikeshed about the naming here? The current name is a 
little bit long, and maybe we could "standardize" the prefix of the flags 
here a little bit. We already have one switch starting with "has_..." and 
some others starting with "auto_enable_...", so I'd maybe suggest one of 
those instead:

   has_default_sdcard
   auto_enable_sdcard

WDYT?

  Thomas


>       bool is_default;
>       const char *default_machine_opts;
>       const char *default_boot_order;


