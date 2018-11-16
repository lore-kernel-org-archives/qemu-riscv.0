Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhxM-0008H6-MY
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:31:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhxL-0008G1-5J
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:30:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhxG-0005xl-Kd
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:30:59 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:46806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhxG-0005sN-CQ
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:30:54 -0500
Received: by mail-io1-xd2d.google.com with SMTP id m1-v6so6812529ioc.13
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2us20nHK+dpdYdCVn5Oz3bWWVtv8De+RVmr1TZ4Lb6Y=;
	b=KkgDaNQgIswmEUOOOA1HBYE5x7/WZFGc+HnMOAywXAIjJ67gVgApyFbHUhhmxA8BMt
	NTDsC1tlTKiUTtRW+V+V8mCj0bL4q8WcJTJvKY2SQu6jsS2qnu/U9SnnKdPD0cum9mo/
	ar8W/M/DlsWu5n4UaktpLJ5Uc0shrroUZUY4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2us20nHK+dpdYdCVn5Oz3bWWVtv8De+RVmr1TZ4Lb6Y=;
	b=f12Ket14XxrlRQj35u7Mn3U/IA/B43Zz7ohF1XqQyKRjZG7up9JQNgPpMKRjJXPRZl
	EdcHevsdh5WnAjCRaqednsUo54vaSlrOlcyfeRHTc5Kx5BF9L/wlk6O2QlEKCooKvK9W
	p+9bQFyYF2oTwp8ECQ9/bP06yiKHcsg21Njng+t1QB4r7tt72c3Bi9Q0UTk8Lju3JqST
	Y7lohQkJUWQyRw1e3KPSmAn9265E+LId/h4ldf+RqmjrZtLUcORwuvhW3KlF3bSkRF+s
	enEHCv+tzJLvbFdUtR76aDJ4Q3KkdLRLE26dfCbYKYK9Qa3rKpivuoBi16nHCqFm5Yrt
	1qaA==
X-Gm-Message-State: AA+aEWYsFVZc8A61OG2Mm9x08d0DkXj+iCobmRO5KWblMrbIZGpsGBs+
	GAIvRI4iaXYsNUhREpipmLW2Qw==
X-Google-Smtp-Source: AFSGD/U/il6J+GNKL5ZOVBeu7vikpD+YVMVl6+mp7ceTVDgKqg/jR8JOHXPjk97B+6gTLLzfv+AssA==
X-Received: by 2002:a6b:7011:: with SMTP id
	l17-v6mr8301860ioc.145.1542389452506; 
	Fri, 16 Nov 2018 09:30:52 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	m22-v6sm10359274iti.42.2018.11.16.09.30.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:30:51 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<b7bd19036aa7af06a54d904f5473d97bd8dcfc6e.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <33a84c65-046f-d8ba-d177-4a2edf8ac036@linaro.org>
Date: Fri, 16 Nov 2018 18:30:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <b7bd19036aa7af06a54d904f5473d97bd8dcfc6e.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d2d
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 23/23] configure: Add support
 for building RISC-V host
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
X-List-Received-Date: Fri, 16 Nov 2018 17:31:00 -0000

On 11/15/18 11:37 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  configure | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

