Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJhaE-0004tE-4j
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 12:50:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJhaA-0004qP-QO
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJha9-0003e1-Vx
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:50:46 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40863)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJha9-0003cU-Pd
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:50:45 -0400
Received: by mail-pl1-x642.google.com with SMTP id b3so75999plr.7
	for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2019 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6GsEehMrGxTNJ75kS5l1YQNwV0S6GpS3jOZIJxIwfHk=;
	b=p3ZJC91kQtDtDVtvRhKMnIJ6nU+UB4QRDjpSYk1H1f1k5Xz3ifQECyV+C+ES/ZAUrB
	n2W74PL+sRUs+Ep8HgRTw2DJWMJuzAeFZP0vEeqKCy8nWzVz5WT3bVs626R+YaBEAH11
	lnNlugkvi1sADWd2xFrAuJ17+sdqqEbsVRzx2p2PVpCE/Z3PFWjzUkBxvR2mTdKENsdb
	eUywopeNhrtHTf+aoxVaYkPQc5jzJ/OwuAaLTZywiZU4r2ZGd4PAb+zax3BqN/MQn7sF
	j3RcifKkdGByuuFjdl8Sy+ajVjSnvl3LK4LjRwy5Lh2QSozY988u9fgZpYcMgl91qf3R
	3F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6GsEehMrGxTNJ75kS5l1YQNwV0S6GpS3jOZIJxIwfHk=;
	b=k5PQMwz+5Y8U7k7RVgbxXT2jdrS+/hlaKwZ+1QrrUSJJlMbu7+jkJswvHMIuDvBOi4
	LGUhX6la6uob92JwOIYQrJIZc8k8r+84ouxljw2QlIS8ndEop1izUaH3DvACW5Qpy8zC
	/ziEjx82s8Jh7QjezQkMacI1UWB81JvFMcHSfQiKSNQezUbg/cwKbl18pAqVMf9QmhPx
	xrCkGPlRFIL8lgTiokAHdHKBkm9LrRopRZeOZiZ8PcgrdTbOZqn9oNdG4mHGCuv56Ayv
	yGbrG7gPZ/9OqU5JoY3nJKwU1a5arAM+WcTYKXBfyRYVjv5v0aIB1g4o5R9dOdDlfW5x
	BULA==
X-Gm-Message-State: APjAAAXWma0wmWMQjpVn1bYosWHynDm/eHVLYlhDkJwWgLunMhciWcU7
	S2fHllZj8F6xdmFFMZGR+m23gp36ze4=
X-Google-Smtp-Source: APXvYqwvLuO0NnHt07fKSGYZtcoVl3I9CwPGXEcaTnt5LyScge5cXwcCokxRkQakxv6WqqkwSlW96w==
X-Received: by 2002:a17:902:aa85:: with SMTP id
	d5mr38983217plr.251.1556211044069; 
	Thu, 25 Apr 2019 09:50:44 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id l1sm25977016pgp.9.2019.04.25.09.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:50:43 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Alistair Francis
	<Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <mhng-f65ff93d-20e5-4c4a-919a-c311ae97649d@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <357d260b-4baf-aea8-c332-f77ce2a3e9b2@linaro.org>
Date: Thu, 25 Apr 2019 09:50:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-f65ff93d-20e5-4c4a-919a-c311ae97649d@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Thu, 25 Apr 2019 16:50:49 -0000

On 4/25/19 9:04 AM, Palmer Dabbelt wrote:
>>  # *** RV64C Standard Extension (Quadrant 2) ***
>> -c_slli            000 .  .....  ..... 10 @c_shift2
>> +slli              000 .  .....  ..... 10 @c_shift2
> 
> This is another one where rd=0 is illegal in the compressed ISA, but again we
> don't appear to handle these correctly before the cleanups.

I see "HINT, rd=0" in the 2.2 documentation for this case.


r~

