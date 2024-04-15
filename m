Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40834C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 16:49:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwPW1-0007DK-Ix; Mon, 15 Apr 2024 12:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rwPVg-0007AC-Qt
 for qemu-riscv@nongnu.org; Mon, 15 Apr 2024 12:48:49 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rwPVe-0005KK-Ug
 for qemu-riscv@nongnu.org; Mon, 15 Apr 2024 12:48:48 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1e651a9f3ffso6949935ad.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Apr 2024 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713199723; x=1713804523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFzuPWBjHOi5jfnpZTkVNprL9qWgrCLYxanfJmaFGOc=;
 b=MSRoALAbbOkJJ5kkaPk4Pcg84BVCL0olUESrm+qe9Ty0gLP9Z67KoeQgFgiPKKL7zn
 3CYWvYyFX3bWApzYj/3buPGQDuMQUJwi2kaKC63O81Fwizea1E4/eRkTT14FUdP2SUu/
 80FegsP2tbjikey8r+2EWBLehcpjlnwrNOAbXPRRjhwak19n5jmI8z/G9rYgaziKDkde
 5JjzlB8d/APxeY/tLJbFI04GupaZlxU2k/7rsxONHFVO4CZw9nadXlpY+edr81rRfxJH
 OD1JMVeVX4t3HWwc43FS/qA3OAttiIzmkodYzXBFiigxIFdvlrrnO1YGYj5f4M+65qxf
 QJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713199723; x=1713804523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFzuPWBjHOi5jfnpZTkVNprL9qWgrCLYxanfJmaFGOc=;
 b=AfrpT0eQsJOlE3eMkOmSQoPCVQo9FUBdFYwNmosar68jwN4zU2IFNdV5jRaJsnE3v8
 PFqfRoG5wvgDIcbQ6g/xaCwOs2/PlKUkD1nwPSWCz7staRhoM8tW9cnAKAZKl0Iprz/D
 4Rc7ADpJYIy8LsXOwSG5fcVdiFVwfWPbLDWM2+6Clw7oSp92hD8NZUnJ9puAlnmUuJsZ
 DQ/ejXLyP4ECkqjC8hyXTpHh47QZsOdKObJOqSDPcAkVcM0X7EQ9zwRFTltDR8SO3VD/
 N7jv7xr7g5fCHbvYGu1lgr33noKhVwL31I7Q588KGIQUwkbjf5xPcv+NRF+ygYvf8H5y
 q9pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi1IAdHsrCJ7LrWwphgyirHU3vZJDUA6XB1cpAdej6yYmnQEePLTRzc3DvqxhJQn3Y5FmIbocEkpO+iI5xMdwYFp2u6Ss=
X-Gm-Message-State: AOJu0Yx7IgMjnMui2270+Q+0+e+blI2QbZbLENZJghS0F2BZfF4KcwPw
 Ax+Cp0HgANF22ynqGWV/LLlSuLFt6YA/ufkIWz0721K/2sJ3o2DnyVn/UF6kQeg=
X-Google-Smtp-Source: AGHT+IEMX133cxctRCQkZlI6UDqMw1JHE925QJPGDbtOUjNY9XevPhPELluGX3kJBxZuC7NWnIb13w==
X-Received: by 2002:a17:902:7609:b0:1e5:10e5:b675 with SMTP id
 k9-20020a170902760900b001e510e5b675mr9091584pll.32.1713199723288; 
 Mon, 15 Apr 2024 09:48:43 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kw7-20020a170902f90700b001e45240eca4sm8150401plb.196.2024.04.15.09.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 09:48:42 -0700 (PDT)
Message-ID: <0a3c4f12-96d7-4f32-9dda-b349ede39f25@linaro.org>
Date: Mon, 15 Apr 2024 09:48:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Improvements for switches in hw/cpu/Kconfig
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240415065655.130099-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240415065655.130099-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 4/14/24 23:56, Thomas Huth wrote:
> Thomas Huth (2):
>    hw: Fix problem with the A*MPCORE switches in the Kconfig files
>    hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

