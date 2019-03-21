Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h71rz-0002Ux-Gk
	for mharc-qemu-riscv@gnu.org; Thu, 21 Mar 2019 13:52:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h71rx-0002NN-Q3
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 13:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h71lw-0007Ch-Bn
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 13:46:36 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h71lt-0006zC-G8
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 13:46:30 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r124so4699941pgr.3
	for <qemu-riscv@nongnu.org>; Thu, 21 Mar 2019 10:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KfdeAR6ue2r56ejw4Hc8jR4FL63MKARLqSLVG3H6Z5c=;
	b=wUVeO0JhMgrdWf9P2DjJ73HdE2Y8e1IkMTEJi/y7TTS7JmxEpv9q2rfw6qE6eWnTT9
	ZeNXNHq9epgFOslz3yTbidjRfWhqeDTzpzkOZJchd6ooTk38iCqavia9aG+mixm/NbYN
	aTRbYfsKaIW1KodrAgxf3JP8ufgtCX2k/nlL6ysOBcvR8Ub1VrV3CRlA0pa2DfeizVtH
	ZcfZ6bHkEIHrJDyInf3RY4OJ3CuIYiBSSZucmP/irivDvypcHv/6ct3P7TcNidQwj/FN
	q/rbLdQKh4176a+xiSnAgugtUCuEcynbTzFZXqf7KTHMKa+PzlFHyS0tImx3qBb2TAPJ
	uyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KfdeAR6ue2r56ejw4Hc8jR4FL63MKARLqSLVG3H6Z5c=;
	b=TkOpo2Tu27sAlWOoRctn1HerpY/Xfzpr79Yxj+n7FpoxNsJhUxqmmzbwH7uodQWCD3
	Rb0NppRNN5K3E3IOEJtv3TMc2+Y6xCx9ZPy9WvrZBXq11tEHLEEKqbva4/wKAKN5pVIC
	FYEB33PPkRfbKnKKNNuD13Hfh2ayPWM+mbhAJowwOywubM2T8BVgl62FAvl7zSjO7CZV
	Iaib7kMgIwcyPlZYCflAG8WX0GAyFjulq+e29C6aPaSUCr+CnIGkSz9gDRjAGFKwaLl/
	ZkU15yf17Ve8xgyt4E1hpnuM+jCpUlzbUE6/sSfrmIZf9jzV9oAR/HCxPqnDXuaFYqp1
	iodA==
X-Gm-Message-State: APjAAAXA1UdklNHV7io0uvW/wV4j88IQmTU8t9wMnUQQwM7VEFKZUQ+m
	CRcLUuidht4RoFuavunWGmziTQ==
X-Google-Smtp-Source: APXvYqyoEGW9QVynkjoXbsoQrs0P704MNHgFMDzLQuRW6BPPw3+beuGSrrZuSVXirZEkms2Z29yFng==
X-Received: by 2002:a63:5415:: with SMTP id i21mr4474017pgb.106.1553190383956; 
	Thu, 21 Mar 2019 10:46:23 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-5-201.tukw.qwest.net.
	[174.21.5.201]) by smtp.gmail.com with ESMTPSA id
	d23sm11026191pfn.69.2019.03.21.10.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 10:46:23 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@gmail.com>
References: <20190321145920.20897-1-palmer@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <175ccc33-b35b-ebfd-9097-156ac9fbd6ee@linaro.org>
Date: Thu, 21 Mar 2019 10:46:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321145920.20897-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Zero extend the
 inputs of divuw and remuw
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 17:52:46 -0000

On 3/21/19 7:59 AM, Palmer Dabbelt wrote:
> While running the GCC test suite against 4.0.0-rc0, Kito found a
> regression introduced by the decodetree conversion that caused divuw and
> remuw to sign-extend their inputs.  The ISA manual says they are
> supposed to be zero extended:
> 
>     DIVW and DIVUW instructions are only valid for RV64, and divide the
>     lower 32 bits of rs1 by the lower 32 bits of rs2, treating them as
>     signed and unsigned integers respectively, placing the 32-bit
>     quotient in rd, sign-extended to 64 bits. REMW and REMUW
>     instructions are only valid for RV64, and provide the corresponding
>     signed and unsigned remainder operations respectively.  Both REMW
>     and REMUW always sign-extend the 32-bit result to 64 bits, including
>     on a divide by zero.
> 
> Here's Kito's reduced test case from the GCC test suite
> 
>     unsigned calc_mp(unsigned mod)
>     {
>          unsigned a,b,c;
>          c=-1;
>          a=c/mod;
>          b=0-a*mod;
>          if (b > mod) { a += 1; b-=mod; }
>          return b;
>     }
> 
>     int main(int argc, char *argv[])
>     {
>          unsigned x = 1234;
>          unsigned y = calc_mp(x);
> 
>          if ((sizeof (y) == 4 && y != 680)
>       || (sizeof (y) == 2 && y != 134))
>     abort ();
>          exit (0);
>     }
> 
> I haven't done any other testing on this, but it does fix the test case.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvm.inc.c |  4 ++--
>  target/riscv/translate.c                | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

