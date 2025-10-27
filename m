Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62282CCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 09:39:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDJhF-0003Ty-Kd; Mon, 27 Oct 2025 05:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDJhD-0003TX-4P
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 05:39:23 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDJhA-00088Z-EG
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 05:39:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso13542895e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761557957; x=1762162757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L9Gkw6WeDhF1XM3MrljCsuR7+7JfXHtFQGXbhULjP0U=;
 b=QZo6YiD60MSNYSNrcF4foRwyAgevPBUZF7QUkDezMKi9O6FJpaZ2IUyYG97TUTCPSH
 AoX3rkHAHOG2IY1oDmqQYAw7tX99iqU52VQdp02VftGqVd+D1CzYOpiJRqQgh8+tYKE6
 m/ffkku+vOgtXoRVRuM5gUyP9KIpQtVf/Y0+Nigk9vK02FeXxdd2s+V1nC5dLz9XUjoe
 2jnsgpJUQfxvrfg0hHsuZjYrepxkjMhuzgJhpneYXhUhFb+OYSKcbuoZ0SKjO8YBGMez
 AOuoboPbuySH58Aqd9oZIBZtQGqC4oc2dFVjExgjSocfy3WHhJDigQ2MHdzHDt1uC/l8
 /cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761557957; x=1762162757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L9Gkw6WeDhF1XM3MrljCsuR7+7JfXHtFQGXbhULjP0U=;
 b=vvorWIXb2sTACYmjizSxSsC+Tnv4pSdlDEWjpCKz1YWZutBp1LusuK5rXCvbW4Lbb0
 HIZ5h/3rhZehA/rxMk0eNLWCPDgtawAWQ9gnjk6ECTbyvxP6AukEMSdbRKhdriqme7ch
 20IWaGXh+HyQVNMda56Y0WKab+HE6KuALXth/C01EEUV2Y793+AK12eryMdlm4qhWFBi
 r3pvG2yDV4oHG5eo3qjrw2qYpxDQWY5BxYVeP5xz7GEJOAtHQzwRmIvPjYix+ToWkMxf
 h7DDT8dS8pxPF6yc1xJNulsCg6jBYTCJt9S/5yLgfH+xkf6n6mKodVUQlb+CWM7oXAGG
 Hslw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0TBSeG0r8Yci1F36UoCV4UP5EcDfDiD7rE37ZpLfDDVUW8XPLJtAxb+xgyZZFEJvQCKB/xN299heF@nongnu.org
X-Gm-Message-State: AOJu0Ywfk6avpQZZvas0M1NPwdAWgGTk0kRhCMNBKKT5HsJ8chf0bdWd
 zgguLkbofIbwDiy8L8nwwMftpmfhch0i0WIAfU1OGRUS7x5uvwoZlwuxet2KPqktXrc=
X-Gm-Gg: ASbGnctWbhHe1kFkA57M9zE5aT929nyzY2kO7WHOZNNZ+YBEdVZaAdrJRhPwDIAQXHe
 i1WUztb905pjGAb+awJnPhm6oKQhIk5wnx6+hmRa0nzsZVSHrahe0cmRqXlX+xbnBwadtzvgLwl
 /DLXfuCwtwFZhYXFcsfwMIbTIAwgGo4Vi9bYSyJ4wtZU2Tv22gQNyfLGvNQa3UFf2iYQSFVB7D5
 8ipNmugcAJhdHPqPFjLrA+7Bt7mjGYhoEN1+CNN6P8R8V7/b8Y0G/pN6yigh2wPwGBxF/2m4uw/
 j95R8fAC9J+RMpC0HfObVlOlsNMwHzO/o9qbLDkXU09G3JGVTJ/gaZms+UebunXWMO51MYRRv/A
 ieWOgWb+yFppfG7K/UPGx26DahUz/nit+1h0E45GFoK/GhyzOty2wXw9HLEpaX183BRCtQyBKgP
 Rd0DaUY6mT5g4NfmXtsSwsdkAEMGv4AJl6ULQDQKBh1UltyFgBwnmgYg==
X-Google-Smtp-Source: AGHT+IGGPPPLJURIakloQq4g+YRAP2mO1YOSULpfld03rhRMn+vtjCGttBrNyEYdZEXbRG/IcOHYhg==
X-Received: by 2002:a05:600c:870b:b0:46f:b42e:e366 with SMTP id
 5b1f17b1804b1-4711791fa34mr274052075e9.40.1761557957116; 
 Mon, 27 Oct 2025 02:39:17 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02ce46sm146112475e9.3.2025.10.27.02.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 02:39:16 -0700 (PDT)
Message-ID: <4aa9a5fe-4987-4140-a2b5-9da2677c9b19@linaro.org>
Date: Mon, 27 Oct 2025 10:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu: Fix MemoryRegion owner
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20251027-iommu-v1-1-0fc52a02a273@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027-iommu-v1-1-0fc52a02a273@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 27/10/25 06:37, Akihiko Odaki wrote:
> as points to the MemoryRegion itself. s is the device that owns the
> MemoryRegion.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   hw/riscv/riscv-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


