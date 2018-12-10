Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWPb4-0000C6-4R
	for mharc-qemu-riscv@gnu.org; Mon, 10 Dec 2018 12:43:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPb1-0000A5-FN
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:43:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPay-0002qc-8A
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:43:55 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWPax-0002qF-MO
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:43:52 -0500
Received: by mail-oi1-x235.google.com with SMTP id h25so9703169oig.1
	for <qemu-riscv@nongnu.org>; Mon, 10 Dec 2018 09:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=A497p6MOx6f49yZJTzr7gFivIy93QoHrblgnKkld0W0=;
	b=IzbBAj84zoylTHukUTy3dRUg8uUNJDM7WzSGVTp8mTvcVpks1dD+lu4K67pecTItPj
	NUfJthvHESqxiOf9XM1+QSiPt/FhQ44BwKszKicr9bxvRTx4IssT7hjVEU+1at0aw5dR
	CegR4Z8mX/LQlnuXOt3u2t4qwhroygw+DG/UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A497p6MOx6f49yZJTzr7gFivIy93QoHrblgnKkld0W0=;
	b=R4ff3Oyy2LUf8nVMiavfYCQlCcI9LjPJwngDZKgprQJZ5xV9fXqycjA0QFYJ0vFH8H
	VVFWEMZagNT9c6h+OVYZFGHuSDgtYNcBxPKOqpE2LOM+PWBTGR+R3cfIZWnrfs1lBEX6
	nns89n5j/snzwPkHBEVJOBi3uBnuxuwn1K6BjCxTUCnZM3KJOrspbXWrgDUAJM9oIVDm
	SaLIhDnTf3yHbl91Zy0DLKNH/ZIC/MQ2lXYyiCy7OCVG3+GGP6SmK1QS3Ifa/pur7i9+
	Y7fKOhnQPBpCC/4KqoFQIUF+ziSCxeCjYodTzC650o+nWM6AAtg9CRMLFwsoriVzQYq5
	tchg==
X-Gm-Message-State: AA+aEWadHQqpcu21WYbiFqntHhwewgftJOWHefOC2ul4qc1msh5VHWL4
	zJXmSgDMRRO1dHC5ArLj5kZf0A==
X-Google-Smtp-Source: AFSGD/UfbFQ23nyZnkRDqHMwc9ONrrPSZCuf/3Lh4C+dF2O65BJ32wFZ3g0Q9+aYa/z+rUDcilS6SQ==
X-Received: by 2002:aca:5344:: with SMTP id h65mr8151099oib.13.1544463830778; 
	Mon, 10 Dec 2018 09:43:50 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id d5sm5616174oth.78.2018.12.10.09.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:43:50 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<1f6b3d26810eb969cf90f0ee978fe2817e6e6421.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <26af2253-8b22-5f91-cb89-ed132e93dea8@linaro.org>
Date: Mon, 10 Dec 2018 11:43:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1f6b3d26810eb969cf90f0ee978fe2817e6e6421.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::235
Subject: Re: [Qemu-riscv] [RFC v3 18/24] riscv: tcg-target: Add direct load
 and store instructions
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
X-List-Received-Date: Mon, 10 Dec 2018 17:43:57 -0000

On 12/7/18 6:49 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 158 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

