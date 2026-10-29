Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BD3606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y27tqmtf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMP4M-0008AQ-2i; Thu, 29 Oct 2026 08:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP4E-00084g-7K
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:17:17 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP4B-0000Lj-M3
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:17:13 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-563a0462094so935126b6e.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276230; x=1793881030; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TgiqfMt4enZALtodJHzxMyM1+EJFhIjqABitftPbU9k=;
 b=y27tqmtf9gJT1CsJAoYW7C2mi4eXBST29ktwSR5wqG5SlLH3A/QdREB5JjLzW7YZAa
 a3K/KViXHgRzS1D9hPRLuEva3Mo9j20h+pUXNaCXcKQFUxH9VhqAkoinJ2P1T5klczsV
 NSh01iat5PbB334saewdhWTJOkOTwjLdhL/HehDi0xI1F1oFdiq+u5zjlHuDhSpvAWL9
 vzAoji+co/3AQFH7AFCdwJzh/VaDi3vHw4xK1iKHDGQK0u1KWRuVIMK3LUmrMk7KRirE
 FYRkX6Ot/GFq+F/YYd0jcDnjnk/e3mvBdhstTms/VWN64h9oweyA7S2Zq2GHXYoFys+r
 b5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276230; x=1793881030;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TgiqfMt4enZALtodJHzxMyM1+EJFhIjqABitftPbU9k=;
 b=N6vGnVROFeokDnYwYG8zugrMybIVd0oA3OZMZHe/X/nx0aP2tWEZvrs/eVgLHe74xi
 yZ7c0CwpQkaa5S3FHRdpam2StQRedjj7AKHQkcGAtvp0d9eIo9p0jGTClB1VZLnypTbE
 huHVb6Sm1K/gmbQaUVq15yB1yxyoxx160q7bOi49Spoqp0wKjxAd6SJmT6gE7mEjbgVR
 oWuwUmgIlORVX+SEtJeOVRuHuvPDVtk6EkNpWws8/XFbnKE5KpkiUMluhAqjNkpJknzG
 Q2Q2cbyk3M9YaLzbbjOaIyOpJicerSs4sJv3LRVQByNVgpUn237stHZGFV7TaAOe9CEY
 72Jw==
X-Gm-Message-State: AFq9FYIn6Yzm56idC1iHa1WpQ8TO61PkrfFz+R7eOA3esRVGvdoHTZKw
 U3oSlfTjH0aM5pYU+ngGT4Psb5W0M6DDIbwJh+AWXwUHjpJXMqUf/YL1klXf4ZhEsLM=
X-Gm-Gg: AYBFou1leMaUbnA2kqb89UlZNtE+7fKaFhFNKzL17sIQmYqYsjx5zKvcKqQKg7NCqIZ
 BHQuT+ryTvPHjfuRVaoLoPHS6iemR7WweEo9QDrNh2KaAMP6xSRrU1VOcsW8/YOfAbgokS4gMGT
 1HbMIHLsTvc/tE6aXdrR4kidwwEpRegIlDHQXiksH9NWT3/1tL+Jj6ekMvyZBcxyotBQKcwqWec
 XyghyVuY5+ROkDIpId8Z4103iXPEZmuNB8GARrbqDIdYbcTBWv9Nh+mV+v0v1aodYSxnRc5W6WD
 KGHv1ftysQ5I2grNTapyZDRFRcP2yCRDBMVUaIiYE9RRk4fGE4hKSq80quzbzaL46jBJ9L3vu8D
 RXo9fFYfKHaKi2eEWofWb4g19uRX8TPlBJIST85IBwFQH1zwWpb3sH+4ENQYLNdML20K7LLqlsr
 cV8dwMXXuoeRZSh+ydWCqBnNo1CrNsYfaiIVavUW864cidQfQxgPRUG4DOJqbzQ3HSPLlL/nzbM
 MHcDXje8isinc6LyOSrsqRzAYb6ualiBmu67gbwqKnlWk+mDlyQW/+FuRUgE7cOOBR0uyLrz8f2
 50P+dDFlaj9Fa9mf3X66UPO8xaSKvHuNkI9KvVpeksuU
X-Received: by 2002:a05:6808:1529:b0:4ea:b0ab:b753 with SMTP id
 5614622812f47-56383e91b1bmr3359378b6e.50.1793276230154; 
 Thu, 29 Oct 2026 05:17:10 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-563c654ad38sm3716945b6e.15.2026.10.29.05.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:17:09 -0700 (PDT)
Message-ID: <cd19db27-b5c1-463c-9475-67808a4e88b4@linaro.org>
Date: Thu, 29 Oct 2026 07:17:08 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] tcg/riscv64: Extract elements for vector
 arithmetic immediates
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-4-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-4-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> The .vi emitters for add, reverse sub and saturating ops pass the
> whole replicated constant (e.g. 0x0505050505050505) to encode_vi()
> instead of a single element. This aborts debug builds on common
> vectorized guest code and is undefined behaviour in release builds.
> 
> Add vec_imm() to extract the VECE element, and use it.
> 
> Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

