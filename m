Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A286ACFD37F
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:29:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqHh-0002ml-U9; Tue, 25 Nov 2025 05:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqHZ-0002gu-Mf
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:28:26 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqHW-0005iR-TI
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:28:25 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so8841322a12.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764066499; x=1764671299; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wp5/syD0+o/LyjTyIR4uS8V1NpnQlWuYtR2o807A2NY=;
 b=qr6y9Z4cz1gKaVoEw0Ltp0XMX4nQ8pBauApl5Fy9pCmJgqGekpNKXk1JYUozIcdv4T
 82cIc9lwalLDniZbZoo3wkl6R0Hxh01ZyHXzdMUbKX8BpVdTjvUqpfq4dTmNs38yBMsO
 8VJXKfuJnuBHDcr6rxYF+YvicHztUA5+H7rLAwEwTWeOYRI9xW/crZGhP5bZYHdbQS0G
 +rZfldja1P8Derc119CZLqOHAsmpxeB0PU/SWynjqpVgYj/+2Jl5GLb4Z9apG50psauU
 oplaT58PrQ2rKSs4TLNlSDjCW99UPY5QNXX1pdM+Phe/4J2LZ2MeuFwdRIMuhzz2dcSd
 827A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764066499; x=1764671299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wp5/syD0+o/LyjTyIR4uS8V1NpnQlWuYtR2o807A2NY=;
 b=WK51LiMFuAQIw5zuTPPKwXuAQrWme1w404ZYH49ANpfi8eXcKHDwmoYQ+biMET8kPm
 FeHbiperrKZNKjAX7j4K5+0IBUDQCqpZ8ij/B72t0LUC178Qu8WK57wAWnTI8HDqF9LX
 tX6PBAIbAGk769uUE5KU4fbR73zLQXqhxI4i6m+3rqdfdsq442hVazA6sHcqoZ9BJM9F
 MczJDjsTq/8ayf3T8hETcpKauafKCBBIW2JkmQ3wGaQ8v/OruAy8HA4CpUya2pyHwXJ0
 Uhpm3PBDpvQFWPFkexO6lSfXeU57gclKpSY6iKtlJNTi3HhT9ZRUlREOsIk6ccp+82A0
 xGoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeA715bySYIz+sxd5JcgMfNdSvmF/d3S1CHHRKUQI+7sjQ8+lZELYE8frMEk70W+7jzJxRfOKz38wJ@nongnu.org
X-Gm-Message-State: AOJu0YzrCqRB2mI3AXH0pDHywjbwNTlZuj9PSLjX8Mk86h/ot0H9hQ7b
 XwXj2LdolWnqk4uOMdeDpbTEFpH9bPXL5jEkabNz7VVOOprQ557TO5+qU/JlLZzAoHM=
X-Gm-Gg: ASbGncu7xg3vRCUS9lpHfryYzT068pIju0O4kqtrSqdsPp3KTsWTT3ve6vPQeoq2Dnn
 61ygZcPI1OzfqcLpHUO5TOOkqMLjdwz+9+PI8FcDjvMTC1vgbADZoekokPYIZwkOn5SYlwkfrvg
 YpGmWvPsSu70pN8ugC5KgV5LWLnjFS7L0WH9v/mcUVUyI7ylexORvsnKgqdDIH87dkroR+mgBD9
 G9+Qbh8TUrwB4/XeCXKBCOuS84BsXbQ2PwqBN2dXPIInK83KbT/6GfqI9om/6+0GG8hxNdeMWBw
 ytF2mvYNJ0SLyiFBqFaUnEtnVFdmV5EYQgFa6hnhKwN9mnUuNlv7fHB3WYwwz/bBYNauZw1Nfhj
 GY3q08BBL6esh6lX7UKzSSWrwE46LlqGm1TZLUXK1t+YRODs65pcvBRWEcaNDzsLlojouwS8prW
 gx+qCG1aitRKoLkUe/LtYxgjRO8NOCGgEyV3WHPWE1paxvRPazWfAeGg==
X-Google-Smtp-Source: AGHT+IE3PKjG7rNMmUMO0u0YPkOHg97YVfk6tokccVI/wtgGNpt9SgcH/ClnqkI9yxamQKVM5NvRXg==
X-Received: by 2002:a17:907:868f:b0:b72:5fac:d05a with SMTP id
 a640c23a62f3a-b7671a47ae8mr1360006666b.37.1764066498581; 
 Tue, 25 Nov 2025 02:28:18 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd43b1sm1532571066b.38.2025.11.25.02.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:28:17 -0800 (PST)
Message-ID: <a5388c93-124f-42ac-8881-3cae4bb620c6@linaro.org>
Date: Tue, 25 Nov 2025 11:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] error: Use error_setg_file_open() for simplicity
 and consistency
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21/11/25 13:14, Markus Armbruster wrote:
> Replace
> 
>      error_setg_errno(errp, errno, MSG, FNAME);
> 
> by
> 
>      error_setg_file_open(errp, errno, FNAME);
> 
> where MSG is "Could not open '%s'" or similar.
> 
> Also replace equivalent uses of error_setg().
> 
> A few messages lose prefixes ("net dump: ", "SEV: ", __func__ ": ").
> We could put them back with error_prepend().  Not worth the bother.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/9pfs/9p-local.c        | 2 +-
>   hw/acpi/core.c            | 2 +-
>   hw/core/loader.c          | 2 +-
>   hw/pci-host/xen_igd_pt.c  | 2 +-
>   monitor/hmp-cmds-target.c | 2 +-
>   net/dump.c                | 2 +-
>   net/tap-bsd.c             | 6 +++---
>   net/tap-linux.c           | 2 +-
>   target/i386/sev.c         | 6 ++----
>   util/vfio-helpers.c       | 5 ++---
>   10 files changed, 14 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


