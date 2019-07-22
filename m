Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpeyB-0006gl-H8
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 16:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50773)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rth7680@gmail.com>) id 1hpdW7-0005NZ-OK
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 14:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rth7680@gmail.com>) id 1hpdW6-0000By-S7
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 14:58:35 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rth7680@gmail.com>)
 id 1hpdW4-0000A3-Vt; Mon, 22 Jul 2019 14:58:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id n9so11877479pgc.1;
 Mon, 22 Jul 2019 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=778redPwBop63aanqBNZExbsIMOCHcXFJM54Q15/E4k=;
 b=BsDXqixydvvsC5MKoaFT8ng6kAg/l3wZltQT5aHjY5FT4BpTxlORcjFXsE9DaH4TEn
 jLJPsHNbK6lJCqRwWc1fuS5GT8laMFv3CTBgAPdl7auHJ/J1PUGxzydNP+D03THsLWhY
 +DzyMmtyrLSUYfSa8l8wC/1C7fEbSajyj8iySkqQXzn1ATP9HtGK4vd2tkU9QExdA2lG
 0iZgn5i4cEWbe0NxwguxVn0H7rcLMXqjkGAoY19B++9EhWhUSffdjiY+ttEigvUviGgG
 kRjVcf7I/+CQGbrJ6djW23/pnljdhILRmC7cQITx0OLp/sYda7BakBry9DdBDUV4+jNm
 7kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=778redPwBop63aanqBNZExbsIMOCHcXFJM54Q15/E4k=;
 b=lA7OTR0VYTeEE7W/R3iLSkB4tg6AGb/SSZ4hFyXiZZisZSPju4XYq8B1VLI/15AOqL
 x9RJhtxRDYari78bAjrhyEGk5LVkLViCx26HfSfCVx0UrP9cmMruec6ERjKzJoJSbqtQ
 yTFtLa7QEPp27Cz/jNuybUeZJRLMLQOqSDXE+Yh5Bsc2z99LxyzdCLCZPn/t/uGKAKu7
 ygXJ24nqnO4pePHss1gHhcrNTdD0gBIsw7oErmOCAGyOJmdWx/RhaNjR4KzJ47S7E/SA
 Yv3QBXsKPfXGF8hbypVAvFiAhzVJZkfYlY8B45hzd2xmCQhcKpWMaE05Nlz4/hPQ53cW
 b9Aw==
X-Gm-Message-State: APjAAAV6pHvHr6qA0lbRUE4YF9PwK6zNxMr1+IrmhZ0G9DJYzlrw/fMh
 H67QFByG9891vHYB3a3QTqY=
X-Google-Smtp-Source: APXvYqygMZtF0TDKR4T2Nj6XsQSkba5WVd5bcXe/HTb6kifQvZ8twT3QAcMGcl6LJpUZM1gv8EiD4A==
X-Received: by 2002:a63:6eca:: with SMTP id j193mr71432686pgc.74.1563821911378; 
 Mon, 22 Jul 2019 11:58:31 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.googlemail.com with ESMTPSA id u6sm35921093pjx.23.2019.07.22.11.58.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 11:58:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: tony.nguyen@bt.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, atar4qemu@gmail.com, ehabkost@redhat.com,
 sw@weilnetz.de, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, cohuck@redhat.com,
 claudio.fontana@huawei.com, alex.williamson@redhat.com, qemu-ppc@nongnu.org,
 amarkovic@wavecomp.com, pbonzini@redhat.com, aurelien@aurel32.net
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
 <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
 <1563812889499.73128@bt.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVuQENBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAGJASUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <87eacdfd-8ad9-c08d-33d1-adb2bd989267@twiddle.net>
Date: Mon, 22 Jul 2019 11:58:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563812889499.73128@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::533
X-Mailman-Approved-At: Mon, 22 Jul 2019 16:31:38 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Mon, 22 Jul 2019 18:58:37 -0000

On 7/22/19 9:28 AM, tony.nguyen@bt.com wrote:
> Do you prefer the v1 implementation of making TCGMemOp -> MemOp?

Yes, I did prefer moving the entire enum.

The use of MO_8 etc instead of MO_UB often emphasized that we were dealing only
with a size without a sign.


r~

