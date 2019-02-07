Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1griQK-0007uv-3D
	for mharc-qemu-riscv@gnu.org; Thu, 07 Feb 2019 07:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1griQF-0007sc-9N
	for qemu-riscv@nongnu.org; Thu, 07 Feb 2019 07:04:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1griQ5-0008JI-0q
	for qemu-riscv@nongnu.org; Thu, 07 Feb 2019 07:04:45 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1griPt-0008Bn-6v
	for qemu-riscv@nongnu.org; Thu, 07 Feb 2019 07:04:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id h22so4208277wmb.0
	for <qemu-riscv@nongnu.org>; Thu, 07 Feb 2019 04:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oz+nrjaVaH7Kzoe1ccCvlxrdhHhHYMG/xZk3W9sOVSY=;
	b=QJ9S2Vmfl5gFdKoO+i1pOcs6xR63LbiOk6OGjvsIKgp74rIEYrHI2VL+N3ZP+g/zAn
	+tl98MbhBix4XkBtC5aouVTYg61QxJoL9z6mWGqlqCagChK7gZ41txTB+oEpF1RywLub
	feXTHvc4JN3+hx2OQW/OxzXQiaBVQUnpbRaU0ufnthX6KZms0Fr7ODe0dwyr//Ps9XUp
	EwzWviATB7A9Fkj8kB7qZepJPYvxjM/43Jhb3kk0vCNqjayqLOKPbPfMi7zIjMS4WZRI
	Ta7oeNXKayOScx4JHM4e637KIe9RiS3UPZ2rNPlAhohqzCnTaFh9d/GDP4weeDsQlzQh
	Mcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oz+nrjaVaH7Kzoe1ccCvlxrdhHhHYMG/xZk3W9sOVSY=;
	b=C0/jbmgrQ64/+6vMQXT+OGDJVNmVMdpuN1MxCFr8/W9YWW0WkwFyqH2yRo1flj/1lQ
	f91QNgiMDtIk/3hxVw+RQDSuHmx6Rcpqa1khZ6znk1cPUEy10oqATSiZed8VN5nMqPIP
	pVn0158lNDcGyYeE7XO+Tcs1RBkFmVQCRYrKtXKTwStwU/TZiLWdCS7vqgjIyiYnqh6T
	cjdgM0bLdm0XrU6AC1tyUGjOYVDWy2hub3hikDUgrlEZavEUzHZFMTpK1mc0IxlzTv3/
	9n/A3h87K4AMoFnVyX+dSc7JnObetlkIgKuShIok9HT4BblwgxPfSBObhpjGNUc3XliJ
	cz5A==
X-Gm-Message-State: AHQUAubFbXuSF16z2R1F8DHS1KKNrr3Js5sjz3JJSVnd+RDwc/ZFk1+4
	QLhvimnCpcQO2USzY7AkpUuQ9Q==
X-Google-Smtp-Source: AHgI3IYyg6cIH7DurDcIuIFF54rwr39CU55sYNb/bNDF3etNDBNAs55xw/kKuVolTPn7SiesfMKc4w==
X-Received: by 2002:a1c:2408:: with SMTP id k8mr6934621wmk.110.1549541067891; 
	Thu, 07 Feb 2019 04:04:27 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id
	r9sm49045049wmb.27.2019.02.07.04.04.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 04:04:27 -0800 (PST)
To: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
	<20190130025708.12811-1-jimw@sifive.com>
	<CAKmqyKMrCVqudmyJUPta9q6TJtDkeLV=FseAqQ7YhYMu3ak_NQ@mail.gmail.com>
	<CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9b4e0b04-e941-a433-0175-33ba9f79945b@linaro.org>
Date: Thu, 7 Feb 2019 12:04:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 5/5 v3] RISC-V: Add hooks to
 use the gdb xml files.
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
X-List-Received-Date: Thu, 07 Feb 2019 12:04:54 -0000

On 2/7/19 2:05 AM, Jim Wilson wrote:
> Maybe qemu doesn't care about unused arguments/parameters?

We do not.


r~

