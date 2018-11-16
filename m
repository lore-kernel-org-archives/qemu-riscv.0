Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZ0E-0006OT-A6
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:57:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ0C-0006O8-DA
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:57:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ04-0000bs-Tf
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:57:17 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZ03-0000b7-66
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:57:11 -0500
Received: by mail-wr1-x443.google.com with SMTP id j17-v6so23817847wrq.11
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RnlqljYMUqrFq7qo0VursqS6j5cdrH/VhjgQR1GIw5Y=;
	b=OuFZfl08MuVj7ECBhX500PrpAGtg1h0AzdL+zcsNn0ScKLJ+iiQ1Hmiohoa/W12GAb
	e49rjU6jKk4Znxd7viz32sE7oQ+D8TCUMU8F9jQiZpNHqKzEAGnwLkzx7QF7GrPrCDFL
	BvYFAtWP1wYh0hKLpOk8nJmd1ZWdxSPBCZwck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RnlqljYMUqrFq7qo0VursqS6j5cdrH/VhjgQR1GIw5Y=;
	b=F8pRdTcT7rsxvD1d4+ADQYjFsMUTrf+agXX3B1zHY/Zksjb+u9H9PTtzwPD0sKNnxH
	8hZsAxd7HyiozDg78yIIKp767inf5A5mTZ5G05m/gpgohUAZt3iZMB3nSMWGLYZQAA9L
	rzdJcW9ve0FGLNxa9y+7345JMoYWhDFOCrSpRftyEzu2v16MdJgsvsFuLAYWvOjponw/
	M/H4Hqn8ngpCUzs+czJ/0pfVX5X+CNXyHqDO2EHSelnHWbjUb9LYopsAJsLbhg5fnfSS
	aW2UdgYu9ksTr6ZPaq2K1rSa4ARnuQmsoJBPLryowhcruX+gKz+0n+4uA01aqw4kKkjY
	vqTg==
X-Gm-Message-State: AGRZ1gKr53fYZvOrZmVMkHH55z8fB0tYfkjMazrKQv/Xgk2qw+dcET3W
	om0IvJLgB+WuHo/NAr7GvOTwbA==
X-Google-Smtp-Source: AJdET5drcCtyrJVUJfapn3FUMxap5lALvign8ZPHErygv9dcPw4xBQFnQ5/MklmBQyrqqRgg5ibu5A==
X-Received: by 2002:adf:dcd1:: with SMTP id
	x17-v6mr8152471wrm.212.1542355029836; 
	Thu, 15 Nov 2018 23:57:09 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm52345664wmf.22.2018.11.15.23.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:57:09 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<1c17c37965dcd1b579a58af168892818b33453fe.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1c642108-907b-38ce-0a4c-b0e64400d02d@linaro.org>
Date: Fri, 16 Nov 2018 08:57:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1c17c37965dcd1b579a58af168892818b33453fe.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Fri, 16 Nov 2018 07:57:21 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> +#define TCG_TARGET_HAS_add2_i32         0
> +#define TCG_TARGET_HAS_sub2_i32         0

You're not allowed to not implement this for riscv-32,
along with brcond2 and setcond2.

> +#define TCG_TARGET_HAS_movcond_i32      0

The architecture manual suggests that implementations recognize short
branch-over and convert internally to predication.  Do any do that?

Even if they don't, you might implement it that way anyway, as the code size
savings are large vs the inline fallback (6 insns).  But you can definitely put
that off for a later patch.

> +#define TCG_TARGET_HAS_ext16u_i32       1

Really?  I thought this required two insns...  Or do you expand to shifts while
the default is x & 0xffff, which would take 3 insns?  I guess I'll find out as
I keep reading.  ;-)


r~

