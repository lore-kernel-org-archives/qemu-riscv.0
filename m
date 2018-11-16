Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhpe-0002R2-Bo
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:23:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhpZ-0002M3-NK
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:22:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhpW-0002GD-7l
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:22:57 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:42043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhpW-0002FW-0x
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:22:54 -0500
Received: by mail-oi1-x232.google.com with SMTP id w13so7655926oiw.9
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ncx7OLT4X76/VM4CsDI9rXbXAZTefcstCCqSmniDT/4=;
	b=PbZoFBNqRnMi9Y3wF3JpzNMqKr1UsnPtX8kuTZbPbM3QjfVg2uGz3IoqtSeDGkLYFs
	ml7CsfPBuRDc72TJKjQWK586YCA7zQ+wbuEQzofkHbztDWqCy8TufN7rETmq0CSgd5T7
	KegW+/pfsph+BY+86CyyoYIs7Nnp/R/DHJ6tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ncx7OLT4X76/VM4CsDI9rXbXAZTefcstCCqSmniDT/4=;
	b=lS27Jz7mm9VMXVwIYUgwwJ2XJ0ii0hDVWqIxOH5tmFBxUuRZT1ZCSaeP8bHYuYVBqm
	HwB3eP4kjHhSg73bytyKIUtOxcJpv7qVoWWKSGyKObz7T2ggunpELTveAVF7qG3YFKr/
	ZXe1vohjuDGnQDug6gmDp7NsKHtxHj3mMAVD51zQJnaYwYyQv750YlAYhgUfZ5fVBFsq
	iTmS1QLtJDmWU+Ozit6CbMoqNwmyWWkey9AJ6MMxPfCO8s74LnLkV3/AgSyYKV12QZ12
	YKpRk4PXsKeoGZAVQPu0SqBNYSpTXp84ArPcfnaV37DOG3Efp+b9Y20/I9gxXuRJL4wf
	7r6g==
X-Gm-Message-State: AGRZ1gJVz3+Tr0Cc0pkQU6y4ipu7hXVR08i9Ct5oB3214IfifzRHkzK5
	zheZt9fFrvO2FH0456oJYNdhWw==
X-Google-Smtp-Source: AJdET5fuae7A24mjndCiWJtsqHFsFWz9MIC+1OEPguoeUJpstM5WunJkio6G4m7JwvIM155/58unlQ==
X-Received: by 2002:aca:eac4:: with SMTP id
	i187-v6mr1405185oih.188.1542388973040; 
	Fri, 16 Nov 2018 09:22:53 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	p37sm24019082otc.27.2018.11.16.09.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:22:52 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<4e25322ab80efb351d006d50672048fea2c71a03.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <03f8e89c-bdc1-5194-74dd-7322b5cfbef9@linaro.org>
Date: Fri, 16 Nov 2018 18:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <4e25322ab80efb351d006d50672048fea2c71a03.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::232
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 18/23] riscv: tcg-target: Add
 the out op decoder
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
X-List-Received-Date: Fri, 16 Nov 2018 17:22:58 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 472 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 472 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

