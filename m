Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWuco-0002gk-VF
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 21:51:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWucm-0002di-4N
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 21:51:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWuci-0006FW-PK
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 21:51:47 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:34358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWuci-0006Et-Gi
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 21:51:44 -0500
Received: by mail-ot1-x331.google.com with SMTP id t5so16283524otk.1
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 18:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1xqhMWkFu3lLkGr8Tej3Dj/sGmWClG5cRnSMG9S4glc=;
	b=i+P3x4cGIPuWBokowdeBNgrgHvLxG9drcs+0mdWrsQ1+k2iiH0eS/MBH7XQhQgGYfP
	tF7tABroCZYuKb1x4Sro6ENfJKj7Xu/sEpr9uGYeW4gQRBNLvNxxU3l3L7fn2LClogWw
	akU6rlRRyJrXspAv50TNR7IQvvsqoGHWT5dQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1xqhMWkFu3lLkGr8Tej3Dj/sGmWClG5cRnSMG9S4glc=;
	b=t2IYcrxdU3uGNEdFtpqq///jL8qVFZc5XQGC7/jkg5TMBvdxB0lZfR55UQ8TPYnauW
	UsUpOvzj30GB6NlvFnGt0jL5Vp9xx88I3Elh9LKUu1mQjlr6gghj1HgSmWLu/C6WAz89
	0WQdYdQjwXJ8Ow21NHPDQ86zOQBl/LhCh2iOFpFcSPtsiGvG/SBaYzbhqP0WTFm28Faq
	rGn22egFeRjPuuzMkU5C5saq8SMOACF0uvYfzRvUkxsTD30ld7nSsD994NAbotWCbnWm
	XUME7akT5lrkmfI+g3w/8eIcz4+AKtK6jV4LuedD6gof91ZEDrXRTW/jOJjDQoC7c5TC
	HoOg==
X-Gm-Message-State: AA+aEWbRrSomyG3XkKnXO6GLh7EQbdXCuaoDjqWQM1yFMMsC88igpyMu
	2BiOp6tffub44cLiypNRKwpT/g==
X-Google-Smtp-Source: AFSGD/WLOW0u26Mj4SXbuRAekKrD9eUeQT6rYy2WfltAGJA9doNMceQTNopYf2TvBeGSGPZT+5vFFQ==
X-Received: by 2002:a05:6830:110:: with SMTP id
	i16mr13955780otp.72.1544583103759; 
	Tue, 11 Dec 2018 18:51:43 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	b63sm11446444oih.6.2018.12.11.18.51.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 18:51:43 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<d579b3cc437a3b81025d42fee40faaf3c0196470.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b7c33fb4-b912-64cd-88bd-6a527d8d3972@linaro.org>
Date: Tue, 11 Dec 2018 20:51:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <d579b3cc437a3b81025d42fee40faaf3c0196470.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-riscv] [RFC v3 15/24] riscv: tcg-target: Add the add2 and
 sub2 instructions
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
X-List-Received-Date: Wed, 12 Dec 2018 02:51:49 -0000

On 12/7/18 6:48 PM, Alistair Francis wrote:
> +static void tcg_out_addsub2(TCGContext *s,
> +                            TCGReg rl, TCGReg rh,
> +                            TCGReg al, TCGReg ah,
> +                            TCGReg bl, TCGReg bh,
> +                            bool cbl, bool cbh, bool is_sub, bool is32bit)

bl and bh must be TCGArg, since they may be constants, as indicated by cbl+cbh.


r~

