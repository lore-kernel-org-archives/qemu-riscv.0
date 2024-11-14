Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE91D6A221
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 19:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBfL6-0002oM-Uw; Thu, 14 Nov 2024 14:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBfKt-0002lL-Pl
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 14:17:01 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBfKl-0007n3-Qf
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 14:16:56 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7f4325168c8so666558a12.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 11:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731611810; x=1732216610; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eZH2DVANAG+P+eSPg16nqAoHHKBm4JbZrp1eN8ibWPI=;
 b=XgCOVO4+vfyLjJstsfgrkyCnlPa1Hi/dGEHHigZvKaJcpLt2oGuOIHEH9eD7NxbMRC
 2v/CT4oabzlLthOU8bh1G69V+Pa3zFBFWMANeaWqvtjOb/nhPl5jMzmBYiI2yPBWsamZ
 LXGc2+kPX3wrVMpk2wvKyscpqWhe0o8hCyYrxvDD6UVbLz3ac2CLJn35JRsBwRqgFTBF
 cEesMtskAOMTXZRsmFKNKUuqnk2Ke3DSlDkNQ2xQileyG5y4JCXy+2xbgu2JnnncTs1/
 5Z7qypB0B7l+Asj92ticB3CF+xuwYjHjdtRGfyRoMwyJMigfBayLaK9HaPi2UqLJpx+9
 jG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731611810; x=1732216610;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eZH2DVANAG+P+eSPg16nqAoHHKBm4JbZrp1eN8ibWPI=;
 b=SMu4rnCMKBaHQl2Vnf1+jMuaKbKObAfH17HBY5xOnQ9l65/TexvAD2xZ+VAB6K3xmK
 94ROa8Ryo/x0Q6LCzK6B7/pcpPmXMh0CqFERg7CTwEIdjETVccky5ua6F1pEkeFRBmuZ
 O83MwALsG8wlEs0jyce4niEBI8bSCY9XuCYdvcdRCt99LW8h1Syviu3xREEMSVW4XbnA
 /mWPBnbtkdo1xveiTxijTxMOkEGyCTNj1Dn3FxiWwias1WyJdDDJ1bDYxGIQ/uvFWUaN
 f1DZmHSOxx20fMC3Ph4eeEaqOpM0Cv8oMw5AORWQ0I1ZsRPm/srh7nheOEfMRrLlpL4m
 fmHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpMSI10Z9IXnSAroaPajDIdp1YSkT1uMDkWPaZ9pbBNhIFZCpzE1dHwi6o6rZiFup5i3utCjUjR6cF@nongnu.org
X-Gm-Message-State: AOJu0Yx6a76fFPRfIAFH4C45+7TAGj2mYjy07d2ClUlPghvFz9z1oVAI
 Y3il3rdUIlORmAqPae6SGEO+NB24uSFdcZqAarGshhPpNchVrrKfcQc0gQDRYFc=
X-Google-Smtp-Source: AGHT+IG2WSy20tbd1WlDDd2eLCFXNIER4y+7/RAis5HfZoesliPPN00wgYPkBLb8EtO4vn4Yjri2iw==
X-Received: by 2002:a05:6a20:1594:b0:1c6:fb66:cfe with SMTP id
 adf61e73a8af0-1dc7039d061mr11177170637.21.1731611810338; 
 Thu, 14 Nov 2024 11:16:50 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f8b3563522sm1455253a12.0.2024.11.14.11.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 11:16:49 -0800 (PST)
Message-ID: <ac704a1a-9738-4531-88f2-e8e9584682c2@linaro.org>
Date: Thu, 14 Nov 2024 11:16:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] accel/tcg: Have tlb_vaddr_to_host() use vaddr type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> abi_ptr is expected to be used in user emulation.
> tlb_vaddr_to_host() uses it, but can be used in
> system emulation. Replace the type by 'vaddr' which
> is equivalent on user emulation but also works on
> system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h | 3 ++-
>   accel/tcg/cputlb.c      | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

