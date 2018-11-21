Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVsa-0003qD-Bi
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:01:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPVsY-0003oM-59
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPVsT-0005aG-4x
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:01:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gPVsP-0005Va-Cx
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:01:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r11-v6so6232235wmb.2
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=09olxb62ZbnyEHcmf7piYfkhGqMLH1DYHv8AEF1rf2Q=;
	b=QvIUcYXK5rUdfAFRwCjxPQJ6JlbfSkuuBWpvLb9G8CoYGXxezGYp41aGBCQujlGARR
	Q9RWQoysKUN1+2uq7hbgJNviZ0Q+0qzE3m2c8+ajuytdbmHl+caAXN/inp5ulMl5oA0R
	OeaQTWV75ZixjNOtqzfdE63MG2MG89lGiJbCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=09olxb62ZbnyEHcmf7piYfkhGqMLH1DYHv8AEF1rf2Q=;
	b=smBnGPMfefzQ83BYY4N50q/l+tAr/2dAjKbRCNW2lldh8HIVfsI6FKZWS9c/EUyU6l
	Woi1OZpC8lYKeA6Uovd04V+wqFfShB7LRXIRP5WTvwR5/UmW11lOYGyQHmTqu1hCUOFd
	zUo/aYRyjn4MWeQXpyfCAXsEkCwrqSndutxnWykzGN57pP9yZ9/ZYrMJFhbxTfFesykj
	LqBLpI7YWcBhGKf6ig42eptt10mecC30mfzhcE/n9i1VmOR9SiDIRbooc39AA5CNjpJO
	unSTsoJNfna01X0PZ0R4Sb87RM68WOBcoRC6bdxsH8dd/rKNf8Q2zXybsVeumLN3HHlJ
	0nAg==
X-Gm-Message-State: AGRZ1gIKvjnNnIZHYQLLVAVdKHJSSs1Jr0I+ltBIFqGPAXBzpKV4hYlY
	VVg15HQJEcjrGp3lTUZjJso1CA==
X-Google-Smtp-Source: AFSGD/Wf9wXKSpdL/7ApdL6Hd0ftomJL3r632dVkR8mFFNqooZRLPi/EVI86FnWsh0nBHdqHiXx3Vg==
X-Received: by 2002:a7b:cd16:: with SMTP id f22mr6484320wmj.88.1542819678413; 
	Wed, 21 Nov 2018 09:01:18 -0800 (PST)
Received: from cloudburst.twiddle.net ([195.77.246.50])
	by smtp.gmail.com with ESMTPSA id
	b13sm18616710wrn.28.2018.11.21.09.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 09:01:17 -0800 (PST)
To: Palmer Dabbelt <palmer@sifive.com>, alistair23@gmail.com
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
References: <mhng-995d2bae-d043-45c1-872d-7639baafd856@palmer-si-x1c4>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7a76c14a-78c1-d3f3-2d51-b9fc06931927@linaro.org>
Date: Wed, 21 Nov 2018 18:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mhng-995d2bae-d043-45c1-872d-7639baafd856@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32d
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 11/23] riscv: tcg-target: Add
 the relocation functions
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
X-List-Received-Date: Wed, 21 Nov 2018 17:01:31 -0000

On 11/21/18 4:53 PM, Palmer Dabbelt wrote:
> 
> Per the memory model chapter (which is being ratified now), FSD is not atomic
> on rv32i:
> 
>    An FLD or FSD instruction for which XLEN<64 may also be decomposed into a   
> set of component memory operations of any granularity.

Ah, thanks.  I knew I should have checked the manual.  Anyway, that means
*only* the indirect goto_tb method is viable for rv32.


r~

