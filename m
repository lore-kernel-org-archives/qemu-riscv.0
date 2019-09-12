Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8Sev-0008QH-4F
	for mharc-qemu-riscv@gnu.org; Thu, 12 Sep 2019 13:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Ses-0008Pr-VP
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 13:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Ses-0007gN-12
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 13:13:26 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:41566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8Ser-0007ft-Rw
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 13:13:25 -0400
Received: by mail-qt1-x841.google.com with SMTP id j10so30433090qtp.8
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2019 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=afTPPA49IbNVhaNyhjkOUPFoYHKl9mFW6We7h9oEz4E=;
 b=gd7rELALpC4YwCf2x5n/iNFU9MjS7oqqtWOxm5zKahJD8vJixIQief1a6/+HXJ7mYx
 GMyAo0Om6q3P9EkQdLYealxImxS4YimQu9cb7z1kiKz8ERLTEUs5ahTht6l5dsMYdmc7
 oviZtKT6opLWL+BzNrzAlKrBWjE1X9JHGNKZHEUFNmBUrp/IyIYg3WBeykintJoS2bLU
 me84hMBvo5t4JGh87rBM5k4t9Gums3OTlNiKeHuswfjvcdCxlx5EEvU+HUtltry+qej4
 a9FZSOmvVspKKOdMDTfnx9HXlW4ji7gWSJhZlh+5iQxwQUa04EHXBtEIntyGAfXX6dzP
 yD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=afTPPA49IbNVhaNyhjkOUPFoYHKl9mFW6We7h9oEz4E=;
 b=A441DPqNhqYbIOznUUy0pfYY7294l48tN/SQtITRywtrUzyUaZEI/TipsckzA1pDTO
 4u7vvSgE6zVr1nf5DVQkIKzfrzjdMsDbyNNY2+4yUXNmfFqjr7145LJe7mh7+wJL3d4k
 WGNqmwk4bvaYqYQE6z+1SLtEjcAqEzaldVM+TtX8KebD813702hn9zXL9Co3lylRoUdw
 pGf6eG5svWgeaoTrW7SNHPHzc2j9y0F3z+uU+Tf+ZttcfPl/oKljXqxbqPDT8/Qy188o
 iZQdsEGvsdrsmPUa5xqy/1BKWWQSVhJgUEhSSJgCV2YFXplzfu9t7xRB0vzgFXH1GOZd
 HPjA==
X-Gm-Message-State: APjAAAWd2HxcCnyg7yfWdN0ZhBc6zXBDWa9VLQfFjNQ2hsjXGEOdsDzr
 3r3zn0c/uuigcGwWjebC9VSw0g==
X-Google-Smtp-Source: APXvYqx1Kx3bhuxBy8Tkpd2YMbVt2M4PL1ee+6I4nnJyNiKwObFmW9j0SulAa9zPOYVjcLTLe6kOqw==
X-Received: by 2002:a0c:e747:: with SMTP id g7mr836808qvn.244.1568308404859;
 Thu, 12 Sep 2019 10:13:24 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id x12sm10647694qtb.32.2019.09.12.10.13.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 10:13:24 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-18-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6ca3fc92-080a-9f9f-8ba5-d292d61dac75@linaro.org>
Date: Thu, 12 Sep 2019 13:13:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-18-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 17/17] RISC-V: add vector
 extension premutation instructions
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
X-List-Received-Date: Thu, 12 Sep 2019 17:13:28 -0000

On 9/11/19 2:25 AM, liuzhiwei wrote:
> +/* vfmv.f.s rd, vs2 # rd = vs2[0] (rs1=0)  */
> +void VECTOR_HELPER(vfmv_f_s)(CPURISCVState *env, uint32_t rs1, uint32_t rs2,
> +    uint32_t rd)
...
> +/* vmv.s.x vd, rs1 # vd[0] = rs1 */
> +void VECTOR_HELPER(vmv_s_x)(CPURISCVState *env, uint32_t rs1, uint32_t rs2,
> +    uint32_t rd)
...
> +/* vfmv.s.f vd, rs1 #  vd[0] = rs1 (vs2 = 0)  */
> +void VECTOR_HELPER(vfmv_s_f)(CPURISCVState *env, uint32_t rs1,
> +    uint32_t rs2, uint32_t rd)

I'll note that, with the vector parameters known to the translator, as I have
advocated, these operations are trivially expanded inline as one or two tcg
operations.


r~

