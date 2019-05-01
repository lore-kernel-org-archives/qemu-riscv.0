Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLddN-0003KH-VN
	for mharc-qemu-riscv@gnu.org; Tue, 30 Apr 2019 21:02:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hLddI-0003GR-VS
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 21:02:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hLddF-0007jn-7v
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 21:02:00 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hLddD-0007hw-U2
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 21:01:57 -0400
Received: by mail-pf1-x442.google.com with SMTP id b3so7932327pfd.1
	for <qemu-riscv@nongnu.org>; Tue, 30 Apr 2019 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=+dMuCy8/ZPqKt1IiTMdmEPknxoPIN17XpSc3WaCu9ps=;
	b=No0jlmTyf0u3mLoJwQ11Nnyic48vKSGJQmrZYdijkS9fcJGTtJ3asIWABp2faMjoA+
	ha9/oTBhiyBq8UA1/OBsB68E88n16sGF5s4GOFFKSjlal0paSnscMIH1T7o/vsczKclp
	oARbFpl8pX/sQmbn5XZm969PiFAYZSzNJhD90lLuOhhjl9xmyNk9WkZ4mRc4jw5vX14r
	W7skvarvxXDNBXhOuWVlZ/1m/MqbSlYJ4NnIAnnUIWARY3sQUL1sy6HAe3Elj1Q40b85
	sLgBQfFpis3wbRjTGflhiGh+ia6+xnybFCanvoXEcnTWthU/7Q1Pha0gaekJlXlETjEa
	wUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=+dMuCy8/ZPqKt1IiTMdmEPknxoPIN17XpSc3WaCu9ps=;
	b=ClxlBVH1dEH1rgL3SBWRxqQGXMjbyY1qFg4WGxWDC3jORru/SrxfeXaLQsQ+fbFQ3O
	8UyzYhXvZPeJyuxaMOHr9roBfo1hPE0wuAR7NTMwxwPmGhmmEuLbQsY4rpGZ1vQmJiOk
	2Oc4bgGcGHN6t8SYcIlB70h+pde1GwlwE8fF36EhnBIdGHl/3Sqgh6vCRhtxhIWawLGB
	3TBREuy7d+KBzpJzD80iYJPeEGArWxpOqkT5tSYH3XB7fyUBv1xPFb7hKsERZNo3FTPi
	k5q+7pOGmEVyI7P/SAVGUH5iE1QJG5WEcLZmNdC09nHHrda/OdPsgsTQVzfj/AJGL1Aq
	rPEA==
X-Gm-Message-State: APjAAAWORcH1vxl93I5MVza3nviAO/+tXsPya8mGLaeW/+EvvR6WnjPa
	S/c5S+LE5jvWrFnq1dh/tV2QEQ==
X-Google-Smtp-Source: APXvYqwkt4SwPw+/yLHOBxBkHs9r9fkCUvAh6MptjDE+kGfwZ876iZdNaH+xipf9adDJ8sWqG7EGxQ==
X-Received: by 2002:a62:2e02:: with SMTP id u2mr37469462pfu.1.1556672514422;
	Tue, 30 Apr 2019 18:01:54 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	s19sm35124284pgj.62.2019.04.30.18.01.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 18:01:53 -0700 (PDT)
Date: Tue, 30 Apr 2019 18:01:53 -0700 (PDT)
X-Google-Original-Date: Tue, 30 Apr 2019 18:00:41 PDT (-0700)
In-Reply-To: <357d260b-4baf-aea8-c332-f77ce2a3e9b2@linaro.org>
CC: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-4cf09562-97fc-4e60-8a96-62aa58a9e038@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-riscv] [PATCH for-4.1 4/8] target/riscv: Merge argument
 decode for RVC shifti
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
X-List-Received-Date: Wed, 01 May 2019 01:02:04 -0000

On Thu, 25 Apr 2019 09:50:41 PDT (-0700), richard.henderson@linaro.org wrote:
> On 4/25/19 9:04 AM, Palmer Dabbelt wrote:
>>>  # *** RV64C Standard Extension (Quadrant 2) ***
>>> -c_slli            000 .  .....  ..... 10 @c_shift2
>>> +slli              000 .  .....  ..... 10 @c_shift2
>>
>> This is another one where rd=0 is illegal in the compressed ISA, but again we
>> don't appear to handle these correctly before the cleanups.
>
> I see "HINT, rd=0" in the 2.2 documentation for this case.

Looks like you're right -- I was assuming the "rd != 0" to mean that it was an
illegal instruction, but I just confirmed with Andrew that it's legal.  In this
case (and probably the others I mentioned), I think QEMU is correct already.

