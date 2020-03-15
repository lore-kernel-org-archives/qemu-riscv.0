Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDIQL-00044l-Ia
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 21:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDIQJ-000439-6N
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDIQH-0000SZ-3m
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:50:38 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37608)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDIQF-0000LE-95
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:50:36 -0400
Received: by mail-pf1-x441.google.com with SMTP id p14so7698266pfn.4
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 18:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c7TqzKtCtZu32NnPv0ecI5mzrIGdYrPWqoYnmLj16MM=;
 b=ufU+PPzNSXRK+HbcJgUUVbzpqAAVhVog4DkZukMoydsInSyYWYmSC7O441KG/3E9w9
 POPHyC5wOHO9F7BuCAhxOGcEchGcIV8jZt3Psdx4wQ+ECvuW8NswEUtzGrb7v5aRSfNi
 B3zbY5yixHiryWpqJid90KWTbfTNriw3fyYOyegZsANzw5gAnBPCw1l3Em9/MmJU2X+Z
 v2CKQI7waM7jITRaN25BlqyD2+GlQUIwr/zid3H6mdgB7n3mr0AmaYEnKllPwNwbe7n2
 OB0Fi7df6Af7RPEVStJJ0gSozuHn6P5L96LJwNg8JUD5xVfnLERRKYIppwGdBvZSnPZN
 CqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7TqzKtCtZu32NnPv0ecI5mzrIGdYrPWqoYnmLj16MM=;
 b=Jsa95oKOeNDsvndVzrOb9mfGWPAMZEf7yyW3Yn+Dukuk6lp8A73CqOTirchjlPHTm/
 bYIke+qZqqpsba2HqKe7AlutiaHossDHnc9tO8VUJ5BgYzx+PnjiwdBX3g7Aod5EnPzy
 DU5fAW5zwAP6nl+o3sHc94mqBIzWc4kH0796fFVmnXNs9OnZb/7ahYIPd/E4vlX/Mh78
 JFSNnysa+f8zw6FyAfyDTB5SQEBgG6gFAYIKvGb/hTJQx9x1abrXyNO5ZawULDs6Jkcs
 AWAiDt0WYblmYhTDQh8193riZc2ZDOSVELhTfZGzT66uxL/DonFysphy6UKQtQhi3f4s
 GKJA==
X-Gm-Message-State: ANhLgQ2vqw4mxkrzCyEQk9xDAUCuLgImUo6uBbyauv76M8QrjSmHT+6l
 FB4rxAQQSs3116x+uNhpNoM+3BcCcyc=
X-Google-Smtp-Source: ADFU+vu/vN/Iex0W1R8bQrXZ4+B4oqh1SAcGcHZcQE8kEeOwsr4SyHU5F6+/pXyuN5XLU3ab8Umi6w==
X-Received: by 2002:a63:348b:: with SMTP id
 b133mr20786909pga.372.1584237032410; 
 Sat, 14 Mar 2020 18:50:32 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 79sm6360914pfz.23.2020.03.14.18.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 18:50:31 -0700 (PDT)
Subject: Re: [PATCH v5 52/60] target/riscv: vector iota instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-53-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2ef3062-2800-133c-fa71-7523101beaae@linaro.org>
Date: Sat, 14 Mar 2020 18:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-53-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Sun, 15 Mar 2020 01:50:40 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  5 ++++
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvv.inc.c | 22 ++++++++++++++++++
>  target/riscv/vector_helper.c            | 31 +++++++++++++++++++++++++
>  4 files changed, 59 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


