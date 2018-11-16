Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNYrd-0001Ux-VW
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:48:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYrb-0001Td-NR
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYrZ-0004My-Qq
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:48:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNYrY-0004Lc-5F
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:48:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id t15-v6so20263474wmt.0
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Q/kWs2vnJQsxyDUisyzJzJeSk56qx+yGF0/ih9aGI7o=;
	b=WcRdjNtF2VN1AEPdN2du7SoGnb74BCSRFIAZ9i7X63eF9S5wXHudBf0l2cypGecJZx
	v1+Up3Hql1uQQVHnWiSmeQKKb0s3+diZbBJs/5PvPUukc3dUt3PUzYA70D954P3oFzxD
	O2AbeZ9V4eGVH8nCNPwxEELsAUL6Hn5RTPXI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Q/kWs2vnJQsxyDUisyzJzJeSk56qx+yGF0/ih9aGI7o=;
	b=BJdiN9r/3OdA9ZL2h1Bw5b9rXbcQNd4ATogQVBwcnCkf05XecvVBWIsBz5VR986N5v
	R55QBcaJkmYpXrbYYo2JSsQ0Ki8GdeQCoo/FEsluKj/GqdV1XCqJB1RsQBOj7BT3C0zj
	pojEVIocLUpID5gIZrs6GSwsGo/FX//ZznUiJA/PHtVA+kIhZfbnxEAXzOCcYK132WtI
	mGrcF3VY6VnxeFxhf5ZMluXecNZLHclgBFneMRJsAwrpeJL/U2lsV4afvS8fX0RUtn3P
	2oAixbEaEzIXfAw0vnShsX2ZznewUlobXwgjhB15Aj++2VQa/NVx1AcZdiOWSvovVW7p
	PvDA==
X-Gm-Message-State: AGRZ1gIVgSytjXX77sQRxfZl4QkQhwaVLuVOVx81UilEkqPz0cbhGF5h
	FyIS1pep8Nq1FsHTBWzLDuzmYg==
X-Google-Smtp-Source: AJdET5eZFRkUzo6RjVA5uIl+He74FI7XRVNovPZ2bo+gxhnvGgRMjDlZ/7/htuYxGqzRBCqabZxF3w==
X-Received: by 2002:a7b:c315:: with SMTP id k21mr1528608wmj.145.1542354502285; 
	Thu, 15 Nov 2018 23:48:22 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	m69-v6sm27020730wmb.8.2018.11.15.23.48.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:48:21 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<970c4b6a1b54c1976c8d36261f18678072dc1c54.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a85692c3-7572-1f00-067c-290255149b56@linaro.org>
Date: Fri, 16 Nov 2018 08:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <970c4b6a1b54c1976c8d36261f18678072dc1c54.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 04/23] exec: Add RISC-V GCC
 poison macro
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
X-List-Received-Date: Fri, 16 Nov 2018 07:48:29 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  include/exec/poison.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


