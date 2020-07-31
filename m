Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YAM-0001IV-0E
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 12:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YAJ-0001I3-IJ
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 12:45:51 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YAH-0002P7-OK
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 12:45:51 -0400
Received: by mail-pf1-x42c.google.com with SMTP id w126so14581926pfw.8
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2SpEe3BEg5fTQoDgclaogKKe40Hl6yJfr0ts2CcQfNo=;
 b=DmkeI+umx0CKCLDbNM+SZdG0LqPpqg8w115jcEsmYHyhzgikXNG72z/PLJ+9hqeM2e
 HtiRpu70LucpHbwc9nCCWf+sPx4aarCuTWhDZCgznfr35K+BhGpXO4zIZEuSnXmyq+9x
 69jn/qpGTtyR42Jf0cQVCt8cBXkdObTLsGw/L9MEe9mrOPzYGpgNr+fPXgXSD8JPkVxY
 kWA6qood0XGLGPvjHGOvekZz7rvccmMgin707s5rpzfIpHi0nqXYSt1ZfbYYX4L/EXD5
 4+jw5vZYuxqaUyJ3cn9fdl7W2ZJZkMIegWeL4ejy120nL8Uu4HSMcKZgwW6WTBMpq/tt
 yCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2SpEe3BEg5fTQoDgclaogKKe40Hl6yJfr0ts2CcQfNo=;
 b=YRw+Xd37Yt1QWAUyOaRIRDRQHOcwbd/P53Ixj5GjnIrconKuXQJ3yRqgqs8tGQnWFM
 SmutRwSAFuv9l2TWc9XLCOv0+R+0blFHUwGV3GE7rjW8IzyWhwI1rRqqBpuU9LMTvx20
 7OHxBcK8VEzpK2bGOfTGczzUBwH0JhE3+SnwVOB4h6dikp6bAXsACPEE2yazYJZ7XBGS
 l13pdvU6N8vW9M8it6WrIY30yYPKCIdTVcFHfmgfJoXlmJRdtj0KF3iSW5zE8AoknP1V
 oCDjBvBi8HnSvh3IplxukFjB7qgdgGiygbRssfCs4qctUVQNR3MbM4A1kuiGcYtKpJGP
 LWtQ==
X-Gm-Message-State: AOAM530JY9hvcG/YqtGiYOCZwbqbR+lMVJ1S4TLr+hkFWXIhPMhgldcJ
 60NuAkrj3mHT3i6BAz/gOe/vkw==
X-Google-Smtp-Source: ABdhPJxf2ffi1ToTSpKOaF8ZknqLU3ywtGDen05n3K7frjjB0VV9Z352edlbbHFqhyC0+dyXja+GZA==
X-Received: by 2002:aa7:9d04:: with SMTP id k4mr4452882pfp.256.1596213947968; 
 Fri, 31 Jul 2020 09:45:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a24sm10354385pfg.113.2020.07.31.09.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:45:47 -0700 (PDT)
Subject: Re: [RFC v2 62/76] target/riscv: rvv-0.9: single-width floating-point
 reduction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-63-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbb66f8c-62af-97aa-48bb-1a26d5baeb29@linaro.org>
Date: Fri, 31 Jul 2020 09:45:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-63-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2020 16:45:51 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
>  # Vector ordered and unordered reduction sum
> -vfredsum_vs     0000-1 . ..... ..... 001 ..... 1010111 @r_vm
> +vfredsum_vs     000001 . ..... ..... 001 ..... 1010111 @r_vm
> +vfredosum_vs    000011 . ..... ..... 001 ..... 1010111 @r_vm

"The vfredosum instruction is a valid implementation of the vfredsum instruction."

Which is exactly what we're doing here.

Why should we treat them differently?  There is no parallelism that we can
exploit in tcg, unlike in hardware.


r~

