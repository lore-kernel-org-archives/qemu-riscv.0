Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhsb-0004S5-I5
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:26:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhsZ-0004QX-43
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhsV-00046p-59
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:26:03 -0500
Received: from mail-it1-x12a.google.com ([2607:f8b0:4864:20::12a]:35263)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhsT-000414-9C
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:25:57 -0500
Received: by mail-it1-x12a.google.com with SMTP id v11so35363407itj.0
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8gTAROk0vqRrTRdSg/NxbnLpOMnjW2npnBClQqRd7/w=;
	b=eqQLhvnxQFcv99Hq8RsMDJW7VCKR/zVpRpp1LBeTDXiOT3CUAin+Io4rLbt5VQ5k71
	d1r99M48QCqKjF9aLWG+9v2rgw1RfLVHR8yKkuUIhx1PZ6xS9VASgtFYSmqDpOVOZpDN
	a1fWUNoE0ebMRKIWAvXtFiJk13zWlF9wZ5BvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8gTAROk0vqRrTRdSg/NxbnLpOMnjW2npnBClQqRd7/w=;
	b=V3KesV8MKmifbdtbxp6MSNdUQCG49t6/Z2lZ5oCr0LPnYdHZhfTxwfiX3DhAuE0Mr+
	GHAgfYkADDsHIaI+LkzotlbTHIyLicWrpW+OpfMUkF2J6arV1LRDSJGddUgUprbL5oKD
	1WdPt5ebBY7WlLYPVNgMPvAOI2t32BFr+gl6M5koDZJRi/HaffUASRrytgNZgOgaPfSC
	eCdCxGOXZc6pYY8BfpqE8HMIgymbQsyQYNNnlD9DHdzAdSbthiGTPHP905mgA6rYcvRU
	XgFJS2LCKAHg/gb+u2F1GpxC960ULiEP0w8qLHB/0s+rjX16HtRa5G3jFhoPjU1nEM2h
	Eg5Q==
X-Gm-Message-State: AGRZ1gLsRQyRlkai0ywt6QnDRYUSe0tnDGeZTAft/VS1yWFBfr9bT5dV
	2N5uHVF9aBIyeQbvJc6AcVAdDA==
X-Google-Smtp-Source: AJdET5c2+MWX6C6Y+CbepATeob0gLQ/81OvUxz+NU58uorMjlMLzgU/glTw9bTUv+I4Tm8WQZlUNDA==
X-Received: by 2002:a24:6991:: with SMTP id
	e139-v6mr9980121itc.17.1542389155740; 
	Fri, 16 Nov 2018 09:25:55 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	f133-v6sm10894467itf.10.2018.11.16.09.25.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:25:55 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<526c9ffdb23b75e96508703b9c9e3bc95cfac939.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e0cc83f2-c49b-9065-0261-803c700b365d@linaro.org>
Date: Fri, 16 Nov 2018 18:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <526c9ffdb23b75e96508703b9c9e3bc95cfac939.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::12a
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 19/23] riscv: tcg-target: Add
 the prologue generation
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
X-List-Received-Date: Fri, 16 Nov 2018 17:26:04 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 66 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


