Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvmf1-0007hk-4L
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 13:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38661)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvmey-0007dV-QJ
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 13:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvmex-0006pd-QO
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 13:57:08 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39609)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvmex-0006on-KN
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 13:57:07 -0400
Received: by mail-pf1-x441.google.com with SMTP id f17so40525309pfn.6
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2019 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jvCeSkCzmSCCppv30RCxwrup3ZK4y8htfnGE/hCcbH0=;
 b=ow9w8MdsTGwlly57Y4YzVI0gTejLDQuBUSX4EA1Vg0EWDcUlkskXZsYtAAWYDGQJAo
 dEGGs8+2jMwjvsfOVVKnZPaRBsKHG5RLSX5UuW7HW0195ui5AiTqdhwfxB8Es+GUHzDb
 EClC7HHo9ZW4pb3Uo22nIMD86I4WbPubfQcPr1ym0pOnJZr9mM39rAr56m6/m/9l+HV+
 os3VaiXLv+18zXSDweDv4x0dIr7I6Q3t5lOQJALh2CVQ48xFQa3GAEoBk6y0wvmILypu
 m4TmeHR0Rp84qSC7JDs72qf/DakqZj/VbU2cfb3iWq2Ms2toII+F/C4fQGykZ/0QGNOQ
 HL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvCeSkCzmSCCppv30RCxwrup3ZK4y8htfnGE/hCcbH0=;
 b=D+fY0RLqXUs0FqINTQ3uOzCFzL1twPBB3WlZf0hTQtDnxDbWpHJtxpO9jnYPY1cAk9
 +qwsIFoYJ3mj+k/Nz/ysOcT1XezrOFD+lSBnXvmSq33zTXc4060PWdj0LSscqgSkJZ07
 fZdjgtIxibaJ3H5FlZSXObXzkcSLQAfxbWQXXFdati8wOeEhN6WF+6zd4yvkc0ck2ddG
 6E2/ZFxbLkhb3mSwZ9YfIS/v+65grJbM64TIb6mEhCdmDjoPeypniSTIcaZTuHh6QoFb
 VhDHet7v2blPTWDRGZwnetEADlfPYCFpXyi3cn09z6MlWBa7LNh8q7pNlK4mIG0lFoIL
 kTlg==
X-Gm-Message-State: APjAAAUVaEKRuFOIT6yfMtrYmzj78o8bKNjdxDO131rydubwMErGIi23
 vtrxYWuLF3eUP8NREP+KojsfI1KY3Ck=
X-Google-Smtp-Source: APXvYqxDm/t4xx9DyCTDlW5PdjtW+l2iGs9329brp+KXKQlybeRWdVcDkpn6nvIN6J0TjwOrG59OBA==
X-Received: by 2002:a62:2582:: with SMTP id l124mr16691352pfl.43.1565287026577; 
 Thu, 08 Aug 2019 10:57:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a3sm97157021pfc.70.2019.08.08.10.57.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 10:57:05 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, armbru@redhat.com,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20190808164117.23348-1-alex.bennee@linaro.org>
 <20190808164117.23348-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <84c3374c-a309-6998-c61a-7c65b7c09d20@linaro.org>
Date: Thu, 8 Aug 2019 10:57:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808164117.23348-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 6/7] target/riscv:
 rationalise softfloat includes
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
X-List-Received-Date: Thu, 08 Aug 2019 17:57:09 -0000

On 8/8/19 9:41 AM, Alex Bennée wrote:
> We should avoid including the whole of softfloat headers in cpu.h and
> explicitly include it only where we will be calling softfloat
> functions. We can use the -types.h and -helpers.h in cpu.h for the few
> bits that are global.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/fpu_helper.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


