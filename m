Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOzz0-0007SG-JL
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 01:58:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gOzyy-0007JB-30
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 01:58:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gOzyu-0004vp-Ty
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 01:58:00 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gOzyu-0004uc-NC
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 01:57:56 -0500
Received: by mail-wm1-x342.google.com with SMTP id r63-v6so988693wma.4
	for <qemu-riscv@nongnu.org>; Mon, 19 Nov 2018 22:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CKPMqDQbWFPdnurb6kI/CNW0gME4eBFRTGYT823JV2I=;
	b=PzY1aBaw4gbSbfcIx/b5RYNWOnPODbbzQmGmSBpxXvAoIeePurJ4nGaC8cQsuVD53u
	rlRwg59fYmAZESjAv3RalXCjFlkZhC15KBzIEdv+reKLey+xWlRkyqtYbHktL0ALSI3f
	azTbva4ThqdVRG2yanviEbx8KrtqdGnWChA8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CKPMqDQbWFPdnurb6kI/CNW0gME4eBFRTGYT823JV2I=;
	b=kEt1schkcbzXL6C1GuVd7iI9F4fXX9QUPB0RqeZBIQx0do7os7Ncu9IbNerX/ce2lP
	xbB1S4Zy49y8kWFQD4AzMjvXQzx7NVI1tTQ7/FfGIZ2Iwoy+kgVITVNxFn1kcJyZp5Fo
	CRAiiX9b1nYwrGVshrGKjPECA0cYB0vwjkdQCeyn3FBQDUHxXRWrMwgeSndyYZJvuShX
	EWMpdSCrePGjRBANzIoYi5Hbvy5e0Jr8s3sdH/XvUTKXqZvg53yzMEh6wGSZyUAwr6gy
	wO5UirLHmb7ExXnT8YONAfyVpJud3qrnsja3ch3FjskXrJZnXI3IyMAeBmLtWK082RLa
	gUqA==
X-Gm-Message-State: AGRZ1gI9kiY0ZBqo1KMLUP6+X8I+7QUbptyYXjy3HYxIE8bE94yHpDIi
	WPbvxXPFSGhKvF6J+PWBcAyZmiBt4GHdzw==
X-Google-Smtp-Source: AJdET5ebkpzVma9LowR5+SSPs6XfU20sNGQZOqjvuhQr8yUabkfC/LJOpb5tuLGVI44MvGnhi93myQ==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr992656wmi.61.1542697075193;
	Mon, 19 Nov 2018 22:57:55 -0800 (PST)
Received: from cloudburst.twiddle.net
	(134.red-79-147-188.dynamicip.rima-tde.net. [79.147.188.134])
	by smtp.gmail.com with ESMTPSA id
	j33sm7564519wre.91.2018.11.19.22.57.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 22:57:54 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<ccb312eb986d846b1b0aa0be062833e5ae1bb5f4.1542321076.git.alistair.francis@wdc.com>
	<687076b9-a5ca-2821-3e24-8b08363f1b5c@linaro.org>
	<CAKmqyKPsnX+RR1A6BTdXZ4-WFix5o9OKpXLyffe8Y_erZ=kYDA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a014bf77-e797-fe7a-cff6-7f7a4d3d0f18@linaro.org>
Date: Tue, 20 Nov 2018 07:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPsnX+RR1A6BTdXZ4-WFix5o9OKpXLyffe8Y_erZ=kYDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 17/23] riscv: tcg-target: Add
 direct load and store instructions
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
X-List-Received-Date: Tue, 20 Nov 2018 06:58:01 -0000

On 11/20/18 12:06 AM, Alistair Francis wrote:
> On Fri, Nov 16, 2018 at 9:10 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/15/18 11:36 PM, Alistair Francis wrote:
>>> +    tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
>>
>> Should avoid this when guest_base == 0, which happens fairly regularly for a
>> 64-bit guest.
>>
>>> +        /* Prefer to load from offset 0 first, but allow for overlap.  */
>>> +        if (TCG_TARGET_REG_BITS == 64) {
>>> +            tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
>>> +        } else {
>>> +            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
>>> +            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
>>> +        }
>>
>> Comment sounds like two lines of code that's missing.
> 
> I can't figure out what this comment should be for. Why would we want
> to prefer loading with an offset 0?

Perhaps to help the memory controler; perhaps no reason at all.
But "allow for overlap" suggests

  } else if (lo != base) {
      tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
      tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
  } else {
      tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
      tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
  }


r~

