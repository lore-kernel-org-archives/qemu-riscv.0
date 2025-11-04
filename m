Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AB5CCFA04
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 15:13:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGIiY-0004vO-RL; Tue, 04 Nov 2025 10:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vGIiW-0004uD-GH
 for qemu-riscv@nongnu.org; Tue, 04 Nov 2025 10:13:05 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vGIiT-00011t-Ol
 for qemu-riscv@nongnu.org; Tue, 04 Nov 2025 10:13:04 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-44db3c8ff14so3043312b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Nov 2025 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762269180; x=1762873980; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wGemEhcrpGKA4eRbEVkDZAuRtZYzqfqUGBeTEb4mjzo=;
 b=mPZHwVk5EXkMRcAEjJfNfqkxQufhGr1t8vtM1ee/W+NroShcy5qNXD7bE0jg7yZldp
 InYkz6SbPPIjBIt4GV37F1iEQgVtrxlcMPjRLJzd/oXAQoaJtUdOntFlUh8hI2XqpsYY
 rHMQeMGp8Tk6CW3YK6rylorqPyiFWrFZHzPxQe5yiAxXq3a2E1YUHZmwhmpFV+U5GCOE
 2I0+rWBPuszAQuGlDBoW4SJymK5Sh4Ad+sBzK4B6PAg8fknNNm22J+o3N/GekXasEkjb
 Rw4V8VDSKtuCKqkri9kXP4YNLQz/m91tSZjTeUpkAmheT09JynAj4opNbtRYKR1Fy64z
 gt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762269180; x=1762873980;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wGemEhcrpGKA4eRbEVkDZAuRtZYzqfqUGBeTEb4mjzo=;
 b=Z5KBws1MrA7ktLkpi33mceIKQBNPpc9o7WIasevOQK3CiXrn2uMKtefNIDq8k7eJta
 k2UE3uPBY+ZoWgRQvg3eDgyj1zsWN9pPpAcPty8d+zUAdJ/sCTZIEOkrE49lUMufIXJr
 T4Ca8Bo9dUAc10aXfQFV7MoXjweBmv9r6GjLvxW9yNsDMQ+bgpk5R7if9O6HiGymajms
 FD+CZCoQbYF+H2UUTnR84aYwTaoZAZHlWyID0qd4ouCJ788J9E2uv2WFVlM/3wZ7fedQ
 CERFI0p0NGj7IKnMoPKyEtYg8BU7IONBkjH+Ao5mGc1XJlH5qX7liGrDDq9sDG4OmP3B
 HFaQ==
X-Gm-Message-State: AOJu0Yy0gzzIasEtnx1g9Ee1eadfgOivQTuWnFOw7BGR3UW1jjD9dx+J
 xOiiwH4KiirZVBZTTkl3w7B/Os6ApmTYc0OC9teP4mAPPJ71mhe95gsQht36BrHrkBM=
X-Gm-Gg: ASbGncsVePjJAbmH+HNH2Qxlo23MAi0r6aogU0SCI4w1OkYBsfv6g0ksR1GCxyYuubq
 9CEOm6iPDPHEwnzqoKCDJM9AYKoVFhOHUxpu9ED9ed1t/4cmMwQgC8Z+QLIF+sPN0+dLsGZwCQ0
 BLLFT4zJhAxkF5fF/KyNaoBzsBab8F9r0s++fHpuUjLyTdGnuPlCSSakd0fXV8vbMlruKh+GQXK
 Vs8eeQ0++x+tkBsWDQq1kT8D2y7sQ/hNWVzKm6NnAZhu01OxLUfg6zsm1sr/Q0CiPAqNsZh9CS2
 09GLWvO16NIfuCKNILgvRY1ahqnE7zmE62Y11NL6d+nfu6/jn3uoR9pJPrWfCbIbpEScSNUsPBl
 wkpgaID3uhZNGRT1nxfsZcrbjVWEK0FL1HxkOE94IQ/VMh0es07eT0zaJ1/il+OWtlq05zuT8gL
 sWIlryl5AsVmmT
X-Google-Smtp-Source: AGHT+IHyVgyl/Q2wJkZ0asHz5cj7xtepVhfOT8TskfTMdzvAaTkZF5OvLdKZvd6tTP8vRlbQB8xjNw==
X-Received: by 2002:a05:6808:23cd:b0:43d:24b7:2b93 with SMTP id
 5614622812f47-44f95eb8411mr7378988b6e.17.1762269179923; 
 Tue, 04 Nov 2025 07:12:59 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-44fde2810dcsm469943b6e.4.2025.11.04.07.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:12:58 -0800 (PST)
Message-ID: <a6e5f685-4bfc-4e13-b0b7-860fc0630b9e@ventanamicro.com>
Date: Tue, 4 Nov 2025 12:12:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] riscv: Update MIPS vendor id
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "alistair23@gmail.com" <alistair23@gmail.com>,
 "thuth@redhat.com" <thuth@redhat.com>
References: <20251104150708.3345289-1-djordje.todorovic@htecgroup.com>
 <20251104150708.3345289-2-djordje.todorovic@htecgroup.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251104150708.3345289-2-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
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



On 11/4/25 12:07 PM, Djordje Todorovic wrote:
> According to MIPS programming guide, the id is 0x127.
> A patch for this has been sent on Linux mailing list as well.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   target/riscv/cpu_vendorid.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
> index 28f0ce9370..f1ffc66542 100644
> --- a/target/riscv/cpu_vendorid.h
> +++ b/target/riscv/cpu_vendorid.h
> @@ -2,7 +2,7 @@
>   #define TARGET_RISCV_CPU_VENDORID_H
>   
>   #define THEAD_VENDOR_ID         0x5b7
> -#define MIPS_VENDOR_ID          0x722
> +#define MIPS_VENDOR_ID          0x127

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   
>   #define VEYRON_V1_MARCHID       0x8000000000010000
>   #define VEYRON_V1_MIMPID        0x111


