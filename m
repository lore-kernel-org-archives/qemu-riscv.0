Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhnl-0001Y5-QO
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:21:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhnk-0001XC-0U
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:21:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhng-0001Z4-Tl
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:21:03 -0500
Received: from mail-it1-x132.google.com ([2607:f8b0:4864:20::132]:37674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhng-0001Yh-OH
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:21:00 -0500
Received: by mail-it1-x132.google.com with SMTP id b5so541518iti.2
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=a8EziR1MP0OXQ5lnWDb7L2G33Q0z675/AxmRYYXgwUA=;
	b=buwo5L1ZahjPBBl94pA4v02jtkzFzdk0X7yGgEMTGCtNn0t40s5BvmlNy0TIFDziD0
	2e0G/LB7poIhhix2YPqfY+EHyGAXK6zjCE4s0J85FNmTtX8U4Dwnr26b4jXggUpoV9H9
	6TJQ5EGwzBnAsBcya0gVU924ISslNCMYnHK98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=a8EziR1MP0OXQ5lnWDb7L2G33Q0z675/AxmRYYXgwUA=;
	b=VAD3FLE1vyzSV1t6b2JwyUbPjZps51y3nmJu3czgF5bEx0GjMfCH3cE3+s4r1Vj0Kw
	yxVUCSiGbzONuwUoVGezrlwHfL1w2ltoGwlVvIQwtbIrM1N6fj0GlErsLDZc5hzdgFZI
	0+N+2gdAwV1vuXhoO11kcekr8+7FOTSH/RGPYHcIBwUR4+3wvmL1V/tpB71k+fH2DajR
	BC4z73BEnINdOVMWRUqKeDD3h7Ecx9zKtMe7nqD1r1q3N24nVgfWhkhiD2fl2E3qoLyk
	SaOLlv4q0DPIYLwCp634wXmpkEfU1ZuAaUg7jlLTXYGMELGDaErQWJEWZWW+M7qwnVlF
	8SFQ==
X-Gm-Message-State: AGRZ1gKNS8M9hToA80GQUOYYIpz61iuhYbRlBChVlFpnn04bncdDwZTJ
	OC4FaGTpZMCg744wrU6mPjtFYQ==
X-Google-Smtp-Source: AJdET5eZRX16hKpUJfG8B7aSudqWTOGuCSO4wmVmUTm/KKngSId1q6Qd7cZhfSSEEG+zRHVKOIm7DA==
X-Received: by 2002:a24:108a:: with SMTP id
	132-v6mr8509228ity.78.1542388859877; 
	Fri, 16 Nov 2018 09:20:59 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	y64-v6sm10726058ita.5.2018.11.16.09.20.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:20:59 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<1c17c37965dcd1b579a58af168892818b33453fe.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ccfbcd15-2295-59ff-4cad-3d5e2947beda@linaro.org>
Date: Fri, 16 Nov 2018 18:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1c17c37965dcd1b579a58af168892818b33453fe.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::132
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 05/23] riscv: Add the
 tcg-target header file
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
X-List-Received-Date: Fri, 16 Nov 2018 17:21:04 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> +#define TCG_TARGET_HAS_extrl_i64_i32    0
> +#define TCG_TARGET_HAS_extrh_i64_i32    0

You need these two for rv64 to preserve the invariant that 32-bit values are
sign-extended in a 64-bit register.  Otherwise _i32 comparisons won't work
reliably.

The first is yet another alias for exts32_i64; the second is an arithmetic
right shift of 32.  Their existence changes how code is emitted in tcg-op.c.


r~

