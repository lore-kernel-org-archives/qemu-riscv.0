Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B022CED60F
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 11:19:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLJk1-0005Yv-8d; Tue, 18 Nov 2025 06:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLJjy-0005VA-1r
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 06:19:18 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLJjv-0003iX-EX
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 06:19:16 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso44355185e9.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763464753; x=1764069553; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FY7MPxZayPe1OiVaDC7Ytfdu9D2keOve8OMUnuYhR1g=;
 b=Y3ePSP2FtPCDzKdInOooP+lGNVzAOWrPcn9dyKlbLExFyn8GBAiFkHm/QR1nt479o4
 eunV3N6NViAfoPTGXOusVkNObiTYmmkch53nUrx+Tk73OzyE6o+WtIGjo4MtIES+Nj01
 tqtjHCXLQUiDPV1BjCHLKLmjuO4IAC5XcKrLoCKgyoBHHlHe/VqSYqQtpD6xUizkWTJ0
 8kEtjbROHG9EE8XFDmzZO4RNTrRNk+uPGdtKF7iN43LbYERvEgWOOqXEKikeJ6zLQat9
 Pt2nhQl0rdCdZEv90EY2wBXq8lGy9ZIetsNFgIjmN9xGEtLeiptD6RNxazPVggnyYM37
 7o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763464753; x=1764069553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FY7MPxZayPe1OiVaDC7Ytfdu9D2keOve8OMUnuYhR1g=;
 b=L4kPKCseF+byWBYi14oh4aMMSRLT/8uh5yIePRLqopVgZ7Tg0rSln/bgnomNP63CMa
 zymhmG70SIdQE1GshsvmweSsV1nIJ8kOQevTENfOisUZ6omB7GmHB5eSK3X2HnPJsX3n
 ScQeSJ3HY5ZMMaIdgDy+JMpK7uanXCASdaf/YGDHzLJNwiQBFKBzLSSOOS2lu697CEmA
 VniLCs5fL6h+Uwo/Ez1qZ8Hba6i2UgTDePHRPxc+WPDmSJZQLLwCQGqMVieWCL6zsOQG
 Ju7pHHKTBJDTRkOkM8Doiv4AVok6wNRoiALX7G6ZDlIv97gkRmV3n4AhWbHy6YSwcfZe
 UF/Q==
X-Gm-Message-State: AOJu0YwH6jzBnUsKWgWHWfAyGrfMJAEUXMY9QOB+mh1b6pMMD2DOpuWJ
 mTIl+5JOh52uIgBIeFQLrbBueMNg5vF00ahb2T+TYCsQlUWBMsPBSCdGpgXCpke25gE=
X-Gm-Gg: ASbGncuGMSGKJGsdNMslfERX0ZU3u67upNcIuUjII1EQmSFQv9gFhsMPgq9dyGeNXDp
 5r9+zwMLuCXdcr8S4LCZp5jMouaDFMa5PceqdxgRMp7Snu/wR4x3WceA2UPqACb9Or/AoFoe7kV
 oSAP8WduIS+y1AZv2EwZ0LAJgkp1wHu85h6zRn/HS0f6aExxwWsMb7ME2/G7rBiEDBvuxud7AWc
 bzFqqaobPBnw2OXALmOZwq4KZEGIvHhmjAK5rgWK91U2+giujrTIi4yQ8iwfXfRBDgbiDdH7MEH
 kfCDjIhRrfYWIMeXVjD4PcivtGMlNN5bwYrtvFvvDsDutx6XMRBRovTkhhignva7r0QYuMHyvmO
 QyEs/X/eUThIjGGCOfluCea/va7alNnq6QdL4V+RSXzp2RvkV4BeuSX+puruW+EloYa6dV0l1gB
 TBrvO+6HbLufYGiaI3o6DxJnfxnpfoNGgogeO7X4Xca+Z2k40V2RQf+g==
X-Google-Smtp-Source: AGHT+IF262iSV8e5bfwsfbK0PHlbT5vX/d2qgGhVlPTeMDKbhu0BNBFd5YL49Q/Kyi3sKWXUXDzfyw==
X-Received: by 2002:a05:600c:2d54:b0:477:a53c:8ca1 with SMTP id
 5b1f17b1804b1-477a94f87aemr17407025e9.14.1763464753432; 
 Tue, 18 Nov 2025 03:19:13 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e442c2sm369906275e9.7.2025.11.18.03.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 03:19:12 -0800 (PST)
Message-ID: <16cd29b1-c0fe-4dfc-81a7-654be0ea09ab@linaro.org>
Date: Tue, 18 Nov 2025 12:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 14/14] scripts/checkpatch: Check DEVICE_NATIVE_ENDIAN
Content-Language: en-US
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>,
 "thuth@redhat.com" <thuth@redhat.com>
References: <20251118085758.3996513-1-djordje.todorovic@htecgroup.com>
 <20251118085758.3996513-15-djordje.todorovic@htecgroup.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251118085758.3996513-15-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x344.google.com
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

On 18/11/25 09:58, Djordje Todorovic wrote:
> Developers should specify endianess explicitly.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   scripts/checkpatch.pl | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 40b6955c69..dc88fa4da4 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3206,6 +3206,10 @@ sub process {
>           if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\baio_bh_new\s*\(/) {
>   			ERROR("use aio_bh_new_guarded() instead of aio_bh_new() to avoid reentrancy problems\n" . $herecurr);
>   		}
> +# check for DEVICE_NATIVE_ENDIAN, use explicit endianness instead
> +		if ($line =~ /\bDEVICE_NATIVE_ENDIAN\b/) {
> +			ERROR("DEVICE_NATIVE_ENDIAN is not allowed, use DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN instead\n" . $herecurr);
> +		}
>   # check for module_init(), use category-specific init macros explicitly please
>   		if ($line =~ /^module_init\s*\(/) {
>   			ERROR("please use block_init(), type_init() etc. instead of module_init()\n" . $herecurr);

Thank you for this patch :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


